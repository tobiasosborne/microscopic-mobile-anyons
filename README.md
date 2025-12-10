---
refs-in:
  - prd.md
  - tech_specs.md
  - research_plan.md
  - AGENTS.md
refs-out: []
---

# Microscopic Models for Mobile Anyons

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A1 | 1D open chain (no PBCs) | Constraint | assumed |
| A2 | First quantisation only (no creation/annihilation operators) | Technical | assumed |

## Project Overview
- Goal: build microscopic lattice models for itinerant anyons from fusion categories, culminating in a publication-ready paper with verified code.
- Inputs: categorical data (simples, fusion multiplicities $N_{ab}^c$, $F$/$R$ symbols) plus lattice geometry for a 1D open chain.
- Outputs: rigorous definitions of Hilbert spaces with variable particle number, local Hamiltonians (hard-core, interacting, braided/free, creation/annihilation), and reductions to known limits (bosons/fermions, golden chain).

## Core Requirements (from PRD)
- Variable anyon number and mobility on a 1D open chain.
- Hamiltonians for hard-core, free, and interacting anyons, with and without braiding.
- Recover standard limits (bosons/fermions, fusion chains) and expose physical observables (spectra, partition functions, scattering effects).

## Critical Constraints
- **First quantisation only:** no creation/annihilation operators; operators act directly on $n$-particle sectors.
- **Normalisation discipline:** document diagrammatic conventions explicitly (see `docs/diagrammatic_calculus.md` when created).
- **Multiplicity aware:** all definitions must handle $N_{ab}^c \ge 0$ (not just multiplicity-free cases).
- **Basis independence:** avoid basis-specific choices unless necessary for computation.

## Workflow and Issue Tracking
- All work is tracked in **Beads** (`bd`) with planning references from `research_plan.md`.
- Check ready work: `bd ready --json`; claim: `bd update <id> --status in_progress --json`; close with a reason.
- Auto-sync is enabled; commit `.beads/issues.jsonl` with code/doc changes.
- AI agent guidance and proof protocol live in `AGENTS.md`; follow Lamport-style proofs and document normalisation choices.

## Repository Structure (planned)
- Top-level docs: `prd.md`, `tech_specs.md`, `research_plan.md`, `AGENTS.md`.
- Domain docs under `docs/` (preliminaries, Hilbert space, Hamiltonians, properties, diagrammatic calculus).
- Code under `src/julia/` (fusion data structures, mobile anyon models) and `src/clojure/` (symbolic tooling).
- Proofs under `proofs/`; literature summaries under `literature/`; LaTeX draft under `tex/`.

## Quick Start for Contributors
- Read `prd.md` (problem/objectives), `tech_specs.md` (standards, cross-references), `research_plan.md` (work breakdown), and `AGENTS.md` (constraints and proof protocol).
- Use `bd ready --json` to pick unblocked work; ensure planning refs go into issue descriptions and commit messages (e.g., `[microscopic-mobile-anyons-kuy.1]`).
- Keep documents ≤200 lines, include front matter and assumption tables where applicable, and accompany definitions with compilable Julia snippets placed in `src/`.

## References
- PRD: high-level goals and success criteria.
- Technical specifications: documentation standards, file layout, and bd workflow.
- Research plan: task graph with planning IDs.
