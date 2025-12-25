# Chapter 8: Defects in Quantum Spin Systems

## Overview

This chapter studies defects in physical systems using microscopic approaches. Defects correspond to bimodule objects fused to anyon chains. Understanding defects requires constructing extended categories and using annular category techniques.

**Connection to thesis goal**: While not directly addressing the Haagerup CFT question, defects generalize anyon chains and connect to topological phases. The annular category construction provides insight into Drinfeld centre computation.

## Defects in Chains

### Basic Picture

A **defect** is a site in the chain labeled by something outside the category:

```
Chain with single defect:
● — ● — ● — ★ — ● — ● — ●
         (red)

Chain with two defects:
● — ● — ● — ★ — ● — ● — ★ — ●
```

Between two defects, the fusion rules can differ from the bulk chain.

### Mathematical Description

- Chain objects: Simple objects from fusion category C
- Defects: C-C bimodules
- Vertices involving defects: Need extended category C ⊕ M

## Defects in Topological Phases

### Importance for Quantum Computation

Topological phases are promising for:
- Topological quantum computation
- Quantum error correction
- Robust information storage

**Limitation**: Many phases have limited computational power.

**Solution**: Defects can **enhance computational power** of a topological phase.

### Literature

Key works on defects in topological systems:
- Fuchs 2013, Barkeshli 2013
- Cong 2016, 2017
- Bridgeman 2017
- Kesselring 2018

## Fock Space Formalism

### Single Site with Defect

System with zero or one quantum spin:
```
F_≤1(C^d) ≅ C ⊕ C^d
```

- C: Vacuum (no spin)
- C^d: One d-level spin

### Multi-Site System

For n sites with possible defects (missing spins):
```
F_≤n(C^d) = ⊗_{j=1}^n F_≤1(C^d) ≅ (C ⊕ C^d)^{⊗n}
```

Equivalent decomposition:
```
F_≤n(C^d) ≅ ⊕_{j=0}^n C^{C(n,j)} ⊗ H_j
```
where:
- C^{C(n,j)}: Configuration space for j particles on n sites
- H_j = (C^d)^{⊗j}: Hilbert space of j distinguishable spins

**Dimension check**: (d+1)^n = Σ_j C(n,j) d^j ✓

## Toric Code Example

### Setup

- 2D lattice on torus (periodic boundary conditions)
- Spins on edges: H = ⊗ C^2
- Hamiltonian:
```
H_T = -Σ_v (Z Z Z Z)_vertex - Σ_p (X X X X)_plaquette
```

### Ground Space Without Defects

For n×n lattice: **4-dimensional ground space**

### Ground Space With Defects

**Single defect**: Still 4-dimensional

**Two adjacent defects** (single puncture): 4-dimensional

**Two distant defects** (separate punctures): **8-dimensional** (C² ⊗ C² ⊗ C²)

### Configuration Space

Ground space for all configurations:
```
V_≤n²^T(C^2) = ⊕_{e₁,...,e_{n²}=0,1} V_{e₁,...,e_{n²}}
```

### Gauging Defects

Allow defects to move → impose equivalence relation:
- Equivalent if unitary circuit transforms one to other
- Collapses many configurations to same ground space dimension

## Vec(Z/2Z) Spin Chain

### The Category

**Vec(Z/2Z)** = vector spaces over Z/2Z:
- Simple objects: {0, 1}
- Fusion: Addition mod 2
- F-symbols: All trivial

**Fusion table**:
|  | 0 | 1 |
|--|---|---|
| 0 | 0 | 1 |
| 1 | 1 | 0 |

### Chain Without Defects

For chain with all labels = 1:
- Only two basis states (alternating): |1,0,1,0,...⟩, |0,1,0,1,...⟩
- Hilbert space: C² (one qubit)

For chain with all labels = 0:
- Two basis states: |0,0,0,...⟩, |1,1,1,...⟩
- Hilbert space: C² (one qubit)

### Defects as Bimodules

Defects = Vec(Z/2Z)-Vec(Z/2Z) bimodules

Use invertible bimodule **F₁** (for vacuum to appear in defect fusion):
- Single object: ★
- Associator: (-1)^{ab} for a,b ∈ {0,1}

### Chain With Two Defects

Between defects, both 0 and 1 are valid (not determined by boundary):
- Each pair of defects adds a qubit
- More defects → larger Hilbert space

### Mixed Chain

Allowing category objects AND bimodule objects on bonds:
```
C² ⊕ C ≅ C³ (three-level system per bond)
```

Total Hilbert space:
```
H ≅ ⊗_j (C ⊕ C²) for N sites
```

## Extended Category Construction

### The Problem

