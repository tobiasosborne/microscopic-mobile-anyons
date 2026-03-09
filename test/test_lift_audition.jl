# Audition: categorical lift functors for mixed-label configurations.
#
# SETUP: Ising category with simples {𝟙, ψ, σ}. Configurations can have
# mixed labels (e.g., σ at site 1 and ψ at site 2).
#
# PROBLEM: The factorization H = Λ^N(ℂ^L) ⊗ V_internal requires all
# particles to have the SAME label. For mixed labels, positions and labels
# are entangled — permuting particles changes labels, which changes the
# fusion tree.
#
# AUDITION of four approaches:
# A. Product map: Π R[y_p, x_p] (correct labels, not isometric for D4)
# B. Full Slater: det(R_sub) (wrong for mixed labels — permutes labels)
# C. Label-grouped Slater: Slater within same-label groups, product across
# D. Löwdin: V_seed (V†V)^{-1/2} (numerical orthogonalization)

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays, Combinatorics

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

Ising = ising_category()
fcache = build_fsymbol_cache(Ising)
h_d4 = daubechies_filter(2)

# ============================================================
# Theorem: Product map is isometric for Haar, any category
# ============================================================

@testset "Product map + Haar: isometric for Ising (L=$L)" for L in 3:5
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry(basis_L, basis_2L, R)
    @test norm(Matrix(V' * V) - I(size(V, 2))) < 1e-12
end

# ============================================================
# Fact: Product map + D4 is NOT isometric (for any multi-particle state
# with adjacent particles, regardless of label configuration)
# ============================================================

@testset "Product map + D4: NOT isometric for Ising (L=$L)" for L in 3:4
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)
    R = one_particle_scaling_map(L, h_d4)
    V = fine_graining_isometry(basis_L, basis_2L, R)
    iso_err = norm(Matrix(V' * V) - I(size(V, 2)))
    @test iso_err > 0.01  # fails for D4
end

# ============================================================
# Fact: The V†V deficit depends on POSITIONS only, not labels
# ============================================================

@testset "V†V deficit is label-independent (L=3)" begin
    L = 3
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)
    R = one_particle_scaling_map(L, h_d4)
    V = fine_graining_isometry(basis_L, basis_2L, R)
    VtV = real.(Matrix(V' * V))

    # Group states by positions, collect V†V diagonal values
    pos_to_deficits = Dict{Vector{Int}, Vector{Float64}}()
    for i in 1:length(basis_L.states)
        st = basis_L.states[i]
        pos = st.config.positions
        deficit = 1.0 - VtV[i, i]
        if !haskey(pos_to_deficits, pos)
            pos_to_deficits[pos] = Float64[]
        end
        push!(pos_to_deficits[pos], deficit)
    end

    # All states at the same positions should have the same deficit
    for (pos, deficits) in pos_to_deficits
        if length(deficits) > 1
            spread = maximum(deficits) - minimum(deficits)
            @test spread < 1e-12  # deficit depends on position only
        end
    end
end

# ============================================================
# Approach C: Label-grouped Slater
# Within each label group, use Slater determinant.
# Across groups, use product map.
# ============================================================

"""
    label_grouped_slater(basis_L, basis_2L, R)

Build fine-graining isometry using Slater determinant within each label group
and product map across groups.

For a state with n_a particles of type a, n_b of type b, etc.:
- Slater lift within each group: Λ^{n_a}(R), Λ^{n_b}(R), ...
- Product across groups (positions constrained to be disjoint)
"""
function label_grouped_slater(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                               R::Matrix{Float64})
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)
    L_fine = 2 * basis_L.L

    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)
        N <= 1 && begin
            # 0 or 1 particle: same as product map
            if N == 0
                bra_idx = get(fine_index, (Int[], Int[], Int[], tc), 0)
                bra_idx > 0 && (push!(I_idx, bra_idx); push!(J_idx, ket_idx); push!(V_val, 1.0))
            else
                for j in 1:L_fine
                    r = R[j, pos[1]]
                    abs(r) < 1e-14 && continue
                    key = ([j], labs, inters, tc)
                    bra_idx = get(fine_index, key, 0)
                    bra_idx > 0 && (push!(I_idx, bra_idx); push!(J_idx, ket_idx); push!(V_val, ComplexF64(r)))
                end
            end
            continue
        end

        # Group particles by label
        label_groups = Dict{Int, Vector{Int}}()  # label → [particle indices]
        for p in 1:N
            g = get!(label_groups, labs[p], Int[])
            push!(g, p)
        end
        groups = sort(collect(values(label_groups)))  # sorted groups of particle indices

        # For each group, build the Slater submatrix
        # Then enumerate combinations across groups (ensuring disjoint fine positions)
        _enumerate_grouped!(I_idx, J_idx, V_val, fine_index,
                             R, pos, labs, inters, tc, ket_idx, N, L_fine, groups)
    end

    return sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
end

function _enumerate_grouped!(I_idx, J_idx, V_val, fine_index,
                              R, pos, labs, inters, tc, ket_idx, N, L_fine, groups)
    n_groups = length(groups)

    # For each group, find the nonzero R entries for each particle
    group_R = Vector{Matrix{Float64}}(undef, n_groups)
    group_coarse = Vector{Vector{Int}}(undef, n_groups)
    for (gi, g) in enumerate(groups)
        coarse_sites = [pos[p] for p in g]
        group_coarse[gi] = coarse_sites
        # R submatrix: rows = all fine sites, cols = coarse sites in this group
        group_R[gi] = R[:, coarse_sites]
    end

    # Enumerate fine-site assignments for each group
    # Each group gets n_g fine sites (from C(L_fine, n_g))
    # Groups' fine sites must be disjoint
    _recurse_groups!(I_idx, J_idx, V_val, fine_index,
                      group_R, groups, labs, inters, tc, ket_idx, N, L_fine,
                      1, n_groups, Int[], ComplexF64(1.0), Vector{Int}[])
end

function _recurse_groups!(I_idx, J_idx, V_val, fine_index,
                           group_R, groups, labs, inters, tc, ket_idx, N, L_fine,
                           gi, n_groups, used_sites, amp_so_far, group_fine_sites)
    if gi > n_groups
        # All groups assigned. Build the full fine state.
        fine_pos = Int[]
        fine_labs = Int[]
        for (gj, g) in enumerate(groups)
            for (k, p) in enumerate(g)
                push!(fine_pos, group_fine_sites[gj][k])
                push!(fine_labs, labs[p])
            end
        end
        # Sort by position
        perm = sortperm(fine_pos)
        fine_pos = fine_pos[perm]
        fine_labs = fine_labs[perm]

        # Check that sorted labs match original ordering's intermediates
        # (intermediates depend on label ORDER, not just label SET)
        # For now: only emit if fine_labs == labs reordered to match fine_pos
        # This is guaranteed if the group structure preserves relative ordering
        key = (fine_pos, fine_labs, inters, tc)
        bra_idx = get(fine_index, key, 0)
        if bra_idx > 0
            push!(I_idx, bra_idx)
            push!(J_idx, ket_idx)
            push!(V_val, amp_so_far)
        end
        return
    end

    g = groups[gi]
    n_g = length(g)
    Rg = group_R[gi]

    # Enumerate n_g-element subsets of fine sites not in used_sites
    available = [j for j in 1:L_fine if !(j in used_sites)]
    for fine_subset in Combinatorics.combinations(available, n_g)
        # Compute Slater determinant for this group
        sub = Rg[fine_subset, :]  # n_g × n_g submatrix
        d = det(sub)
        abs(d) < 1e-14 && continue

        new_used = vcat(used_sites, fine_subset)
        push!(group_fine_sites, fine_subset)
        _recurse_groups!(I_idx, J_idx, V_val, fine_index,
                          group_R, groups, labs, inters, tc, ket_idx, N, L_fine,
                          gi + 1, n_groups, new_used, amp_so_far * d, group_fine_sites)
        pop!(group_fine_sites)
    end
end

# ============================================================
# Approach D: Löwdin orthogonalization
# ============================================================

function lowdin_isometry(V_seed)
    Vd = Matrix(V_seed)
    S = Vd' * Vd
    eig = eigen(Symmetric(real.(S)))
    S_inv_sqrt = eig.vectors * Diagonal(1.0 ./ sqrt.(max.(eig.values, 1e-14))) * eig.vectors'
    return sparse(Vd * S_inv_sqrt)
end

# ============================================================
# AUDITION: compare all approaches for Ising + D4
# ============================================================

@testset "Audition: Ising + D4, L=$L" for L in 3:4
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)
    R = one_particle_scaling_map(L, h_d4)

    # A: Product map
    V_prod = fine_graining_isometry(basis_L, basis_2L, R)
    err_prod = norm(Matrix(V_prod' * V_prod) - I(size(V_prod, 2)))

    # C: Label-grouped Slater
    V_grouped = label_grouped_slater(basis_L, basis_2L, R)
    err_grouped = norm(Matrix(V_grouped' * V_grouped) - I(size(V_grouped, 2)))

    # D: Löwdin on product map
    V_lowdin = lowdin_isometry(V_prod)
    err_lowdin = norm(Matrix(V_lowdin' * V_lowdin) - I(size(V_lowdin, 2)))

    println("L=$L Ising + D4:")
    println("  Product:       ||V†V-I|| = $(round(err_prod, sigdigits=4))")
    println("  Grouped Slater:||V†V-I|| = $(round(err_grouped, sigdigits=4))")
    println("  Löwdin:        ||V†V-I|| = $(round(err_lowdin, sigdigits=4))")

    # Grouped Slater should improve over product (handles same-label overlaps)
    @test err_grouped ≤ err_prod + 1e-10

    # Löwdin should be exact
    @test err_lowdin < 1e-10
end

# ============================================================
# Summary of the landscape
# ============================================================

@testset "Summary: what works where" begin
    L = 3

    # Case 1: Fibonacci (single non-vacuum simple)
    Fib = fibonacci_category()
    bL = build_basis(L, Fib); b2L = build_basis(2L, Fib)
    R_d4 = one_particle_scaling_map(L, h_d4)

    V_slater_fib = fine_graining_isometry_svec(bL, b2L, R_d4)
    @test norm(Matrix(V_slater_fib' * V_slater_fib) - I(size(V_slater_fib, 2))) < 1e-12

    # Case 2: sVec (single non-vacuum simple)
    G = Oscar.cyclic_group(2)
    sVec = graded_vector_spaces(G)
    bL_s = build_basis(L, sVec); b2L_s = build_basis(2L, sVec)

    V_slater_svec = fine_graining_isometry_svec(bL_s, b2L_s, R_d4)
    @test norm(Matrix(V_slater_svec' * V_slater_svec) - I(size(V_slater_svec, 2))) < 1e-12

    # Case 3: Ising (multiple non-vacuum simples)
    bL_i = build_basis(L, Ising); b2L_i = build_basis(2L, Ising)

    V_prod_i = fine_graining_isometry(bL_i, b2L_i, R_d4)
    err_prod_i = norm(Matrix(V_prod_i' * V_prod_i) - I(size(V_prod_i, 2)))
    @test err_prod_i > 0.01  # product map fails for D4 + Ising

    V_lowdin_i = lowdin_isometry(V_prod_i)
    @test norm(Matrix(V_lowdin_i' * V_lowdin_i) - I(size(V_lowdin_i, 2))) < 1e-10

    println("\n=== SUMMARY ===")
    println("Single label type (Fibonacci, sVec): Slater lift = Λ^N(R) ⊗ I")
    println("  → isometric for ANY wavelet ✓")
    println()
    println("Multiple label types (Ising): Slater overcounts, product undercounts")
    println("  → Haar product map: always works ✓")
    println("  → D4 product map: V†V < I (hard-core exclusion at overlaps)")
    println("  → D4 Löwdin: exact isometry ✓ (numerical, no clean formula)")
    println("  → Open: analytical formula for multi-species hard-core lift")
end
