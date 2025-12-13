# src/julia/Lattice/local_hilbert.jl
# Planning ref: §3.4.4
# See: docs/lattice.md

include("lattice.jl")

"""
    LatticeWithHilbert

Lattice with local Hilbert space structure.
Each site carries a local Hilbert space of dimension `local_dim`.

See: docs/lattice.md, Definitions 3.4.8-3.4.10
"""
struct LatticeWithHilbert
    lattice::Lattice1D
    local_dim::Int
    
    function LatticeWithHilbert(n_sites::Int, d_loc::Int)
        @assert d_loc ≥ 1 "Local dimension must be ≥ 1"
        new(Lattice1D(n_sites), d_loc)
    end
end

"""
    LatticeWithHilbert(L::Lattice1D, d::Int)

Construct from existing lattice.
"""
LatticeWithHilbert(L::Lattice1D, d_loc::Int) = LatticeWithHilbert(L.n_sites, d_loc)

"""
    total_dim(L::LatticeWithHilbert) -> Int

Total Hilbert space dimension: d^n

See: docs/lattice.md, Definition 3.4.10
"""
total_dim(L::LatticeWithHilbert) = L.local_dim ^ L.lattice.n_sites

"""
    local_dim(L::LatticeWithHilbert) -> Int

Local Hilbert space dimension.

See: docs/lattice.md, Definition 3.4.9
"""
local_dim(L::LatticeWithHilbert) = L.local_dim

"""
    n_sites(L::LatticeWithHilbert) -> Int

Number of lattice sites.
"""
n_sites(L::LatticeWithHilbert) = L.lattice.n_sites

"""
    basis_index(L::LatticeWithHilbert, occupations::Vector{Int}) -> Int

Convert occupation vector to computational basis index (0-indexed).

Uses little-endian convention: site 0 is least significant.

Example: For d=2, n=3, occupations=[1,0,1] → index = 1 + 0⋅2 + 1⋅4 = 5
"""
function basis_index(L::LatticeWithHilbert, occupations::Vector{Int})
    @assert length(occupations) == L.lattice.n_sites "Wrong number of occupations"
    @assert all(0 .≤ occupations .< L.local_dim) "Occupation out of range [0, $(L.local_dim))"
    
    idx = 0
    for (j, occ) in enumerate(occupations)
        idx += occ * L.local_dim^(j-1)
    end
    return idx
end

"""
    index_to_occupations(L::LatticeWithHilbert, idx::Int) -> Vector{Int}

Convert computational basis index to occupation vector.

Inverse of `basis_index`.
"""
function index_to_occupations(L::LatticeWithHilbert, idx::Int)
    @assert 0 ≤ idx < total_dim(L) "Index out of range [0, $(total_dim(L)))"
    
    occs = zeros(Int, L.lattice.n_sites)
    remaining = idx
    for j in 1:L.lattice.n_sites
        occs[j] = remaining % L.local_dim
        remaining ÷= L.local_dim
    end
    return occs
end

"""
    computational_basis(L::LatticeWithHilbert) -> Vector{Vector{Int}}

All computational basis states as occupation vectors.
"""
function computational_basis(L::LatticeWithHilbert)
    return [index_to_occupations(L, idx) for idx in 0:(total_dim(L) - 1)]
end

"""
    basis_state(L::LatticeWithHilbert, occupations::Vector{Int}) -> Vector{ComplexF64}

Construct the computational basis state vector for given occupations.
"""
function basis_state(L::LatticeWithHilbert, occupations::Vector{Int})
    idx = basis_index(L, occupations)
    v = zeros(ComplexF64, total_dim(L))
    v[idx + 1] = 1.0  # Julia is 1-indexed
    return v
end

"""
    basis_state(L::LatticeWithHilbert, idx::Int) -> Vector{ComplexF64}

Construct the computational basis state vector for given index.
"""
function basis_state(L::LatticeWithHilbert, idx::Int)
    @assert 0 ≤ idx < total_dim(L)
    v = zeros(ComplexF64, total_dim(L))
    v[idx + 1] = 1.0
    return v
end

# Forward methods from Lattice1D
sites(L::LatticeWithHilbert) = sites(L.lattice)
neighbours(L::LatticeWithHilbert, i::Int) = neighbours(L.lattice, i)
boundary(L::LatticeWithHilbert) = boundary(L.lattice)
bulk(L::LatticeWithHilbert) = bulk(L.lattice)
bonds(L::LatticeWithHilbert) = bonds(L.lattice)
