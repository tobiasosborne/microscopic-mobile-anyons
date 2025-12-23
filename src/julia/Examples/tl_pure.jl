"""
    Pure Temperley-Lieb Anyon Simulation (Catalan Pairings)

    No trivalent vertices - strands pair up planarly.
    Internal degree of freedom: planar pairing of N strand endpoints.

    For N strands: N must be even, counting gives Catalan C_{N/2}

    Usage:
        julia tl_pure.jl
"""

using LinearAlgebra
using SparseArrays
using Combinatorics

#==============================================================================#
#                         TL Parameters                                         #
#==============================================================================#

"""
    TLParams

Parameters for pure Temperley-Lieb model.

Fields:
- δ: loop value (weight for closed loops)
- n: number of sites
"""
struct TLParams
    δ::ComplexF64
    n::Int
end

# Common choices
TLParams(; δ, n) = TLParams(ComplexF64(δ), n)

# Standard loop values
golden_ratio_tl(n) = TLParams(δ = (1 + sqrt(5))/2, n = n)  # δ = φ
sqrt2_tl(n) = TLParams(δ = sqrt(2), n = n)                  # δ = √2 (Ising)
critical_tl(n) = TLParams(δ = 2.0, n = n)                   # δ = 2 (free fermion point)

#==============================================================================#
#                         Planar Pairings                                       #
#==============================================================================#

"""
    PlanarPairing

A planar (non-crossing) pairing of points 1, 2, ..., 2n.
Stored as a vector of pairs (i, j) with i < j.
"""
struct PlanarPairing
    n::Int                        # number of pairs (2n points total)
    pairs::Vector{Tuple{Int,Int}} # the pairs, sorted by first element
end

Base.length(p::PlanarPairing) = p.n
num_points(p::PlanarPairing) = 2 * p.n

"""
    partner(p::PlanarPairing, i::Int)

Find the partner of point i in pairing p.
"""
function partner(p::PlanarPairing, i::Int)
    for (a, b) in p.pairs
        a == i && return b
        b == i && return a
    end
    error("Point $i not found in pairing")
end

"""
    all_planar_pairings(n::Int)

Generate all planar pairings of 2n points.
Returns vector of PlanarPairing objects.
Count = Catalan number C_n.
"""
function all_planar_pairings(n::Int)
    n == 0 && return [PlanarPairing(0, Tuple{Int,Int}[])]
    n == 1 && return [PlanarPairing(1, [(1, 2)])]

    result = PlanarPairing[]

    # Point 1 must pair with some point 2k (k = 1, ..., n)
    # This leaves k-1 pairs inside [2, 2k-1] and n-k pairs outside [2k+1, 2n]
    for k in 1:n
        partner_of_1 = 2k
        inner_pairings = all_planar_pairings(k - 1)
        outer_pairings = all_planar_pairings(n - k)

        for inner in inner_pairings, outer in outer_pairings
            pairs = [(1, partner_of_1)]

            # Shift inner pairs: positions 2, 3, ..., 2k-1
            for (a, b) in inner.pairs
                push!(pairs, (a + 1, b + 1))
            end

            # Shift outer pairs: positions 2k+1, ..., 2n
            for (a, b) in outer.pairs
                push!(pairs, (a + 2k, b + 2k))
            end

            sort!(pairs, by = first)
            push!(result, PlanarPairing(n, pairs))
        end
    end

    result
end

"""
    catalan(n::Int)

n-th Catalan number.
"""
catalan(n::Int) = binomial(2n, n) ÷ (n + 1)

#==============================================================================#
#                         Configuration Space                                   #
#==============================================================================#

"""
    Configuration

Positions of N strand endpoints on n sites.
Hard-core: at most one endpoint per site.
"""
struct Configuration
    n::Int                  # number of sites
    positions::Vector{Int}  # sorted positions (1-indexed)
end

Base.length(c::Configuration) = length(c.positions)

"""
    all_configurations(n::Int, N::Int)

All configurations of N hard-core strand endpoints on n sites.
"""
function all_configurations(n::Int, N::Int)
    N > n && return Configuration[]
    [Configuration(n, collect(pos)) for pos in combinations(1:n, N)]
end

#==============================================================================#
#                         Hilbert Space                                         #
#==============================================================================#

"""
    TLBasisState

A basis state in pure TL: configuration × planar pairing.
"""
struct TLBasisState
    config::Configuration
    pairing::PlanarPairing
end

"""
    TLHilbertSpace

Hilbert space for pure TL with N strands on n sites.
N must be even for all strands to pair up.
"""
struct TLHilbertSpace
    params::TLParams
    N::Int                              # number of strands (must be even)
    basis::Vector{TLBasisState}
    config_to_indices::Dict{Vector{Int}, Vector{Int}}
end

