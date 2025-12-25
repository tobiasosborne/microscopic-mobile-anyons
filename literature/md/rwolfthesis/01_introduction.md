# Chapter 1: Introduction

## Overview

This thesis investigates the central question: **Is there a conformal field theory that corresponds to the Haagerup subfactor?**

## Physical Motivation

### Phase Transitions

Phase transitions affect our daily life:
- **Thermal transitions**: Occur when temperature T reaches critical value T_C
  - Ice cream melting (solid → liquid)
  - Steam from tea kettle (liquid → gas)
- **Quantum phase transitions**: Occur at T=0 when control parameter g reaches critical value g_C
  - Only quantum fluctuations (not thermal) drive the transition
  - System near quantum phase transition is described by a **conformal field theory (CFT)**

### Anyons and Exchange Statistics

In **3D**: Path C_1 (particle encircling another) can be continuously deformed to C_2 (no encirclement)
- Exchange operator R must satisfy R² = 1
- Only two solutions: R = +1 (bosons) or R = -1 (fermions)

In **2D**: Path C_1 cannot be deformed to C_2 (cannot cross the particle)
- Exchange operator R is not required to square to identity
- Can be represented by complex phase (**abelian anyons**) or unitary matrix (**non-abelian anyons**)
- These exotic exchange properties enable **topological quantum computation**
- Robustness to environmental noise due to topological protection

## The Subfactor-to-CFT Pipeline

```
Subfactor → UFC → UMTC → CFT
           (Even parts) (Drinfeld centre / (Anyon chains)
                        Levin-Wen model /
                        Annular category)
```

### Key Steps:

1. **Subfactor → UFC**: Even parts of finite-depth subfactor give rise to two Unitary Fusion Categories (UFCs)

2. **UFC → UMTC**: Several construction methods:
   - Direct construction of Drinfeld centre (tedious, lengthy calculations)
   - **Levin-Wen model**: 2D lattice model, excitations form UMTC
   - **Tube algebra / Annular category**: Connected to defect chains

3. **UMTC → CFT**: Build 1D anyon chains with nearest-neighbour interactions
   - At quantum phase transition: correlation length diverges
   - Entanglement entropy diverges
   - Extract central charge (important CFT characteristic)
   - Successfully done for: Fibonacci anyons, SO(5)_2 anyons

## The Haagerup Subfactor

- **Index**: (5 + √13)/2 ≈ 4.30278
- Smallest (finite-depth, irreducible, hyperfinite) subfactor with index > 4
- First interesting example requiring new CFT construction techniques

### Three Morita-Equivalent Fusion Categories:
- **H₁**: From principal even part (4 simple objects)
- **H₂**: From dual even part (6 simple objects)
- **H₃**: Third Morita-equivalent category (same fusion rules as H₂)

The category **H₃** is particularly useful because it's also a **trivalent category**, enabling simpler graphical calculus.

## Thesis Structure

### Part I: Mathematical Tools
1. **Category Theory** (Chapter 2): Basic definitions, monoidal categories, graphical calculus
2. **Trivalent Categories** (Chapter 2.1): Special categories with simple graphical rules
3. **Subfactors** (Chapter 3): Connection to fusion categories, module categories, algebra objects
4. **Haagerup/Drinfeld** (Chapter 4): Haagerup fusion categories, F-symbols, Drinfeld centre

### Part II: Microscopic Models
5. **Anyon Chains** (Chapter 5): 1D chains from H₃, numerical results
6. **Gauging Defects** (Chapter 8): Defects in spin chains, Vec(Z/2Z) example
7. **Levin-Wen Model** (Chapter 9): Generalization for non-tetrahedral categories
8. **Conclusion** (Chapter 10): Summary and future directions

## Key Finding

Using the UFC directly (instead of constructing UMTC first) does not give rise to a quantum phase transition for the Haagerup chain. Therefore, constructing the UMTC is necessary to study the connection to CFT.

## References

- Jones 1990: Subfactor-CFT conjecture
- Doplicher & Roberts 1989: Original work on field theory
- Bischoff 2015, 2016: Conjecture holds for subfactors with index < 4
- Haagerup 1994, Asaeda 1999: Haagerup subfactor construction
- Evans & Gannon 2011: Properties of hypothetical Haagerup CFT
- Feiguin et al. 2007: Fibonacci anyon chains
- Finch et al. 2014: SO(5)_2 anyon chains
- Levin & Wen 2005: String-net model

## Graph Database Metadata

```json
{
  "chapter": 1,
  "title": "Introduction",
  "key_concepts": [
    "phase_transition",
    "quantum_phase_transition",
    "conformal_field_theory",
    "anyons",
    "exchange_statistics",
    "subfactors",
    "fusion_categories",
    "unitary_modular_tensor_categories",
    "Haagerup_subfactor",
    "Drinfeld_centre",
    "topological_quantum_computation"
  ],
  "equations": [],
  "definitions": [],
  "cross_references": [
    "ch:cats",
    "ch:Trivalent",
    "ch:subfactor",
    "ch:Haagerup",
    "sec:anyons",
    "ch:defects",
    "ch:LW",
    "ch:conclusion"
  ]
}
```
