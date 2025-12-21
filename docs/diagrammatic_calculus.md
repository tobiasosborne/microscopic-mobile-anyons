---
title: Diagrammatic Calculus for Fusion Categories
section: "§3.5"
refs-in:
  - fusion_category.md
  - morphism_spaces.md
  - fusion_ring.md
refs-out:
  - braiding_particle_ordering.md
  - hilbert_space.md
  - operators.md
  - hamiltonian_v0.md
---

# Diagrammatic Calculus for Fusion Categories

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.5.1 | Fusion category $(\mathcal{C}, \otimes, \mathbf{1})$ over $k = \mathbb{C}$ (Definition 3.1.2) | Input | assumed |
| A3.5.2 | $\mathcal{C}$ is pivotal (left and right duals agree) | Technical | assumed |
| A3.5.3 | All diagrams are read bottom-to-top (source at bottom, target at top) | Convention | assumed |

## §3.5.1 String Diagrams for Morphisms

**Definition 3.5.1** (String diagram). A **string diagram** represents morphisms in a monoidal category graphically:

- **Objects** are drawn as labelled strings (vertical lines)
- **Morphisms** $f: A \to B$ are nodes (boxes/vertices) with input string $A$ below and output $B$ above
- **Composition** $g \circ f$ stacks $g$ above $f$
- **Tensor product** $f \otimes g$ places diagrams side-by-side (left-to-right)
- **Identity** $1_A$ is a straight vertical line labelled $A$

For fusion categories, strings are labelled by simple objects $X_i \in \mathrm{Irr}(\mathcal{C})$.

[Selinger, *New Structures for Physics*, Springer 2011, §4] `[unverified]`

**Reading convention:** Diagrams flow **bottom-to-top** (inputs at bottom, outputs at top). Tensor factors are ordered **left-to-right**.

## §3.5.2 Isotopy and Pivotal Structure

**Definition 3.5.2** (Isotopy invariance). String diagrams satisfy **isotopy invariance**: deforming a diagram without crossing strings or moving nodes past each other yields the same morphism.

**Definition 3.5.3** (Pivotal category). A **pivotal structure** on a monoidal category provides:
1. A chosen isomorphism $X \cong X^{**}$ (double dual) for each object
2. Consistency between left and right duals

In a pivotal fusion category, upward and downward strings are related by duality:
- Upward arrow on $X$: the object $X$
- Downward arrow on $X$: the dual $X^*$

**Consequence:** Pivotal structure allows bending strings (cups and caps) without ambiguity.

[Etingof et al., *Tensor Categories*, AMS 2015, §4.7] `[unverified]`

## §3.5.3 Evaluation, Coevaluation, and Quantum Dimensions

**Definition 3.5.4** (Evaluation and coevaluation). For a simple object $X_i$ with dual $X_i^*$:

- **Coevaluation** (cup): $\mathrm{coev}_i: \mathbf{1} \to X_i \otimes X_i^*$
- **Evaluation** (cap): $\mathrm{ev}_i: X_i^* \otimes X_i \to \mathbf{1}$

These satisfy the **zigzag identities**:
$$
(\mathrm{ev}_i \otimes 1_{X_i}) \circ (1_{X_i} \otimes \mathrm{coev}_i) = 1_{X_i}
$$
$$
(1_{X_i^*} \otimes \mathrm{ev}_i) \circ (\mathrm{coev}_i \otimes 1_{X_i^*}) = 1_{X_i^*}
$$

Diagrammatically: a bent string (cup followed by cap) straightens to an identity.

**Definition 3.5.5** (Quantum dimension). The **quantum dimension** $d_i$ of simple object $X_i$ is:
$$
d_i := \mathrm{ev}_i \circ \mathrm{coev}_i = \mathrm{Tr}(1_{X_i})
$$
Diagrammatically: a closed loop labelled $X_i$ evaluates to $d_i \in k$.

For unitary fusion categories, $d_i > 0$ for all simple objects.

[Etingof et al., *Tensor Categories*, AMS 2015, §4.5] `[unverified]`

## §3.5.4 F-Moves and R-Moves Diagrammatically

**Definition 3.5.6** (F-move). The **F-move** is the graphical representation of the associator. For simple objects $a, b, c, d$ with intermediate channels $e, f$:

