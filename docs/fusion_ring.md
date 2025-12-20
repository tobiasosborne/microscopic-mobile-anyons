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
| A1 | Finite set of simple objects $\{X_i\}_{i=0}^{d_C-1}$ | Technical | assumed |
| A2 | Structure constants $N_{ab}^c \in \mathbb{Z}_{\ge 0}$ are associative and unital with unit $\mathbf{1}$ | Technical | assumed |

---

## §3.1.0 Simple Objects

**Definition 3.1.0** (Simple object). Let $\mathcal{C}$ be a fusion category over field $\mathbb{C}$. An object $X \in \mathcal{C}$ is **simple** if it satisfies all three conditions:

1. **Nonzero:** $X \neq 0$ (in the sense that $X$ is not the zero object).
2. **Indecomposable:** If $X \cong Y \oplus Z$, then $Y = 0$ or $Z = 0$.
3. **Schur:** $\mathrm{End}(X) \cong \mathbb{C}$ (all endomorphisms are scalar multiples of the identity).

**Consequence:** By semisimplicity of fusion categories (Deligne's theorem), every object $A \in \mathcal{C}$ decomposes as a finite direct sum of simple objects:
$$A \cong \bigoplus_{i \in I} X_i^{\oplus m_i}$$
where $X_i$ are simple and $m_i \in \mathbb{Z}_{\ge 0}$ are multiplicities.

For our purposes, we work with fusion categories where the simple objects are **distinguishable** by their labels: $\{X_0, X_1, \ldots, X_{d_C-1}\}$ with $X_0 = \mathbf{1}$ (the tensor unit/vacuum).

[Etingof–Nikshych–Ostrik, *Ann. Math.* **162** (2005), Theorem 2.7] `[unverified]`

---

**Definition 3.1** (Fusion ring). A fusion ring is a finitely generated free abelian group $\mathcal{R} = \bigoplus_{i \in I} \mathbb{Z} X_i$ with a ring structure satisfying:

1. $X_0 = \mathbf{1}$ is the unit element.
2. The product of basis elements satisfies
   \[
   X_i X_j = \sum_{k\in I} N_{ij}^k X_k,
   \]
   where $N_{ij}^k \in \mathbb{Z}_{\ge 0}$ are the **fusion coefficients** (or fusion multiplicities).
3. There exists an involution $i \mapsto i^*$ such that
   \[
   N_{ij}^0 = \delta_{i, j^*}.
   \]

The involution gives duality: $X_i^* = X_{i^*}$. Associativity follows from the ring axioms: $\sum_e N_{ij}^e N_{ek}^\ell = \sum_e N_{jk}^e N_{ie}^\ell$ for all $i, j, k, \ell \in I$.

**Note:** Fusion rings are generally **not commutative**, i.e., $N_{ij}^k \neq N_{ji}^k$ in general.

[Etingof–Nikshych–Ostrik, *Ann. Math.* **162** (2005), 581–642, Def. 3.1] `[unverified]`

```julia
# file: src/julia/FusionCategories/fusion_ring.jl
module FusionCategories

export FusionRing, fusion_product, is_associative, has_valid_duality

"""
    FusionRing(basis::Vector{Symbol}, unit::Symbol, dual::Dict{Symbol,Symbol},
               N::Dict{NTuple{3,Symbol},Int})

A fusion ring as per Etingof–Nikshych–Ostrik (2005), Definition 3.1.

# Fields
- `basis`: Basis elements {X_i | i ∈ I}, with X_0 = unit
- `unit`: The unit element (X_0 = 𝟙)
- `dual`: The involution map i ↦ i*, implementing duality
- `N`: Fusion coefficients N[(i,j,k)] = N_{ij}^k ∈ ℤ_{≥0}

# Axioms
1. X_0 is the unit
2. X_i X_j = ∑_k N_{ij}^k X_k with N_{ij}^k ≥ 0
3. N_{i,i*}^0 = 1 and N_{ij}^0 = 0 for j ≠ i*

See: docs/fusion_ring.md, Definition 3.1
"""
struct FusionRing
    basis::Vector{Symbol}
    unit::Symbol
    dual::Dict{Symbol,Symbol}
    N::Dict{NTuple{3,Symbol},Int}
    function FusionRing(basis, unit, dual, N)
        @assert unit ∈ basis "Unit must be in basis"
        @assert all(dual[dual[x]] == x for x in basis) "Dual must be an involution"
        new(basis, unit, dual, N)
    end
end

"""
    fusion_product(R::FusionRing, a::Symbol, b::Symbol) -> Dict{Symbol,Int}

Compute X_a · X_b = ∑_c N_{ab}^c X_c, returning coefficients as a dictionary.
"""
fusion_product(R::FusionRing, a::Symbol, b::Symbol) =
    Dict(c => get(R.N, (a, b, c), 0) for c in R.basis)

"""
    is_associative(R::FusionRing) -> Bool

Check if ∑_e N_{ij}^e N_{ek}^ℓ = ∑_e N_{jk}^e N_{ie}^ℓ for all i,j,k,ℓ.
"""
is_associative(R::FusionRing) = all(
    sum(get(R.N, (i, j, e), 0) * get(R.N, (e, k, ℓ), 0) for e in R.basis) ==
    sum(get(R.N, (j, k, e), 0) * get(R.N, (i, e, ℓ), 0) for e in R.basis)
    for i in R.basis, j in R.basis, k in R.basis, ℓ in R.basis
)

"""
    has_valid_duality(R::FusionRing) -> Bool

Check that N_{i,i*}^0 = 1 for all i (and implicitly N_{ij}^0 = 0 for j ≠ i*).
"""
has_valid_duality(R::FusionRing) = all(
    get(R.N, (i, R.dual[i], R.unit), 0) == 1 for i in R.basis
)

end # module
```
