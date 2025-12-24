---
title: Boundary Conditions for Anyonic Chains
section: "§6.5"
refs-in:
  - module_categories.md
  - fusion_category.md
  - hilbert_space.md
  - hamiltonian_v0.md
  - research_plan.md
refs-out:
  - partition_functions.md
---

# Boundary Conditions for Anyonic Chains

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A6.5.BC.1 | Bulk fusion category $\mathcal{C}$ (from §3.1) | Input | assumed |
| A6.5.BC.2 | 1D chain with open boundary conditions (from §3.4) | Constraint | assumed |
| A6.5.BC.3 | Boundary conditions classified by $\mathcal{C}$-module categories | Framework | assumed |

## Overview

For anyonic chains with open boundary conditions, the choice of **boundary conditions** at each end significantly affects the Hilbert space structure and dynamics. Following the Kitaev-Kong framework, boundary conditions are classified by **module categories** over the bulk fusion category $\mathcal{C}$.

**Key insight:** Different boundary conditions lead to different edge mode structures, affecting ground state degeneracy, edge excitations, and partition functions.

## Boundary Hilbert Space

**Definition 6.5.BC.1** (Boundary Hilbert space). For a chain with:
- Bulk category $\mathcal{C}$
- Left boundary condition $\mathcal{M}_L$ (left $\mathcal{C}$-module category)
- Right boundary condition $\mathcal{M}_R$ (right $\mathcal{C}$-module category)

The boundary-modified Hilbert space for $N$ anyons with total charge $c$ is:
\[
\mathcal{H}_{N,\mathcal{M}_L,\mathcal{M}_R}^{(c)} = \bigoplus_{M_L, M_R} \mathrm{Mor}_{\mathcal{M}_L}(M_L, X_c \triangleright M_L') \otimes \cdots
\]
where $M_L, M_R$ run over simple objects of the module categories.

**Remark.** The full construction involves the **relative tensor product** $\mathcal{M}_L \boxtimes_\mathcal{C} \mathcal{M}_R$.

## Trivial Boundary Conditions

**Definition 6.5.BC.2** (Trivial/smooth boundary). The **trivial boundary condition** corresponds to the regular module $\mathcal{C}_\mathcal{C}$, where $\mathcal{C}$ acts on itself by tensor product.

**Physical interpretation:** Anyons can freely approach the boundary without restriction. No edge modes beyond the bulk structure.

## Gapped Boundaries via Lagrangian Algebras

**Definition 6.5.BC.3** (Lagrangian algebra). A **Lagrangian algebra** $A \in \mathcal{C}$ is a commutative algebra object satisfying:
\[
\dim(A)^2 = \dim(\mathcal{C})
\]
where $\dim(\mathcal{C}) = \sum_i d_i^2$ is the total quantum dimension.

**Theorem 6.5.BC.1.** Gapped boundary conditions for a topological phase with bulk $\mathcal{C}$ are in bijection with Lagrangian algebras in $\mathcal{C}$ (for modular $\mathcal{C}$).

[Kong–Wen, *JHEP* (2014)] `[unverified]`

**Physical interpretation:** A Lagrangian algebra specifies which bulk anyons can "condense" at the boundary.

## Examples

### Fibonacci Anyons

For the Fibonacci category $\mathcal{C} = \mathrm{Fib}$ with simples $\{\mathbf{1}, \tau\}$:

| Module category | Simple objects | Physical meaning |
|----------------|----------------|------------------|
| $\mathrm{Fib}_\mathrm{Fib}$ (regular) | $\{\mathbf{1}, \tau\}$ | Smooth boundary |
| $\mathrm{Vec}$ (condensed) | $\{\mathbf{1}\}$ | $\tau$ condensed at boundary |

**Claim 6.5.BC.1.** For Fibonacci anyons, the two boundary conditions lead to different ground state structures and edge mode content.

### Ising Anyons

For the Ising category $\mathcal{C} = \mathrm{Ising}$ with simples $\{\mathbf{1}, \sigma, \psi\}$:

| Module category | Simple objects | Physical meaning |
|----------------|----------------|------------------|
| $\mathrm{Ising}_\mathrm{Ising}$ | $\{\mathbf{1}, \sigma, \psi\}$ | Smooth boundary |
| $\mathrm{Vec}(\mathbb{Z}_2)$ | $\{\mathbf{1}, \psi\}$ | $\sigma$ condensed |

## Application to Mobile Anyons

For mobile anyons on an open chain (our setting from §4):

1. **Standard construction** (§4.2): Uses trivial boundary conditions implicitly.

2. **With general boundaries:** The Hilbert space becomes:
\[
\mathcal{H} = \bigoplus_{M_L \in \mathcal{M}_L} \bigoplus_{M_R \in \mathcal{M}_R} \mathcal{H}(M_L, M_R)
\]
where $\mathcal{H}(M_L, M_R)$ is the space of bulk configurations that interpolate between boundary states.

3. **Boundary Hamiltonians:** Additional terms in the Hamiltonian can describe:
   - Boundary potentials (energy cost for edge modes)
   - Boundary-bulk coupling (anyons interacting with edge)
   - Boundary-changing operators (transitions between boundary conditions)

## Connection to Golden Chain

**Example 6.5.BC.1** (Golden chain boundaries). The golden chain (Fibonacci anyons at unit filling) has been studied with various boundary conditions:

- **Free boundaries:** Regular module, leading to CFT edge modes
- **Fixed boundaries:** Specific module object pinned at edge, breaking some symmetry

[Aasen–Fendley–Mong (2020)] `[unverified]`

## Subsections

| Section | Topic | BEAD |
|---------|-------|------|
| §6.5.5 | Application to our model: boundary Hilbert space | BEAD-0345 |
| §6.5.6 | Boundary-changing operators as bimodule functors | BEAD-0346 |
| §6.5.7 | Open chain with two boundaries: $\mathcal{M} \boxtimes_\mathcal{C} \mathcal{N}$ | BEAD-0347 |
| §6.5.8 | Examples: trivial, Lagrangian, gapped boundaries | BEAD-0348 |
| §6.5.9 | Connection to golden chain boundary conditions | BEAD-0349 |

## References

- [Kitaev–Kong, *Commun. Math. Phys.* **313** (2012), 351-373](https://doi.org/10.1007/s00220-012-1500-5) `[unverified]`
- [Kong–Wen, *JHEP* (2014)](https://arxiv.org/abs/1405.5858) `[unverified]`
- [Aasen–Fendley–Mong, *J. Phys. A* (2020)](https://arxiv.org/abs/2008.08598) `[unverified]`
