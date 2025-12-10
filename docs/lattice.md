---
title: Lattice Geometry
section: "§3.4"
refs-in:
  - qm_lattice.md
refs-out:
  - config_space.md
  - hilbert_space.md
---

# Lattice Geometry

**Planning ref:** §3.4  
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.4.1 | Spatial dimension is 1 | Constraint | assumed |
| A3.4.2 | Open boundary conditions (no PBCs) | Constraint | assumed |
| A3.4.3 | Finite number of sites | Technical | assumed |

---

## §3.4.1 One-Dimensional Chain

**Definition 3.4.1** (Lattice). A *lattice* $\Lambda$ is a finite set of sites. In this work:
$$\Lambda = \{0, 1, 2, \ldots, n-1\}$$
where $n = |\Lambda|$ is the number of sites.

**Remark.** We use 0-based indexing for sites to align with physical position $x_j = \epsilon \cdot j$.

**Definition 3.4.2** (Neighbour relation). Sites $i$ and $j$ are *neighbours* if $|i - j| = 1$. We write $i \sim j$.

**Definition 3.4.3** (Boundary sites). The *boundary* of $\Lambda$ consists of sites $0$ and $n-1$. The *bulk* consists of sites $\{1, \ldots, n-2\}$.

```julia
# file: src/julia/Lattice/lattice.jl

"""
One-dimensional lattice with n sites (0-indexed: 0, 1, ..., n-1).
"""
struct Lattice1D
    n_sites::Int
    
    function Lattice1D(n::Int)
        @assert n ≥ 1 "Lattice must have at least 1 site"
        new(n)
    end
end

"""
All sites in the lattice.
"""
sites(L::Lattice1D) = 0:(L.n_sites - 1)

"""
Check if two sites are neighbours.
"""
are_neighbours(i::Int, j::Int) = abs(i - j) == 1

"""
Neighbours of site i in lattice L.
"""
function neighbours(L::Lattice1D, i::Int)
    @assert 0 ≤ i < L.n_sites "Site index out of range"
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
Boundary sites.
"""
boundary(L::Lattice1D) = [0, L.n_sites - 1]

"""
Bulk sites (excluding boundaries).
"""
bulk(L::Lattice1D) = L.n_sites > 2 ? collect(1:(L.n_sites - 2)) : Int[]
```

---

## §3.4.2 Lattice Spacing and Physical Position

**Definition 3.4.4** (Physical length). The *physical length* of the system is $L > 0$.

**Definition 3.4.5** (Lattice spacing). The *lattice spacing* is
$$\epsilon = \frac{L}{n}$$

**Definition 3.4.6** (Physical position). The *physical position* of site $j$ is
$$x_j = \epsilon \cdot j = \frac{L \cdot j}{n}$$
so that $x_0 = 0$ and $x_{n-1} = L(1 - 1/n) < L$.

**Convention.** Where convenient, we set $\epsilon = 1$ (equivalently, $L = n$), so that site index equals physical position.

```julia
# file: src/julia/Lattice/spacing.jl

"""
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

"""
Convenience constructor with ε = 1.
"""
unit_lattice(n::Int) = PhysicalLattice1D(n, Float64(n))

"""
Physical position of site j.
"""
position(L::PhysicalLattice1D, j::Int) = L.spacing * j

"""
All physical positions.
"""
positions(L::PhysicalLattice1D) = [position(L, j) for j in 0:(L.n_sites - 1)]
```

---

## §3.4.3 Open Boundary Conditions

**Definition 3.4.7** (Open boundary conditions). A system has *open boundary conditions* (OBC) if:
1. The lattice is a finite chain with distinct endpoints
2. Site 0 has only one neighbour (site 1)
3. Site $n-1$ has only one neighbour (site $n-2$)

**Remark.** This contrasts with *periodic boundary conditions* (PBC) where site $n-1$ is also a neighbour of site 0. We exclude PBCs in this work (Assumption A3.4.2).

**Remark.** OBC implies:
- No topological ground state degeneracy from nontrivial cycles
- Edge effects may be present
- Total charge is well-defined without ambiguity from winding

```julia
# file: src/julia/Lattice/boundary.jl

"""
Boundary condition types.
"""
@enum BoundaryCondition OBC PBC

"""
Number of neighbours for site i under given boundary conditions.
"""
function n_neighbours(n_sites::Int, i::Int, bc::BoundaryCondition)
    @assert 0 ≤ i < n_sites
    if bc == OBC
        if i == 0 || i == n_sites - 1
            return 1
        else
            return 2
        end
    else  # PBC - not used in this project
        return n_sites == 1 ? 0 : 2
    end
end

"""
Check if lattice has open boundary conditions (always true in this project).
"""
has_obc(L::Lattice1D) = true
```

---

## §3.4.4 Local Hilbert Spaces

**Definition 3.4.8** (Local Hilbert space). Each site $j \in \Lambda$ carries a *local Hilbert space* $\mathcal{H}_j$. For identical sites:
$$\mathcal{H}_j \cong \mathcal{H}_{\mathrm{loc}} \quad \forall j$$

**Definition 3.4.9** (Local dimension). The *local dimension* is $d = \dim(\mathcal{H}_{\mathrm{loc}})$.

**Definition 3.4.10** (Total Hilbert space). The *total Hilbert space* for the lattice is
$$\mathcal{H}_{\mathrm{total}} = \bigotimes_{j=0}^{n-1} \mathcal{H}_j \cong \mathbb{C}^{d^n}$$

**Remark.** For mobile anyons, the local Hilbert space structure is more subtle—see §4. The "local dimension" depends on the occupation at that site.

```julia
# file: src/julia/Lattice/local_hilbert.jl

"""
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

"""
Total Hilbert space dimension.
"""
total_dim(L::LatticeWithHilbert) = L.local_dim ^ L.lattice.n_sites

"""
Canonical basis state: site j in local state k, others in state 0.
Returns index in computational basis (0-indexed).
"""
function basis_index(L::LatticeWithHilbert, occupations::Vector{Int})
    @assert length(occupations) == L.lattice.n_sites
    @assert all(0 .≤ occupations .< L.local_dim)
    
    # Convert to single index (little-endian convention)
    idx = 0
    for (j, occ) in enumerate(occupations)
        idx += occ * L.local_dim^(j-1)
    end
    return idx
end

"""
Inverse: index to occupation vector.
"""
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
```

---

## Summary

| Concept | Symbol | Value/Definition |
|---------|--------|------------------|
| Number of sites | $n$ | $\|\Lambda\|$ |
| Site indices | $j$ | $0, 1, \ldots, n-1$ |
| Physical length | $L$ | System size |
| Lattice spacing | $\epsilon$ | $L/n$ |
| Physical position | $x_j$ | $\epsilon \cdot j$ |
| Local Hilbert space | $\mathcal{H}_j$ | Space at site $j$ |
| Local dimension | $d$ | $\dim(\mathcal{H}_{\mathrm{loc}})$ |
| Total dimension | — | $d^n$ |

---

## Notation Conventions

Throughout this project:
- Sites are **0-indexed**: $j \in \{0, 1, \ldots, n-1\}$
- Boundary conditions are **open** (OBC)
- Default: $\epsilon = 1$ unless stated otherwise
- Tensor products are ordered left-to-right: $\mathcal{H}_0 \otimes \mathcal{H}_1 \otimes \cdots \otimes \mathcal{H}_{n-1}$
