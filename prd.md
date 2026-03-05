# Research Project PRD: Microscopic Models for Mobile Anyons from Fusion Categories

**Status:** v1 (revised from v0 Dec 2025)
**Author:** Tobias
**Date:** March 2026

---

## Problem Statement

Existing microscopic many-body models based on fusion categories -- such as the golden chain -- are defined with a fixed number of anyons at fixed positions. This is analogous to the tightly-packed Mott insulating phase in condensed matter systems. There is currently no systematic framework for constructing microscopic lattice models that describe **mobile (itinerant) anyons** arising from an arbitrary fusion category, where both the positions and number of anyons can fluctuate.

## Motivation

Understanding mobile anyons is essential for:

- Connecting fusion-category-based models to realistic physical systems where particle number and position are dynamical degrees of freedom
- Exploring phases beyond the "Mott" limit, including dilute gases and superfluids of anyons
- Establishing precise relationships between abstract categorical data and concrete many-body physics (scattering, transport, thermodynamics)
- Recovering known results (free bosons, free fermions, Bethe-ansatz-solvable 1D anyons) as special cases

## Objectives

1. Develop a framework for modelling systems of mobile anyons on a 1D chain with open boundary conditions
2. Construct Hilbert spaces that accommodate variable anyon number and anyon motion
3. Define microscopic Hamiltonians for physically motivated scenarios, including models both with and without braiding
4. Validate the framework by reduction to known limiting cases, in particular fermion Fock space for sVec

## Approach (v1)

**Code-first, compute-first.** The previous attempt (v0, archived) produced extensive documentation but never implemented the core computation (matrix elements via F-symbol contraction). This version reverses the priority:

1. **Get matrix elements working** for sVec (fermions) on small lattices first
2. **Validate against known results** (free fermion spectrum, Jordan-Wigner signs)
3. **Extend to Fibonacci** and verify Hilbert space dimensions / fusion tree counting
4. **Compute spectra** via exact diagonalisation for small systems
5. **Write the paper** from working code, not the other way around

**Tooling:**
- `af` CLI for workflow
- `TensorCategories.jl` directly (no wrapper modules) for all categorical data
- `Oscar.jl` for exact arithmetic

## Core Requirements

| ID | Requirement |
|----|-------------|
| **R1** | 1D chain with open boundary conditions. |
| **R2** | Hilbert space supports variable anyon number and mobility. |
| **R3** | Constructible Hamiltonians: hard-core, free, interacting; braided and non-braided. |
| **R4** | Reduces to standard models in limits (bosons, fermions, golden chain). |
| **R5** | Computable physical observables: spectra, ground states, partition functions. |

## Fundamental Constraints

| ID | Constraint |
|----|------------|
| **C1** | **First quantisation only.** No creation/annihilation operators. Fock space = direct sum of N-particle sectors. Operators act on sectors directly. |
| **C2** | **Braiding required for ordering identification.** Without R-symbols, morphism spaces for different particle orderings are not canonically isomorphic. Non-braided models work within fixed-ordering sectors. |
| **C3** | **F-moves vs R-moves are independent.** F handles reassociation (parenthesisation); R handles particle reordering. |
| **C4** | **Fusion vertices are Hamiltonian terms, not unitary.** Mor(X tensor Y, Z) gives interaction terms, not basis changes. |
| **C5** | **Local operations require F-moves to canonical form.** For sVec F=1 (trivial); for Fibonacci, nontrivial. |

## Indexing Convention (Canonical)

**One convention, everywhere:**
- Sites: 1-based (`1, 2, ..., L`)
- Simple objects: 1-based indices into `simples(C)` where **index 1 = vacuum (trivial object)**
- Nontrivial anyons: indices `2, 3, ..., d` where `d = length(simples(C))`
- Fusion trees: intermediate charges as 1-based indices into `simples(C)`

This matches TensorCategories.jl's convention where `simples(C)[1]` is the unit object.

## Success Criteria

- **SC1:** Working matrix elements for sVec that reproduce free fermion hopping Hamiltonian
- **SC2:** Correct Hilbert space dimensions: sVec on L sites = 2^L states
- **SC3:** Fibonacci Hilbert space dimensions match known fusion tree counting
- **SC4:** Exact diagonalisation spectra for L=3..6 sites match expectations
- **SC5:** Clear physical interpretation of all Hamiltonian terms

## Scope

**In scope:**
- 1D lattice, open boundaries
- Hard-core regime (at most one anyon per site)
- sVec, Fibonacci, Ising as target categories
- Exact diagonalisation for small systems (L <= 8 or so)
- Paper draft from working results

**Out of scope:**
- Soft-core (multiple anyons per site)
- Periodic boundary conditions
- Large-scale numerics / DMRG
- Higher dimensions

## Open Questions

1. How exactly do TensorCategories.jl associator morphisms encode F-matrices numerically?
2. What is the most efficient way to contract F-symbols for matrix elements?
3. For which categories does the resulting model become integrable?
4. How do braiding phases manifest in the spectrum of a finite open chain?

---

*Previous version (v0) archived in `archive/v0/`.*
