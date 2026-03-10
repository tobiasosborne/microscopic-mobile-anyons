# Number-changing fine-graining isometry experiment.
#
# Hypothesis: pair-creation terms V₂: H_N(L)→H_{N+2}(2L) can fill the deficit
# D = I - V₀†V₀ of the raw product map, giving V=[V₀;V₂] with V†V=I physically
# (without artificial column normalization).
#
# Phase 1: Deficit analysis — characterize D per (N,c) sector
# Phase 2: Composition V₂ = h†_{2L} · V₀ — per-sector + orthogonal projection
# Phase 4: Isometry verification
# Phase 5: Hamiltonian intertwining comparison

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

# ============================================================
# Setup: categories + wavelets
# ============================================================

Fib = fibonacci_category()
fcache_fib = build_fsymbol_cache(Fib)

Ising = ising_category()
fcache_ising = build_fsymbol_cache(Ising)

h_d4 = daubechies_filter(2)

# ============================================================
# Phase 1: Deficit analysis
# ============================================================

@testset "Phase 1: Deficit analysis" begin

    @testset "Raw product map G=V₀†V₀ is diagonal ($catname, L=$L)" for
            (catname, C, fcache) in [("Fibonacci", Fib, fcache_fib),
                                      ("Ising", Ising, fcache_ising)],
            L in [3, 4]

        b_L = build_basis(L, C)
        b_2L = build_basis(2L, C)
        R = one_particle_scaling_map(L, h_d4)
        V0 = fine_graining_isometry(b_L, b_2L, R)

        G = Matrix(V0' * V0)
        n = size(G, 1)

        # G should be diagonal
        offdiag = norm(G - Diagonal(diag(G)))
        @test offdiag < 1e-12

        # Deficit D = I - G
        D = I(n) - G
        deficit_diag = diag(D)

        # All deficit entries should be non-negative (G ≤ I)
        @test all(d -> d > -1e-12, deficit_diag)

        # Analyze deficit by sector
        println("\n=== $catname L=$L deficit analysis ===")
        for ((N, c), rng) in sort(collect(b_L.sector_ranges); by=first)
            sector_deficit = deficit_diag[rng]
            max_def = maximum(sector_deficit)
            if max_def > 1e-10
                println("  (N=$N, c=$c): max deficit = $(round(max_def, digits=6)), " *
                        "states with deficit: $(count(d -> d > 1e-10, sector_deficit))/$(length(rng))")

                # Verify deficit depends only on positions
                positions_seen = Dict{Vector{Int}, Float64}()
                for idx in rng
                    st = b_L.states[idx]
                    pos = st.config.positions
                    d = deficit_diag[idx]
                    if haskey(positions_seen, pos)
                        @test abs(positions_seen[pos] - d) < 1e-12
                    else
                        positions_seen[pos] = d
                    end
                end
            else
                println("  (N=$N, c=$c): zero deficit ($(length(rng)) states)")
            end
        end

        # N=0 and N=1 must have zero deficit
        for ((N, c), rng) in b_L.sector_ranges
            if N <= 1
                @test maximum(abs.(deficit_diag[rng])) < 1e-12
            end
        end
    end
end

# ============================================================
# Phase 2: Composition with full orthogonalization
#
# Three issues to resolve for V = V₀ + V₂ with V†V = I:
#   (a) V₀†V₂ = 0 — project V₂ onto complement of Im(V₀)
#   (b) V₂†V₂ diagonal — Löwdin-style orthogonalization of V₂ columns
#   (c) diag(V₂†V₂) = D — scale columns to fill deficit
#
# Combined fix: V₂ = (I-Π_{V₀}) h†V₀ · T  where T = G₂^{-1/2} D^{1/2}
# with G₂ = orthogonalized Gram matrix restricted to deficit indices.
# ============================================================

"""
Build number-changing fine-graining isometry V = V₀ + V₂.

V₀ = raw product map (number-preserving, diagonal G = V₀†V₀).
V₂ = orthogonalized, scaled (I-Π_{V₀})h†V₀ (number-changing by +2).

Steps:
1. Project h†V₀ onto orthogonal complement of Im(V₀) → V₂_orth
2. Restrict to columns with nonzero deficit
3. Löwdin orthogonalize: V₂_orth[:,J] → V₂_orth[:,J] G₂^{-1/2} D_J^{1/2}
4. This gives V₂†V₂ = D (diagonal), V₀†V₂ = 0, hence V†V = I.
"""
function build_number_changing_isometry(b_L, b_2L, R, fcache; verbose=false)
    V0 = fine_graining_isometry(b_L, b_2L, R)
    h_dag = pair_creation_operator(b_2L, fcache)
    n = size(V0, 2)

    # Gram matrix and deficit
    G = Matrix(V0' * V0)
    D_diag = diag(I(n) - G)
    g_sq = diag(G)
    g_sq_inv = [g > 1e-14 ? 1.0 / g : 0.0 for g in g_sq]

    # Step 1: Project out V₀'s image
    V2_raw = h_dag * V0
    cross_mat = Matrix(V0' * V2_raw)
    V2_orth = Matrix(V2_raw - V0 * (Diagonal(g_sq_inv) * cross_mat))

    # Step 2: Identify deficit columns
    J = findall(d -> d > 1e-10, D_diag)
    if isempty(J)
        return V0  # no deficit, product map is already isometric
    end

    # Check all deficit columns have nonzero V₂_orth norm
    for j in J
        if norm(V2_orth[:, j]) < 1e-12
            verbose && println("  Column $j has deficit but zero V₂_orth norm — cannot fill")
            return nothing
        end
    end

    # Step 3: Löwdin orthogonalization within deficit subspace
    V2_J = V2_orth[:, J]  # n_fine × |J|
    G2 = real.(V2_J' * V2_J)  # |J| × |J| Gram matrix
    D_J = Diagonal(D_diag[J])  # |J| × |J| target

    # G₂^{-1/2}
    eig = eigen(Symmetric(G2))
    # Check for near-zero eigenvalues (rank deficiency)
    min_eig = minimum(eig.values)
    if min_eig < 1e-10
        verbose && println("  G₂ near-singular (min eigenvalue = $min_eig)")
        return nothing
    end
    G2_inv_sqrt = eig.vectors * Diagonal(1.0 ./ sqrt.(eig.values)) * eig.vectors'

    # T = G₂^{-1/2} D_J^{1/2}
    T = G2_inv_sqrt * Diagonal(sqrt.(D_diag[J]))

    # Apply transformation
    V2_final = zeros(size(V2_orth))
    V2_final[:, J] = V2_J * T

    V_full = V0 + V2_final

    if verbose
        VtV = Matrix(V_full' * V_full)
        err = norm(VtV - I(n))
        println("  ||V†V - I|| = $(round(err, digits=12))")
        cross = norm(Matrix(V0' * V2_final))
        println("  ||V₀†V₂|| = $(round(cross, digits=12))")
        v2tv2 = Matrix(V2_final' * V2_final)
        offdiag_v2 = norm(v2tv2 - Diagonal(diag(v2tv2)))
        println("  ||V₂†V₂ offdiag|| = $(round(offdiag_v2, digits=12))")
    end

    return V_full
end

@testset "Phase 2: Composition with full orthogonalization" begin

    @testset "Orthogonal composition ($catname, L=$L)" for
            (catname, C, fcache) in [("Fibonacci", Fib, fcache_fib),
                                      ("Ising", Ising, fcache_ising)],
            L in [3, 4]

        b_L = build_basis(L, C)
        b_2L = build_basis(2L, C)
        R = one_particle_scaling_map(L, h_d4)

        println("\n=== $catname L=$L: Phase 2 ===")
        V = build_number_changing_isometry(b_L, b_2L, R, fcache; verbose=true)

        if isnothing(V)
            println("  Construction failed")
            @test false
            continue
        end

        n = size(V, 2)
        VtV = Matrix(V' * V)
        err = norm(VtV - I(n))
        println("  FINAL: ||V†V - I|| = $(round(err, digits=12))")
        @test err < 1e-8
    end
end

# ============================================================
# Phase 4: Isometry verification
# ============================================================

@testset "Phase 4: Isometry verification" begin

    @testset "V†V=I ($catname, L=$L)" for
            (catname, C, fcache) in [("Fibonacci", Fib, fcache_fib),
                                      ("Ising", Ising, fcache_ising)],
            L in [3, 4]

        b_L = build_basis(L, C)
        b_2L = build_basis(2L, C)
        R = one_particle_scaling_map(L, h_d4)

        V = build_number_changing_isometry(b_L, b_2L, R, fcache)
        @test !isnothing(V)
        isnothing(V) && continue

        n = size(V, 2)
        VtV = Matrix(V' * V)
        err = norm(VtV - I(n))
        @test err < 1e-8
    end
end

# ============================================================
# Phase 5: Hamiltonian intertwining comparison
# ============================================================

function intertwining_residual(V, H_fine, H_coarse)
    H_proj = Matrix(V' * H_fine * V)
    n = size(H_coarse, 1)
    H_c = Matrix(H_coarse)
    A = hcat(vec(H_c), vec(Matrix(1.0I, n, n)))
    ab = A \ vec(real.(H_proj))
    res = norm(real.(H_proj) - ab[1] * H_c - ab[2] * I(n)) / max(norm(H_proj), 1e-14)
    return (residual=res, a=ab[1], b=ab[2])
end

@testset "Phase 5: Intertwining comparison" begin

    @testset "Normalized vs number-changing ($catname, L=$L)" for
            (catname, C, fcache) in [("Fibonacci", Fib, fcache_fib)],
            L in [3, 4]

        b_L = build_basis(L, C)
        b_2L = build_basis(2L, C)
        R = one_particle_scaling_map(L, h_d4)

        # Coarse and fine Hamiltonians (hopping + interaction)
        H_L = hopping_hamiltonian(b_L; t=1.0) +
               real.(interaction_hamiltonian(b_L, fcache; J=1.0))
        H_2L = hopping_hamiltonian(b_2L; t=1.0) +
                real.(interaction_hamiltonian(b_2L, fcache; J=1.0))

        # 1. Normalized product (current best, number-preserving)
        V_norm = normalized_product_isometry(b_L, b_2L, R)
        fit_norm = intertwining_residual(V_norm, H_2L, H_L)

        # 2. Number-changing
        V_nc = build_number_changing_isometry(b_L, b_2L, R, fcache)

        println("\n=== $catname L=$L intertwining comparison ===")
        println("  Normalized product: residual=$(round(fit_norm.residual, digits=6)), " *
                "a=$(round(fit_norm.a, digits=4)), b=$(round(fit_norm.b, digits=4))")

        if !isnothing(V_nc)
            n = size(V_nc, 2)
            VtV = Matrix(V_nc' * V_nc)
            iso_err = norm(VtV - I(n))

            fit_nc = intertwining_residual(V_nc, H_2L, H_L)
            println("  Number-changing:    residual=$(round(fit_nc.residual, digits=6)), " *
                    "a=$(round(fit_nc.a, digits=4)), b=$(round(fit_nc.b, digits=4))")
            println("  (||V_nc†V_nc - I|| = $(round(iso_err, digits=10)))")

            # The number-changing residual should be comparable
            # (not necessarily better — this is exploratory)
        else
            println("  Number-changing: construction failed")
        end
    end
end
