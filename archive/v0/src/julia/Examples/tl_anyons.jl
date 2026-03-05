"""
    Temperley-Lieb Anyon Simulation

    Exact diagonalization of mobile TL anyons on a 1D chain.

    Models:
    1. Number-conserving hopping (hard-core)
    2. Pair creation/annihilation

    Usage:
        julia tl_anyons.jl

    References:
    - Kauffman-Lins, "Temperley-Lieb Recoupling Theory"
    - Jones, Inventiones Math. 72 (1983)
"""

using LinearAlgebra
using SparseArrays
using Combinatorics

#==============================================================================#
#                         TL Category Data                                      #
#==============================================================================#

"""
    TLCategory

Temperley-Lieb category data parametrized by q.

Fields:
- q: quantum parameter (e.g., exp(iπ/p) for roots of unity)
- δ: loop value = -(q + q⁻¹)
- p: if q = exp(iπ/p), the truncation level (0 for generic q)
"""
struct TLCategory
    q::ComplexF64
    δ::ComplexF64
    p::Int  # truncation level, 0 = no truncation

    function TLCategory(q::Number)
        δ = -(q + 1/q)
        # Check if q is a root of unity
        p = 0
        for k in 3:100
            if abs(q - exp(im * π / k)) < 1e-10
                p = k
                break
            end
        end
        new(ComplexF64(q), ComplexF64(δ), p)
    end
end

# Convenience constructors
TLCategory(; p::Int) = TLCategory(exp(im * π / p))
fibonacci_tl() = TLCategory(p=5)   # δ = -φ (golden ratio)
ising_tl() = TLCategory(p=4)       # δ = -√2

"""
    qnum(tl::TLCategory, n::Int)

Quantum number [n]_q = (q^n - q^{-n}) / (q - q^{-1})
"""
function qnum(tl::TLCategory, n::Int)
    q = tl.q
    if abs(q - 1) < 1e-10
        return ComplexF64(n)
    end
    (q^n - q^(-n)) / (q - q^(-1))
end

"""
    qfac(tl::TLCategory, n::Int)

Quantum factorial [n]!_q = [1]_q [2]_q ... [n]_q
"""
function qfac(tl::TLCategory, n::Int)
    n <= 0 && return one(ComplexF64)
    prod(qnum(tl, k) for k in 1:n)
end

"""
    max_spin(tl::TLCategory)

Maximum spin before truncation. Returns Inf for generic q.
"""
max_spin(tl::TLCategory) = tl.p > 0 ? (tl.p - 2) / 2 : Inf

"""
    quantum_dim(tl::TLCategory, j)

Quantum dimension of spin-j object: d_j = [2j+1]_q
"""
quantum_dim(tl::TLCategory, j) = qnum(tl, Int(2j + 1))

#==============================================================================#
#                         Configuration Space                                   #
#==============================================================================#

"""
    Configuration

A configuration of N hard-core anyons on n sites.
Positions are 1-indexed: x[i] ∈ {1, ..., n} with x[1] < x[2] < ... < x[N]
"""
struct Configuration
    n::Int           # number of sites
    positions::Vector{Int}  # sorted positions of anyons
end

Base.length(c::Configuration) = length(c.positions)
num_sites(c::Configuration) = c.n

"""
    all_configurations(n::Int, N::Int)

Generate all configurations of N hard-core anyons on n sites.
Returns vector of Configuration objects.
"""
function all_configurations(n::Int, N::Int)
    N > n && return Configuration[]
    configs = Configuration[]
    for positions in combinations(1:n, N)
        push!(configs, Configuration(n, collect(positions)))
    end
    configs
end

"""
    config_index(configs::Vector{Configuration}, c::Configuration)

Find index of configuration c in list configs.
"""
function config_index(configs::Vector{Configuration}, c::Configuration)
    findfirst(x -> x.positions == c.positions, configs)
end

#==============================================================================#
#                         Fusion Tree Basis                                     #
#==============================================================================#

"""
    FusionTree

A fusion tree for N anyons, all of type τ (spin-1/2).
Intermediate channels: c[1], c[2], ..., c[N-1]
where c[k] is result of fusing first k+1 anyons.

For spin-1/2 ⊗ spin-1/2 = spin-0 ⊕ spin-1, we have:
- c[1] ∈ {0, 1} (result of τ ⊗ τ)
- c[k] ∈ {|c[k-1] - 1/2|, c[k-1] + 1/2} ∩ allowed

The tree encodes a basis state in Mor(1, τ ⊗ τ ⊗ ... ⊗ τ).
"""
struct FusionTree
    N::Int                    # number of anyons
    channels::Vector{Rational{Int}}  # intermediate fusion channels
