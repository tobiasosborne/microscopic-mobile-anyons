# Interaction Hamiltonian: nearest-neighbor vacuum-channel projector.
#
# For two anyons at adjacent sites j, j+1 with labels a, b:
# P_j projects onto the fusion channel a ⊗ b → 1 (vacuum).
#
# Matrix elements require F-symbols when the bond is not at the
# innermost vertex of the left-associated fusion tree.
#
# The golden chain Hamiltonian is H = J Σ_j P_j (sum over all bonds).
#
# IMPORTANT: The TensorCategories.jl F-matrix is in a non-unitary gauge
# (involutory: F²=I, but F†≠F⁻¹). We use the Hermitian projector
# P_H = vv†/|v|² where v = F[:, vacuum_col], which is gauge-independent.

"""
    interaction_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; J=1.0)
        -> SparseMatrixCSC{ComplexF64}

Build the nearest-neighbor interaction H = J Σ_j P_j where P_j projects
onto the vacuum fusion channel at bond j.

For the dense chain (N=L), this reduces to the golden chain Hamiltonian.
"""
function interaction_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; J=1.0)
    n = length(basis.states)
    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    for (ket_idx, ket) in enumerate(basis.states)
        _add_interaction_elements!(I_idx, J_idx, V_val, basis, cache, ket_idx, ket, J)
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
    interaction_hamiltonian_sector(basis::AnyonBasis, cache::FSymbolCache,
                                   N::Int, c::Int; J=1.0)

Build interaction Hamiltonian restricted to (N, c) sector.
"""
function interaction_hamiltonian_sector(basis::AnyonBasis, cache::FSymbolCache,
                                        N::Int, c::Int; J=1.0)
    range = get(basis.sector_ranges, (N, c), 1:0)
    isempty(range) && return sparse(ComplexF64[], ComplexF64[], ComplexF64[], 0, 0)

    states = basis.states[range]
    ns = length(states)

    # Build index for this sector: (positions, intermediates) → local index
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}}, Int}()
    for (idx, st) in enumerate(states)
        state_index[(st.config.positions, st.intermediates)] = idx
    end

    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    for (ket_idx, ket) in enumerate(states)
        np = length(ket.config.positions)
        np < 2 && continue

        labels = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge

        # For each bond between consecutive anyons p and p+1
        # (in the anyon ordering, not lattice sites)
        for p in 1:(np - 1)
            # Only act on adjacent occupied sites
            ket.config.positions[p] + 1 == ket.config.positions[p + 1] || continue

            # Bond p between anyons p and p+1
            element = _bond_projector_element(cache, labels, inters, tc, p, np)

            for (bra_inter_p, val) in element
                # Construct bra intermediates: bond p changes inters[p-1] for p≥2, inters[1] for p=1
                change_idx = p == 1 ? 1 : p - 1
                bra_inters = copy(inters)
                bra_inters[change_idx] = bra_inter_p

                bra_key = (ket.config.positions, bra_inters)
                bra_idx = get(state_index, bra_key, 0)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, J * val)
                end
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, ns, ns)
end

"""
Compute projector matrix elements for bond p (between anyons p and p+1)
in a left-associated fusion tree.

Returns: vector of (bra_intermediate_value, amplitude) pairs.
"""
function _bond_projector_element(cache::FSymbolCache, labels, inters, tc, p, np)
    vacuum = 1  # index of vacuum simple object

    if p == 1
        # Bond 1: pair (l₁, l₂) is at the innermost vertex.
        # intermediates[1] = l₁ ⊗ l₂. Projector is diagonal.
        ket_e = inters[1]
        if ket_e == vacuum
            return [(vacuum, ComplexF64(1.0))]
        else
            return Tuple{Int, ComplexF64}[]
        end
    end

    # Bond p ≥ 2: need F-move to expose pair (l_p, l_{p+1}).
    # F^{a, b, c}_d where:
    #   a = cumulative up to anyon p-1
    #   b = labels[p]  (anyon p)
    #   c = labels[p+1] (anyon p+1)
    #   d = cumulative up to anyon p+1 (= intermediates[p])
    #     ... but wait: intermediates[p] = cumul after p+1 anyons.
    #     intermediates[k] = cumul after k+1 anyons (k=1,...,N-1).
    #     So after p+1 anyons: intermediates[p].
    #     But p goes up to np-1, and intermediates has length np-1.

    a = (p == 2) ? labels[1] : inters[p - 2]
    b = labels[p]
    c = labels[p + 1]
    d = (p < np - 1) ? inters[p] : tc  # intermediates[p] if it exists, else total charge
    # Actually intermediates has length np-1 and p ranges 1..np-1.
    # inters[p] exists for p ≤ np-1. So d = inters[p] always works? Let me check:
    # p ranges 2..np-1 in this branch. inters has length np-1. So p ≤ np-1. ✓
    d = inters[p]

    F = f_matrix(cache, a, b, c, d)
    size(F, 1) == 0 && return Tuple{Int, ComplexF64}[]

    # Row/col index mapping
    li = left_intermediates(cache, a, b, c, d)
    ri = right_intermediates(cache, a, b, c, d)

    # Find vacuum column index
    vac_col = findfirst(==(vacuum), ri)
    isnothing(vac_col) && return Tuple{Int, ComplexF64}[]

    # Find ket row index
    ket_e = inters[p - 1]  # the intermediate being changed
    ket_row = findfirst(==(ket_e), li)
    isnothing(ket_row) && return Tuple{Int, ComplexF64}[]

    # Hermitian projector: P_H = v v† / |v|² where v = F[:, vac_col].
    # This is gauge-independent and correctly Hermitian.
    v = F[:, vac_col]
    norm_sq = real(dot(v, v))
    norm_sq < 1e-14 && return Tuple{Int, ComplexF64}[]

    # P_H[bra_row, ket_row] = v[ket_row] × conj(v[bra_row]) / |v|²
    result = Tuple{Int, ComplexF64}[]
    for (bra_row, bra_e) in enumerate(li)
        val = v[ket_row] * conj(v[bra_row]) / norm_sq
        abs(val) > 1e-14 && push!(result, (bra_e, val))
    end

    return result
end

function _add_interaction_elements!(I_idx, J_idx, V_val, basis, cache, ket_idx, ket, J)
    np = length(ket.config.positions)
    np < 2 && return

    for p in 1:(np - 1)
        ket.config.positions[p] + 1 == ket.config.positions[p + 1] || continue

        element = _bond_projector_element(
            cache, ket.config.labels, ket.intermediates, ket.total_charge, p, np)

        for (bra_inter_p, val) in element
            change_idx = p == 1 ? 1 : p - 1
            bra_idx = _find_state_index(basis, ket, change_idx, bra_inter_p)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, J * val)
            end
        end
    end
end

function _find_state_index(basis, ket, p, new_inter_p)
    for (idx, st) in enumerate(basis.states)
        st.config.positions == ket.config.positions || continue
        st.config.labels == ket.config.labels || continue
        st.total_charge == ket.total_charge || continue
        match = true
        for k in eachindex(st.intermediates)
            expected = (k == p) ? new_inter_p : ket.intermediates[k]
            if st.intermediates[k] != expected
                match = false
                break
            end
        end
        match && return idx
    end
    return 0
end