```
    d                     d
    |                     |
   / \                   / \
  e   c       F         a   f
 / \          →            / \
a   b                     b   c
```

The F-symbol $(F_{abc}^d)_e^f$ (with multiplicity indices suppressed) gives the coefficient.

**Definition 3.5.7** (R-move). For a braided category, the **R-move** is:

```
a   b           b   a
 \ /     R       \ /
  X      →        X
 / \             / \
b   a           a   b
```

The R-symbol $(R_{ab}^c)$ (with multiplicity indices) relates the two orderings.

**Pentagon identity** (graphically): Five ways to re-associate $(a \otimes b) \otimes c) \otimes d$ form a commuting pentagon.

**Hexagon identities** (graphically): Interleaving F-moves and R-moves for three objects forms two commuting hexagons.

## §3.5.5 Normalisation Choices for This Project

**Convention 3.5.1** (Fusion tree normalisation). We adopt the following normalisations:

1. **Trivalent vertices** (fusion vertices $f_{ab \to c}^{(\mu)}$): Normalised so that
   $$
   \sum_\mu f_{ab \to c}^{(\mu)\dagger} f_{ab \to c}^{(\mu)} = 1_{X_a \otimes X_b \to c}
   $$

2. **Quantum dimensions**: $d_{\mathbf{1}} = 1$ (vacuum has dimension 1).

3. **Evaluation/coevaluation**: Normalised so closed loop gives quantum dimension:
   $$
   \bigcirc_{X_i} = d_i
   $$

4. **F-symbols**: Unitary in unitary fusion categories:
   $$
   \sum_f (F_{abc}^d)_e^f \overline{(F_{abc}^d)_{e'}^f} = \delta_{e,e'}
   $$

5. **R-symbols** (when braided): Unitary:
   $$
   (R_{ab}^c)^\dagger R_{ab}^c = 1
   $$

**Remark.** These conventions match TensorCategories.jl defaults where applicable. Discrepancies with literature (e.g., different phase conventions) must be documented case-by-case.

## §3.5.6 Algebraic vs Diagrammatic Definitions

**Claim 3.5.1** (Equivalence). The diagrammatic calculus and algebraic definitions are equivalent:

| Algebraic | Diagrammatic |
|-----------|--------------|
| Morphism $f: A \to B$ | Box with $A$ below, $B$ above |
| Composition $g \circ f$ | Vertical stacking |
| Tensor $f \otimes g$ | Horizontal juxtaposition |
| Associator $\alpha_{a,b,c}$ | F-move |
| Braiding $c_{a,b}$ | R-move (crossing) |
| Dual $X^*$ | Reversed arrow direction |
| $\mathrm{coev}: \mathbf{1} \to X \otimes X^*$ | Cup (U-shaped bend) |
| $\mathrm{ev}: X^* \otimes X \to \mathbf{1}$ | Cap (inverted U) |
| Trace $\mathrm{Tr}(f)$ | Close string into loop |

**Remark.** The diagrammatic calculus is more than notation: the coherence theorem (Mac Lane) ensures any two ways of re-associating yield the same morphism when expressed via F-moves.

```julia
# file: src/julia/FusionCategories/diagrammatic.jl
# Planning ref: §3.5

"""
    quantum_dimension(C::FusionCategory, i::Symbol) -> Number

Compute the quantum dimension d_i of simple object X_i.
This equals the trace of the identity morphism, or equivalently,
the value of a closed loop labelled X_i.

See: docs/diagrammatic_calculus.md, Definition 3.5.5
"""
function quantum_dimension(C::FusionCategory, i::Symbol)
    # For unitary fusion categories, d_i is the positive root of
    # sum_k N_{i,i*}^k d_k = d_i * d_{i*}
    # Implementation depends on category data
    return C.quantum_dims[i]
end

"""
    total_dimension(C::FusionCategory) -> Number

Compute the total dimension D = sqrt(sum_i d_i^2).
See: docs/diagrammatic_calculus.md
"""
function total_dimension(C::FusionCategory)
    return sqrt(sum(quantum_dimension(C, i)^2 for i in C.simples))
end
```

---

*This document establishes the diagrammatic foundations. For braiding and particle ordering, see `braiding_particle_ordering.md` (§3.5.7).*
