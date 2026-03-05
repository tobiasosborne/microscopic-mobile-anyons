---
refs-in: []
refs-out:
  - fusion_category.md
  - diagrammatic_calculus.md
  - hilbert_space.md
  - hamiltonian_v0.md
  - matrix_elements_2local.md
  - svec_verification.md
  - temperley_lieb.md
  - module_categories.md
  - boundary_conditions.md
---

# docs Overview

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A1 | No additional assumptions beyond global project constraints | Constraint | assumed |

This directory will contain modular documents (≤200 lines each) for preliminaries, Hilbert space, Hamiltonians, properties, and diagrammatic calculus. Use `_overview.md` files in subdirectories to aid navigation and keep concepts separated.

**New in §4.5:** Matrix element computations for 2-local operators on hard-core sectors—three operator types (two-particle interaction, right hopping, left hopping).

**§3.1a Temperley-Lieb:** `temperley_lieb.md` covers TL categories as key test cases connecting fusion categories to loop models, CFT, and statistical mechanics. Parametrised by loop fugacity, with Fibonacci and Ising as special cases.

**§3.5 Diagrammatic Calculus:** `diagrammatic_calculus.md` covers string diagrams, isotopy/pivotal structure, evaluation/coevaluation maps, quantum dimensions, F-moves/R-moves, and project normalisation conventions.

**§6.5 Boundary Conditions:** `module_categories.md` and `boundary_conditions.md` cover the Kitaev-Kong framework for classifying boundary conditions via module categories. Includes Lagrangian algebras, gapped boundaries, and application to anyonic chains.
