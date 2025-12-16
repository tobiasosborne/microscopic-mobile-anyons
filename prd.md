# Research Project PRD: Microscopic Models for Mobile Anyons from Fusion Categories

**Status:** Draft
**Author:** Tobias
**Date:** December 2025

---

## Problem Statement

Existing microscopic many-body models based on fusion categories—such as the golden chain—are defined with a fixed number of anyons at fixed positions. This is analogous to the tightly-packed Mott insulating phase in condensed matter systems. There is currently no systematic framework for constructing microscopic lattice models that describe **mobile (itinerant) anyons** arising from an arbitrary fusion category, where both the positions and number of anyons can fluctuate.

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

## Core Requirements

| ID | Requirement |
|----|-------------|
| **R1** | The model must describe a 1D chain of sites with open boundary conditions (no PBCs). |
| **R2** | The Hilbert space must support (a) variable anyon number and (b) anyon mobility between sites. |
| **R3** | Microscopic Hamiltonians must be constructible for: hard-core anyons, "free" (non-interacting) anyons, and interacting anyons—in both braiding and non-braiding variants. |
| **R4** | In appropriate limits, the models must reduce to standard models: bosonic/fermionic systems, tightly-packed fusion chains (golden chain, etc.). |
| **R5** | The framework must yield physical understanding of: dilute/low-N limits, fully-filled sector, partition functions, and scattering/braiding effects. |
| **R6** | Connection to known exactly-solvable models (e.g., 1D anyons via Bethe ansatz) must be established where applicable. |

## Fundamental Constraints

| ID | Constraint |
|----|------------|
| **C1** | **Braiding required to identify particle orderings.** The $N$-anyon Hilbert space is built from morphism spaces $\mathrm{Mor}(\mathbf{1}, X_{i_1} \otimes \cdots \otimes X_{i_N})$ for particles at ordered positions. Without braiding, morphism spaces for *different* position orderings cannot be unitarily identified—there is no canonical isomorphism. Braiding (R-symbols) provides exactly this: a unitary identification between spaces with different particle orderings. Consequently, (a) particle exchange is only meaningful for braided categories, (b) processes that change particle ordering require braiding, and (c) non-braided models must work within fixed-ordering sectors. |
| **C2** | **F-moves vs R-moves.** Reassociation (F-moves) unitarily transforms between different *associativity patterns* (parenthesisations) for the same particle ordering. Braiding (R-moves) unitarily identifies spaces with different *particle orderings*. These are independent structures: F handles $(X \otimes Y) \otimes Z \leftrightarrow X \otimes (Y \otimes Z)$; R handles $X \otimes Y \leftrightarrow Y \otimes X$. |
| **C3** | **Fusion processes are not unitary.** Morphisms in $\mathrm{Mor}(X \otimes Y, Z)$ relate morphism spaces of different particle content—but these are Hamiltonian interaction terms, not unitary identifications. They represent physical processes: pair creation/annihilation, fusion, and splitting. The distinction between unitary (braiding, F-moves) and non-unitary (fusion vertices in Hamiltonians) operations is essential. |
| **C4** | **Collision processes vs passing.** Hamiltonian terms in $\mathrm{Mor}(X \otimes Y, Y \otimes X)$ exist even without braiding, but they represent *collision processes*: $X$ and $Y$ meet, fuse to an intermediate channel $Z \in X \otimes Y$, then dissociate as $Y$ and $X$. This is physically distinct from "passing by"—the latter requires unitary identification of orderings (i.e., braiding). In a non-braided model, such terms describe scattering with intermediate fusion, not free passage. The amplitude depends on fusion channels, not just exchange statistics. |
| **C5** | **Associativity patterns under local operations.** Creating an anyon at site $j$ or applying local terms produces states in non-standard associativity patterns. F-moves are required to bring states to canonical form. For fermionic categories (sVec), $F = 1$ and this cost vanishes; for non-abelian anyons (e.g., Fibonacci), the F-move transformation is nontrivial. |

## Success Criteria

- **SC1:** Explicit construction of the Hilbert space for at least one non-trivial fusion category (e.g., Fibonacci) with mobile anyons.
- **SC2:** Well-defined hopping and interaction terms in the Hamiltonian with clear physical interpretation.
- **SC3:** Demonstrated recovery of known models in limiting cases (e.g., Ising anyons → fermions, trivial fusion rules → bosons).
- **SC4:** For sVec (super-vector spaces), the construction must reduce exactly to fermionic Fock space with standard anticommutation relations. This is a critical consistency check.
- **SC5:** Calculable physical quantities: ground state properties in tractable limits, structure of low-energy spectrum, partition function in simple cases.
- **SC6:** Characterisation of how braiding statistics manifest in scattering or dynamical processes.

## Scope

**In scope:**
- 1D lattice models with open boundaries
- Arbitrary (modular) fusion categories as input
- Equilibrium properties and spectral analysis

**Out of scope (for this phase):**
- Higher-dimensional generalisations
- Periodic boundary conditions and topological ground state degeneracy on closed manifolds
- Non-equilibrium dynamics and transport (beyond basic scattering analysis)
- Numerical implementation and large-scale simulations

## Open Questions

1. What is the correct notion of "vacuum" and particle-number sectors for a general fusion category?
2. How should hopping operators be defined to respect fusion constraints and associativity (F-moves)?
3. Under what conditions is the resulting model integrable or amenable to Bethe ansatz?
4. How do non-Abelian braiding phases enter observable quantities in a 1D open chain?

---

*Technical specifications and proposed solutions to be developed in a separate document.*
