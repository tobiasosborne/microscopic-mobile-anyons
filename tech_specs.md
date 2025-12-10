# Technical Specifications: Project Infrastructure

**Status:** Draft  
**Parent:** [mobile_anyons_prd.md](./mobile_anyons_prd.md)  
**Date:** December 2025

---

## Overview

This document specifies the technical infrastructure, documentation standards, and workflow requirements for the mobile anyons research project. It does **not** contain the research plan itself (see `research_plan.md`).

---

## 1. File Types and Languages

| Purpose | Format | Extension |
|---------|--------|-----------|
| Documentation, notes | Markdown | `.md` |
| Formal writeup, publication | LaTeX | `.tex` |
| Numerical computation, examples | Julia | `.jl` |
| Symbolic/algebraic tooling, agents | Clojure | `.clj` |
| Formal verification (optional, future) | Lean 4 | `.lean` |

All prose documents are authored in Markdown first; LaTeX is reserved for publication-ready material. Lean 4 formalisation is a nice-to-have for future versions, not a hard requirement for this phase.

---

## 2. Cross-Referencing

Every file must declare its dependencies and dependents in a front-matter block:

```markdown
---
refs-in:
  - hilbert_space.md
  - fusion_rules.md
refs-out:
  - hamiltonian_construction.md
---
```

Tooling (TBD) will validate that all cross-references resolve and detect orphaned files.

---

## 3. Symbol and Assumption Tables

**Global symbol table:** All symbols are defined in `symbols.yaml` and imported by reference.

```yaml
# symbols.yaml (excerpt)
symbols:
  - sym: "\\mathcal{C}"
    type: FusionCategory
    desc: "Input fusion category"
    defined_in: fusion_category.md
  - sym: "N"
    type: ℕ
    desc: "Number of sites"
    defined_in: null
  - sym: "\\mathcal{H}"
    type: Hilbert
    desc: "Full Hilbert space"
    defined_in: hilbert_space.md
```

Documents reference symbols by name; tooling (TBD) can generate per-document symbol tables for LaTeX export.

**Assumption table** (per-document, at document head):

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A1 | $\mathcal{C}$ is modular | Constraint | assumed |
| A2 | Open boundary conditions | Constraint | assumed |
| A3 | Finite-dimensional local spaces | Technical | assumed |

Type annotations follow: `Constraint`, `Technical`, `Physical`, `Conjecture`.

---

## 4. Definitions with Code

Every definition must be accompanied by a compilable code snippet in Julia.

**Example format:**

> **Definition 3.1** (Fusion multiplicity). For simple objects $a, b, c \in \mathcal{C}$, the fusion multiplicity $N_{ab}^c$ is the dimension of $\mathrm{Hom}(a \otimes b, c)$.

```julia
# file: src/fusion/multiplicity.jl
# refs: fusion_category.md, Def 3.1

struct FusionCategory
    simples::Vector{Symbol}
    N::Dict{Tuple{Symbol,Symbol,Symbol}, Int}  # N[a,b,c] = N_{ab}^c
end

fusion_multiplicity(C::FusionCategory, a, b, c) = get(C.N, (a, b, c), 0)
```

Code snippets longer than ~20 lines go in separate files under `src/`, with a reference comment linking back to the definition.

---

## 5. Derivations with Code

Each derivation step should be verifiable via executable code. Structure:

1. State derivation in prose/math
2. Provide minimal code example demonstrating the step
3. Reference full implementation in `src/` if non-trivial

```julia
# Derivation: F-move consistency (pentagon equation)
# See: fmove_derivation.md, Section 2

function check_pentagon(F, a, b, c, d)
    # Returns true iff pentagon identity holds for given labels
    ...
end
```

---

## 6. Claims, Conjectures, and Theorems

| Label | Requirement |
|-------|-------------|
| **Claim** | Statement without proof; evidence may be numerical/heuristic |
| **Conjecture** | Statement believed true; no proof supplied |
| **Theorem** | Statement with complete proof (see §7) |
| **Lemma/Proposition** | Supporting statement with complete proof |

Results without proof must be labelled `Claim` or `Conjecture`. No exceptions.

---

## 7. Proof Format: Lamport Structured Proofs

All proofs use hierarchical Lamport notation. Example:

