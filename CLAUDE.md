# CLAUDE.md

## Project

Microscopic lattice models for mobile anyons from fusion categories.
Code-first approach using TensorCategories.jl + Oscar.jl.

## Critical Rules

1. **First quantisation only.** No creation/annihilation operators. No second quantisation.
2. **Use TensorCategories.jl directly.** No wrapper modules. No custom fusion category structs.
3. **1-based indexing everywhere.** Sites 1..L, simples 1..d, index 1 = vacuum.
4. **Code before docs.** Get computations working, then write about them.

## Conventions

- Morphisms: use Mor(A, B) in prose, `Hom(A, B)` in Julia (TensorCategories.jl API)
- N = {1, 2, 3, ...} (excludes zero)
- Z_≥0 = {0, 1, 2, ...} (includes zero)
- TikZ diagrams: use macros from `tex/tikz_styles.tex`

## Key files

- `src/MobileAnyons/` — Julia package
- `test/` — tests
- `prd.md` — project requirements
- `archive/v0/` — deprecated first attempt

## Workflow

```bash
julia --project=. -e 'using Pkg; Pkg.test()'   # run tests
```
