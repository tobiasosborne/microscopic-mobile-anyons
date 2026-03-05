# Research Project PRD: Microscopic Models for Mobile Anyons from Fusion Categories

**Status:** v2 (continuum limit via OAR)
**Author:** Tobias
**Date:** March 2026

---

## Problem Statement

Existing microscopic many-body models based on fusion categories — such as the golden
chain — are defined with a fixed number of anyons at fixed positions. This is the
"Mott insulator" of anyonic matter: the lattice spacing and inter-particle spacing
are locked together, making a continuum limit impossible.

We construct microscopic lattice models for **mobile anyons** from arbitrary fusion
categories where both the number and positions of anyons fluctuate. The central
insight is that **variable anyon number decouples the lattice spacing from the
inter-particle spacing**, opening the door to genuine continuum limits via
operator algebraic renormalization.

## Why Variable Anyon Number Changes Everything

In a dense chain (golden chain), every site hosts an anyon. The lattice spacing a
and the inter-particle spacing ℓ are identical: ℓ = a. Taking a → 0 sends the
particle density to infinity — you can never reach a dilute regime. The continuum
limit is trapped in the Mott phase.

With variable particle number:
- The inter-particle spacing ℓ = L/N and lattice spacing a are **independent**
- One can take a → 0 at fixed ℓ (standard continuum limit)
- Or vary ℓ at fixed a (density-driven phase transitions)
- Pair creation/annihilation makes N a dynamical variable (grand canonical)

This enables a path: **categorical data → lattice model → continuum QFT** via
fine-graining isometries (operator algebraic renormalization).

## The Path to the Continuum

The continuum limit follows the **Wilson triangle** from operator algebraic
renormalization (Osborne-Stiegemann 1901.06124, 2002.01442, 2107.13834):

```
        Lattice (scale a)
           /         \
    fine-grain      coarse-grain
    isometry ι      CP map Λ
         /             \
    Lattice (a/2)  ←→  Continuum QFT
```

1. **Lattice models at scale a**: Our mobile anyon Hamiltonians on L sites
2. **Fine-graining isometries ι**: Embed the L-site algebra into a 2L-site algebra,
   doubling the resolution while preserving the physics. These must be *isometries*
   (not merely CP maps) for the inductive limit to yield a genuine C*-algebra.
3. **Inductive limit**: The sequence of lattice algebras A_1 → A_2 → A_4 → ...
   under fine-graining isometries converges to a continuum quasi-local algebra.
4. **Continuum QFT**: The limiting C*-algebra, equipped with the limiting dynamics,
   is the continuum field theory of anyonic matter.

The key technical challenge: constructing fine-graining isometries that respect the
fusion-tree Hilbert space structure and the anyonic constraints.

## Motivation

- **Categorical data → QFT**: A systematic path from abstract fusion category data
  (F-symbols, R-symbols, quantum dimensions) to a continuum quantum field theory,
  passing through computable lattice models
- **New phases of anyonic matter**: Dilute gases, superfluids, and crossovers between
  Mott (dense chain) and dilute regimes
- **Connecting two communities**: The categorical/chain community (Poilblanc, Ardonne,
  Hollands) and the FCI/FQAH community (Shi, Senthil, Vishwanath) both study mobile
  anyons but from opposite ends. Our framework bridges them.
- **Recovering known results**: Free bosons, free fermions, Bethe-ansatz-solvable
  1D anyons as special cases

## Objectives

1. Construct Hilbert spaces with variable anyon number from arbitrary fusion categories
2. Define microscopic Hamiltonians (hopping, interaction, pair creation/annihilation)
3. Validate: sVec → free fermions, dense limit → golden chain
4. Compute spectra via exact diagonalisation for small systems
5. Construct fine-graining isometries for the anyonic lattice
6. Take the continuum limit via operator algebraic renormalization

## Approach

**Code-first, compute-first.**

1. Get matrix elements working for sVec (fermions) on small lattices
2. Validate against free fermion spectrum and Jordan-Wigner signs
3. Extend to Fibonacci; verify Hilbert space dimensions and spectra
4. Implement pair creation/annihilation (generalise Garjani-Ardonne to arbitrary FC)
5. Construct fine-graining isometries for the anyonic Hilbert space
6. Demonstrate continuum limit convergence on tractable examples
7. Write the paper from working code and computed results

**Tooling:**
- TensorCategories.jl directly (no wrapper modules) for categorical data
- Oscar.jl for exact arithmetic
- Custom Julia code for Hilbert space, Hamiltonians, exact diag