> **Theorem 4.2.** The Hilbert space $\mathcal{H}$ decomposes as $\bigoplus_n \mathcal{H}_n$.
>
> *Proof.*
>
> 1. $\mathcal{H}$ is graded by total anyon number.
>    1.1. The number operator $\hat{N}$ commutes with the Hamiltonian.
>         *Proof:* Direct calculation; see `src/proofs/number_operator.jl`.
>    1.2. Therefore $\mathcal{H}$ decomposes into eigenspaces of $\hat{N}$.
> 2. Each eigenspace $\mathcal{H}_n$ is finite-dimensional.
>    2.1. Follows from assumption A3.
> 3. QED.

Proofs must be self-contained within the document or explicitly reference sub-proofs in other documents.

---

## 8. Document Modularity

**Hard constraint:** Each document ≤ 200 lines (~2K tokens).

Guidelines:
- One concept per document
- Offload code to `src/`; reference by path
- Offload long proofs to `proofs/` subdirectory
- Use `_overview.md` files to provide navigation for directories with many files

If a document exceeds 200 lines, split it. Prefer semantic boundaries (e.g., separate "Hilbert space definition" from "Hilbert space properties").

---

## 9. Citations

All definitions and results must cite sources. Format:

> **Definition 2.1** (F-symbols). [...] [Kitaev2006, §2.3] `[unverified]`

Citation status:
- `[unverified]` — default; not yet checked by human
- `[verified]` — human-in-the-loop has confirmed citation accuracy
- `[original]` — new result; no prior source

Verification is tracked in `citations.yaml`:

```yaml
- id: Kitaev2006
  title: "Anyons in an exactly solved model..."
  verified_by: null
  verified_date: null
  sections_used: ["§2.3", "§4.1"]
```

---

## 10. Version Control and Issue Tracking

**Repository:** Git

**Issue/task tracking:** [Beads](https://github.com/steveyegge/beads)

### bd Tool Format

The `bd` tool uses sequential IDs with a project prefix:

```bash
bd init --prefix ma    # Issues will be: ma-1, ma-2, ma-3, ...
bd create "Define fusion ring" -d "..."
bd list
bd ready               # Show unblocked work
```

### Planning IDs vs bd IDs

The research plan uses **planning IDs** (e.g., `§3.1.1`, `§P1.2`, `§F3.4`) for logical organization. When registering issues with `bd`, these become sequential `ma-N` IDs. Track the mapping via the description field:

```bash
bd create "Define fusion ring" \
  -d "Planning ref: §3.1.1. Define fusion ring with simple objects and fusion rules N_{ab}^c. 
      Must handle both multiplicity-free and general cases. 
      Ref: arXiv:1509.03275, Etingof." \
  -t task
```

### Mandatory Fields

When creating issues, always include:
- **Title:** Brief descriptive title
- **Description (`-d`):** Detailed scope, acceptance criteria, planning reference

### Dependencies

Use `bd dep add` to track blocking relationships:

```bash
bd dep add ma-15 ma-10    # ma-10 blocks ma-15
bd dep tree ma-15         # Visualize dependencies
bd ready                  # Show unblocked work
```

### Workflow

```bash
bd ready                          # Find next task
bd update ma-5 --status in_progress
# ... do work ...
bd close ma-5 --reason "Completed in docs/fusion_category.md"
```

---

## 11. Folder Structure

```
mobile-anyons/
├── README.md
├── agents.md
├── prd.md
├── tech_specs.md
├── research_plan.md
├── symbols.yaml
├── citations.yaml
├── docs/
│   ├── _overview.md
│   ├── fusion_category.md
│   ├── hilbert_space.md
│   ├── hamiltonian.md
│   └── ...
├── proofs/
│   ├── _overview.md
│   └── ...
├── literature/
│   ├── overview.md
│   ├── references.bib
│   └── pdfs/
├── src/
│   ├── julia/
│   │   ├── FusionCategories/
│   │   └── MobileAnyons/
│   ├── clojure/
│   └── lean/           # (optional, future)
├── tex/
│   ├── main.tex
│   ├── sections/
│   ├── appendices/
│   └── figures/
├── reviews/
│   └── llm_feedback.md
├── plans/
│   └── ...
└── notes/
    └── ...
```

---

## 12. Git Workflow

- `main` branch: stable, reviewed material only
- `dev` branch: work in progress
- Feature branches: `feature/<topic>` for exploratory work
- Commit messages: imperative mood, reference bd issue IDs where applicable

```
Add Fibonacci fusion rules and F-symbols [ma-14]
```

---

*Research plan to follow in `research_plan.md`.*
