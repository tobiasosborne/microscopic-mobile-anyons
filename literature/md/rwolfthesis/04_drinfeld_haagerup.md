# Chapter 4: The Haagerup Subfactor and Its Fusion Categories

## Overview

The Haagerup subfactor is the smallest (finite-depth, irreducible, hyperfinite) subfactor with index above 4.

**Index**: (5 + √13)/2 ≈ 4.30278

## Haagerup's Classification

### Possible Principal Graphs Near Index 4

Haagerup (1994) asked: Which principal graphs with index in range (4, 3+√3) are possible?

**Result**: No subfactor with index in interval (4, (5+√13)/2).

### Table of Possible Graphs

| Family | Principal Graph Γ | Dual Graph Γ' | Index Range |
|--------|-------------------|---------------|-------------|
| H_n | Chain + 3 branches | Chain + 2 arms | n ∈ N |
| B_n | Chain + 4 branches | Hexagon-like | n ∈ N |
| AH | Extended chain | Extended chain | Single |

**Index values**: From H₀ ≈ 4.303 to lim B_n ≈ 4.659

### Realization Status

- **H₀ (Haagerup)**: Realized (Haagerup & Asaeda 1999)
- **AH (Asaeda-Haagerup)**: Realized (Haagerup & Asaeda 1999)
- **B_n (all n)**: Not realized (Bisch 1998, inconsistent fusion)
- **H_n (n ≥ 2)**: Not realized (Asaeda & Yasuda 2007, 2008)
- **H₁ (Extended Haagerup)**: Realized (Bigelow et al. 2012)

## The Haagerup Fusion Categories

### Category H₁ (Principal Even Part)

**Simple objects**: {1, η, ν, μ}

**Quantum dimensions**:
| Object | Dimension |
|--------|-----------|
| 1 | 1 |
| η | (3+√13)/2 ≈ 3.303 |
| ν | (1+√13)/2 ≈ 2.303 |
| μ | (5+√13)/2 ≈ 4.303 |

**Fusion rules** (N_{XY}^Z):

|  ⊗  | 1 | ν | η | μ |
|-----|---|---|---|---|
| 1 | 1 | ν | η | μ |
| ν | ν | 1+2ν+2η+μ | 2ν+η+μ | ν+η+μ |
| η | η | 2ν+η+μ | 1+ν+η+μ | ν+η |
| μ | μ | ν+η+μ | ν+η | 1+ν |

### Category H₂ (Dual Even Part)

**Simple objects**: {1, α, α*, ρ, _αρ, _{α*}ρ}

**Quantum dimensions**:
| Object | Dimension |
|--------|-----------|
| 1, α, α* | 1 |
| ρ, _αρ, _{α*}ρ | (3+√13)/2 |

**Fusion rules** (Z = ρ + _αρ + _{α*}ρ):

|  ⊗  | 1 | α | α* | ρ | _αρ | _{α*}ρ |
|-----|---|---|-----|---|------|---------|
| 1 | 1 | α | α* | ρ | _αρ | _{α*}ρ |
| α | α | α* | 1 | _αρ | _{α*}ρ | ρ |
| α* | α* | 1 | α | _{α*}ρ | ρ | _αρ |
| ρ | ρ | _{α*}ρ | _αρ | 1+Z | α*+Z | α+Z |
| _αρ | _αρ | ρ | _{α*}ρ | α+Z | 1+Z | α*+Z |
| _{α*}ρ | _{α*}ρ | _αρ | ρ | α*+Z | α+Z | 1+Z |

### Category H₃ (Third Morita Class)

- Same simple objects and fusion rules as H₂
- Constructed as bimodules over algebra objects
- **Key difference**: Different F-symbols

### Morita Equivalence Class

```
        1+η
   H₁ ←——→ H₂
    ↖     ↗
1+μ+ν ↘ ↙ 1+α+α*
        H₃
```

**Algebra objects connecting categories**:
- H₁ → H₂: 1+η bimodules
- H₂ → H₁: 1+ρ bimodules
- H₁ → H₃: 1+μ+ν bimodules
- H₃ → H₁: 1+ρ+_αρ bimodules
- H₂ → H₃: 1+α+α* bimodules
- H₃ → H₂: 1+α+α* bimodules

## Recovering Principal Graphs

### From H₁ to Principal Graph

Algebra object: A = 1+η

**Matrix T** (rows = X_i ⊗ A decomposition):
```
T = | 1 0 1 0 |  1
    | 0 3 1 1 |  ν
    | 1 1 2 1 |  η
    | 0 1 1 1 |  μ
```

**Factorization** T = VV^T:
```
V = | 1 0 0 0 |
    | 0 1 1 1 |
    | 1 1 0 0 |
    | 0 1 0 0 |
```

V is the **adjacency matrix** of principal graph.

### From H₂ to Dual Graph

Algebra object: A = 1+ρ

**Matrix T**:
```
T = | 1 0 0 1 0 0 |
    | 0 1 0 0 1 0 |
    | 0 0 1 0 0 1 |
    | 1 0 0 2 1 1 |
    | 0 1 0 1 2 1 |
    | 0 0 1 1 1 2 |
```

**Module objects** from V:
- M₁ = 1 + ρ
- M₂ = α + _αρ
- M₃ = α* + _{α*}ρ
- M₄ = ρ + _αρ + _{α*}ρ

## F-Symbols for H₃

### The Computational Challenge

For H₃ with 6 simple objects:
- **41,391 equations** from pentagon equation
- **1,431 unknowns**

### Solution Strategy

Three sources of "seed data":

