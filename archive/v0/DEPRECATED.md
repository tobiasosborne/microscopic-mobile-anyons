# v0 Archive (Deprecated)

**Archived:** 2026-03-05
**Reason:** Full restart with code-first approach using `af` CLI + TensorCategories.jl

## What this was

First attempt at building microscopic lattice models for mobile anyons from fusion
categories. Docs-first workflow with Sonnet 4.5 agents (Dec 2025 - Jan 2026).

## Why it was deprecated

1. Core computation (`matrix_element()`) was never implemented - returns 0
2. ~13k lines of docs/specs vs ~1500 lines of code, most structural scaffolding
3. Massive internal inconsistencies (indexing, notation, duplicate definitions)
4. Over-engineered process (273 beads issues, Lamport proofs, dual docs/LaTeX)
5. TensorCategories.jl migration half-done

## What was salvaged into v1

- Physics framing and PRD (revised)
- TikZ macro library (tex/tikz_styles.tex)
- Literature collection
- Configuration space enumeration logic
- Fusion tree enumeration algorithm

## Beads state

273 issues (193 open, 78 closed, 33 blocked). Database likely corrupt from
dolt migrations. Not worth recovering - all context is in the docs and code.
