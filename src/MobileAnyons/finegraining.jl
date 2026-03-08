# Fine-graining isometries for anyonic Fock spaces.
#
# The fine-graining map V: H_L → H_{2L} embeds the L-site anyonic Hilbert space
# into the 2L-site space, doubling lattice resolution while preserving physics.
#
# For Haar wavelets (non-overlapping supports), the product map suffices:
#   V|x,inters⟩ = Σ_y Π_p R[y_p, x_p] |y, inters⟩
# since disjoint supports guarantee V†V = I by factorization.
#
# For wavelets with overlapping supports (D4, etc.), the product map is NOT
# isometric. The fix is the **categorical determinant**: replace the product
# with a braiding-weighted sum over permutations:
#   V[y,inters'; x,inters] = Σ_{σ∈S_N} B(σ)[inters',inters] Π_p R[y_p, x_{σ(p)}]
#
# where B(σ) is the braiding representation of permutation σ, built from
# elementary braiding matrices σ_p = Σ_f R^{b,c}_f P_f^{phys}.
#
# This generalizes:
# - sVec: B(σ) = (-1)^σ → Slater determinant
# - Haar: only σ=id contributes → product map
# - D4 + Fibonacci: B(σ) mixes intermediates via R-symbols + F-moves

"""
    fine_graining_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                            R::Matrix{Float64}) -> SparseMatrixCSC{Float64}

Build the many-body fine-graining isometry V: H_L → H_{2L} for any fusion category.

Uses the product map: each particle spreads independently via the one-particle
isometry R. Labels and fusion-tree intermediates are preserved.

For Haar wavelets (non-overlapping supports), V†V = I is guaranteed by factorization.
"""
function fine_graining_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                 R::Matrix{Float64})
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    # Build fine-basis index: (positions, labels, intermediates, charge) → index
    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    L_fine = 2 * basis_L.L

    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)

        if N == 0
            # Vacuum maps to vacuum
            bra_idx = get(fine_index, (Int[], Int[], Int[], tc), 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, 1.0)
            end
            continue
        end

        # For each particle p at coarse site pos[p], find fine sites with nonzero R
        # Build list of (fine_site, amplitude) for each particle
        particle_options = Vector{Vector{Tuple{Int,Float64}}}(undef, N)
        for p in 1:N
            opts = Tuple{Int,Float64}[]
            for j in 1:L_fine
                r = R[j, pos[p]]
                abs(r) > 1e-14 && push!(opts, (j, r))
            end
            particle_options[p] = opts
        end

        # Enumerate all combinations (one fine site per particle)
        _enumerate_fine_configs!(I_idx, J_idx, V_val, fine_index,
                                 particle_options, labs, inters, tc, ket_idx, N)
    end

    return sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
end

"""
Recursively enumerate all valid fine-site configurations from particle options.
Enforces hard-core constraint (no two particles at the same fine site)
and sorted position order.
"""
function _enumerate_fine_configs!(I_idx, J_idx, V_val, fine_index,
                                  particle_options, labs, inters, tc, ket_idx, N)
    # Use iterative enumeration over the Cartesian product
    n_opts = [length(particle_options[p]) for p in 1:N]
    indices = ones(Int, N)

    while true
        # Build fine positions and amplitude
        fine_pos = Vector{Int}(undef, N)
        amp = 1.0
        valid = true
        for p in 1:N
            site, r = particle_options[p][indices[p]]
            fine_pos[p] = site
            amp *= r
        end

        # Check sorted and distinct (hard-core)
        if issorted(fine_pos) && allunique(fine_pos)
            key = (fine_pos, labs, inters, tc)
            bra_idx = get(fine_index, key, 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, amp)
            end
        end

        # Increment indices (odometer)
        carry = true
        for p in N:-1:1
            if carry
                indices[p] += 1
                if indices[p] > n_opts[p]
                    indices[p] = 1
                else
                    carry = false
                end
            end
        end
        carry && break
    end
end

