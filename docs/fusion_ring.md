---
refs-in:
  - research_plan.md
  - prd.md
  - tech_specs.md
refs-out:
  - fusion_category.md
---

# Fusion Ring

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A1 | Finite set of simple objects $\{X_i\}_{i=1}^d$ | Technical | assumed |
| A2 | Structure constants $N_{ab}^c \in \mathbb{N}$ are associative and unital with unit $\mathbf{1}$ | Technical | assumed |

**Definition 3.1** (Fusion ring). A fusion ring is a free $\mathbb{Z}$-module $R$ with basis $\{X_1, \ldots, X_d\}$ containing a distinguished unit $\mathbf{1}$ such that for all basis elements $X_a, X_b$ the product decomposes as
\[
  X_a \cdot X_b = \sum_{c=1}^d N_{ab}^c\, X_c,\quad N_{ab}^c \in \mathbb{N},
\]
with associativity $\sum_e N_{ab}^e N_{ec}^f = \sum_e N_{bc}^e N_{ae}^f$, commutativity $N_{ab}^c = N_{ba}^c$, and an involution $a \mapsto \bar{a}$ implementing duals with $N_{a\bar{a}}^{\mathbf{1}} \ge 1$. [TensorCategories2015, §2.3] `[unverified]`

```julia
# file: src/julia/FusionCategories/fusion_ring.jl
module FusionCategories

export FusionRing, fusion_product, is_associative

"""
    FusionRing(basis::Vector{Symbol}, N::Dict{NTuple{3,Symbol},Int})

Grothendieck fusion ring with basis elements and non-negative integer structure
constants N[(a,b,c)] = N_{ab}^c. Unit is `:one` by convention.
Refs: docs/fusion_ring.md, Definition 3.1.
"""
struct FusionRing
    basis::Vector{Symbol}
    N::Dict{NTuple{3,Symbol},Int}
end

fusion_product(R::FusionRing, a::Symbol, b::Symbol) =
    Dict(c => get(R.N, (a, b, c), 0) for c in R.basis)

is_associative(R::FusionRing) = all(
    sum(get(R.N, (a, b, e), 0) * get(R.N, (e, c, f), 0) for e in R.basis) ==
    sum(get(R.N, (b, c, e), 0) * get(R.N, (a, e, f), 0) for e in R.basis)
    for a in R.basis, b in R.basis, c in R.basis, f in R.basis
)

end # module
```
