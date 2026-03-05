# CLAUDE.md

## Project

Microscopic lattice models for mobile anyons from fusion categories.
Code-first approach using TensorCategories.jl + Oscar.jl (Julia).

## Workflow Orchestration

### 1. Plan Mode Default

- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately -- don't keep pushing
- Use plan mode for verification steps, not just building

### 2. Subagent Strategy

- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- One task per subagent for focused execution

### 3. Verification Before Done

- Never mark a task complete without proving it works
- Run tests, check outputs, demonstrate correctness
- Ask yourself: "Would a physicist trust this computation?"

### 4. Autonomous Bug Fixing

- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests -- then resolve them

## Physics Constraints (Non-Negotiable)

1. **First quantisation only.** No creation/annihilation operators. No second quantisation. Ever.
2. **1-based indexing everywhere.** Sites 1..L, simples 1..d, index 1 = vacuum. Matches TensorCategories.jl.
3. **Use TensorCategories.jl directly.** No wrapper modules. No custom fusion category structs.
4. **Code before docs.** Get computations working, then write about them.
5. **Normalisation discipline.** State conventions explicitly. Document diagrammatic choices.
6. **Multiplicity-aware.** All definitions must handle N_{ab}^c >= 0, not just multiplicity-free.

## Notation

- Morphisms: Mor(A, B) in prose, `Hom(A, B)` in Julia (TensorCategories.jl API)
- N = {1, 2, 3, ...} (excludes zero)
- Z_{>=0} = {0, 1, 2, ...} (includes zero)
- TikZ diagrams: use macros from `tex/tikz_styles.tex`, never inline TikZ

## Task Management (Beads)

```bash
bd ready                    # What can I work on?
bd show <id>                # Issue details
bd update <id> --status in_progress  # Claim work
bd close <id>               # When complete
bd close <id1> <id2> ...    # Close multiple at once
bd sync                     # Sync with git remote
bd create --title="..." --description="..." --type=task|bug|feature --priority=2
bd dep add <issue> <depends-on>  # Add dependency
bd blocked                  # Show blocked issues
bd stats                    # Project statistics
```

Issues have dependencies. Respect the DAG.

## Core Principles

- **Simplicity First**: Make every change as simple as possible. Minimal code impact.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Compute First**: A working 10-line script beats 500 lines of specification.

## Key Files

- `src/MobileAnyons/` -- Julia package (config, hilbert, operators)
- `test/` -- tests
- `tex/` -- LaTeX paper and TikZ macros
- `prd.md` -- project requirements
- `archive/v0/` -- deprecated first attempt (reference only)