"""
    trivial_embedding(basis_L::AnyonBasis, basis_2L::AnyonBasis)
        -> SparseMatrixCSC{Float64}

Build the trivial embedding V₀: each coarse site j maps to fine site 2j-1.
Even-numbered fine sites are left vacant. This is always isometric (permutation).
"""
function trivial_embedding(basis_L::AnyonBasis, basis_2L::AnyonBasis)
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    I_idx = Int[]
    J_idx = Int[]

    for (ket_idx, ket) in enumerate(basis_L.states)
        fine_pos = [2x - 1 for x in ket.config.positions]
        key = (fine_pos, ket.config.labels, ket.intermediates, ket.total_charge)
        bra_idx = get(fine_index, key, 0)
        if bra_idx > 0
            push!(I_idx, bra_idx)
            push!(J_idx, ket_idx)
        end
    end

    return sparse(I_idx, J_idx, ones(Float64, length(I_idx)), n_fine, n_coarse)
end

# ============================================================
# Categorical determinant fine-graining
# ============================================================

"""
    categorical_determinant_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                      R::Matrix{Float64}, fcache::FSymbolCache,
                                      rcache) -> SparseMatrixCSC{ComplexF64}

Build the fine-graining isometry using the categorical determinant:

  V[y,inters'; x,inters] = Σ_{σ∈S_N} B(σ)[inters',inters] × Π_p R[y_p, x_{σ(p)}]

where B(σ) is the braiding representation of permutation σ.

This generalizes the Slater determinant (sVec) and the product map (Haar)
to arbitrary braided fusion categories with any wavelet filter.
"""
function categorical_determinant_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                           R::Matrix{Float64}, fcache::FSymbolCache,
                                           rcache)
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)
    L_fine = 2 * basis_L.L

    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    # Fine-basis index
    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    # Group coarse states by (N, labels, total_charge) for braiding matrix reuse
    # (braiding matrices depend on labels/tc, not positions)
    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)

        if N == 0
            bra_idx = get(fine_index, (Int[], Int[], Int[], tc), 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, one(ComplexF64))
            end
            continue
        end

        if N == 1
            # Single particle: no permutations, just spread via R
            for j in 1:L_fine
                r = R[j, pos[1]]
                abs(r) < 1e-14 && continue
                key = ([j], labs, inters, tc)
                bra_idx = get(fine_index, key, 0)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, ComplexF64(r))
                end
            end
            continue
        end

        # N ≥ 2: build elementary braiding matrices for this state's labels
        sigma_matrices = _build_braiding_matrices(fcache, rcache, labs, inters, tc, N)

        # Find nonzero R entries per coarse site
        R_nonzero = Vector{Vector{Tuple{Int,Float64}}}(undef, N)
        for p in 1:N
            opts = Tuple{Int,Float64}[]
            for j in 1:L_fine
                r = R[j, pos[p]]
                abs(r) > 1e-14 && push!(opts, (j, r))
            end
            R_nonzero[p] = opts
        end

        # Enumerate all sorted fine-position sets
        # For each, sum over permutations weighted by braiding
        _add_catdet_elements!(I_idx, J_idx, V_val, fine_index,
                               R_nonzero, sigma_matrices, labs, inters, tc,
                               ket_idx, N, L_fine, pos)
    end

    return sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
end

"""
Build elementary braiding matrices σ_p for bonds p = 1, ..., N-1.

Each σ_p is a Dict mapping inters => [(inters', amplitude)].
Uses spectral decomposition: σ_p = Σ_f R^{b,c}_f P_f^{phys}.
"""
function _build_braiding_matrices(fcache, rcache, labels, inters_template, tc, N)
    # We need braiding matrices for all possible intermediate sequences,
    # not just the template. Build as matrices indexed by intermediate sequences.

    # First, enumerate all valid intermediate sequences for these labels + tc
    all_inters = enumerate_fusion_trees(fcache.C, labels, tc)
    n_states = length(all_inters)

    # Map intermediate sequence to index
    inters_idx = Dict{Vector{Int}, Int}()
    for (i, inter) in enumerate(all_inters)
        inters_idx[inter] = i
    end

    # Build σ_p as n_states × n_states matrix for each bond
    sigmas = Vector{Matrix{ComplexF64}}(undef, N - 1)

    for p in 1:(N - 1)
        M = zeros(ComplexF64, n_states, n_states)

        for (ket_i, ket_inters) in enumerate(all_inters)
            elements = _bond_sigma_element(fcache, rcache, labels, ket_inters, tc, p, N)
            for (bra_inter_val, amp) in elements
                change_idx = p == 1 ? 1 : p - 1
                bra_inters = copy(ket_inters)
                bra_inters[change_idx] = bra_inter_val
                bra_i = get(inters_idx, bra_inters, 0)
                if bra_i > 0
                    M[bra_i, ket_i] = amp
                end
            end
        end

        sigmas[p] = M
    end

    return (matrices=sigmas, all_inters=all_inters, inters_idx=inters_idx)