end

"""
    all_fusion_trees(tl::TLCategory, N::Int; total_charge=nothing)

Generate all valid fusion trees for N τ-anyons.
If total_charge is specified, only return trees with that final channel.
"""
function all_fusion_trees(tl::TLCategory, N::Int; total_charge=nothing)
    N <= 0 && return FusionTree[]
    N == 1 && return [FusionTree(1, Rational{Int}[])]

    j_max = max_spin(tl)

    # Build trees recursively
    trees = FusionTree[]

    function build_tree!(channels::Vector{Rational{Int}}, k::Int)
        if k == N
            # Check total charge constraint
            final = isempty(channels) ? 1//2 : channels[end]
            if isnothing(total_charge) || final == total_charge
                push!(trees, FusionTree(N, copy(channels)))
            end
            return
        end

        # Current intermediate result
        current = isempty(channels) ? 1//2 : channels[end]

        # Fuse with next τ (spin-1/2)
        for next in [current - 1//2, current + 1//2]
            next >= 0 && next <= j_max && begin
                push!(channels, next)
                build_tree!(channels, k + 1)
                pop!(channels)
            end
        end
    end

    build_tree!(Rational{Int}[], 1)
    trees
end

"""
    fusion_tree_dim(tl::TLCategory, N::Int; total_charge=nothing)

Dimension of fusion space for N τ-anyons.
"""
fusion_tree_dim(tl::TLCategory, N::Int; total_charge=nothing) =
    length(all_fusion_trees(tl, N; total_charge))

#==============================================================================#
#                         Hilbert Space                                         #
#==============================================================================#

"""
    BasisState

A basis state: configuration × fusion tree
"""
struct BasisState
    config::Configuration
    tree::FusionTree
end

"""
    HilbertSpace

Full Hilbert space for mobile TL anyons.
"""
struct HilbertSpace
    tl::TLCategory
    n::Int                    # sites
    N::Int                    # anyons
    basis::Vector{BasisState}
    config_to_indices::Dict{Vector{Int}, Vector{Int}}  # config → basis indices
end

"""
    build_hilbert_space(tl::TLCategory, n::Int, N::Int; total_charge=nothing)

Construct Hilbert space basis for N anyons on n sites.
"""
function build_hilbert_space(tl::TLCategory, n::Int, N::Int; total_charge=nothing)
    # Special case: N=0 (vacuum)
    if N == 0
        vacuum_config = Configuration(n, Int[])
        vacuum_tree = FusionTree(0, Rational{Int}[])
        basis = [BasisState(vacuum_config, vacuum_tree)]
        config_to_indices = Dict{Vector{Int}, Vector{Int}}(Int[] => [1])
        return HilbertSpace(tl, n, N, basis, config_to_indices)
    end

    configs = all_configurations(n, N)
    trees = all_fusion_trees(tl, N; total_charge)

    basis = BasisState[]
    config_to_indices = Dict{Vector{Int}, Vector{Int}}()

    for config in configs
        indices = Int[]
        for tree in trees
            push!(basis, BasisState(config, tree))
            push!(indices, length(basis))
        end
        config_to_indices[config.positions] = indices
    end

    HilbertSpace(tl, n, N, basis, config_to_indices)
end

Base.length(H::HilbertSpace) = length(H.basis)

#==============================================================================#
#                         F-Symbols (6j symbols)                                #
#==============================================================================#

"""
    fsymbol(tl::TLCategory, j1, j2, j3, j12, j23, j)

F-symbol (recoupling coefficient) for TL/SU(2)_q:
    F^{j1,j2,j3}_{j12,j23,j}

Maps (j1 ⊗ j2) ⊗ j3 → j1 ⊗ (j2 ⊗ j3) basis.

For now, returns simplified values for spin-1/2 case.
TODO: Implement full q-deformed 6j symbols.
"""
function fsymbol(tl::TLCategory, j1, j2, j3, j12, j23, j)
    # Spin-1/2 case: j1 = j2 = j3 = 1/2
    # Only need F^{1/2,1/2,1/2}_{j12,j23,j}

    if j1 == j2 == j3 == 1//2
        # Simplified F-matrix for τ ⊗ τ ⊗ τ
        # F[j12, j23] where j12, j23, j ∈ {0, 1}

        q = tl.q
        φ = -(q^2 + q^(-2))  # related to quantum dim

        # The F-matrix for Fibonacci is:
        # F = [φ^{-1}   φ^{-1/2}]
        #     [φ^{-1/2}  -φ^{-1} ]
        # Here we use a simplified version

        if j12 == 0 && j23 == 0 && j == 0
            return 1 / quantum_dim(tl, 1//2)
        elseif j12 == 0 && j23 == 1 && j == 1
            return sqrt(quantum_dim(tl, 1) / quantum_dim(tl, 1//2))
        elseif j12 == 1 && j23 == 0 && j == 1
            return sqrt(quantum_dim(tl, 1) / quantum_dim(tl, 1//2))
        elseif j12 == 1 && j23 == 1 && j == 0
            return -quantum_dim(tl, 1//2) / quantum_dim(tl, 1)
        elseif j12 == 1 && j23 == 1 && j == 1
            # Need proper q-6j here
            return 1 / quantum_dim(tl, 1)
        else
            return zero(ComplexF64)
        end
    end

    # TODO: General case
    error("General F-symbols not yet implemented for j > 1/2")
end

#==============================================================================#
#                         Hamiltonian Construction                              #
#==============================================================================#

"""
    hopping_hamiltonian(H::HilbertSpace; t=1.0)

Build number-conserving hopping Hamiltonian.

H = -t ∑_j (hop from j to j+1 + h.c.)

The hopping includes F-moves when anyons pass each other's fusion tree.
For hard-core: if both sites occupied, hopping is blocked.
"""
function hopping_hamiltonian(H::HilbertSpace; t=1.0)
    dim = length(H)
    Hmat = spzeros(ComplexF64, dim, dim)

    for (i, state) in enumerate(H.basis)
        config = state.config
        tree = state.tree

        # Try hopping each anyon
        for (a, pos) in enumerate(config.positions)
            # Hop right: pos → pos + 1
            if pos < H.n && !(pos + 1 in config.positions)
                new_positions = copy(config.positions)
                new_positions[a] = pos + 1
                sort!(new_positions)

                # Find new configuration index
                if haskey(H.config_to_indices, new_positions)
                    # For now, identity on fusion tree (no F-move needed for simple hop)
                    # TODO: Include proper F-move when anyon passes another
                    for j in H.config_to_indices[new_positions]
                        if H.basis[j].tree.channels == tree.channels
                            Hmat[j, i] -= t
                        end
                    end
                end
            end

            # Hop left: pos → pos - 1
            if pos > 1 && !(pos - 1 in config.positions)
                new_positions = copy(config.positions)
                new_positions[a] = pos - 1
                sort!(new_positions)

                if haskey(H.config_to_indices, new_positions)
                    for j in H.config_to_indices[new_positions]
                        if H.basis[j].tree.channels == tree.channels
                            Hmat[j, i] -= t
                        end
                    end
                end
            end
        end
    end

    Hermitian(Hmat)
end

"""
    interaction_hamiltonian(H::HilbertSpace; V=1.0)

Add nearest-neighbor interaction.

H_int = V ∑_j n_j n_{j+1}
"""
function interaction_hamiltonian(H::HilbertSpace; V=1.0)
    dim = length(H)
    Hmat = spzeros(ComplexF64, dim, dim)

    for (i, state) in enumerate(H.basis)
        config = state.config

        # Count adjacent pairs
        n_pairs = 0
        for (a, pos) in enumerate(config.positions[1:end-1])
            if config.positions[a+1] == pos + 1
                n_pairs += 1
            end
        end

        Hmat[i, i] += V * n_pairs
    end

    Hermitian(Hmat)
end

#==============================================================================#
#                         Pair Creation/Annihilation                            #
#==============================================================================#

"""
    HilbertSpaceVariable

Hilbert space with variable particle number: ⊕_N H_N
"""
struct HilbertSpaceVariable
    tl::TLCategory
    n::Int
    N_max::Int
    sectors::Vector{HilbertSpace}  # H_0, H_1, ..., H_{N_max}
    offsets::Vector{Int}           # starting index for each sector
end

"""
    build_variable_hilbert_space(tl::TLCategory, n::Int, N_max::Int)

Build Hilbert space allowing 0 to N_max anyons.
"""
function build_variable_hilbert_space(tl::TLCategory, n::Int, N_max::Int)
    sectors = HilbertSpace[]
    offsets = Int[1]

    for N in 0:N_max
        H_N = build_hilbert_space(tl, n, N)
        push!(sectors, H_N)
        push!(offsets, offsets[end] + length(H_N))
    end

    HilbertSpaceVariable(tl, n, N_max, sectors, offsets)
end

Base.length(H::HilbertSpaceVariable) = H.offsets[end] - 1

"""
    pair_creation_hamiltonian(H::HilbertSpaceVariable; μ=1.0)

Pair creation/annihilation Hamiltonian.

H = μ ∑_j (create pair at j,j+1 + annihilate pair at j,j+1)

Creates/annihilates pairs that fuse to vacuum (j=0 channel).
"""
function pair_creation_hamiltonian(H::HilbertSpaceVariable; μ=1.0)
    dim = length(H)
    Hmat = spzeros(ComplexF64, dim, dim)

    # TODO: Implement pair creation/annihilation
    # Key: pairs must fuse to vacuum (trivial channel)
    # This couples N and N±2 sectors

    @warn "Pair creation Hamiltonian not yet implemented"

    Hermitian(Hmat)
end

#==============================================================================#
#                         Exact Diagonalization                                 #
#==============================================================================#

"""
    diagonalize(H::AbstractMatrix; nev=6)

Diagonalize Hamiltonian, return lowest eigenvalues and eigenvectors.
"""
function diagonalize(Hmat::AbstractMatrix; nev=6)
    if size(Hmat, 1) <= 20
        # Full diagonalization for small matrices
        F = eigen(Hermitian(Matrix(Hmat)))
        perm = sortperm(real.(F.values))
        return F.values[perm[1:min(nev, end)]], F.vectors[:, perm[1:min(nev, end)]]
    else
        # TODO: Use iterative solver for large matrices
        # For now, still do full diag
        F = eigen(Hermitian(Matrix(Hmat)))
        perm = sortperm(real.(F.values))
        return F.values[perm[1:min(nev, end)]], F.vectors[:, perm[1:min(nev, end)]]
    end
end

#==============================================================================#
#                         Main / Examples                                       #
#==============================================================================#

function example_fibonacci()
    println("="^60)
    println("Fibonacci Anyons (q = exp(iπ/5), δ = -φ)")
    println("="^60)

    tl = fibonacci_tl()
    println("Loop value δ = ", tl.δ)
    println("Quantum dim d_{1/2} = ", quantum_dim(tl, 1//2))

    n = 6  # sites
    N = 3  # anyons

    println("\nBuilding Hilbert space: n=$n sites, N=$N anyons")
    H = build_hilbert_space(tl, n, N)
    println("Hilbert space dimension: ", length(H))
    println("  Configurations: ", length(all_configurations(n, N)))
    println("  Fusion trees per config: ", fusion_tree_dim(tl, N))

    println("\nBuilding hopping Hamiltonian...")
    Hmat = hopping_hamiltonian(H; t=1.0)

    println("Diagonalizing...")
    evals, evecs = diagonalize(Hmat; nev=6)

    println("\nLowest eigenvalues:")
    for (i, E) in enumerate(evals)
        println("  E_$i = ", round(real(E), digits=6))
    end

    return H, Hmat, evals, evecs
end

function example_ising()
    println("\n" * "="^60)
    println("Ising Anyons (q = exp(iπ/4), δ = -√2)")
    println("="^60)

    tl = ising_tl()
    println("Loop value δ = ", tl.δ)

    n = 8  # sites
    N = 4  # anyons

    println("\nBuilding Hilbert space: n=$n sites, N=$N anyons")
    H = build_hilbert_space(tl, n, N)
    println("Hilbert space dimension: ", length(H))

    println("\nBuilding hopping Hamiltonian...")
    Hmat = hopping_hamiltonian(H; t=1.0)

    println("Adding nearest-neighbor interaction...")
    Hmat_int = interaction_hamiltonian(H; V=0.5)
    Hmat_total = Hmat + Hmat_int

    println("Diagonalizing...")
    evals, evecs = diagonalize(Hmat_total; nev=6)

    println("\nLowest eigenvalues:")
    for (i, E) in enumerate(evals)
        println("  E_$i = ", round(real(E), digits=6))
    end

    return H, Hmat_total, evals, evecs
end

function example_scaling()
    println("\n" * "="^60)
    println("Scaling Test: Hilbert Space Dimensions")
    println("="^60)

    tl = fibonacci_tl()

    println("\nFibonacci anyons:")
    println("n (sites) | N (anyons) | dim(H)")
    println("-"^40)

    for n in 4:10
        for N in 1:min(n, 5)
            H = build_hilbert_space(tl, n, N)
            println("    $n     |     $N      |   $(length(H))")
        end
    end
end

# Run examples if executed directly
if abspath(PROGRAM_FILE) == @__FILE__
    example_fibonacci()
    example_ising()
    example_scaling()
end
