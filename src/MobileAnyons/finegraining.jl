# Fine-graining isometries for anyonic Fock spaces.
#
# The fine-graining map V: H_L → H_{2L} embeds the L-site anyonic Hilbert space
# into the 2L-site space, doubling lattice resolution while preserving physics.
#
# For Haar wavelets, each coarse particle at site i spreads to fine sites {2i-1, 2i}
# with amplitude 1/√2 each. The fusion tree (labels + intermediates) is preserved
# since hopping doesn't change the tree. Because Haar supports don't overlap
# between different particles, V†V = I follows by factorization.
#
# This works for ALL fusion categories — the product map is universal for Haar.
# For non-Haar wavelets with overlapping supports, antisymmetrization (sVec)
# or optimization (Fibonacci) may be needed.

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
