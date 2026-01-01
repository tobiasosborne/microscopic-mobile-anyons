---
title: Module Categories
section: "§6.5"
refs-in:
  - fusion_category.md
  - morphism_spaces.md
  - research_plan.md
refs-out:
  - boundary_conditions.md
  - hilbert_space.md
---

# Module Categories

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A6.5.1 | Fusion category $\mathcal{C}$ over $\mathbb{C}$ (from §3.1) | Input | assumed |
| A6.5.2 | $\mathcal{C}$ is rigid (has duals) | Technical | assumed |
| A6.5.3 | Module categories are semisimple and finite | Technical | assumed |

## Overview

**Module categories** provide the mathematical framework for classifying boundary conditions in topological phases. A (left) $\mathcal{C}$-module category is a category $\mathcal{M}$ equipped with an action of the fusion category $\mathcal{C}$, analogous to how a module is a set with an action of a ring.

**Physical significance:** In the context of anyonic chains, module categories classify:
- Boundary conditions for open chains
- Edge modes and boundary excitations
- Domain walls between different phases

## Definition

**Definition 6.5.1** (Left module category). A **left $\mathcal{C}$-module category** is a category $\mathcal{M}$ equipped with:

1. **Action functor:** $\triangleright: \mathcal{C} \times \mathcal{M} \to \mathcal{M}$, written $(X, M) \mapsto X \triangleright M$

2. **Module associator:** Natural isomorphism
   \[
   m_{X,Y,M}: (X \otimes Y) \triangleright M \xrightarrow{\sim} X \triangleright (Y \triangleright M)
   \]

3. **Unit constraint:** Natural isomorphism $\ell_M: \mathbf{1} \triangleright M \xrightarrow{\sim} M$

satisfying coherence conditions (pentagon and triangle diagrams for modules).

[Etingof–Nikshych–Ostrik, *Adv. Math.* **226** (2011)] `[unverified]`

**Definition 6.5.2** (Right module category). A **right $\mathcal{C}$-module category** is defined analogously with action $\triangleleft: \mathcal{M} \times \mathcal{C} \to \mathcal{M}$.

**Definition 6.5.3** (Bimodule category). A **$(\mathcal{C}, \mathcal{D})$-bimodule category** is a category $\mathcal{M}$ that is simultaneously a left $\mathcal{C}$-module and right $\mathcal{D}$-module, with compatible associators.

## Simple Module Objects

**Definition 6.5.4** (Simple module object). An object $M \in \mathcal{M}$ is **simple** if it has no proper subobjects. The simple objects of $\mathcal{M}$ form a finite set $\mathrm{Irr}(\mathcal{M})$.

**Physical interpretation:** Simple module objects correspond to **boundary excitations** or **edge modes**. They are the elementary degrees of freedom localised at the boundary.

## Internal Hom

**Definition 6.5.5** (Internal Hom). For $M, N \in \mathcal{M}$, the **internal Hom** $\underline{\mathrm{Hom}}(M, N) \in \mathcal{C}$ is defined by:
$
\mathrm{Mor}_\mathcal{M}(X \triangleright M, N) \cong \mathrm{Mor}_\mathcal{C}(X, \underline{\mathrm{Hom}}(M, N))
$
This is the right adjoint to the action functor.
[Etingof–Nikshych–Ostrik 2010]

## The Regular Module

**Example 6.5.1** (Regular module). Every fusion category $\mathcal{C}$ is a module over itself via the tensor product:
\[
X \triangleright Y := X \otimes Y
\]
This is called the **regular module** $\mathcal{C}_\mathcal{C}$.

**Physical interpretation:** The regular module corresponds to the "trivial" or "smooth" boundary condition.

## Module Functors

**Definition 6.5.6** (Module functor). A **$\mathcal{C}$-module functor** between $\mathcal{C}$-module categories $\mathcal{M}$ and $\mathcal{N}$ is a functor $F: \mathcal{M} \to \mathcal{N}$ with natural isomorphisms:
\[
s_{X,M}: F(X \triangleright M) \xrightarrow{\sim} X \triangleright F(M)
\]
satisfying coherence conditions.

**Physical interpretation:** Module functors describe **boundary-changing operators** or **defects** between different boundary conditions.

## Morita Equivalence

**Definition 6.5.7** (Morita equivalence). Two fusion categories $\mathcal{C}$ and $\mathcal{D}$ are **Morita equivalent** if there exists an invertible $(\mathcal{C}, \mathcal{D})$-bimodule category.

**Theorem 6.5.1** (Boundary-bulk correspondence). The bulk topological order determines, and is determined by, the set of all possible boundary conditions (module categories) up to Morita equivalence.

[Kitaev–Kong, *Commun. Math. Phys.* **313** (2012)] `[unverified]`

## Connection to Boundary Conditions

For an anyonic chain with bulk category $\mathcal{C}$:

| Boundary type | Mathematical description |
|--------------|-------------------------|
| Left boundary | Left $\mathcal{C}$-module category $\mathcal{M}_L$ |
| Right boundary | Right $\mathcal{C}$-module category $\mathcal{M}_R$ |
| Open chain | $\mathcal{M}_L \boxtimes_\mathcal{C} \mathcal{M}_R$ (relative tensor product) |
| Boundary excitations | Simple objects of $\mathcal{M}_{L/R}$ |

See `docs/boundary_conditions.md` for explicit application to mobile anyons.

## Subsections

| Section | Topic | BEAD |
|---------|-------|------|
| §6.5.1 | Review: module categories as boundary conditions | BEAD-0341 |
| §6.5.2 | Left/right module categories; bimodules | BEAD-0342 |
| §6.5.3 | Simple module objects as edge modes | BEAD-0343 |
| §6.5.4 | Morita equivalence; boundary-bulk correspondence | BEAD-0344 |

## References

- [Kitaev–Kong, *Commun. Math. Phys.* **313** (2012), 351-373](https://doi.org/10.1007/s00220-012-1500-5) `[unverified]`
- [Etingof–Nikshych–Ostrik, *Adv. Math.* **226** (2011), 176-205](https://doi.org/10.1016/j.aim.2010.08.007) `[unverified]`
- [Kong, *Nucl. Phys. B* **886** (2014), 436-482](https://arxiv.org/abs/1211.4644) `[unverified]`
