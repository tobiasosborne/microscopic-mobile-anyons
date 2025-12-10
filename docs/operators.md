---
title: Operators as Morphisms
section: "§4.3"
refs-in:
  - hilbert_space.md
  - fusion_category.md
refs-out:
  - hamiltonian_v0.md
  - hamiltonian_v1.md
---

# Operators as Morphisms

**Planning ref:** §4.3  
**Status:** Draft

---

## §4.3.1 Operator Space

**Definition 4.3.1** (Operator). An operator on $\mathcal{H}$ is a linear map $\mathcal{H} \to \mathcal{H}$.

**Definition 4.3.2** (Operator as morphism sum). Operators decompose as:
$$\mathcal{A} \in \bigoplus_{A,B} \mathrm{Mor}(A, B)$$
where $A, B$ range over tensor products of $\mathbf{1}, X_2, \ldots, X_d$.

---

## §4.3.2 Particle-Number Conservation

**Definition 4.3.3** (Particle-conserving operator). An operator $\mathcal{A}$ is *particle-conserving* if it maps $\mathcal{H}_N \to \mathcal{H}_N$ for all $N$.

**Definition 4.3.4** (Particle-changing operator). An operator with components in $\mathrm{Mor}(A, B)$ where $A$ and $B$ have different numbers of nontrivial factors changes particle number.

**Example.** $\mathrm{Mor}(X_a \otimes X_b, X_c \otimes \mathbf{1})$ annihilates a particle (if $X_c$ is nontrivial) or two particles (if $X_c = \mathbf{1}$).

---

## §4.3.3 Locality

**Definition 4.3.5** (Local operator). An operator is *local* if it acts nontrivially only on a bounded number of adjacent sites.

**Definition 4.3.6** (k-local operator). A *k-local* operator acts on at most $k$ consecutive sites.

For mobile anyons, a 2-local operator has components:
- $\mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$ — acts on two neighbouring anyons
- $\mathrm{Mor}(X_a \otimes \mathbf{1}, \mathbf{1} \otimes X_a)$ — hops anyon right
- $\mathrm{Mor}(\mathbf{1} \otimes X_a, X_a \otimes \mathbf{1})$ — hops anyon left

```julia
# file: src/julia/MobileAnyons/operators.jl

abstract type AnyonOperator end

struct MorphismTerm
    source::Vector{Int}    # object A as list of simple labels
    target::Vector{Int}    # object B as list of simple labels  
    matrix::Matrix{ComplexF64}
end

struct LocalOperator <: AnyonOperator
    site::Int                           # leftmost site
    width::Int                          # number of sites (locality)
    components::Vector{MorphismTerm}    # Mor(A,B) terms
end

is_particle_conserving(op::LocalOperator) = all(
    count(≠(1), t.source) == count(≠(1), t.target) 
    for t in op.components
)
```
