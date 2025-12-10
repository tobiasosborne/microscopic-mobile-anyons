# src/julia/Lattice/boundary.jl
# Planning ref: §3.4.3
# See: docs/lattice.md

"""
    BoundaryCondition

Enum for boundary condition types.

See: docs/lattice.md, Definition 3.4.7
"""
@enum BoundaryCondition begin
    OBC  # Open boundary conditions (used in this project)
    PBC  # Periodic boundary conditions (excluded by Assumption A3.4.2)
end

"""
    n_neighbours(n_sites::Int, i::Int, bc::BoundaryCondition) -> Int

Number of neighbours for site i under given boundary conditions.
"""
function n_neighbours(n_sites::Int, i::Int, bc::BoundaryCondition)
    @assert 0 ≤ i < n_sites "Site index out of range"
    
    if n_sites == 1
        return bc == PBC ? 0 : 0  # Single site has no neighbours either way
    end
    
    if bc == OBC
        if i == 0 || i == n_sites - 1
            return 1  # Boundary sites have 1 neighbour
        else
            return 2  # Bulk sites have 2 neighbours
        end
    else  # PBC
        return 2  # All sites have 2 neighbours with PBC
    end
end

"""
    has_obc(::Any) -> Bool

Check if lattice has open boundary conditions.
Always returns true in this project (Assumption A3.4.2).
"""
has_obc(::Any) = true

"""
    validate_obc(L) -> Nothing

Assert that we are using OBC. Raises error if not.
"""
function validate_obc(L)
    if !has_obc(L)
        error("This project requires open boundary conditions (Assumption A3.4.2)")
    end
    return nothing
end

"""
    boundary_effects_present(n_sites::Int) -> Bool

Check if boundary effects are non-trivial.
For very small systems, boundary effects dominate.
"""
boundary_effects_present(n_sites::Int) = n_sites < 10

"""
    bulk_fraction(n_sites::Int) -> Float64

Fraction of sites in the bulk (not on boundary).
"""
function bulk_fraction(n_sites::Int)
    if n_sites ≤ 2
        return 0.0
    else
        return (n_sites - 2) / n_sites
    end
end
