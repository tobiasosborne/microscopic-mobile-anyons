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
4. Validate the framework by reduction to known limiting cases

## Core Requirements

| ID | Requirement |
|----|-------------|
| **R1** | The model must describe a 1D chain of sites with open boundary conditions (no PBCs). |
| **R2** | The Hilbert space must support (a) variable anyon number and (b) anyon mobility between sites. |
| **R3** | Microscopic Hamiltonians must be constructible for: hard-core anyons, "free" (non-interacting) anyons, and interacting anyons—in both braiding and non-braiding variants. |
| **R4** | In appropriate limits, the models must reduce to standard models: bosonic/fermionic systems, tightly-packed fusion chains (golden chain, etc.). |
| **R5** | The framework must yield physical understanding of: dilute/low-N limits, fully-filled sector, partition functions, and scattering/braiding effects. |
| **R6** | Connection to known exactly-solvable models (e.g., 1D anyons via Bethe ansatz) must be established where applicable. |

## Success Criteria

- **SC1:** Explicit construction of the Hilbert space for at least one non-trivial fusion category (e.g., Fibonacci) with mobile anyons.
- **SC2:** Well-defined hopping and interaction terms in the Hamiltonian with clear physical interpretation.
- **SC3:** Demonstrated recovery of known models in limiting cases (e.g., Ising anyons → fermions, trivial fusion rules → bosons).
- **SC4:** Calculable physical quantities: ground state properties in tractable limits, structure of low-energy spectrum, partition function in simple cases.
- **SC5:** Characterisation of how braiding statistics manifest in scattering or dynamical processes.

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