Need new vertex:
```
    0 or 1
      |
  ★ ——+—— ★
```

Not defined in Vec(Z/2Z) or F₁ separately.

**Goal**: Construct extended category Vec(Z/2Z) ⊕ F₁.

### Three-String Annular Category

**Definition**: Ann_{M,N;P}(A,B,C) for:
- A, B, C: Fusion categories
- M: (A,B)-bimodule
- N: (B,C)-bimodule
- P: (A,C)-bimodule

**Objects**: Triples (m,n;p) ∈ M × N × P

**Morphisms**: Diagrams on annulus with three strings (up to isotopy and local relations)

**Composition**: Stack diagrams radially

### Our Case

Ann_{F₁,F₁;Vec}(Vec,Vec,Vec) where Vec = Vec(Z/2Z)

Objects: (★,★,a) for a ∈ {0,1}

Morphisms: Annular diagrams with two red (F₁) strings and one black (Vec) string.

## Primitive Idempotent Construction

### Step 1: Isomorphism Classes

Simple objects (★,★,a) and (★,★,a+x+z) are isomorphic for any x,z.

**Result**: Single isomorphism class, representative (★,★,0).

### Step 2: Find Endomorphisms

Morphisms (★,★,0) → (★,★,0) require x+z = 0.

Four candidates T_{x,y} for x,y ∈ {0,1}:
- T_{0,0}: Identity (no internal lines)
- T_{0,1}: Single y=1 line at bottom
- T_{1,0}: x=z=1 lines on sides
- T_{1,1}: All three internal lines

### Step 3: Compute Multiplication

Using isotopy, F-moves, and bimodule associator:

**Multiplication rule**:
```
T_{a,b} T_{c,d} = T_{a+c, b+d}
```

**Key fact**: Non-trivial associator of F₁ introduces sign:
```
T_{1,1}² = T_{0,0} (not T_{1,1})
```

None of T_{x,y} is a primitive idempotent!

### Step 4: Matrix Representation

Represent 4D algebra with matrices:
```
M_{0,0} = diag(1,1,1,1)
M_{0,1} = diag(1,1,-1,-1)
M_{1,0} = diag(-1,1,-1,1)
M_{1,1} = diag(-1,1,1,-1)
```

### Step 5: Primitive Idempotents

Decompose into primitive idempotents:
```
P_{x,y} = (1/4) Σ_{a,b} (-1)^{ax+by} M_{a,b}
```

Resulting in 4 primitive idempotents (projectors onto each basis state).

### Step 6: Translate to Diagrams

Express primitive idempotents as linear combinations of annular diagrams.

These provide **basis for morphism spaces** in extended category.

## Hamiltonian for Defect Chain

### Local Terms

Project onto vacuum channel:
```
H = -Σ_i (1/√2) |0-channel⟩⟨0-channel|
```

Normalization: 1/√2 because dim(★) = √2.

### Including Bimodule Vertices

Extended Hamiltonian acts on states like:
```
★ — ★ — ... — ★ (all defects)
```

with C² on each bond (from Vec ⊕ F₁).

## Connection to Drinfeld Centre

### Tube Algebra

One-string annular category = **tube algebra**

For category C:
- Objects: Strings labeled by C objects
- Morphisms: Annular diagrams
- Simple objects = simple objects of Drinfeld centre Z(C)

### Dube Algebra

One-string annular category with invertible bimodule = **dube algebra**

### Application

Annular category techniques help compute:
- Drinfeld centre (for UMTC construction)
- Representations needed for extended chains

## Graph Database Metadata

```json
{
  "chapter": 8,
  "title": "Defects in Quantum Spin Systems",
  "key_concepts": [
    "defects",
    "topological_phases",
    "Fock_space",
    "toric_code",
    "gauging_defects",
    "bimodules",
    "extended_category",
    "annular_category",
    "tube_algebra",
    "dube_algebra",
    "primitive_idempotents",
    "Karoubi_envelope"
  ],
  "categories_studied": [
    {
      "name": "Vec(Z/2Z)",
      "objects": ["0", "1"],
      "fusion": "addition_mod_2",
      "F_symbols": "trivial"
    },
    {
      "name": "F1_bimodule",
      "objects": ["★"],
      "associator": "(-1)^{ab}"
    }
  ],
  "key_constructions": [
    "three_string_annular_category",
    "primitive_idempotent_decomposition",
    "inflation_trick",
    "extended_category_vertices"
  ],
  "applications": [
    "defect_enhanced_computation",
    "topological_quantum_error_correction",
    "Drinfeld_centre_computation"
  ],
  "references": [
    "Kitaev2003",
    "Bridgeman2019",
    "Bridgeman2020",
    "barter_domain_2019"
  ]
}
```