end

"""
Compute matrix elements of the elementary braiding σ_p (NOT σ+σ†).

Uses spectral decomposition: σ_p = Σ_f R_f P_f^{phys}
where R_f = R^{b,c}_f (complex R-symbol, not 2Re).

Returns: vector of (bra_intermediate_value, amplitude) pairs.
"""
function _bond_sigma_element(fcache, rcache, labels, inters, tc, p, np)
    if p == 1
        ket_e = inters[1]
        R_val = get(rcache.r_values, (labels[1], labels[2], ket_e), nothing)
        isnothing(R_val) && return Tuple{Int, ComplexF64}[]
        return [(ket_e, R_val)]  # diagonal: R^{a₁,a₂}_{e₁}
    end

    # Bond p ≥ 2: σ_p = Σ_f R_f P_f^{phys}
    a = (p == 2) ? labels[1] : inters[p - 2]
    b = labels[p]
    c = labels[p + 1]
    d = inters[p]

    F = f_matrix(fcache, a, b, c, d)
    n_ch = size(F, 1)
    n_ch == 0 && return Tuple{Int, ComplexF64}[]

    li = left_intermediates(fcache, a, b, c, d)
    ri = right_intermediates(fcache, a, b, c, d)

    ket_e = inters[p - 1]
    ket_row = findfirst(==(ket_e), li)
    isnothing(ket_row) && return Tuple{Int, ComplexF64}[]

    # R_f (complex) for each right intermediate
    R_vals = ComplexF64[get(rcache.r_values, (b, c, f), zero(ComplexF64)) for f in ri]

    # σ = Σ_f R_f P_f^{phys}
    M = zeros(ComplexF64, n_ch, n_ch)

    if n_ch == 1
        M[1, 1] = R_vals[1]
    elseif n_ch == 2
        v1 = F[:, 1]
        norm1_sq = real(dot(v1, v1))
        if norm1_sq > 1e-14
            P1 = (v1 * v1') / norm1_sq
            P2 = I(n_ch) - P1  # orthogonal complement
            M = R_vals[1] * P1 + R_vals[2] * P2
        end
    else
        # General: orthogonalize via Gram matrix
        G = F' * F
        G_inv = inv(G)
        M = F * G_inv * Diagonal(R_vals) * F'
    end

    result = Tuple{Int, ComplexF64}[]
    for (bra_row, bra_e) in enumerate(li)
        val = M[bra_row, ket_row]
        abs(val) > 1e-14 && push!(result, (bra_e, val))
    end
    return result
end

"""
Add categorical determinant matrix elements for a coarse state.

For each valid fine-position set y₁ < ... < yₙ, sums over all permutations
σ ∈ S_N with nonzero position amplitude, weighted by the braiding matrix B(σ).
"""
function _add_catdet_elements!(I_idx, J_idx, V_val, fine_index,
                                R_nonzero, sigma_data, labs, inters, tc,
                                ket_idx, N, L_fine, coarse_pos)
    all_inters = sigma_data.all_inters
    inters_idx = sigma_data.inters_idx
    sigma_mats = sigma_data.matrices
    n_inters = length(all_inters)

    ket_i = get(inters_idx, inters, 0)
    ket_i == 0 && return

    # Collect all fine sites that any coarse site can reach
    # For each fine site, which coarse indices can reach it?
    fine_to_coarse = Dict{Int, Vector{Tuple{Int, Float64}}}()
    for p in 1:N
        for (j, r) in R_nonzero[p]
            if !haskey(fine_to_coarse, j)
                fine_to_coarse[j] = Tuple{Int, Float64}[]
            end
            push!(fine_to_coarse[j], (p, r))
        end
    end

    # Enumerate all N-element subsets of fine sites that can be reached
    reachable_fine = sort(collect(keys(fine_to_coarse)))

    for fine_pos in Combinatorics.combinations(reachable_fine, N)
        # For this fine-position set, find all valid assignments (permutations)
        # σ(p) = q means fine site fine_pos[p] gets particle from coarse index q
        # We need: for each p, coarse index σ(p) must have nonzero R[fine_pos[p], coarse_pos[σ(p)]]

        # Build the assignment options per fine position
        options_per_pos = Vector{Vector{Tuple{Int, Float64}}}(undef, N)
        valid = true
        for p in 1:N
            opts = Tuple{Int, Float64}[]
            for (q, r) in fine_to_coarse[fine_pos[p]]
                push!(opts, (q, r))
            end
            if isempty(opts)
                valid = false
                break
            end
            options_per_pos[p] = opts
        end
        valid || continue

        # Enumerate all perfect matchings (permutations) by brute force
        # For small N, this is tractable
        _sum_permutations!(I_idx, J_idx, V_val, fine_index,
                            options_per_pos, sigma_mats, all_inters, inters_idx,
                            labs, inters, tc, ket_idx, ket_i, N, fine_pos, n_inters)
    end
end

"""
Sum over all valid permutations for a fixed fine-position set.

A permutation σ assigns coarse particle σ(p) to fine position p.
The amplitude is B(σ)[inters', inters] × Π_p R[y_p, x_{σ(p)}].
"""
function _sum_permutations!(I_idx, J_idx, V_val, fine_index,
                             options_per_pos, sigma_mats, all_inters, inters_idx,
                             labs, inters, tc, ket_idx, ket_i, N, fine_pos, n_inters)
    # Accumulate amplitude vector (one per bra intermediate sequence)
    amp_vec = zeros(ComplexF64, n_inters)

    # Generate all permutations by enumerating assignments
    # Each fine position p gets one coarse index from options_per_pos[p]
    # Constraint: all chosen coarse indices must be distinct (perfect matching)
    _recurse_perms!(amp_vec, options_per_pos, sigma_mats, ket_i, n_inters,
                     N, Int[], Float64(1.0), 1)

    # Write nonzero amplitudes to the sparse matrix
    for (bra_i, amp) in enumerate(amp_vec)
        abs(amp) < 1e-14 && continue
        bra_inters = all_inters[bra_i]
        key = (fine_pos, labs, bra_inters, tc)
        bra_idx = get(fine_index, key, 0)
        if bra_idx > 0
            push!(I_idx, bra_idx)
            push!(J_idx, ket_idx)
            push!(V_val, amp)
        end
    end
end

"""
Recursively enumerate valid permutations (assignments of coarse particles
to fine positions) and accumulate braiding-weighted amplitudes.
"""
function _recurse_perms!(amp_vec, options_per_pos, sigma_mats, ket_i, n_inters,
                          N, used_coarse::Vector{Int}, pos_amp::Float64, depth::Int)
    if depth > N
        # Complete assignment found. Compute braiding matrix B(σ).
        # σ maps fine position p → coarse index used_coarse[p]
        # Decompose σ into adjacent transpositions and compose braiding matrices.
        perm = copy(used_coarse)
        B = _braiding_for_permutation(perm, sigma_mats, n_inters)

        # Add contribution: B[:, ket_i] * pos_amp
        for i in 1:n_inters
            amp_vec[i] += B[i, ket_i] * pos_amp
        end
        return
    end

    for (q, r) in options_per_pos[depth]
        q in used_coarse && continue  # already used
        push!(used_coarse, q)
        _recurse_perms!(amp_vec, options_per_pos, sigma_mats, ket_i, n_inters,
                         N, used_coarse, pos_amp * r, depth + 1)
        pop!(used_coarse)
    end
end

"""
Compute the braiding matrix B(σ) for a permutation σ given as an array
where perm[p] = coarse index assigned to fine position p.

Decomposes σ into adjacent transpositions via bubble sort and composes
the elementary braiding matrices.
"""
function _braiding_for_permutation(perm::Vector{Int}, sigma_mats, n_inters)
    B = Matrix{ComplexF64}(I(n_inters))
    work = copy(perm)

    # Bubble sort: each swap (i, i+1) corresponds to braiding σ_i
    n = length(work)
    for i in 1:(n - 1)
        for j in 1:(n - i)
            if work[j] > work[j + 1]
                work[j], work[j + 1] = work[j + 1], work[j]
                B = sigma_mats[j] * B  # apply braiding at bond j
            end
        end
    end

    return B
end