"""
    build_tl_hilbert_space(params::TLParams, N::Int)

Build Hilbert space for N strands (N must be even).
"""
function build_tl_hilbert_space(params::TLParams, N::Int)
    if N == 0
        # Vacuum: one state, no strands
        vacuum_config = Configuration(params.n, Int[])
        vacuum_pairing = PlanarPairing(0, Tuple{Int,Int}[])
        basis = [TLBasisState(vacuum_config, vacuum_pairing)]
        config_to_indices = Dict{Vector{Int}, Vector{Int}}(Int[] => [1])
        return TLHilbertSpace(params, 0, basis, config_to_indices)
    end

    @assert iseven(N) "N must be even for pure TL (strands must pair up)"

    configs = all_configurations(params.n, N)
    pairings = all_planar_pairings(N ÷ 2)

    basis = TLBasisState[]
    config_to_indices = Dict{Vector{Int}, Vector{Int}}()

    for config in configs
        indices = Int[]
        for pairing in pairings
            push!(basis, TLBasisState(config, pairing))
            push!(indices, length(basis))
        end
        config_to_indices[config.positions] = indices
    end

    TLHilbertSpace(params, N, basis, config_to_indices)
end

Base.length(H::TLHilbertSpace) = length(H.basis)

#==============================================================================#
#                         Hamiltonian: Hopping                                  #
#==============================================================================#

"""
    hopping_hamiltonian(H::TLHilbertSpace; t=1.0)

Number-conserving hopping Hamiltonian.
Strand endpoint hops to adjacent empty site.
Pairing structure is preserved (strand just moves).
"""
function hopping_hamiltonian(H::TLHilbertSpace; t=1.0)
    dim = length(H)
    Hmat = spzeros(ComplexF64, dim, dim)

    n = H.params.n

    for (i, state) in enumerate(H.basis)
        config = state.config
        pairing = state.pairing

        # Try hopping each strand endpoint
        for (a, pos) in enumerate(config.positions)
            # Hop right
            if pos < n && !(pos + 1 in config.positions)
                new_positions = copy(config.positions)
                new_positions[a] = pos + 1
                sort!(new_positions)

                if haskey(H.config_to_indices, new_positions)
                    # Find matching pairing state
                    # The pairing refers to strand indices, not positions
                    # So pairing is preserved when we hop
                    for j in H.config_to_indices[new_positions]
                        if H.basis[j].pairing.pairs == pairing.pairs
                            Hmat[j, i] -= t
                        end
                    end
                end
            end

            # Hop left
            if pos > 1 && !(pos - 1 in config.positions)
                new_positions = copy(config.positions)
                new_positions[a] = pos - 1
                sort!(new_positions)

                if haskey(H.config_to_indices, new_positions)
                    for j in H.config_to_indices[new_positions]
                        if H.basis[j].pairing.pairs == pairing.pairs
                            Hmat[j, i] -= t
                        end
                    end
                end
            end
        end
    end

    Hermitian(Hmat)
end

#==============================================================================#
#                         Hamiltonian: TL Generator (Reconnection)              #
#==============================================================================#

"""
    tl_generator_hamiltonian(H::TLHilbertSpace; J=1.0)

TL generator Hamiltonian: when two strands are adjacent, they can reconnect.

The TL generator e_i acts on strands at positions i and i+1:
  - If strands a,b are at adjacent positions with a paired elsewhere,
    they can "swap partners" via a cup-cap insertion.
  - Closed loops contribute factor δ.
"""
function tl_generator_hamiltonian(H::TLHilbertSpace; J=1.0)
    dim = length(H)
    Hmat = spzeros(ComplexF64, dim, dim)
    δ = H.params.δ

    for (i, state) in enumerate(H.basis)
        config = state.config
        pairing = state.pairing
        positions = config.positions
        N = length(positions)

        # Find adjacent pairs of strand endpoints
        for a in 1:(N-1)
            pos_a = positions[a]
            pos_b = positions[a + 1]

            # Check if adjacent
            if pos_b == pos_a + 1
                # Strands a and a+1 (in position ordering) are adjacent
                # Find their partners in the pairing
                partner_a = partner(pairing, a)
                partner_b = partner(pairing, a + 1)

                if partner_a == a + 1
                    # Strands a and a+1 are already paired to each other
                    # e_i acts as δ * identity (creates and removes a loop)
                    Hmat[i, i] += J * δ
                else
                    # Strands are paired to others
                    # e_i reconnects: (a, partner_a), (a+1, partner_b)
                    #              → (a, a+1), (partner_a, partner_b)

                    # Build new pairing
                    new_pairs = Tuple{Int,Int}[]
                    for (p, q) in pairing.pairs
                        if p == a || p == a + 1 || q == a || q == a + 1 ||
                           p == partner_a || q == partner_a ||
                           p == partner_b || q == partner_b
                            continue  # Skip old pairs involving these
                        end
                        push!(new_pairs, (p, q))
                    end

                    # Add new pairs
                    push!(new_pairs, (min(a, a+1), max(a, a+1)))
                    if partner_a != partner_b  # They're different
                        push!(new_pairs, (min(partner_a, partner_b),
                                          max(partner_a, partner_b)))
                    end
                    # If partner_a == partner_b, that's impossible for valid pairing

                    sort!(new_pairs, by = first)
                    new_pairing = PlanarPairing(pairing.n, new_pairs)

                    # Find this pairing in basis
                    for j in H.config_to_indices[positions]
                        if H.basis[j].pairing.pairs == new_pairs
                            Hmat[j, i] += J
                            break
                        end
                    end
                end
            end
        end
    end

    Hermitian(Hmat)
