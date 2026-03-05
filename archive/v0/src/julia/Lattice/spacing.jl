# src/julia/Lattice/spacing.jl
# Planning ref: §3.4.2
# See: docs/lattice.md

include("lattice.jl")

"""
    PhysicalLattice1D

Lattice with physical length and spacing.

See: docs/lattice.md, Definitions 3.4.4-3.4.6
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

"""
    unit_lattice(n::Int) -> PhysicalLattice1D

Convenience constructor with ε = 1 (equivalently, L = n).
"""
unit_lattice(n::Int) = PhysicalLattice1D(n, Float64(n))

"""
    position(L::PhysicalLattice1D, j::Int) -> Float64

Physical position of site j: xⱼ = ε ⋅ j

See: docs/lattice.md, Definition 3.4.6
"""
function position(L::PhysicalLattice1D, j::Int)
    @assert 0 ≤ j < L.n_sites "Site index out of range"
    return L.spacing * j
end

"""
    positions(L::PhysicalLattice1D) -> Vector{Float64}

All physical positions.
"""
positions(L::PhysicalLattice1D) = [position(L, j) for j in 0:(L.n_sites - 1)]

"""
    site_at_position(L::PhysicalLattice1D, x::Real) -> Int

Find nearest site to physical position x.
"""
function site_at_position(L::PhysicalLattice1D, x::Real)
    j = round(Int, x / L.spacing)
    return clamp(j, 0, L.n_sites - 1)
end

"""
    lattice(L::PhysicalLattice1D) -> Lattice1D

Extract the underlying discrete lattice.
"""
lattice(L::PhysicalLattice1D) = Lattice1D(L.n_sites)

# Forward methods from Lattice1D
sites(L::PhysicalLattice1D) = sites(lattice(L))
neighbours(L::PhysicalLattice1D, i::Int) = neighbours(lattice(L), i)
boundary(L::PhysicalLattice1D) = boundary(lattice(L))
bulk(L::PhysicalLattice1D) = bulk(lattice(L))
bonds(L::PhysicalLattice1D) = bonds(lattice(L))
