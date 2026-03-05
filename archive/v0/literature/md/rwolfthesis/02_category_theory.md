# Chapter 2: Basics of Category Theory

## Overview

Category theory takes a general view of mathematical concepts, focusing on patterns and structures rather than details. Methods from one area can be transferred to others, providing new proof techniques.

**Goal**: Employ category theory to describe complex quantum systems (anyons), modeled by **Unitary Modular Tensor Categories (UMTCs)**.

## Basic Definitions

### Definition: Category

A **category** C consists of:
- A collection Obj(C) of **objects**
- For each pair X, Y ∈ Obj(C), a collection Hom_C(X,Y) of **morphisms** from X to Y
- **Composition**: Hom_C(Y,Z) × Hom_C(X,Y) → Hom_C(X,Z), denoted (g,f) ↦ g∘f
- **Identity**: For every X, an element id_X ∈ Hom_C(X,X)

**Axioms**:
1. **Associativity**: (h∘g)∘f = h∘(g∘f)
2. **Identity laws**: f∘id_X = f = id_Y∘f

### Notation
- f ∈ Hom_C(X,Y) written as f: X → Y
- X is the **domain**, Y is the **codomain**
- Commuting diagram: all paths between objects give same composition

### Definition: Isomorphism

A morphism f: X → Y is an **isomorphism** if it has an inverse g: Y → X such that:
- g∘f = id_X
- f∘g = id_Y

### Examples

**Category of Sets (Sets)**:
- Objects: All possible sets
- Morphisms: All maps between sets
- Composition: Composition of maps
- Identity: id(a) = a for all a ∈ X

**Group as Category**:
- Single object ★
- Hom(★,★) = elements of group G
- Composition: Group operation
- All morphisms are isomorphisms

### Definition: Functor

A **functor** F: C → D between categories consists of:
- Object map: Obj(C) → Obj(D), X ↦ F(X)
- Morphism map: Hom_C(X,Y) → Hom_D(F(X),F(Y)), f ↦ F(f)

**Axioms**:
1. F(g∘f) = F(g)∘F(f) for composable morphisms
2. F(id_X) = id_{F(X)}

Functors preserve structure: domains, codomains, identities, composition.

### Definition: Natural Transformation

For functors F,G: C → D, a **natural transformation** α: F → G is a family of morphisms:
- α_X: F(X) → G(X) for each X ∈ Obj(C)