## Core Requirements

| ID | Requirement |
|----|-------------|
| **R1** | 1D chain with open boundary conditions. |
| **R2** | Hilbert space supports variable anyon number and mobility. |
| **R3** | Constructible Hamiltonians: hard-core, free, interacting; braided and non-braided. Pair creation/annihilation for variable N. |
| **R4** | Reduces to standard models: sVec → fermions, dense limit → golden chain. |
| **R5** | Computable physical observables: spectra, ground states. |
| **R6** | Fine-graining isometries respecting fusion-tree structure. |
| **R7** | Continuum limit via inductive limit of lattice algebras. |

## Fundamental Constraints

| ID | Constraint |
|----|------------|
| **C1** | **First quantisation only.** No creation/annihilation operators. Fock space = direct sum of N-particle sectors. |
| **C2** | **Braiding required for ordering identification.** Without R-symbols, different orderings are inequivalent. |
| **C3** | **F-moves vs R-moves are independent.** F = reassociation; R = reordering. |
| **C4** | **Fusion vertices are Hamiltonian terms, not unitary.** Pair creation/annihilation from Mor(X⊗Y, Z). |
| **C5** | **Local operations require F-moves.** For sVec trivial; for Fibonacci nontrivial. |
| **C6** | **Fine-graining must be isometric.** CP maps lose information; only isometries give a true C*-algebraic continuum limit. |

## Indexing Convention (Canonical)

- Sites: 1-based (1, 2, ..., L)
- Simple objects: 1-based into simples(C), index 1 = vacuum
- Nontrivial anyons: indices 2, ..., d
- Matches TensorCategories.jl convention

## Success Criteria

- **SC1:** sVec matrix elements reproduce free fermion hopping Hamiltonian
- **SC2:** sVec on L sites gives 2^L-dimensional Hilbert space
- **SC3:** Fibonacci dimensions match fusion tree counting
- **SC4:** Exact diag spectra for L=3..6 match expectations
- **SC5:** Dense limit recovers golden chain (c=7/10 for Fibonacci AF)
- **SC6:** Fine-graining isometries constructed for sVec and Fibonacci
- **SC7:** Continuum limit converges to identifiable QFT for at least one example

## Scope

**In scope:**
- 1D lattice, open boundaries
- Hard-core regime, with pair creation/annihilation for variable N
- sVec, Fibonacci, Ising as target categories
- Exact diag for small systems
- Fine-graining isometries and continuum limit via OAR
- Paper draft from working results

**Out of scope (this phase):**
- Soft-core (multiple anyons per site)
- Periodic boundary conditions
- Large-scale numerics / DMRG
- Higher dimensions
- Full classification of phases

## Prior Art

- **Poilblanc et al. (2011-2012)**: Anyonic t-J model for SU(2)_k. Charge-anyon
  fractionalization. PBC, no braiding in H, hopping implicit. [1210.5605]
- **Garjani-Ardonne (2016)**: Pair creation/annihilation for SU(2)_k. Dilute TL
  integrability. Almost no follow-up (4 citations). [1608.04927]
- **Hollands (2022)**: Rigorous categorical framework via subfactors. Dense only. [2205.15243]
- **Shi-Zhang-Senthil (2025)**: Field-theoretic (CSGL) for doped non-abelian QH.
  Explicitly calls for microscopic models. [2505.02893]
- **Nakajima et al. (2025)**: Dilute anyon thermodynamics from fusion constraints.
  No F-symbols needed. Complementary. [2508.14961]
- **Finch, Frahm, Lewerenz, Milsted, Osborne (2014)**: Dense anyon chain. [1404.2439]
- **Osborne-Stiegemann (2019-2021)**: Operator algebraic renormalization. Fine-graining
  isometries, Wilson triangle, continuum limit. [1901.06124, 2002.01442, 2107.13834]

## Open Questions

1. What do the fine-graining isometries look like for fusion-tree Hilbert spaces?
2. Does the anyonic Hilbert space constraint (fusion rules) survive the continuum limit,
   or does it become a superselection rule?
3. Which continuum QFTs arise from mobile anyon lattice models?
4. Is the charge-anyon fractionalization (Poilblanc) visible in the OAR continuum limit?
5. For which categories does the model become integrable?
6. How do braiding phases manifest in the continuum theory?

---

*v0 (Dec 2025) archived in `archive/v0/`. v1 (Mar 2026) superseded.*
