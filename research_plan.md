# Research Plan: Mobile Anyons from Fusion Categories

**Status:** Draft (in progress)  
**Parent:** [tech_specs_infrastructure.md](./tech_specs_infrastructure.md)  
**Date:** December 2025

---

## Overview

This document outlines the research plan structured around the target publication. Each step and substep corresponds to a Beads issue. Steps marked `[refine]` require further decomposition based on complexity discovered during execution.

### Note on Issue IDs

This plan uses **planning IDs** (e.g., `§3.1.1`, `§P1.2`) for logical organization. When issues are registered with the `bd` tool, they receive sequential IDs (e.g., `ma-1`, `ma-2`). The planning reference should be included in each issue's description for traceability. See `tech_specs.md` §10 for details.

### Note on Code Libraries

**All fusion category Julia code MUST use [TensorCategories.jl](https://github.com/FabianMaeurer/TensorCategories.jl).** This package provides:
- Built-in Fibonacci, Ising, and other standard categories
- Proper categorical operations (tensor products, Hom spaces, duals)
- F-symbol and R-symbol computation with pentagon/hexagon verification
- Integration with Oscar.jl for algebraic computations

See `.agents/skills/tensor-categories.md` for comprehensive API documentation.

---

## Pre-Flight: Project Setup

### P1. Agent Configuration

**BEAD-P001** `[open]`

| Task | BEAD | Status |
|------|------|--------|
| P1.1 | Create `agents.md` with Beads prompt integration | BEAD-P011 | completed |
| P1.2 | Add Lamport structured proof notation prompt to `agents.md` | BEAD-P012 | completed |
| P1.3 | Add project-specific instructions (first quantisation, normalisation care, etc.) | BEAD-P013 | completed |

Output: `agents.md`

### P2. Repository Setup

**BEAD-P002** `[open]`

| Task | BEAD | Status |
|------|------|--------|
| P2.1 | Create `README.md` with project overview | BEAD-P021 | completed |
| P2.2 | Initialise Git repository | BEAD-P022 | completed |
| P2.3 | Create GitHub repository | BEAD-P023 | completed |
| P2.4 | Set up folder structure per tech specs | BEAD-P024 | completed |
| P2.5 | Create initial `symbols.yaml` and `citations.yaml` | BEAD-P025 | completed |

Output: Repository ready for development

### P3. Beads Registration

**BEAD-P003** `[open]`

| Task | BEAD | Status |
|------|------|--------|
| P3.1 | Go through entire research plan | BEAD-P031 | completed |
| P3.2 | Register all BEADs as issues (with dependencies) | BEAD-P032 | completed |
| P3.3 | Verify BEAD coverage (no orphan tasks) | BEAD-P033 | completed |

Output: All ~80+ BEADs registered and tracked

---

## 0. Literature Review

**BEAD-0001** `[open]`

Before commencing technical work, assemble and review relevant literature.

| Task | Status |
|------|--------|
| Create `literature/` folder | completed |
| Collect papers on fusion categories (Etingof, Kitaev, etc.) | completed |
| Collect papers on anyonic chains (golden chain, etc.) | completed |
| Collect papers on Fock space / second quantisation for anyons | completed |
| Collect papers on 1D anyons / Bethe ansatz | completed |
| Write annotated bibliography (`literature/overview.md`) | completed |

Key references (initial):
- Etingof et al., *Tensor Categories* (book)
- [arXiv:1509.03275](https://arxiv.org/abs/1509.03275) — Fusion categories introduction
- [arXiv:1910.10619](https://arxiv.org/abs/1910.10619) — Fock space for anyons (§2)
- Kitaev, *Anyons in an exactly solved model...* (2006)

---

## 1. Abstract

**BEAD-0002** `[blocked]`

Write last, after all technical sections complete.

---

## 2. Introduction

**BEAD-0003** `[blocked]` — Write towards end of project.

Structure: 3+1 paragraphs.

| Para | Content | Status |
|------|---------|--------|
| 2.1 | **Why?** General overview and motivation. Why mobile anyons matter. | pending |
| 2.2 | **How?** Literature review summary. Existing approaches and gaps. | pending |
| 2.3 | **What?** Summary of contributions in this work. | pending |
| 2.4 | Outline of paper structure (optional). | pending |

---

## 3. Preliminaries

### 3.1. Fusion Rings and Fusion Categories

**BEAD-0010** `[open]`

Define fusion rings and fusion categories with full mathematical rigour. **Critical:** Definitions must handle both multiplicity-free case ($N_{ab}^c \in \{0,1\}$) and general case with multiplicity ($N_{ab}^c \geq 0$). Work basis-independent where possible; fusion tree basis may be introduced where needed.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 3.1.1 | Definition of fusion ring: simple objects, fusion rules $N_{ij}^k$, involution | [Etingof–Nikshych–Ostrik, *Ann. Math.* **162** (2005), Def. 3.1](https://doi.org/10.4007/annals.2005.162.581) | BEAD-0011 | **completed** |
| 3.1.2 | Definition of fusion category: 5-point axiomatic definition, Grothendieck ring | [Etingof–Nikshych–Ostrik, *Ann. Math.* **162** (2005), Def. 2.1](https://doi.org/10.4007/annals.2005.162.581) | BEAD-0012 | **completed** |
| 3.1.3 | Morphism spaces $\mathrm{Mor}(A, B)$; dimension = multiplicity; basis independence | [Etingof–Nikshych–Ostrik, *Ann. Math.* **162** (2005), §2](https://doi.org/10.4007/annals.2005.162.581) | BEAD-0013 | **completed** |
| 3.1.4 | F-symbols and pentagon equation (with multiplicity indices) | ibid. | BEAD-0014 | completed |
| 3.1.5 | R-symbols and hexagon equations (braiding, with multiplicity) | ibid. | BEAD-0015 | completed |
| 3.1.6 | Fusion tree basis: when and how to fix a basis | ibid. | BEAD-0016 | pending |
| 3.1.7 | Examples: Fibonacci (mult-free), Ising (mult-free), $\mathbb{Z}_N$, others with multiplicity | ibid. | BEAD-0017 | pending |
| 3.1.8 | Julia implementation using TensorCategories.jl (see `.agents/skills/tensor-categories.md`) | — | BEAD-0018 | **completed** |

Output: `docs/fusion_ring.md`, `docs/fusion_category.md`, `docs/morphism_spaces.md`, `src/julia/FusionCategories/`, `symbols.yaml`, `symbols.md`

### 3.2. Fock Space Perspective (First Quantisation)

**BEAD-0020** `[closed]`

Reminder/expansion of Fock space formalism with categorical interpretation. **Critical:** We work exclusively in first quantisation. Creation/annihilation operators are a red herring and must not be used.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 3.2.1 | Standard Fock space as direct sum of $n$-particle spaces | standard | BEAD-0021 | **completed** |
| 3.2.2 | Direct sum as "OR quantifier" (superposition of particle numbers) | [arXiv:1910.10619](https://arxiv.org/abs/1910.10619) §2 | BEAD-0022 | **completed** |
| 3.2.3 | Tensor product as "AND quantifier" (multi-site/multi-particle structure) | ibid. | BEAD-0023 | **completed** |
| 3.2.4 | First-quantised operators: how operators act on $n$-particle sectors | — | BEAD-0024 | **completed** |

Output: `docs/fock_space.md`

### 3.3. Quantum Mechanics for Lattice Models

**BEAD-0030** `[closed]`

Brief reminder of QM formalism oriented towards 1D lattice systems.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 3.3.1 | Hilbert space, states, observables | standard | BEAD-0031 | **completed** |
| 3.3.2 | Hamiltonians for lattice systems (local terms, nearest-neighbour) | standard | BEAD-0032 | **completed** |
| 3.3.3 | Ground states, spectrum, partition function | standard | BEAD-0033 | **completed** |
| 3.3.4 | Tensor product structure for multi-site systems | standard | BEAD-0034 | **completed** |

Output: `docs/qm_lattice.md`

### 3.4. Lattice Geometry

**BEAD-0040** `[closed]`

Define lattice conventions for this work.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 3.4.1 | 1D chain: sites labelled $1, \ldots, N$ | — | BEAD-0041 | **completed** |
| 3.4.2 | Lattice spacing $a$ (set $a=1$ where convenient) | — | BEAD-0042 | **completed** |
| 3.4.3 | Open boundary conditions (no PBCs) | — | BEAD-0043 | **completed** |
| 3.4.4 | Notation for local Hilbert spaces $\mathcal{H}_i$ | — | BEAD-0044 | **completed** |

Output: `docs/lattice.md`

### 3.5. Diagrammatic Calculus

**BEAD-0050** `[open]`

Review of diagrammatic/graphical calculus for fusion categories. **Critical:** Extra care must be taken with normalisations of diagrams and morphisms—inconsistent conventions are a major source of errors.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 3.5.1 | String diagrams for morphisms in monoidal categories | Etingof, Selinger | BEAD-0051 | pending |
| 3.5.2 | Normalisation conventions: isotopy, pivotal structure | — | BEAD-0052 | pending |
| 3.5.3 | Evaluation and coevaluation maps; quantum dimensions | — | BEAD-0053 | pending |
| 3.5.4 | F-moves and R-moves diagrammatically | — | BEAD-0054 | pending |
| 3.5.5 | Explicit normalisation choices for this project (document carefully) | — | BEAD-0055 | pending |
| 3.5.6 | Relationship between algebraic and diagrammatic definitions | — | BEAD-0056 | pending |

Output: `docs/diagrammatic_calculus.md`

---

## 4. Hilbert Space for Mobile Anyons

### 4.1. Classical Configuration Space

**BEAD-0100** `[closed]`

Define the underlying classical configuration space. This provides the foundation for the quantum Hilbert space.

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 4.1.1 | Positions: $0 \leq x_1 \leq x_2 \leq \cdots \leq x_N \leq L$ | BEAD-0101 | **completed** |
| 4.1.2 | Each position carries label $k \in \{1, \ldots, d\}$ (anyon type) | BEAD-0102 | **completed** |
| 4.1.3 | Lattice: sites $j \in \{0, \ldots, n-1\}$, physical positions $x_j = \epsilon \cdot j$ where $\epsilon = L/n$ | BEAD-0103 | **completed** |
| 4.1.4 | Mixed character: "identical" (same-label anyons) and "distinguishable" (different labels) | BEAD-0104 | **completed** |
| 4.1.5 | Hard-core: strict inequality $x_1 < x_2 < \cdots < x_N$ | BEAD-0105 | **completed** |

Output: `docs/config_space.md`

### 4.2. Core Hilbert Space Definitions

**BEAD-0110** `[open]`

Define the Hilbert space as direct sums over morphism spaces. Use notation $\mathrm{Mor}(A, B)$ for morphisms from object $A$ to object $B$.

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 4.2.1 | Space of $N$ anyons with definite total charge $c$: $\mathcal{H}_N^{(c)}$ | BEAD-0111 | completed |
| 4.2.2 | Space of $N$ anyons with indefinite total charge: $\mathcal{H}_N = \bigoplus_c \mathcal{H}_N^{(c)}$ | BEAD-0112 | completed |
| 4.2.3 | Total Hilbert space: $\mathcal{H} = \bigoplus_{N=0}^{n} \mathcal{H}_N$ where $n$ = number of sites | BEAD-0113 | completed |
| 4.2.4 | Explicit construction via $\mathrm{Mor}(\mathbf{1}, X_1 \otimes \cdots \otimes X_N)$ or similar | BEAD-0114 | completed |
| 4.2.5 | Handle both multiplicity-free and with-multiplicity cases | BEAD-0115 | completed |

Output: `docs/hilbert_space.md`

### 4.3. Operators as Morphisms

**BEAD-0120** `[open]`

Operators on the Hilbert space belong to direct sums of morphism spaces.

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 4.3.1 | Operators as elements of $\bigoplus \mathrm{Mor}(A, B)$ | BEAD-0121 | completed |
| 4.3.2 | Objects $A$, $B$ built from tensor products of vacuum $\mathbf{1}$ and simples $X_1, \ldots, X_d$ | BEAD-0122 | completed |
| 4.3.3 | Particle-number-conserving vs non-conserving operators | BEAD-0123 | completed |
| 4.3.4 | Local vs global operators | BEAD-0124 | completed |

Output: `docs/operators.md`

### 4.4. Hard-Core vs Soft-Core Anyons

**BEAD-0130** `[open]`

Two regimes: anyons restricted to separate sites (hard-core) or allowed to coexist on same site (soft-core).

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 4.4.1 | Hard-core constraint: at most one anyon per site | BEAD-0131 | completed |
| 4.4.2 | Soft-core: multiple anyons per site; local fusion structure | BEAD-0132 | completed |
| 4.4.3 | Hilbert space modifications for each case | BEAD-0133 | completed |
| 4.4.4 | Physical motivation for each regime | BEAD-0134 | completed |

Output: `docs/hardcore_softcore.md`

---

## 5. Dynamics for Mobile Anyons

### 5.1. Local Hamiltonians as Morphisms

**BEAD-0200** `[open]`

Local Hamiltonians act on neighbouring (or next-neighbouring) sites and are morphisms in the categorical sense.

#### 5.1.1. Particle-Conserving Dynamics (Hard-Core, v0)

**BEAD-0210** `[open]`

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 5.1.1.1 | Definition: Hamiltonians that do not create/annihilate anyons | BEAD-0211 | pending |
| 5.1.1.2 | Laplacian-type models: act as Laplacian on single-particle sector | BEAD-0212 | pending |
| 5.1.1.3 | Two neighbouring anyons: act as identity (hard-core blocking) | BEAD-0213 | pending |
| 5.1.1.4 | Diagrammatic formulation | BEAD-0214 | pending |
| 5.1.1.5 | Algebraic formulation | BEAD-0215 | pending |
| 5.1.1.6 | Implicit hard-core interactions from structure | BEAD-0216 | pending |

Output: `docs/hamiltonian_v0.md`

#### 5.1.2. Interactions v1 (No Braiding)

**BEAD-0220** `[open]`

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 5.1.2.1 | Nontrivial interaction terms in $\mathrm{Mor}(X \otimes Y, X \otimes Y)$ | BEAD-0221 | pending |
| 5.1.2.2 | Particle number conserved | BEAD-0222 | pending |
| 5.1.2.3 | No braiding involved; anyons do not pass through each other | BEAD-0223 | pending |
| 5.1.2.4 | Examples and physical interpretation | BEAD-0224 | pending |

Output: `docs/hamiltonian_v1.md`

#### 5.1.3. Free Anyons (With Braiding)

**BEAD-0230** `[open]`

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 5.1.3.1 | "Free anyons": anyons can pass each other via braiding (R-matrix) | BEAD-0231 | pending |
| 5.1.3.2 | Write explicit Hamiltonian incorporating R-moves | BEAD-0232 | pending |
| 5.1.3.3 | Diagrammatic representation | BEAD-0233 | pending |
| 5.1.3.4 | Reduction to bosons/fermions in appropriate limits | BEAD-0234 | pending |

Output: `docs/hamiltonian_free.md`

#### 5.1.4. Particle Creation and Annihilation

**BEAD-0240** `[open]`

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 5.1.4.1 | Terms from $\mathrm{Mor}(X \otimes Y, Z \otimes \mathbf{1})$ (pair annihilation) | BEAD-0241 | pending |
| 5.1.4.2 | Terms from $\mathrm{Mor}(Z \otimes \mathbf{1}, X \otimes Y)$ (pair creation) | BEAD-0242 | pending |
| 5.1.4.3 | Constraints from fusion rules on allowed processes | BEAD-0243 | pending |
| 5.1.4.4 | Conservation laws (total charge, etc.) | BEAD-0244 | pending |

Output: `docs/hamiltonian_creation.md`

---

## 6. Basic Properties of the Models

### 6.1. Limiting Cases

**BEAD-0300** `[open]`

Characterise behaviour in physically important limiting regimes.

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 6.1.1 | Dilute regime: $N/L \to 0$; connection to Girardeau limit (see §6.2) | BEAD-0301 | pending |
| 6.1.2 | Dense regime: $N/L \to 1$; reduction to golden chain for Fibonacci? | BEAD-0302 | pending |
| 6.1.3 | Prove/argue dense limit reduction to standard fusion chain models | BEAD-0303 | pending |

Output: `docs/limiting_cases.md`

### 6.2. Hard-Core Regime: Girardeau Mapping

**BEAD-0310** `[open]` `[refine]`

Conjecture: Hard-core anyons in continuum limit are described by Girardeau-type mapping.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 6.2.1 | Review Girardeau mapping for impenetrable bosons | [Girardeau 1960](https://pubs.aip.org/aip/jmp/article/1/6/516/222573) `[add to library]` | BEAD-0311 | pending |
| 6.2.2 | Generalisation to anyons | [Girardeau PRL 97 (2006)](https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.97.100402) `[add to library]` | BEAD-0312 | pending |
| 6.2.3 | Analytical investigation of conjecture | — | BEAD-0313 | pending |
| 6.2.4 | Numerical investigation of conjecture | — | BEAD-0314 | pending |

Output: `docs/girardeau.md`

### 6.3. Partition Functions and Spacetime Diagrams

**BEAD-0320** `[open]` `[refine]`

The partition function $Z = \mathrm{Tr}(e^{-\beta H})$ admits a worldline representation as a sum over spacetime diagrams. For particle-non-conserving Hamiltonians, this generates fusion/splitting vertices weighted by categorical data. See `notes/spacetime.PNG` for the dilute vs dense regimes.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 6.3.1 | Hard-core partition function: connection to loop models? | — | BEAD-0321 | pending |
| 6.3.2 | Free anyons: Leinaas–Myrheim / Wilczek susceptibility? | Leinaas–Myrheim, Wilczek `[add to library]` | BEAD-0322 | pending |
| 6.3.3 | With creation/annihilation: spacetime diagrams → Levin–Wen configurations? | [Levin–Wen](https://arxiv.org/abs/cond-mat/0404617) `[add to library]` | BEAD-0323 | pending |
| 6.3.4 | Diagram weights from categorical data: F-symbols at vertices, R at crossings, $d_a$ for loops | — | BEAD-0324 | pending |
| 6.3.5 | Dilute vs dense phases: string tension and loop proliferation | — | BEAD-0325 | pending |
| 6.3.6 | Criticality detection I: SLE for domain walls / interfaces | [Schramm 2000](https://arxiv.org/abs/math/0005295), [Cardy 2005](https://arxiv.org/abs/cond-mat/0503313) `[add to library]` | BEAD-0326 | pending |
| 6.3.7 | Criticality detection II: conformal invariance, scaling as isometries | — | BEAD-0327 | pending |
| 6.3.8 | Connection to CFT: central charge from loop fugacity, Virasoro structure | [Di Francesco et al.](https://doi.org/10.1007/978-1-4612-2256-9) `[add to library]` | BEAD-0328 | pending |
| 6.3.9 | Fractal dimensions of worldlines at criticality | — | BEAD-0329 | pending |

Output: `docs/partition_functions.md`, `docs/criticality.md`

### 6.4. Quantum Dynamics via Numerics

**BEAD-0330** `[open]` `[refine]`

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 6.4.1 | Exact diagonalisation for small systems | BEAD-0331 | pending |
| 6.4.2 | Time evolution and dynamical properties | BEAD-0332 | pending |
| 6.4.3 | Comparison with analytical predictions | BEAD-0333 | pending |

Output: `docs/numerics.md`, `src/julia/Numerics/`

### 6.5. Boundary Conditions via Module Categories

**BEAD-0340** `[open]` `[refine]`

Boundary conditions for anyonic chains are classified by module categories over the bulk fusion category $\mathcal{C}$. This follows Kitaev–Kong and subsequent works on topological boundaries and domain walls.

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 6.5.1 | Review: module categories as boundary conditions | [Kitaev–Kong, *Commun. Math. Phys.* **313** (2012)](https://doi.org/10.1007/s00220-012-1500-5) | BEAD-0341 | pending |
| 6.5.2 | Left and right $\mathcal{C}$-module categories; bimodule categories | ibid., [Kong 2014](https://arxiv.org/abs/1211.4644) | BEAD-0342 | pending |
| 6.5.3 | Simple module objects as boundary excitations / edge modes | ibid. | BEAD-0343 | pending |
| 6.5.4 | Morita equivalence of fusion categories; boundary-bulk correspondence | [Etingof–Nikshych–Ostrik, *Adv. Math.* **226** (2011)](https://doi.org/10.1016/j.aim.2010.08.007) | BEAD-0344 | pending |
| 6.5.5 | Application to our model: boundary Hilbert space from module category | — | BEAD-0345 | pending |
| 6.5.6 | Boundary-changing operators as bimodule functors | — | BEAD-0346 | pending |
| 6.5.7 | Open chain with two boundaries: $\mathcal{M} \boxtimes_\mathcal{C} \mathcal{N}$ structure | — | BEAD-0347 | pending |
| 6.5.8 | Examples: trivial boundaries, Lagrangian algebras, gapped boundaries | [Kong–Wen, *JHEP* (2014)](https://arxiv.org/abs/1405.5858) | BEAD-0348 | pending |
| 6.5.9 | Connection to golden chain boundary conditions (Fibonacci case) | [Aasen–Fendley–Mong (2020)](https://arxiv.org/abs/2008.08598) | BEAD-0349 | pending |

Output: `docs/boundary_conditions.md`, `docs/module_categories.md`

---

## 7. Discussion

**BEAD-0400** `[blocked]` — Write towards end of project.

### 7.1. Future Directions

| Substep | Description | BEAD | Status |
|---------|-------------|------|--------|
| 7.1.1 | Exact solutions: integrability, Bethe ansatz for anyonic models | BEAD-0411 | pending |
| 7.1.2 | Continuum limit: field-theoretic description | BEAD-0412 | pending |
| 7.1.3 | Higher dimensions: 2D and beyond | BEAD-0413 | pending |
| 7.1.4 | Periodic boundary conditions and topological sectors | BEAD-0414 | pending |
| 7.1.5 | Non-equilibrium dynamics and transport | BEAD-0415 | pending |
| 7.1.6 | Connections to other models (e.g., spin chains, CFT) | BEAD-0416 | pending |

Output: `docs/discussion.md`

---

## 8. Conclusions

**BEAD-0500** `[blocked]`

Write at end of project. Summarise main results and contributions.

Output: Section in `tex/main.tex`

---

## 9. Bibliography

**BEAD-0600** `[open]`

Assemble bibliography using BibLaTeX in `literature/` folder.

| Task | BEAD | Status |
|------|------|--------|
| Set up `literature/references.bib` | BEAD-0601 | pending |
| Import all cited papers | BEAD-0602 | pending |
| Verify citation accuracy (HITL) | BEAD-0603 | pending |
| Generate formatted bibliography | BEAD-0604 | pending |

Output: `literature/references.bib`, `literature/overview.md`

---

## Post-Flight: Paper Finalisation

### F1. LaTeX Conversion

**BEAD-F100** `[blocked]` — After all sections complete.

| Task | BEAD | Status |
|------|------|--------|
| F1.1 | Convert Section 3 (Preliminaries) to LaTeX | BEAD-F101 | pending |
| F1.2 | Convert Section 4 (Hilbert Space) to LaTeX | BEAD-F102 | pending |
| F1.3 | Convert Section 5 (Dynamics) to LaTeX | BEAD-F103 | pending |
| F1.4 | Convert Section 6 (Properties) to LaTeX | BEAD-F104 | pending |
| F1.5 | Convert Section 7 (Discussion) to LaTeX | BEAD-F105 | pending |
| F1.6 | Convert Section 8 (Conclusions) to LaTeX | BEAD-F106 | pending |
| F1.7 | Convert Section 2 (Introduction) to LaTeX | BEAD-F107 | pending |
| F1.8 | Convert Section 1 (Abstract) to LaTeX | BEAD-F108 | pending |

Output: `tex/sections/*.tex`

### F2. Compilation Verification

**BEAD-F200** `[blocked]`

| Task | BEAD | Status |
|------|------|--------|
| F2.1 | Verify compilation of each LaTeX section individually | BEAD-F201 | pending |
| F2.2 | Verify full document compilation | BEAD-F202 | pending |
| F2.3 | Fix any LaTeX errors/warnings | BEAD-F203 | pending |

Output: Clean compilation of `tex/main.tex`

### F3. Code Appendices

**BEAD-F300** `[blocked]`

| Task | BEAD | Status |
|------|------|--------|
| F3.1 | Create appendix structure for code snippets | BEAD-F301 | pending |
| F3.2 | Verify all Julia code compiles | BEAD-F302 | completed |
| F3.3 | Verify all Clojure code compiles | BEAD-F303 | pending |
| F3.4 | Cross-reference code appendices with main text | BEAD-F304 | pending |

Output: `tex/appendices/code.tex`, verified `src/`

### F4. Results Review and Figures

**BEAD-F400** `[blocked]` — HITL required.

| Task | BEAD | Status |
|------|------|--------|
| F4.1 | Review all results (claims, conjectures, theorems) | BEAD-F401 | pending |
| F4.2 | Identify which results need figures | BEAD-F402 | pending |
| F4.3 | Register figure creation as BEAD issues | BEAD-F403 | pending |
| F4.4 | Create figures | BEAD-F404 | pending |
| F4.5 | Integrate figures into LaTeX | BEAD-F405 | pending |

Output: `tex/figures/`, updated `tex/main.tex`

### F5. Final Paper Assembly

**BEAD-F500** `[blocked]`

| Task | BEAD | Status |
|------|------|--------|
| F5.1 | Assemble all sections into final document | BEAD-F501 | pending |
| F5.2 | Final compilation and PDF generation | BEAD-F502 | pending |
| F5.3 | Check cross-references and citations | BEAD-F503 | pending |
| F5.4 | Verify page limits / formatting for target venue | BEAD-F504 | pending |

Output: `tex/main.pdf`

### F6. Critical Review

**BEAD-F600** `[blocked]`

| Task | BEAD | Status |
|------|------|--------|
| F6.1 | Review by LLM #1 (e.g., Claude) | BEAD-F601 | pending |
| F6.2 | Review by LLM #2 (e.g., GPT-4) | BEAD-F602 | pending |
| F6.3 | Review by LLM #3 (e.g., Gemini) | BEAD-F603 | pending |
| F6.4 | Review by LLM #4 (optional, e.g., open-source) | BEAD-F604 | pending |
| F6.5 | Collate feedback from all reviewers | BEAD-F605 | pending |

Output: `reviews/llm_feedback.md`

### F7. Feedback Integration

**BEAD-F700** `[blocked]`

| Task | BEAD | Status |
|------|------|--------|
| F7.1 | Triage feedback (accept/reject/modify) | BEAD-F701 | pending |
| F7.2 | Implement accepted changes | BEAD-F702 | pending |
| F7.3 | Re-verify compilation | BEAD-F703 | pending |
| F7.4 | Final proofread | BEAD-F704 | pending |
| F7.5 | Generate submission-ready PDF | BEAD-F705 | pending |

Output: Final `tex/main.pdf`

---

## Dependency Graph

```
Pre-Flight (P)
┌────┴────┬─────────┐
▼         ▼         ▼
P1       P2        P3
Agents   Repo     Beads
│         │         │
└────┬────┴─────────┘
     ▼
Literature Review (0)
     │
     ▼
Preliminaries (3)
┌────┴────┬─────────┬──────────┬──────────┐
▼         ▼         ▼          ▼          ▼
3.1       3.2       3.3        3.4        3.5
Fusion    Fock      QM/Latt    Lattice    Diagrams
│         │         │          │          │
└────┬────┴─────────┴──────────┴──────────┘
     ▼
Hilbert Space (4)
┌────┴────┬─────────┬──────────┐
▼         ▼         ▼          ▼
4.1       4.2       4.3        4.4
Config    Core      Ops       HC/SC
│         │         │          │
└────┬────┴─────────┴──────────┘
     ▼
Dynamics (5)
┌────┴────┬─────────┬──────────┐
▼         ▼         ▼          ▼
5.1.1     5.1.2     5.1.3      5.1.4
v0        v1        Free       Create
│         │         │          │
└────┬────┴─────────┴──────────┘
     ▼
Properties (6)
┌────┴────┬─────────┬──────────┬──────────┐
▼         ▼         ▼          ▼          ▼
6.1       6.2       6.3        6.4        6.5
Limits    Girard.   Part.Fn    Numerics   Bound.
│         │         │          │          │
└────┬────┴─────────┴──────────┴──────────┘
     ▼
Discussion (7)
     │
     ▼
Conclusions (8)
     │
     ▼
Introduction (2)
     │
     ▼
Abstract (1)
     │
     ▼
Bibliography (9)
     │
     ▼
Post-Flight (F)
┌────┴────┬─────────┬──────────┬──────────┬──────────┬──────────┐
▼         ▼         ▼          ▼          ▼          ▼          ▼
F1        F2        F3         F4         F5         F6         F7
LaTeX     Compile   Code       Figures    Assemble   Review     Integrate
│         │         │          │          │          │          │
└────┬────┴─────────┴──────────┴──────────┴──────────┴──────────┘
     ▼
  DONE
```

---

## Papers to Add to Library

| Paper | BEAD | Status |
|-------|------|--------|
| Girardeau 1960 (impenetrable bosons) | BEAD-0701 | completed |
| Girardeau PRL 97 2006 (anyons generalisation) | BEAD-0702 | completed |
| Leinaas–Myrheim (original anyons paper) | BEAD-0703 | completed |
| Wilczek (anyons / fractional statistics) | BEAD-0704 | pending |
| Levin–Wen (string-net) | BEAD-0705 | pending |
| Kitaev–Kong 2012 (models for gapped boundaries) | BEAD-0706 | pending |
| Kong 2014 (anyon condensation and tensor categories) | BEAD-0707 | pending |
| Etingof–Nikshych–Ostrik 2011 (Morita equivalence) | BEAD-0708 | pending |
| Kong–Wen 2014 (gapped domain walls / boundaries) | BEAD-0709 | pending |
| Aasen–Fendley–Mong 2020 (topological defects on the lattice) | BEAD-0710 | pending |
| Schramm 2000 (SLE original paper) | BEAD-0711 | pending |
| Cardy 2005 (SLE and conformal invariance) | BEAD-0712 | pending |
| Di Francesco et al. (CFT textbook) | BEAD-0713 | pending |

---

## Planning Reference Summary

These are **planning IDs** for logical organization. When registered with `bd`, they become sequential `ma-N` IDs. Include the planning reference (e.g., `§3.1.1`) in each issue description.

Total planning items: ~145

| Phase | Section | Planning Refs | Count |
|-------|---------|---------------|-------|
| **Pre-Flight** | P1. Agents | §P1.1–§P1.3 | 4 |
| | P2. Repository | §P2.1–§P2.5 | 6 |
| | P3. Beads Registration | §P3.1–§P3.3 | 4 |
| **Research** | 0. Literature | §0 | 1 |
| | 1. Abstract | §1 | 1 |
| | 2. Introduction | §2.1–§2.4 | 4 |
| | 3. Preliminaries | §3.1.1–§3.5.6 | ~25 |
| | 4. Hilbert Space | §4.1.1–§4.4.4 | ~20 |
| | 5. Dynamics | §5.1.1.1–§5.1.4.4 | ~20 |
| | 6. Properties | §6.1.1–§6.5.9 | ~30 |
| | 7. Discussion | §7.1.1–§7.1.6 | ~7 |
| | 8. Conclusions | §8 | 1 |
| | 9. Bibliography | §9.1–§9.4 | 4 |
| | Papers | §Lit.1–§Lit.13 | 13 |
| **Post-Flight** | F1. LaTeX Conversion | §F1.1–§F1.8 | 9 |
| | F2. Compilation | §F2.1–§F2.3 | 4 |
| | F3. Code Appendices | §F3.1–§F3.4 | 5 |
| | F4. Figures | §F4.1–§F4.5 | 6 |
| | F5. Assembly | §F5.1–§F5.4 | 5 |
| | F6. Review | §F6.1–§F6.5 | 6 |
| | F7. Integration | §F7.1–§F7.5 | 6 |

---

*Research plan complete. Ready for execution starting with Pre-Flight.*