such that for every f: X → X' in C, the naturality square commutes:
- α_{X'} ∘ F(f) = G(f) ∘ α_X

**Natural isomorphism**: α is natural isomorphism if each α_X is an isomorphism.

## Monoidal Categories

### Definition: Monoidal Category

A **monoidal category** (C, ⊗, α, **1**, l, r) consists of:
- Category C with bifunctor ⊗: C × C → C (tensor product)
- **Associator** α_{X,Y,Z}: (X⊗Y)⊗Z → X⊗(Y⊗Z) (natural isomorphism)
- **Unit object** **1** ∈ Obj(C)
- **Unit constraints** l_X: **1**⊗X → X and r_X: X⊗**1** → X

**Axioms**:

1. **Pentagon axiom**: The following diagram commutes:
```
((X⊗Y)⊗Z)⊗W → (X⊗Y)⊗(Z⊗W) → X⊗(Y⊗(Z⊗W))
      ↓                               ↑
(X⊗(Y⊗Z))⊗W ——————→ X⊗((Y⊗Z)⊗W) ———→
```

2. **Triangle axiom**: (X⊗**1**)⊗Y → X⊗(**1**⊗Y) → X⊗Y commutes with unit constraints

### Mac Lane's Coherence Theorem

For any two parenthesized products P₁, P₂ of X₁,...,Xₙ with arbitrary unit insertions, any two isomorphisms f,g: P₁ → P₂ obtained by composing associativity and unit isomorphisms are equal: **f = g**.

### Definition: Strict Monoidal Category

A monoidal category is **strict** if:
- (X⊗Y)⊗Z = X⊗(Y⊗Z)
- X⊗**1** = X = **1**⊗X

**Theorem**: Every monoidal category is monoidally equivalent to a strict one.

### Definition: Equivalence of Categories

Categories C and D are **equivalent** if there exist functors F: C → D and G: D → C such that:
- G∘F ≅ id_C
- F∘G ≅ id_D

## Graphical Calculus

Monoidal categories have a **string diagram** language:

### Basic Elements

- **Morphism** f: X → Y: Box labeled f with string X below and Y above
- **Identity** id_X: Straight line labeled X
- **Composition** g∘f: Stack f below g, connect
- **Tensor product** f⊗g: Place f and g side by side horizontally
- **Unit object** **1**: Dashed line or absence of line

**Convention**: Read diagrams bottom to top.

Associativity is implicit in graphical calculus (stacking boxes is associative).

## Fusion Categories

### Duality

**Left dual** X* of object X: Exists if there are morphisms:
- ev_X: X*⊗X → **1** (evaluation, depicted as cup: ∪)
- coev_X: **1** → X⊗X* (coevaluation, depicted as cap: ∩)

satisfying **zigzag identities**:
- (id_X ⊗ ev_X) ∘ (coev_X ⊗ id_X) = id_X
- (ev_X ⊗ id_{X*}) ∘ (id_{X*} ⊗ coev_X) = id_{X*}

**Right dual** *X: Defined similarly with reversed order.

**Dual morphism** f*: Y* → X* for f: X → Y, depicted by bending the f-box with cups and caps.

### Definition: Rigid Category

A monoidal category is **rigid** if every object has left and right duals.

### Definition: k-linear Category

A category is **k-linear** (k a field) if:
- Hom(X,Y) is a k-vector space
- Composition is bilinear over k

### Definition: Simple and Semisimple

- **Simple object**: Hom(X,X) = k (one-dimensional)
- **Semisimple object**: Direct sum of simple objects
- **Semisimple category**: Every object is semisimple

### Definition: Fusion Category

A **fusion category** over C is:
- C-linear
- Rigid
- Semisimple
- Finitely many simple objects (up to isomorphism)
- Finite-dimensional morphism spaces
- Unit object is simple

### Fusion Rules

For simple objects labeled by set I with representatives X_i:

**Fusion multiplicities**: N_{ij}^k ∈ Z₊ such that:
```
X_i ⊗ X_j = ⊕_k N_{ij}^k X_k
```

### Quantum Dimension

The **quantum dimension** d_a of simple object a:
```
d_a = |F_a^{aa*a}|_{**1****1**}|^{-1}
```

Alternative definition: d_a = Tr(id_a) using categorical trace.

**Total dimension**: D² = Σ_a d_a²

### Pivotal Category

A rigid category is **pivotal** if there's a monoidal natural isomorphism from id_C to the double dual functor (−)**.

**Spherical**: Pivotal category where left and right traces coincide.

## F-Symbols

### F-Matrices

For fusion category, **F-symbols** (or **6j-symbols**) are basis change matrices between different parenthesizations:

```
(F_d^{abc})_{fe}: Hom(d, a⊗(b⊗c)) → Hom(d, (a⊗b)⊗c)
```

Graphically: F-move converts between two tree structures with same external labels.

### Pentagon Equation

F-symbols must satisfy the **pentagon equation**:
```
(F_u^{abr})_{sp} (F_u^{pcd})_{rq} = Σ_t (F_s^{bcd})_{rt} (F_u^{atd})_{sq} (F_q^{abc})_{tp}
```

This ensures consistency of basis changes.

### Gauge Freedom

F-symbols have gauge freedom corresponding to choice of basis at each vertex:
```
(F_d^{abc})'_{fe} = (u_d^{af} u_f^{bc}) / (u_e^{ab} u_d^{ec}) · (F_d^{abc})_{fe}
```

Pentagon equation is gauge invariant.

## Braided Categories

### Definition: Braided Monoidal Category

A **braided monoidal category** has natural isomorphisms:
```
c_{X,Y}: X⊗Y → Y⊗X
```

satisfying hexagon equations.

Graphically: Braiding depicted as crossing (over or under).

### R-Matrix

For braided fusion category, **R-symbols** encode braiding:
```
(R_c^{ab})_{μν}: Basis change under braiding
```

### Definition: Ribbon Category

A **ribbon category** is a braided rigid category with a **twist** θ_X: X → X satisfying:
- θ_{X⊗Y} = c_{Y,X} ∘ c_{X,Y} ∘ (θ_X ⊗ θ_Y)
- (θ_X)* = θ_{X*}

### Definition: Modular Tensor Category (MTC)

A **modular tensor category** is a ribbon fusion category where the **S-matrix** is invertible:
```
S_{ab} = (1/D) Σ_c N_{ab}^c θ_c d_c
```

**Unitary MTC (UMTC)**: MTC with unitary S-matrix.

## Graph Database Metadata

```json
{
  "chapter": 2,
  "title": "Basics of Category Theory",
  "key_definitions": [
    "category",
    "morphism",
    "functor",
    "natural_transformation",
    "monoidal_category",
    "tensor_product",
    "associator",
    "unit_object",
    "left_dual",
    "right_dual",
    "evaluation",
    "coevaluation",
    "rigid_category",
    "simple_object",
    "semisimple_category",
    "fusion_category",
    "fusion_multiplicities",
    "quantum_dimension",
    "F_symbols",
    "pentagon_equation",
    "braided_category",
    "R_symbols",
    "ribbon_category",
    "modular_tensor_category"
  ],
  "key_equations": [
    "pentagon_equation",
    "hexagon_equations",
    "zigzag_identities",
    "fusion_rules"
  ],
  "examples": [
    "Sets",
    "group_as_category",
    "Vec(Z/pZ)"
  ]
}
```
