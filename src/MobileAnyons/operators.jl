# Operators for mobile anyons on a 1D lattice.
#
# Key insight: hopping to an adjacent vacant site has matrix element +1
# for ANY fusion category, because the F-moves only involve vacuum factors
# (F^{a,b,1}_d = F^{a,1,c}_d = 1). The hopping Hamiltonian is simply
# the adjacency matrix of the hard-core configuration graph.
#
# F-symbols become nontrivial for:
# - Exchange/interaction (two non-vacuum objects at adjacent sites)
# - Pair creation/annihilation
# These are implemented separately using FSymbolCache.

using SparseArrays

"""
    hopping_hamiltonian(basis::AnyonBasis; t=1.0) -> SparseMatrixCSC{Float64}

Build the hopping Hamiltonian H = -t Σ_j (h_R(j) + h_L(j)).

h_R(j) moves an anyon from site j to vacant site j+1.
h_L(j) = h_R(j)† moves an anyon from site j+1 to vacant site j.

Matrix elements are ±t (always +t for right/left hop, since F-symbols with
a vacuum factor are trivial). The Hamiltonian is real symmetric.
"""
function hopping_hamiltonian(basis::AnyonBasis; t=1.0)
    n = length(basis.states)
    I = Int[]
    J = Int[]
    V = Float64[]

    # Index states for fast lookup: (positions, labels, intermediates, charge) → index
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        state_index[key] = idx
    end

    for (ket_idx, ket) in enumerate(basis.states)
        pos = ket.config.positions
        labs = ket.config.labels
        N = length(pos)
        N == 0 && continue

        occ = Set(pos)

        for p in 1:N
            site = pos[p]

            # Right hop: site → site+1 (if site+1 ≤ L and vacant)
            if site + 1 <= basis.L && (site + 1) ∉ occ
                new_pos = copy(pos)
                new_pos[p] = site + 1
                # Maintain sorted order
                sort!(new_pos)
                # Labels and intermediates unchanged (hopping preserves fusion tree)
                key = (new_pos, labs, ket.intermediates, ket.total_charge)
                bra_idx = get(state_index, key, 0)
                if bra_idx > 0
                    push!(I, bra_idx)
                    push!(J, ket_idx)
                    push!(V, -t)
                end
            end

            # Left hop: site → site-1 (if site-1 ≥ 1 and vacant)
            if site - 1 >= 1 && (site - 1) ∉ occ
                new_pos = copy(pos)
                new_pos[p] = site - 1
                sort!(new_pos)
                key = (new_pos, labs, ket.intermediates, ket.total_charge)
                bra_idx = get(state_index, key, 0)
                if bra_idx > 0
                    push!(I, bra_idx)
                    push!(J, ket_idx)
                    push!(V, -t)
                end
            end
        end
    end

    return sparse(I, J, V, n, n)
end

"""
    hopping_hamiltonian_sector(basis::AnyonBasis, N::Int, c::Int; t=1.0)
        -> SparseMatrixCSC{Float64}

Build hopping Hamiltonian restricted to the (N, c) sector.
"""
function hopping_hamiltonian_sector(basis::AnyonBasis, N::Int, c::Int; t=1.0)
    range = get(basis.sector_ranges, (N, c), 1:0)
    isempty(range) && return sparse(Float64[], Float64[], Float64[], 0, 0)

    states = basis.states[range]
    n = length(states)

    state_index = Dict{Vector{Int}, Int}()
    for (idx, st) in enumerate(states)
        state_index[st.config.positions] = idx
    end

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    for (ket_idx, ket) in enumerate(states)
        pos = ket.config.positions
        N_p = length(pos)
        N_p == 0 && continue

        occ = Set(pos)

        for p in 1:N_p
            site = pos[p]

            for delta in [-1, 1]
                new_site = site + delta
                (1 <= new_site <= basis.L && new_site ∉ occ) || continue

                new_pos = copy(pos)
                new_pos[p] = new_site
                sort!(new_pos)

                bra_idx = get(state_index, new_pos, 0)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, -t)
                end
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
    free_fermion_energies(L, N; t=1.0) -> Vector{Float64}

Return all N-particle free fermion energies on L sites with OBC.
Single-particle energies: ε_k = -2t cos(πk/(L+1)), k=1,...,L.
N-particle energies: sums of N distinct single-particle energies.
"""
function free_fermion_energies(L::Int, N::Int; t=1.0)
    sp = [-2t * cos(π * k / (L + 1)) for k in 1:L]
    N == 0 && return [0.0]
    N > L && return Float64[]

    energies = Float64[]
    for combo in Combinatorics.combinations(1:L, N)
        push!(energies, sum(sp[k] for k in combo))
    end
    return sort(energies)
end
