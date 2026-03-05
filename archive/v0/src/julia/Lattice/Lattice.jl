# src/julia/Lattice/Lattice.jl
# Module for lattice geometry
# Planning ref: §3.4

module Lattice

export Lattice1D, sites, n_sites, are_neighbours, neighbours, boundary, bulk, is_boundary, is_bulk, bonds
export PhysicalLattice1D, unit_lattice, position, positions, site_at_position
export BoundaryCondition, OBC, PBC, n_neighbours, has_obc, validate_obc
export LatticeWithHilbert, total_dim, local_dim, basis_index, index_to_occupations, computational_basis, basis_state

include("lattice.jl")

# PhysicalLattice1D (inline to avoid include conflicts)
"""
    PhysicalLattice1D

Lattice with physical length and spacing.
"""
struct PhysicalLattice1D
    n_sites::Int
    length::Float64
    spacing::Float64
    
    function PhysicalLattice1D(n::Int, L::Real)
        @assert n ≥ 1 "Need at least 1 site"
        @assert L > 0 "Length must be positive"
        new(n, Float64(L), Float64(L) / n)
    end
end

unit_lattice(n::Int) = PhysicalLattice1D(n, Float64(n))
position(L::PhysicalLattice1D, j::Int) = (@assert 0 ≤ j < L.n_sites; L.spacing * j)
positions(L::PhysicalLattice1D) = [position(L, j) for j in 0:(L.n_sites - 1)]
lattice(L::PhysicalLattice1D) = Lattice1D(L.n_sites)

sites(L::PhysicalLattice1D) = sites(lattice(L))
neighbours(L::PhysicalLattice1D, i::Int) = neighbours(lattice(L), i)
boundary(L::PhysicalLattice1D) = boundary(lattice(L))
bulk(L::PhysicalLattice1D) = bulk(lattice(L))
bonds(L::PhysicalLattice1D) = bonds(lattice(L))

# Boundary conditions
@enum BoundaryCondition begin
    OBC
    PBC
end

function n_neighbours(n_sites::Int, i::Int, bc::BoundaryCondition)
    @assert 0 ≤ i < n_sites
    if n_sites == 1
        return 0
    end
    if bc == OBC
        return (i == 0 || i == n_sites - 1) ? 1 : 2
    else
        return 2
    end
end

has_obc(::Any) = true
validate_obc(L) = has_obc(L) || error("Requires OBC")

# LatticeWithHilbert
"""
    LatticeWithHilbert

Lattice with local Hilbert space structure.
"""
struct LatticeWithHilbert
    lattice::Lattice1D
    local_dim::Int
    
    function LatticeWithHilbert(n_sites::Int, d::Int)
        @assert d ≥ 1 "Local dimension must be ≥ 1"
        new(Lattice1D(n_sites), d)
    end
end

LatticeWithHilbert(L::Lattice1D, d::Int) = LatticeWithHilbert(L.n_sites, d)
total_dim(L::LatticeWithHilbert) = L.local_dim ^ L.lattice.n_sites
local_dim(L::LatticeWithHilbert) = L.local_dim
n_sites(L::LatticeWithHilbert) = L.lattice.n_sites

function basis_index(L::LatticeWithHilbert, occupations::Vector{Int})
    @assert length(occupations) == L.lattice.n_sites
    @assert all(0 .≤ occupations .< L.local_dim)
    idx = 0
    for (j, occ) in enumerate(occupations)
        idx += occ * L.local_dim^(j-1)
    end
    return idx
end

function index_to_occupations(L::LatticeWithHilbert, idx::Int)
    @assert 0 ≤ idx < total_dim(L)
    occs = zeros(Int, L.lattice.n_sites)
    remaining = idx
    for j in 1:L.lattice.n_sites
        occs[j] = remaining % L.local_dim
        remaining ÷= L.local_dim
    end
    return occs
end

computational_basis(L::LatticeWithHilbert) = [index_to_occupations(L, idx) for idx in 0:(total_dim(L) - 1)]

function basis_state(L::LatticeWithHilbert, occupations::Vector{Int})
    idx = basis_index(L, occupations)
    v = zeros(ComplexF64, total_dim(L))
    v[idx + 1] = 1.0
    return v
end

function basis_state(L::LatticeWithHilbert, idx::Int)
    @assert 0 ≤ idx < total_dim(L)
    v = zeros(ComplexF64, total_dim(L))
    v[idx + 1] = 1.0
    return v
end

sites(L::LatticeWithHilbert) = sites(L.lattice)
neighbours(L::LatticeWithHilbert, i::Int) = neighbours(L.lattice, i)
boundary(L::LatticeWithHilbert) = boundary(L.lattice)
bulk(L::LatticeWithHilbert) = bulk(L.lattice)
bonds(L::LatticeWithHilbert) = bonds(L.lattice)

end # module
