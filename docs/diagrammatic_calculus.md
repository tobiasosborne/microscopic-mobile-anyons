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

## §3.5.4a Index Structure for F-Symbols and R-Symbols

This section formalises the index notation for F-symbols and R-symbols, resolving ambiguities in Definition 3.1.4–3.1.7 of `fusion_category.md`.

**Convention 3.5.0** (Index types). We distinguish three types of indices:

| Index Type | Notation | Range | Meaning |
|------------|----------|-------|---------|
| **Simple object** | $a, b, c, d, \ldots$ | $\{X_0, X_1, \ldots, X_{d-1}\}$ or equivalently $\{0, 1, \ldots, d-1\}$ | Labels for simple objects in $\mathrm{Irr}(\mathcal{C})$ |
| **Intermediate channel** | $e, f, g, h, k, \ldots$ | Same as simple objects | Intermediate fusion outcomes (also simple objects) |
| **Multiplicity index** | $\alpha, \beta, \mu, \nu, \ldots$ | $\{1, \ldots, N_{xy}^z\}$ (context-dependent) | Basis choice within fusion space $\mathrm{Mor}(x \otimes y, z)$ |

**Definition 3.5.4a** (F-symbol index structure). The F-symbol $(F_{abc}^d)_{(e,\alpha,\beta)}^{(f,\mu,\nu)}$ has the following index structure:

- **External objects** $a, b, c, d \in \mathrm{Irr}(\mathcal{C})$: The four simple objects being re-associated
- **Left intermediate channel** $e \in \mathrm{Irr}(\mathcal{C})$: The fusion outcome of $a \otimes b$ in the left-associated tree
- **Right intermediate channel** $f \in \mathrm{Irr}(\mathcal{C})$: The fusion outcome of $b \otimes c$ in the right-associated tree
- **Multiplicity indices**:
  - $\alpha \in \{1, \ldots, N_{ab}^e\}$: basis index for $a \otimes b \to e$
  - $\beta \in \{1, \ldots, N_{ec}^d\}$: basis index for $e \otimes c \to d$
  - $\mu \in \{1, \ldots, N_{bc}^f\}$: basis index for $b \otimes c \to f$
  - $\nu \in \{1, \ldots, N_{af}^d\}$: basis index for $a \otimes f \to d$

**Compact notation.** When all fusion multiplicities satisfy $N_{xy}^z \leq 1$ (multiplicity-free case), we suppress multiplicity indices and write $(F_{abc}^d)_e^f$.

**Definition 3.5.4b** (R-symbol index structure). The R-symbol $(R_{ab}^c)_{\alpha}^{\beta}$ has the following index structure:

- **External objects** $a, b \in \mathrm{Irr}(\mathcal{C})$: The two objects being braided
- **Fusion outcome** $c \in \mathrm{Irr}(\mathcal{C})$: The total charge, with $c \in a \otimes b$ (equivalently $N_{ab}^c \geq 1$)
- **Multiplicity indices**:
  - $\alpha \in \{1, \ldots, N_{ab}^c\}$: basis index for $a \otimes b \to c$
  - $\beta \in \{1, \ldots, N_{ba}^c\}$: basis index for $b \otimes a \to c$

**Remark.** Since $N_{ab}^c = N_{ba}^c$ (by commutativity of the Grothendieck ring), both indices range over the same set. The R-symbol is thus a square matrix of size $N_{ab}^c \times N_{ab}^c$ for each fixed $a, b, c$.

**Definition 3.5.4c** (Pentagon equation with explicit indices). For simple objects $a, b, c, d$ and total charge $p$, summing over intermediate channels and multiplicities:
$$
\sum_{g, \gamma_1, \gamma_2, \gamma_3}
(F_{abc}^g)_{(e,\alpha,\beta)}^{(f,\gamma_1,\gamma_2)}
(F_{afg}^p)_{(h,\gamma_2,\delta)}^{(k,\mu,\nu)}
(F_{bcd}^k)_{(f,\gamma_1,\epsilon)}^{(m,\sigma,\tau)}
$$
$$
= \sum_{\lambda} (F_{ecd}^p)_{(h,\beta,\delta)}^{(n,\lambda,\rho)} (F_{abn}^p)_{(e,\alpha,\lambda)}^{(k,\mu,\nu')}
$$
where the indices satisfy the appropriate range constraints based on fusion multiplicities.

**Simplified form** (multiplicity-free). When $N_{xy}^z \in \{0,1\}$:
$$
\sum_{g} (F_{abc}^g)_e^f (F_{afg}^p)_h^k (F_{bcd}^k)_f^m = (F_{ecd}^p)_h^n (F_{abn}^p)_e^k
$$

**Definition 3.5.4d** (Hexagon equations with explicit indices). For the first hexagon (multiplicity-free):
$$
(R_{ac}^e) (F_{acb}^d)_e^f (R_{bc}^f) = \sum_g (F_{cab}^d)_e^g (R_{ab}^g) (F_{abc}^d)_g^f
$$

For the second hexagon:
$$
(R_{ca}^e)^{-1} (F_{acb}^d)_e^f (R_{cb}^f)^{-1} = \sum_g (F_{cab}^d)_e^g (R_{ba}^g)^{-1} (F_{abc}^d)_g^f
$$

With multiplicity indices, additional sums and indices appear on each R-symbol and F-symbol as per Definitions 3.5.4a–3.5.4b.

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
