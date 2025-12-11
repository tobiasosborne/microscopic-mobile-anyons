---
title: Morphism Spaces and Multiplicities
section: "§3.1.3"
refs-in:
  - fusion_category.md
  - fusion_ring.md
  - research_plan.md
refs-out:
  - hilbert_space.md
  - operators.md
  - diagrammatic_calculus.md
---

# Morphism Spaces and Multiplicities

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.1.3.1 | Fusion category $(\mathcal{C}, \otimes, \mathbf{1})$ over an algebraically closed field $k$ (Definition 3.2) | Input | assumed |
| A3.1.3.2 | $\mathcal{C}$ is semisimple and $k$-linear, so all morphism spaces are finite-dimensional $k$-vector spaces | Technical | assumed |

**Definition 3.3** (Morphism space). For any objects $A, B \in \mathcal{C}$,
\[
\mathrm{Mor}(A, B) := \mathrm{Hom}_{\mathcal{C}}(A, B)
\]
is a finite-dimensional $k$-vector space. If $A, B$ are simple, Schur's lemma implies $\dim \mathrm{Mor}(A, B) = \delta_{A, B}$.
[Etingof–Nikshych–Ostrik, §2] `[unverified]`

**Definition 3.4** (Fusion multiplicity space). For simple objects $X_a, X_b, X_c \in \mathrm{Irr}(\mathcal{C})$, the space
\[
\mathrm{Mor}(X_a \otimes X_b, X_c)
\]
has dimension $N_{ab}^c = \dim \mathrm{Mor}(X_a \otimes X_b, X_c) \in \mathbb{Z}_{\ge 0}$. A **multiplicity basis** is any choice of morphisms
\[
f_{ab \to c}^{(\mu)} : X_a \otimes X_b \to X_c,\quad \mu = 1, \ldots, N_{ab}^c.
\]
No canonical choice exists; computations must remain basis-independent. When a fusion-tree basis is fixed for computation, record normalisation in `docs/diagrammatic_calculus.md`.
[Etingof–Nikshych–Ostrik, §2] `[unverified]`

**Claim 3.1.3.1** (Multiplicity-free simplification). In the multiplicity-free case ($N_{ab}^c \in \{0, 1\}$), each space $\mathrm{Mor}(X_a \otimes X_b, X_c)$ is either $\{0\}$ or a one-dimensional $k$-line. Basis dependence disappears, and $f_{ab \to c}^{(1)}$ can be chosen uniquely up to phase.

```julia
# file: src/julia/FusionCategories/fusion_category.jl
# Planning ref: §3.1.3

"""
    morphism_dim(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) -> Int

Return dim Mor(X_a \\otimes X_b, X_c) = N_{ab}^c.
See: docs/morphism_spaces.md, Definition 3.4.
"""
morphism_dim(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) =
    fusion_multiplicity(C, a, b, c)

"""
    multiplicity_basis_labels(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol)
        -> Vector{Tuple{Symbol,Symbol,Symbol,Int}}

Return abstract labels for a multiplicity basis f_{ab->c}^{(mu)} with
mu = 1,...,N_{ab}^c. This is basis-independent bookkeeping only.
See: docs/morphism_spaces.md, Definition 3.4.
"""
function multiplicity_basis_labels(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol)
    n = fusion_multiplicity(C, a, b, c)
    [(a, b, c, mu) for mu in 1:n]
end
```

**Remark.** Duals: $\mathrm{Mor}(\mathbf{1}, X_a \otimes X_b)$ is canonically dual to $\mathrm{Mor}(X_a^* \otimes X_b^*, \mathbf{1})$ via rigidity. Normalisation choices for evaluation/coevaluation maps must be consistent with `docs/diagrammatic_calculus.md`.

**Remark.** Basis independence is essential for categorical definitions. Fusion-tree bases are admissible for computations (e.g., numerical evaluation of $F$-symbols) but must be removed from statements of definitions and theorems.
