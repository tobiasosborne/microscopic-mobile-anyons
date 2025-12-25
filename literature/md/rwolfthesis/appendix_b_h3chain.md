# Appendix B: Numerical Results for the H₃ Anyon Chain

## Overview

This appendix presents the entropy landscape for the H₃ anyon chain Hamiltonian, providing numerical evidence that no quantum phase transition occurs.

## Hamiltonian

The general H₃ anyon chain Hamiltonian with four fusion channels:

```
H = -Σᵢ [ cos(ψ) pᵢ^(1) + sin(ψ)cos(θ) pᵢ^(ρ) + sin(ψ)sin(θ)cos(φ) pᵢ^(αρ) + sin(ψ)sin(θ)sin(φ) pᵢ^(α*ρ) ]
```

where:
- pᵢ^(X) projects adjacent anyons onto fusion channel X
- ψ, θ, φ are angular parameters spanning all possible couplings
- X ∈ {1, ρ, αρ, α*ρ} are the fusion outcomes of ρ ⊗ ρ

## Parameter Space

Three spherical coordinates parametrize the coupling space:
- **ψ** ∈ [0, π]: Controls vacuum vs non-vacuum projection weight
- **θ** ∈ [0, π]: Controls ρ vs (αρ, α*ρ) weight
- **φ** ∈ [0, 2π]: Controls αρ vs α*ρ weight

## Numerical Method

1. **Ground state computation**: DMRG/MPS variational optimization
2. **Entropy calculation**: Entanglement entropy S = -Tr(ρ_A log ρ_A)
3. **Parameter scan**: 16 divisions per interval
4. **Visualization**: Contour plots (dark = low entropy, bright = high entropy)

## Results

### Fixed φ Slices

For each value of φ from 0 to 2π (in steps of π/16):
- Contour plot of entropy vs (ψ, θ)
- No divergent entropy regions observed
- Finite correlation length throughout

### Key Observations

1. **No phase transitions**: Entropy remains finite everywhere
2. **Smooth landscape**: No discontinuities or singularities
3. **Bounded entropy**: Maximum values consistent with gapped phase

### Interpretation

- **Gapped phase**: System has finite correlation length
- **No criticality**: No CFT description possible from this chain
- **UFC limitation**: Need UMTC for phase transition

## Plots

The appendix contains 33 contour plots:
- φ = 0, π/16, 2π/16, ..., 2π
- Each shows entropy landscape in (ψ, θ) plane
- Color scale: dark (low S) to bright (high S)

## Comparison with Fibonacci

For the Fibonacci anyon chain (a UMTC):
- Clear phase transition at critical coupling
- Divergent entanglement entropy
- Central charge c = 7/10 extractable

The H₃ chain (a UFC without braiding) shows:
- No phase transition
- Bounded entropy
- No CFT signature

## Conclusion

The numerical results confirm that the UFC-based anyon chain approach fails for H₃. The UMTC (Drinfeld centre) is required to find critical behaviour.

## Graph Database Metadata

```json
{
  "appendix": "B",
  "title": "Numerical results for H3 anyon chain",
  "category": "H3",
  "hamiltonian": {
    "form": "projector_sum",
    "channels": ["1", "ρ", "αρ", "α*ρ"],
    "parameters": ["ψ", "θ", "φ"]
  },
  "numerical_method": {
    "algorithm": "DMRG",
    "observable": "entanglement_entropy",
    "resolution": 16
  },
  "results": {
    "phase_transition": false,
    "entropy_divergence": false,
    "correlation_length": "finite"
  },
  "conclusion": "UFC_insufficient_for_CFT",
  "plots": 33
}
```
