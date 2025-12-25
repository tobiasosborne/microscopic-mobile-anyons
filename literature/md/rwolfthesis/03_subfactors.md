# Chapter 3: Subfactors and Fusion Categories

## Overview

The study of subfactors has deep connections to physics, particularly quantum field theory. There is a conjectured correspondence between subfactors and Conformal Field Theories (CFTs):
- **Jones (1990)**: Original conjecture
- **Doplicher & Roberts (1989)**: Foundational work
- **Bischoff (2015, 2016)**: Verified for subfactors with index < 4

The **Haagerup subfactor** is the smallest (finite-depth, irreducible, hyperfinite) subfactor with index > 4, and whether it has a corresponding CFT remains an open problem.

## Von Neumann Algebras and Factors

### Definition: Von Neumann Algebra

A **von Neumann algebra** is a self-adjoint subalgebra M of L(H) (bounded operators on Hilbert space H) satisfying:
```
M = (M')'
```
where M' is the **commutant**:
```
M' = {x' ∈ L(H) : x'x = xx' for all x ∈ M}
```

### Definition: Factor

A von Neumann algebra M with **trivial centre** (only multiples of identity) is called a **factor**.

### Definition: Subfactor

A **subfactor** of factor M is a subalgebra N ⊆ M such that:
- N is also a factor
- N contains the identity of M