**1. Unitarity**:
- F-matrices are unitary: U†U = UU† = I
- For 1×1 matrices: |F|² = 1

**2. Gauge Freedom**:
- Each vertex has gauge freedom (basis choice)
- Pentagon equation is gauge invariant
- Transformation: (F_d^{abc})'_{fe} = (u_d^{af} u_f^{bc})/(u_e^{ab} u_d^{ec}) · (F_d^{abc})_{fe}

**3. Trivalent Relations**:
- Interpret trivalent diagrams as morphisms in full category
- Apply F-moves, compare with trivalent calculus
- Extract constraints on F-symbol entries

### Example: Square Diagram Constraint

From trivalent square decomposition:
```
(F_ρ^{ρρρ})†_{_αρ,ρ} (F_{_αρ}^{ρρρ})_{ρρ} √d_ρ = α(F_ρ^{ρρρ})†_{_αρ,1} + β(F_ρ^{ρρρ})†_{_αρ,ρ}
```

where α = (√13+7)/18 and β = √(√13-2)/3.

### F-Symbol Results

Complete F-symbols listed in Appendix A. Also independently computed by Matthew Titsworth.

## Algebra Objects in H₃

### Finding Algebra Object A = 1+ρ+_αρ

**Multiplication morphism** m: A⊗A → A

Dimension of Hom(A⊗A, A):
```
dim = Σ_{X,Y,Z} a_X a_Y a_Z dim(Hom(X⊗Y, Z)) = 15
```

**15 coefficients** to determine:
```
m = c_{11}^1 · (1→1) + c_{1ρ}^ρ · (ρ→ρ) + ... + c_{_αρ _αρ}^{_αρ} · (_αρ→_αρ)
```

### Conditions

**Unit conditions** (5 coefficients fixed):
```
c_{11}^1 = c_{1ρ}^ρ = c_{1,_αρ}^{_αρ} = c_{ρ1}^ρ = c_{_αρ,1}^{_αρ} = 1
```

**Associativity conditions** (from m∘(m⊗id) = m∘(id⊗m)):
```
Σ_α c_{xy}^α c_{αz}^w (F_w^{xyz})_{βα} = c_{xβ}^w c_{yz}^β
```

### Solution

Remaining 10 coefficients determined (some with gauge freedom):
```
c_{ρ,_αρ}^ρ = c_{_αρ,ρ}^ρ
c_{_αρ,ρ}^{_αρ} = c_{ρ,_αρ}^{_αρ}
c_{ρρ}^1 = √[(3-√(2√13-5))/2] · (c_{ρ,_αρ}^{_αρ})²
...
```

Two free parameters remain (gauge freedom).

## Module Categories over H₃

### Construction from A = 1+ρ+_αρ

**Matrix T** (fusion with A):
```
T = | 1 0 0 1 1 0 |
    | 0 1 0 1 0 1 |
    | 0 0 1 0 1 1 |
    | 1 1 0 3 2 2 |
    | 1 0 1 2 3 2 |
    | 0 1 1 2 2 3 |
```

**Factorization** T = VV^T gives 4 simple module objects:
```
M₁ = 1 + ρ + _αρ
M₂ = α + ρ + _{α*}ρ
M₃ = α* + _αρ + _{α*}ρ
M₄ = ρ + _αρ + _{α*}ρ
```

Module morphisms l_{M_i} determined analogously to multiplication m.

## The Drinfeld Centre

### Definition

For fusion category C, the **Drinfeld centre** Z(C) consists of pairs (X, σ) where:
- X ∈ C
- σ_Y: X⊗Y → Y⊗X is natural (half-braiding)

**Properties**:
- Z(C) is a **modular tensor category**
- Morita equivalent categories have equivalent Drinfeld centres

### Computation Methods

1. **Direct construction**: Tedious, involves finding all half-braidings
2. **Tube algebra**: Related to annular categories
3. **Levin-Wen model**: Excitations form Z(C)

For Haagerup categories, direct computation is challenging (see Chapter 9).

## Graph Database Metadata

```json
{
  "chapter": 4,
  "title": "The Haagerup Subfactor and Its Fusion Categories",
  "key_categories": [
    {
      "name": "H1",
      "simple_objects": ["1", "η", "ν", "μ"],
      "num_simples": 4,
      "source": "principal_even_part"
    },
    {
      "name": "H2",
      "simple_objects": ["1", "α", "α*", "ρ", "_αρ", "_{α*}ρ"],
      "num_simples": 6,
      "source": "dual_even_part"
    },
    {
      "name": "H3",
      "simple_objects": ["1", "α", "α*", "ρ", "_αρ", "_{α*}ρ"],
      "num_simples": 6,
      "source": "third_Morita_class",
      "is_trivalent": true
    }
  ],
  "key_values": {
    "index": "(5+√13)/2 ≈ 4.303",
    "d_rho": "(3+√13)/2 ≈ 3.303"
  },
  "algebra_objects": [
    {"in": "H1", "object": "1+η", "target": "H2"},
    {"in": "H2", "object": "1+ρ", "target": "H1"},
    {"in": "H1", "object": "1+μ+ν", "target": "H3"},
    {"in": "H2", "object": "1+α+α*", "target": "H3"}
  ],
  "key_techniques": [
    "principal_graph_recovery",
    "F_symbol_computation",
    "algebra_object_construction",
    "module_category_construction"
  ],
  "references": [
    "Haagerup1994",
    "asaeda_exotic_1999",
    "izumi_structure_2001",
    "Peters2010",
    "grossman_quantum_2012",
    "Morrison2017",
    "Osborne2019"
  ]
}
```