end

#==============================================================================#
#                         Exact Diagonalization                                 #
#==============================================================================#

function diagonalize(Hmat::AbstractMatrix; nev=6)
    F = eigen(Hermitian(Matrix(Hmat)))
    perm = sortperm(real.(F.values))
    nev = min(nev, length(F.values))
    F.values[perm[1:nev]], F.vectors[:, perm[1:nev]]
end

#==============================================================================#
#                         Examples                                              #
#==============================================================================#

function example_pure_tl()
    println("="^70)
    println("PURE TEMPERLEY-LIEB (Catalan Pairings)")
    println("="^70)

    println("\nHilbert space dimensions:")
    println("-"^70)
    println(" n  | N  | configs | pairings | dim(H) | C(n,N)×C_{N/2}")
    println("-"^70)

    for n in [4, 6, 8]
        params = TLParams(δ = sqrt(2), n = n)
        for N in [0, 2, 4, min(6, n)]
            if N > n
                continue
            end
            H = build_tl_hilbert_space(params, N)
            configs = N > 0 ? binomial(n, N) : 1
            pairings = catalan(N ÷ 2)
            expected = configs * pairings
            match = length(H) == expected ? "✓" : "✗"
            println(" $n  | $N  |    $(lpad(configs, 3))    |    $(lpad(pairings, 3))     |   $(lpad(length(H), 4))  |      $(lpad(expected, 4))    $match")
        end
    end

    # Example spectrum
    println("\n" * "="^70)
    println("Example: n=6 sites, N=4 strands, δ=√2")
    println("="^70)

    params = TLParams(δ = sqrt(2), n = 6)
    H = build_tl_hilbert_space(params, 4)
    println("Hilbert space dimension: $(length(H))")
    println("  = C(6,4) × C_2 = 15 × 2 = 30")

    println("\nPlanar pairings for N=4:")
    for (i, p) in enumerate(all_planar_pairings(2))
        println("  $i: $(p.pairs)")
    end

    println("\nBuilding hopping Hamiltonian...")
    H_hop = hopping_hamiltonian(H; t=1.0)

    println("Building TL generator Hamiltonian...")
    H_tl = tl_generator_hamiltonian(H; J=0.5)

    H_total = H_hop + H_tl

    println("\nDiagonalizing H = H_hop + 0.5 H_TL...")
    evals, _ = diagonalize(H_total; nev=10)

    println("\nLowest eigenvalues:")
    for (i, E) in enumerate(evals)
        println("  E_$i = $(round(real(E), digits=6))")
    end

    return H, H_total, evals
end

function example_comparison()
    println("\n" * "="^70)
    println("COMPARISON: Pure TL vs Fusion Picture")
    println("="^70)

    println("\n n  | N  | TL (Catalan) | Fusion (Fibonacci)")
    println("-"^55)

    # Fibonacci sequence for comparison
    fib = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

    for n in [4, 6, 8]
        params = TLParams(δ = sqrt(2), n = n)
        for N in [2, 4, min(6, n)]
            if N > n
                continue
            end
            H_pure = build_tl_hilbert_space(params, N)
            # Fusion dim = C(n,N) × F_{N+1}
            fusion_dim = binomial(n, N) * fib[N + 1]
            println(" $n  | $N  |      $(lpad(length(H_pure), 4))      |        $(lpad(fusion_dim, 4))")
        end
    end
end

function example_basis_explicit()
    println("\n" * "="^70)
    println("EXPLICIT BASIS: n=4, N=4 (fully packed)")
    println("="^70)

    params = TLParams(δ = sqrt(2), n = 4)
    H = build_tl_hilbert_space(params, 4)

    println("\nAll basis states:")
    for (i, state) in enumerate(H.basis)
        println("  $i: positions=$(state.config.positions), pairing=$(state.pairing.pairs)")
    end
end

# Run examples
if abspath(PROGRAM_FILE) == @__FILE__
    example_pure_tl()
    example_comparison()
    example_basis_explicit()
end