**Irreducible subfactor**: Has trivial relative commutant (N' ∩ M = C)

### Classification of Factors

**Projections**: Operator p with p = pp = p*
- **Minimal**: No projection q with 0 < q < p
- **Finite**: No equivalent projection q < p

**Factor types**:
1. **Type I**: Contains nonzero minimal projection
2. **Type II**: Contains nonzero finite projections, not type I
   - **II₁**: Identity is finite projection
   - **II_∞**: Identity is not finite projection
3. **Type III**: No nonzero projection is finite

Every factor is exactly one of: Type I, II₁, II_∞, or III.

## The Index of a Subfactor

### Type II₁ Factors

Type II₁ factors have unique trace Tr_M: M → C.

**Inner product**: ⟨x, y⟩ = Tr_M(y*x) for x, y ∈ M

**Hilbert space**: L²(M) = completion of M with respect to this inner product

L²(M) is naturally an M-bimodule (Hilbert bimodule).

### Definition: Index

For type II₁ factor M and subfactor N ⊆ M:
```
[M:N] = dim_N L²(M)
```

**Properties**:
- Index = 1 if and only if N = M
- Measures "dimension" of M as N-module

### Jones' Theorem on Index Values

For inclusion N ⊆ M of type II₁ factors:
```
[M:N] ∈ {4cos²(π/n) : n = 3,4,...} ∪ [4,∞]
```

**Discrete spectrum below 4**:
- n=3: 1
- n=4: 2
- n=5: (3+√5)/2 ≈ 2.618
- n=6: 3
- n=7: (5+√5)/2 ≈ 3.618
- Accumulating at 4

**Continuous spectrum**: [4, ∞]

### The Hyperfinite Type II₁ Factor

The **hyperfinite type II₁ factor** R is:
- Unique smallest infinite-dimensional factor
- Can be embedded in every other infinite-dimensional factor
- Inductive limit: M₂ ⊆ M₄ ⊆ M₈ ⊆ ... ⊆ M_{2^n} ⊆ ...

Every allowed index value can be realized with M ≅ N ≅ R.

## Principal Graphs

### Bimodule Construction

For subfactor N ⊆ M, consider tensor products:
```
M_k = M ⊗_N M ⊗_N ... ⊗_N M  (k copies)
```

Decompose M_k into bimodule types:
- N-N bimodules
- M-M bimodules
- N-M bimodules
- M-N bimodules

### Bimodule Notation

- α = _N L²(M)_M (N-M bimodule)
- ᾱ = _M L²(M)_N (M-N bimodule)
- ε_N = _N L²(N)_N (trivial N-N bimodule)
- ε_M = _M L²(M)_M (trivial M-M bimodule)

### Four Parts of a Subfactor

1. **Principal even part** Γ_even: Irreducible N-N bimodules in ε_N, αᾱ, (αᾱ)², ...
2. **Principal odd part** Γ_odd: Irreducible N-M bimodules in α, αᾱα, α(ᾱα)², ...
3. **Dual even part** Γ'_even: Irreducible M-M bimodules in ε_M, ᾱα, (ᾱα)², ...
4. **Dual odd part** Γ'_odd: Irreducible M-N bimodules in ᾱ, ᾱαᾱ, ᾱ(αᾱ)², ...

### Principal Graph

The **principal graph** Γ is a bipartite graph:
- Vertices: Γ_even ∪ Γ_odd
- Even vertices: Distance even from ★ = ε_N
- Odd vertices: Distance odd from ★

**Edges**: For γ ∈ Γ_even, calculate γα. For each δ appearing in decomposition, draw edge γ—δ.

**Dual graph** Γ' constructed similarly from Γ'_even and Γ'_odd.

### Definition: Finite Depth

A subfactor has **finite depth** if its principal graph is finite.

- Principal graph finite ⟺ dual graph finite
- Their depths differ by at most 1

## Connection to Fusion Categories

### Theorem (Grossman et al.)

For a **finite-depth, irreducible, hyperfinite** subfactor:
- Γ_even and Γ'_even have monoidal category structure
- These categories are **fusion categories**

### Definition: Morita Equivalence

Fusion categories C₁ and C₂ are **Morita equivalent** (C₁ ≈ C₂) if there exists an invertible bimodule category M between them.

**Equivalent characterizations**:
1. Invertible bimodule category exists
2. Drinfeld centres Z(C₁) and Z(C₂) are equivalent as braided fusion categories
3. There exists algebra object A ∈ C₁ such that Bimod(A) ≅ C₂

**Key property**: Categories from same subfactor are Morita equivalent.

## Module Categories and Algebra Objects

### Definition: Module Category

A **left module category** over monoidal category C is a category M with:
- **Action**: Functor ⊳: C × M → M
- **Associator**: L_{X,Y,M}: (X⊗Y)⊳M → X⊳(Y⊳M)
- **Unit constraint**: u^l_M: 1⊳M → M

satisfying pentagon and triangle axioms.

**Right module** and **bimodule categories** defined similarly.

### Graphical Notation

Module associator:
```
   ╲  X
    ╲│    P        ╲  X
     ●──M  →  Σ_Q L ●──M
    ╱│    N         │  Q
   ╱  Y             │
                   ╱  Y
                    ╲ N
```

### Relative Tensor Product

For (A,B)-bimodule M and (B,C)-bimodule N:
```
M ⊗_B N
```
is an (A,C)-bimodule. Decomposes into simple bimodules P:
```
M ⊗_B N ≅ ⊕_P N_{M,N}^P · P
```

### Definition: Algebra Object

In strict fusion category C, an **algebra object** A ∈ C has:
- **Multiplication**: m: A⊗A → A
- **Unit**: i: 1 → A

satisfying:
```
m ∘ (id_A ⊗ m) = m ∘ (m ⊗ id_A)  [associativity]
m ∘ (i ⊗ id_A) = id_A = m ∘ (id_A ⊗ i)  [unit]
```

### Graphical Representation

Multiplication m: trivalent vertex with A,A,A labels
Unit i: univalent vertex with A label

Associativity condition:
```
  A         A
   ╲       ╱
    ●     ●
   ╱ ╲   ╱ ╲      =      same diagram mirrored
  A   ● A
       │
       A
```

### Theorem: Bound on Algebra Object Size

For simple algebra object A in fusion category C:
```
#X_i ∈ A ≤ dim(X_i)
```
where X_i are simple objects in decomposition of A.

### Example: Fibonacci Category

Simple objects: {1, τ} with τ⊗τ = 1 + τ

**Possible algebra objects** (by dimension bounds):
- **1**: Trivially an algebra object
- **τ**: Not an algebra object (no unit morphism Hom(1,τ) = ∅)
- **1+τ**: Is an algebra object with multiplication coefficients satisfying F-symbol equations

### Module Category from Algebra Object

A **left A-module** in C is pair (M, l) where:
- M ∈ C
- l: A⊗M → M (left action)

satisfying compatibility with multiplication m.

The category of A-modules forms a module category over C.

## Example: Vec(Z/pZ) Bimodules

### Structure

Category Vec(Z/pZ):
- Simple objects: {0, 1, 2, ..., p-1}
- Fusion: Addition mod p
- Associator: Always trivial

### F_q Bimodules

Family of bimodules F_q for q ∈ Z/pZ:
- Single object: ★
- Left/right action by group elements

**Associator**:
```
(a ⊳ ★) ◁ b → a ⊳ (★ ◁ b)
```
with phase exp(2πi qab/p)

**Special cases**:
- F₀: Non-invertible, trivial associator
- F_q (q≠0): Invertible, non-trivial associator

**Vec(Z/2Z) example**:
- F₀: Trivial associator
- F₁: Associator (-1)^{ab}

## Graph Database Metadata

```json
{
  "chapter": 3,
  "title": "Subfactors and Fusion Categories",
  "key_definitions": [
    "von_Neumann_algebra",
    "factor",
    "subfactor",
    "irreducible_subfactor",
    "factor_type",
    "index",
    "hyperfinite_factor",
    "principal_graph",
    "dual_graph",
    "finite_depth",
    "Morita_equivalence",
    "module_category",
    "algebra_object",
    "bimodule_category",
    "relative_tensor_product"
  ],
  "key_theorems": [
    "Jones_index_theorem",
    "Morita_equivalence_characterizations",
    "algebra_object_dimension_bound"
  ],
  "key_formulas": [
    "index_allowed_values: {4cos²(π/n)} ∪ [4,∞]",
    "module_pentagon_axiom",
    "algebra_object_associativity"
  ],
  "examples": [
    "Fibonacci_algebra_objects",
    "Vec(Z/pZ)_bimodules"
  ],
  "references": [
    "Jones1983",
    "Jones1990",
    "Jones1997",
    "Popa1990",
    "Popa1994",
    "grossman_quantum_2012"
  ]
}
```
