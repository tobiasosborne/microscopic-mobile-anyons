# Session Handoff — 2026-03-10

## What was done this session

### Number-changing fine-graining isometry experiment
- **Goal**: test whether pair-creation h† can fill the deficit D = I - V₀†V₀ of the raw product map physically (without artificial normalization)
- **Phase 1 (Deficit Analysis)**: confirmed G = V₀†V₀ is diagonal, deficit depends only on positions, zero for N≤1. Deficit grows with N: ~0.029 (N=2), ~0.057 (N=3), ~0.083 (N=4)
- **Phase 2 (Composition h†V₀)**: naive composition fails because V₀†(h†V₀) ≠ 0 — cross-sector overlap where V₀ maps coarse (N+2) states to the same fine sector as h†V₀ maps coarse N states
- **Three-step fix** gives V†V = I exactly:
  1. Project: V₂_orth = (I - Π_{V₀}) h†V₀ → eliminates V₀†V₂
  2. Löwdin: V₂_J · G₂^{-1/2} → orthogonalizes V₂ columns against each other
  3. Scale: · D_J^{1/2} → fills deficit exactly
- **Result**: V†V = I to machine precision for Fibonacci and Ising, L=3,4 with D4 wavelet
- **Intertwining**: number-changing isometry gives ~3% better residual than normalized product (0.378 vs 0.393 at L=4 Fibonacci)
- New test file: `test/test_number_changing_finegraining.jl`
- Helper function `build_number_changing_isometry()` in test file (not yet in src/)

## Current state

### Completed
- M1-M5: All lattice operators (hopping, interaction, braiding, pair creation)
- M6: Pair creation/annihilation (622 tests)
- Phase 1 (OAR): sVec fine-graining, Haar + D4 wavelets
- Phase 2-3 (OAR): Universal normalized product map for any category/wavelet
- Phase 4 (OAR): Convergence tests, multi-step composition, spectral convergence
- **NEW**: Number-changing isometry V = V₀ + V₂ proven to work

### Two isometry approaches now validated
1. **Normalized product** (number-preserving): V = V_prod / ||col||. Simple, universal, no category data needed beyond basis.
2. **Number-changing**: V = V₀ + (I-Π_{V₀})h†V₀ · G₂^{-1/2}D^{1/2}. Uses pair creation, slightly better intertwining, physically motivated (pairs fill vacancies).

## What's next

### Immediate
- Decide whether to promote `build_number_changing_isometry` to `src/MobileAnyons/finegraining.jl` (currently only in test)
- Investigate whether the intertwining improvement scales with L (is 3% at L=4 growing or shrinking?)
- Consider multi-step composition with number-changing isometry (V_{2L→4L} ∘ V_{L→2L})

### Medium term
- LaTeX writeup of number-changing isometry result
- Compare continuum limit convergence rates: normalized product vs number-changing
- Explore whether higher-order pair terms (N→N+4) further improve things

### Long term
- Full OAR continuum limit construction
- Identify resulting QFTs
- Paper

## Key files
- `test/test_number_changing_finegraining.jl` — this session's experiment (Phases 1-5)
- `test/test_convergence.jl` — Phase 4 convergence tests
- `src/MobileAnyons/finegraining.jl` — product map, normalized product, categorical determinant
- `src/MobileAnyons/paircreation.jl` — pair creation operator h†
- `src/MobileAnyons/wavelets.jl` — Daubechies filters, one-particle scaling maps
