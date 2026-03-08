# Pair creation/annihilation for mobile anyons.
#
# Creates/annihilates pairs of anyons that fuse to vacuum at adjacent sites.
# This is a cross-sector operator: maps N-particle states to (N±2)-particle states.
#
# The amplitude for creating a pair (a,b) at bond (j,j+1) involves an F-symbol:
#   F^{cum_k, a, b}_{cum_k}[e_row, vac_col]
# where cum_k is the cumulative charge at insertion point k, and the vacuum
# column selects the channel where the pair fuses to vacuum (b⊗c → 1).
#
# This generalizes Garjani-Ardonne pair creation to arbitrary fusion categories.

"""
    dual_pairs(cache::FSymbolCache) -> Vector{Tuple{Int,Int}}

Return all pairs (a, b) of non-vacuum simples with a ⊗ b → 1 (vacuum).
For self-dual objects (e.g. τ in Fibonacci, ψ in sVec), this gives (a, a).
"""
function dual_pairs(cache::FSymbolCache)
    S = simples(cache.C)
    d = length(S)
    pairs = Tuple{Int,Int}[]
    for a in 2:d, b in 2:d
        !iszero(dim(Hom(S[a] ⊗ S[b], S[1]))) && push!(pairs, (a, b))
    end
    return pairs
end

"""
    pair_creation_operator(basis::AnyonBasis, cache::FSymbolCache)
        -> SparseMatrixCSC{ComplexF64}

Build the pair creation operator h† on the full basis.
Maps N-particle states to (N+2)-particle states by creating vacuum pairs
at adjacent vacant sites. Matrix element (bra, ket) is nonzero when bra
is obtained from ket by inserting a dual pair at adjacent vacant sites.
"""
function pair_creation_operator(basis::AnyonBasis, cache::FSymbolCache)
    n = length(basis.states)
    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    # Global state index for cross-sector lookup
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        state_index[key] = idx
    end

    dpairs = dual_pairs(cache)

    for (ket_idx, ket) in enumerate(basis.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)
        occ = Set(pos)

        for j in 1:(basis.L - 1)
            (j ∈ occ || (j + 1) ∈ occ) && continue

            # Insertion index: number of anyons at positions < j
            k = count(x -> x < j, pos)

            # Cumulative charge at insertion point
            cum_k = _cumulative_charge(labs, inters, k)

            for (pa, pb) in dpairs
                _add_pair_creation!(I_idx, J_idx, V_val, state_index,
                                    cache, ket_idx, pos, labs, inters, tc,
                                    N, j, k, cum_k, pa, pb)
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
    pair_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; Δ=1.0)
        -> SparseMatrixCSC{ComplexF64}

Build the Hermitian pair creation/annihilation Hamiltonian: Δ(h† + h).
"""
function pair_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; Δ=1.0)
    h_dag = pair_creation_operator(basis, cache)
    return Δ * (h_dag + h_dag')
end

# --- Internal helpers ---

function _cumulative_charge(labels, inters, k)
    k == 0 && return 1
    k == 1 && return labels[1]
    return inters[k - 1]
end

function _add_pair_creation!(I_idx, J_idx, V_val, state_index,
                              cache, ket_idx, pos, labs, inters, tc,
                              N, j, k, cum_k, pa, pb)
    F = f_matrix(cache, cum_k, pa, pb, cum_k)
    size(F, 1) == 0 && return

    li = left_intermediates(cache, cum_k, pa, pb, cum_k)
    ri = right_intermediates(cache, cum_k, pa, pb, cum_k)

    vac_col = findfirst(==(1), ri)
    isnothing(vac_col) && return

    for (e_row, e) in enumerate(li)
        amp = F[e_row, vac_col]
        abs(amp) < 1e-14 && continue

        # Construct bra positions and labels
        new_pos = Vector{Int}(undef, N + 2)
        new_labs = Vector{Int}(undef, N + 2)
        for i in 1:k
            new_pos[i] = pos[i]
            new_labs[i] = labs[i]
        end
        new_pos[k + 1] = j
        new_labs[k + 1] = pa
        new_pos[k + 2] = j + 1
        new_labs[k + 2] = pb
        for i in (k + 1):N
            new_pos[i + 2] = pos[i]
            new_labs[i + 2] = labs[i]
        end

        # Construct new intermediates
        new_inters = _build_pair_intermediates(inters, labs, k, e, cum_k, N)

        key = (new_pos, new_labs, new_inters, tc)
        bra_idx = get(state_index, key, 0)
        if bra_idx > 0
            push!(I_idx, bra_idx)
            push!(J_idx, ket_idx)
            push!(V_val, ComplexF64(amp))
        end
    end
end

"""
Build intermediates for the (N+2)-particle bra state after inserting a pair
at position k (between anyon k and k+1 in the original ordering).

The new intermediates vector has length N+1:
- Indices 1..k-1: unchanged from original
- Index k (if k≥1): e (the F-symbol left intermediate, cum_k ⊗ pa → e)
- Index k+1: cum_k (cumulative charge restored after pair fuses to vacuum)
- Indices k+2..N+1: shifted from original cumulatives
"""
function _build_pair_intermediates(inters, labels, k, e, cum_k, N)
    new_inters = Vector{Int}(undef, N + 1)

    # Region 1: unchanged (i = 1..k-1)
    for i in 1:(k - 1)
        new_inters[i] = inters[i]
    end

    # Region 2: F-symbol intermediate (i = k, only if k ≥ 1)
    if k >= 1
        new_inters[k] = e
    end

    # Region 3: restored cumulative (i = k+1)
    new_inters[k + 1] = cum_k

    # Region 4: shifted old cumulatives (i = k+2..N+1)
    # new_inters[i] = cum(i-1) of the original tree
    for i in (k + 2):(N + 1)
        j = i - 1  # original cumulative index
        new_inters[i] = j == 1 ? labels[1] : inters[j - 1]
    end

    return new_inters
end
