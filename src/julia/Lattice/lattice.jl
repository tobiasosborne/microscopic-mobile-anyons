# src/julia/Lattice/lattice.jl
# Planning ref: §3.4.1
# See: docs/lattice.md

"""
    Lattice1D

One-dimensional lattice with n sites (0-indexed: 0, 1, ..., n-1).

See: docs/lattice.md, Definition 3.4.1
"""
struct Lattice1D
    n_sites::Int
    
    function Lattice1D(n::Int)
        @assert n ≥ 1 "Lattice must have at least 1 site"
        new(n)
    end
end

"""
    sites(L::Lattice1D) -> UnitRange

All sites in the lattice (0-indexed).
"""
sites(L::Lattice1D) = 0:(L.n_sites - 1)

"""
    n_sites(L::Lattice1D) -> Int

Number of sites in the lattice.
"""
n_sites(L::Lattice1D) = L.n_sites

"""
    are_neighbours(i::Int, j::Int) -> Bool

Check if two sites are neighbours (differ by 1).

See: docs/lattice.md, Definition 3.4.2
"""
are_neighbours(i::Int, j::Int) = abs(i - j) == 1

"""
    neighbours(L::Lattice1D, i::Int) -> Vector{Int}

Neighbours of site i in lattice L (respecting OBC).
"""
function neighbours(L::Lattice1D, i::Int)
    @assert 0 ≤ i < L.n_sites "Site index out of range: got $i, need 0 ≤ i < $(L.n_sites)"
    result = Int[]
    if i > 0
        push!(result, i - 1)
    end
    if i < L.n_sites - 1
        push!(result, i + 1)
    end
    return result
end

"""
    boundary(L::Lattice1D) -> Vector{Int}

Boundary sites (endpoints).

See: docs/lattice.md, Definition 3.4.3
"""
boundary(L::Lattice1D) = L.n_sites == 1 ? [0] : [0, L.n_sites - 1]

"""
    bulk(L::Lattice1D) -> Vector{Int}

Bulk sites (excluding boundaries).

See: docs/lattice.md, Definition 3.4.3
"""
bulk(L::Lattice1D) = L.n_sites > 2 ? collect(1:(L.n_sites - 2)) : Int[]

"""
    is_boundary(L::Lattice1D, i::Int) -> Bool

Check if site i is on the boundary.
"""
is_boundary(L::Lattice1D, i::Int) = i == 0 || i == L.n_sites - 1

"""
    is_bulk(L::Lattice1D, i::Int) -> Bool

Check if site i is in the bulk.
"""
is_bulk(L::Lattice1D, i::Int) = !is_boundary(L, i)

"""
    bonds(L::Lattice1D) -> Vector{Tuple{Int,Int}}

All nearest-neighbour bonds (i, i+1) in the lattice.
"""
bonds(L::Lattice1D) = [(i, i+1) for i in 0:(L.n_sites - 2)]
