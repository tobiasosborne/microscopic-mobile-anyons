---
title: Fusion Categories
section: "§3.1.2"
refs-in:
  - fusion_ring.md
  - research_plan.md
  - prd.md
  - tech_specs.md
refs-out:
  - hilbert_space.md
  - diagrammatic_calculus.md
  - operators.md
---

# Fusion Categories

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.1.2.1 | Fusion ring $(R, \{X_i\}_{i=1}^d, \mathbf{1})$ with $N_{ab}^c \in \mathbb{Z}_{\ge 0}$ (Definition 3.1) | Input | assumed |
| A3.1.2.2 | Associator data $F$ (and, when present, braiding data $R$) satisfy the pentagon/hexagon equations with normalisation recorded in `docs/diagrammatic_calculus.md` | Technical | assumed |

**Definition 3.2** (Fusion category). A fusion category over $\mathbb{C}$ is a semisimple, $\mathbb{C}$-linear, rigid monoidal category $\mathcal{C}$ with finitely many isomorphism classes of simple objects $\{X_1=\mathbf{1}, \ldots, X_d\}$. The data consist of:
- Tensor product $\otimes: \mathcal{C} \times \mathcal{C} \to \mathcal{C}$ with unit object $\mathbf{1}$.
- Fusion multiplicities $N_{ab}^c = \dim \mathrm{Mor}(X_a \otimes X_b, X_c) \in \mathbb{Z}_{\ge 0}$ (multiplicity allowed).
- Associator isomorphisms $\alpha_{a,b,c}: (X_a \otimes X_b) \otimes X_c \to X_a \otimes (X_b \otimes X_c)$ whose matrix elements $F_{abc}^{d; e, f}$ (in any fusion-tree basis) satisfy the pentagon identity.
- Duals $X_a^\ast$ with evaluation/coevaluation maps (rigidity), giving $N_{a\,\bar{a}}^{\mathbf{1}} \ge 1$ with $\bar{a}$ the index of $X_a^\ast$.
- (If braided) braiding isomorphisms $c_{a,b}: X_a \otimes X_b \to X_b \otimes X_a$ with matrix elements $R_{ab}^c$ satisfying the hexagon identities with $F$.

All statements are basis-independent; concrete $F$- and $R$-symbols may be specified by choosing fusion-tree bases, with normalisations documented separately. [TensorCategories2015, §2.3] `[unverified]`

```julia
# file: src/julia/FusionCategories/fusion_category.jl
export FusionCategory, fusion_multiplicity, associator_value, braiding_value, is_rigid

struct FusionCategory
    simples::Vector{Symbol}
    unit::Symbol
    dual::Dict{Symbol,Symbol}
    N::Dict{NTuple{3,Symbol},Int}
    F::Dict{NTuple{6,Symbol},ComplexF64}
    R::Dict{NTuple{3,Symbol},ComplexF64}
    function FusionCategory(simples, unit, dual, N;
                            F=Dict{NTuple{6,Symbol},ComplexF64}(),
                            R=Dict{NTuple{3,Symbol},ComplexF64}())
        new(simples, unit, dual, N, F, R)
    end
end

fusion_multiplicity(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) =
    get(C.N, (a, b, c), 0)

associator_value(C::FusionCategory, a, b, c, d, e, f) =
    get(C.F, (a, b, c, d, e, f), 0 + 0im)

braiding_value(C::FusionCategory, a, b, c) =
    get(C.R, (a, b, c), 0 + 0im)

function is_rigid(C::FusionCategory)
    all(C.dual[C.dual[x]] == x for x in C.simples) &&
    all(fusion_multiplicity(C, x, C.dual[x], C.unit) > 0 for x in C.simples)
end
```
