# Microscopic Models for Mobile Anyons

Lattice models for itinerant anyons from fusion categories, using
[TensorCategories.jl](https://github.com/FabianMaeurer/TensorCategories.jl).

## Structure

```
src/MobileAnyons/     Julia package: Hilbert space, operators, Hamiltonians
test/                 Tests
tex/                  LaTeX paper and TikZ macros
literature/           References and paper summaries
archive/v0/           Deprecated first attempt (Dec 2025 - Jan 2026)
```

## Setup

```julia
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using TensorCategories, Oscar
Fib = fibonacci_category()
```

## Key idea

For a fusion category C with simples {1, X₂, ..., X_d}, the Hilbert space
of mobile anyons on L sites is:

    H = ⊕_{N=0}^{L} ⊕_c ⊕_{configs} Mor(X_c, X_{a₁} ⊗ ... ⊗ X_{aₙ})

where configs run over hard-core placements of N anyons on L sites.
States are labelled by (config, fusion_tree, total_charge).

## Status

- [x] Project structure and TensorCategories.jl setup
- [ ] Hilbert space basis enumeration (sVec, Fibonacci)
- [ ] F-symbol extraction from TensorCategories.jl associators
- [ ] Matrix elements via F-symbol contraction
- [ ] sVec validation (free fermion spectrum)
- [ ] Fibonacci exact diag on small systems
- [ ] Paper draft
