# Agent Prompt: Continue TL Anyon Simulation Work

## Context

This folder contains Julia implementations for simulating mobile anyons on 1D chains using exact diagonalization. Two distinct models have been implemented:

1. **`tl_pure.jl`** - Pure Temperley-Lieb (Catalan pairings, no trivalent vertices)
2. **`tl_anyons.jl`** - Fusion category picture (Fibonacci counting, trivalent vertices)

## What Has Been Done

### Pure TL (`tl_pure.jl`)
- ✅ `PlanarPairing` struct with `all_planar_pairings(n)` → Catalan numbers
- ✅ `TLHilbertSpace`: fixed N strands, basis = (config × pairing)
- ✅ `TLVariableHilbertSpace`: variable N, ⊕_{N even} H_N
- ✅ `hopping_hamiltonian`: strand endpoints hop
- ✅ `tl_generator_hamiltonian`: adjacent strands reconnect, loops → δ
- ✅ `pair_creation_op` / `pair_annihilation_op`: create/destroy paired strands
- ✅ `pair_hamiltonian`: Hermitian combination
- ✅ Basic exact diagonalization

### Fusion Picture (`tl_anyons.jl`)
- ✅ `TLCategory` with q-numbers, quantum dimensions
- ✅ `FusionTree` for intermediate charges (gives Fibonacci counting)
- ✅ `HilbertSpace` with config × fusion tree basis
- ✅ `hopping_hamiltonian` (simplified, no F-moves yet)
- ✅ Basic exact diagonalization

### Tests
- `test_tl_edge_cases.jl` - dimension checks
- `test_explicit_basis.jl` - explicit basis enumeration
- `test_tl_vs_fusion.jl` - comparison of the two pictures

## Key Formulas

**Pure TL**: `dim(H) = C(n,N) × C_{N/2}` (Catalan)
**Fusion**: `dim(H) = C(n,N) × F_{N+1}` (Fibonacci)

## What Needs To Be Done

### High Priority

1. **F-moves in fusion hopping** (`tl_anyons.jl`)
   - When anyon hops past another, fusion tree must be transformed via F-symbols
   - Currently hopping preserves fusion tree (incorrect for non-abelian anyons)
   - Need: implement proper 6j symbols and apply during hop

2. **Verify TL generator action** (`tl_pure.jl`)
   - The `tl_generator_hamiltonian` reconnects adjacent strands
   - Need careful verification that planarity is preserved
   - Check eigenvalues against known TL algebra results

3. **Pair creation in fusion picture** (`tl_anyons.jl`)
   - `pair_creation_hamiltonian` is stubbed but not implemented
   - Need to couple N ↔ N±2 sectors with proper fusion rules

### Medium Priority

4. **Braiding / R-matrices**
   - Add R-symbol data to categories
   - Implement braiding when anyons exchange (for fusion picture)

5. **Observables**
   - Correlation functions ⟨n_i n_j⟩
   - String order parameters
   - Entanglement entropy

6. **Larger system sizes**
   - Use sparse iterative solvers (Arpack/KrylovKit) for N > 10
   - Currently uses dense `eigen()` which limits to dim ~ 1000

### Lower Priority

7. **Periodic boundary conditions**
   - Currently open BC only
   - PBC introduces topological sectors

8. **Other categories**
   - Ising anyons (implemented but less tested)
   - Z_N parafermions
   - General Rep(U_q(sl_2)) at roots of unity

## Key Files

```
src/julia/Examples/
├── tl_pure.jl           # Pure TL with Catalan pairings
├── tl_anyons.jl         # Fusion picture with Fibonacci
├── test_tl_edge_cases.jl
├── test_explicit_basis.jl
├── test_tl_vs_fusion.jl
└── AGENT_PROMPT.md      # This file
```

## Running Tests

```bash
cd src/julia/Examples
julia tl_pure.jl           # Run pure TL examples
julia tl_anyons.jl         # Run fusion examples
julia test_tl_edge_cases.jl
```

## Key Physics

The loop weight δ controls criticality:
- δ = 2: free fermion point
- δ = √2: Ising CFT (c = 1/2)
- δ = φ (golden ratio): Fibonacci/tricritical Ising (c = 7/10)
- δ = 1: percolation

The partition function Z = Tr(e^{-βH}) generates spacetime diagrams weighted by categorical data. At criticality, these should exhibit conformal invariance detectable via SLE or finite-size scaling.

## References

- See `research_plan.md` §3.1a for TL category plan
- See `research_plan.md` §6.3 for partition function / criticality
- Key papers: Kauffman-Lins, Jones 1983, Jacobsen (loop models)
