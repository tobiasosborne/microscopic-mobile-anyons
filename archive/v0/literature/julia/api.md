# TensorCategories.jl API Guide

A Julia package for working with tensor categories, fusion categories, and their algebraic structures. Built on Oscar.jl for algebraic computations and GAP.jl for group-theoretic operations.

## Overview

TensorCategories.jl provides:
- Framework for defining and computing with (fusion) categories
- Explicit implementations of common category examples
- Generic methods for categorical operations (direct sums, tensor products, duals, traces)
- Computation of the Drinfeld centre of fusion categories
- Grothendieck ring calculations
- S-matrix computation for modular categories

## Installation

```julia
using Pkg
Pkg.add("TensorCategories")
```

Requires Oscar.jl ecosystem.

---

## Core Abstract Types

```julia
abstract type Category end
abstract type Object end
abstract type Morphism end
abstract type VectorSpaceObject <: Object end
abstract type VectorSpaceMorphism <: Morphism end
abstract type HomSpace <: VectorSpaceObject end
abstract type HomSet end
```

---

## Category Properties

Check category properties with boolean functions:

| Function | Description |
|----------|-------------|
| `isfusion(C)` | Finite semisimple rigid ring category |
| `ismultifusion(C)` | Finite semisimple rigid multiring category |
| `istensor(C)` | Rigid ring category |
| `ismultitensor(C)` | Rigid multiring category |
| `isring(C)` | Ring category (End(1) = k) |
| `ismultiring(C)` | Multiring category |
| `ismonoidal(C)` | Has tensor product structure |
| `isabelian(C)` | Abelian category |
| `issemisimple(C)` | All objects are semisimple |
| `islinear(C)` | k-linear category |

---

## Core Methods

### Basic Operations

```julia
parent(X::Object)           # Parent category of X
base_ring(X::Object)        # Base field k
base_ring(C::Category)      # Base field of category
id(X::Object)               # Identity morphism
compose(f, g)               # Composition f ∘ g (in order)
f ∘ g                       # Composition (same as compose)
domain(f::Morphism)         # Domain of morphism
codomain(f::Morphism)       # Codomain of morphism
isisomorphic(X, Y)          # Returns (bool, isomorphism_or_nothing)
```

### Direct Sums (Additive Structure)

```julia
dsum(X, Y)                  # Direct sum of objects
X ⊕ Y                       # Direct sum (Unicode operator)
dsum(X...)                  # Direct sum of multiple objects
dsum(f, g)                  # Direct sum of morphisms
zero(C::Category)           # Zero object
zero_morphism(X, Y)         # Zero morphism X → Y
f + g                       # Sum of parallel morphisms
λ * f                       # Scalar multiplication
```

### Products and Coproducts

```julia
product(X, Y)               # Categorical product
X × Y                       # Product (returns object + projections)
coproduct(X, Y)             # Categorical coproduct
X ∐ Y                       # Coproduct (returns object + injections)
```

### Abelian Structure

```julia
kernel(f::Morphism)         # Returns (kernel_object, inclusion)
cokernel(f::Morphism)       # Returns (cokernel_object, projection)
image(f::Morphism)          # Image object with inclusion
```

### Monoidal Structure

```julia
tensor_product(X, Y)        # Tensor product of objects
X ⊗ Y                       # Tensor product (Unicode)
tensor_product(f, g)        # Tensor product of morphisms
f ⊗ g                       # Tensor product of morphisms
one(C::Category)            # Unit object 𝟙
associator(X, Y, Z)         # Associativity constraint (X⊗Y)⊗Z → X⊗(Y⊗Z)
```

### Rigid Structure (Duals)

```julia
dual(X::Object)             # Left dual X*
left_dual(X)                # Left dual X*
right_dual(X)               # Right dual *X
ev(X)                       # Evaluation X* ⊗ X → 𝟙
coev(X)                     # Coevaluation 𝟙 → X ⊗ X*
dual(f::Morphism)           # Dual morphism f*
```

### Traces and Dimensions

```julia
tr(f::Morphism)             # Left trace (spherical)
left_trace(f)               # Left trace
right_trace(f)              # Right trace
dim(X::Object)              # Categorical dimension Tr(id_X)
dim(C::Category)            # Sum of squared dimensions of simples
spherical(X)                # Spherical structure morphism X → X**
```

### Braiding

```julia
braiding(X, Y)              # Braiding c_{X,Y}: X⊗Y → Y⊗X
smatrix(C)                  # S-matrix for premodular categories
drinfeld_morphism(X)        # Drinfeld element
```

### Semisimple Categories

```julia
simples(C::Category)        # List of simple objects (up to isomorphism)
decompose(X)                # Decompose X into simples: [(S_i, multiplicity)]
decompose_morphism(X)       # Isomorphism X → ⊕ n_i S_i
grothendieck_ring(C)        # Grothendieck ring as AlgAss
```

### Hom Spaces

```julia
Hom(X, Y)                   # Hom-space as vector space
End(X)                      # Endomorphism space Hom(X,X)
basis(H::HomSpace)          # Basis of morphisms
dim(H::HomSpace)            # Dimension of Hom-space
```

---

## Implemented Categories

### 1. Finite Sets: `Sets`

Basic category of finite sets with functions.

```julia
set = Sets()
X = SetObject([1, 2, 3, 4])
Y = SetObject([:a, :b])

product(X, Y)               # Cartesian product
coproduct(X, Y)             # Disjoint union
```

### 2. Vector Spaces: `VectorSpaces`

Category of finite-dimensional k-vector spaces.

```julia
Vec = VectorSpaces(QQ)
V = VectorSpaceObject(QQ, 3)        # 3-dimensional space
W = VectorSpaceObject(QQ, ["a","b"]) # 2-dim with named basis

basis(V)                    # Basis elements
V ⊕ W                       # Direct sum
V ⊗ W                       # Tensor product
dual(V)                     # Dual space
ev(V)                       # Evaluation map
coev(V)                     # Coevaluation map

# Morphisms
H = Hom(V, W)
f = basis(H)[1]             # A basis morphism
matrix(f)                   # Matrix representation
kernel(f)                   # Kernel
cokernel(f)                 # Cokernel
```

**Types:** `VectorSpaces`, `VSObject`, `VSMorphism`, `VSHomSpace`

### 3. Graded Vector Spaces: `GradedVectorSpaces`

G-graded vector spaces for finite group G.

```julia
G = symmetric_group(3)
VecG = GradedVectorSpaces(QQ, G)

g, s = gens(G)
V = VectorSpaceObject(g => VectorSpaceObject(QQ, 2),
                      s => VectorSpaceObject(QQ, 3))

simples(VecG)               # Simple objects k_g for g ∈ G
V ⊗ W                       # Graded tensor product
dual(V)                     # Graded dual (inverse grading)
```

**Types:** `GradedVectorSpaces`, `GVSObject`, `GVSMorphism`, `GVSHomSpace`

### 4. Twisted Graded Vector Spaces

Vec_G^ω with 3-cocycle twist ω.

```julia
G = cyclic_group(5)
F, ξ = CyclotomicField(5, "ξ")
c = cyclic_group_3cocycle(G, F, ξ)
VecGω = GradedVectorSpaces(F, G, c)

associator(X, Y, Z)         # Twisted associator (uses ω)
ev(V)                       # Twisted evaluation
```

**Helper:** `cyclic_group_3cocycle(G, F, ξ)` - constructs standard 3-cocycle for cyclic groups

### 5. Group Representations: `RepresentationCategory`

Category Rep(G) of finite-dimensional representations over finite fields.

```julia
G = symmetric_group(5)
k = FiniteField(23)[1]
RepG = RepresentationCategory(G, k)

S = simples(RepG)           # Irreducible representations (via MeatAxe)
ρ = S[2]^2 ⊕ S[4]          # Build representation
ρ(g)                        # Action matrix for g ∈ G

ρ ⊗ τ                       # Tensor product of representations
dual(ρ)                     # Contragredient representation
decompose(ρ ⊗ τ)            # Decompose into irreducibles
```

**Types:** `GroupRepresentationCategory`, `GroupRepresentation`, `GroupRepresentationMorphism`

**Functors:**
```julia
H = subgroups(G)[10]
RepH = RepresentationCategory(H, k)

Res = Restriction(RepG, RepH)   # Restriction functor
Ind = Induction(RepH, RepG)     # Induction functor

Res(ρ)                          # Restricted representation
Ind(τ)                          # Induced representation
```

### 6. Coherent Sheaves: `CohSheaves`

G-equivariant coherent sheaves on finite G-sets.

```julia
G = symmetric_group(3)
X = gset(G, [1, 2, 3, 4])
k = FiniteField(23)[1]
Coh = CohSheaves(X, k)

S = simples(Coh)            # Simple sheaves
F = S[1]^2 ⊕ S[4]

stalks(F)                   # Stalks as representations of stabilizers
orbit_stabilizers(Coh)      # Stabilizer subgroups for orbit reps
```

**Types:** `CohSheaves`, `CohSheaf`, `CohSheafMorphism`

**Functors:**
```julia
Y = gset(G, [1, 2, 3, 4, 5])
CohY = CohSheaves(Y, k)
f = identity                # Equivariant map X → Y

PF = Pushforward(Coh, CohY, f)
PB = Pullback(CohY, Coh, f)

PF(F)                       # Pushforward sheaf
PB(G)                       # Pullback sheaf
```

### 7. Convolution Category: `ConvolutionCategory`

Monoidal structure on Coh_G(X×X) via convolution product.

```julia
G = symmetric_group(3)
X = gset(G, [1, 2, 3, 4])
k = FiniteField(23)[1]
Conv = ConvolutionCategory(X, k)

S = simples(Conv)
F ⊗ G                       # Convolution product
dual(F)                     # Convolution dual
stalks(F)                   # Underlying stalks
```

**Types:** `ConvolutionCategory`, `ConvolutionObject`, `ConvolutionMorphism`

### 8. Ring Categories (6j-Symbols): `RingCategory`

Abstract semisimple ring categories defined by fusion rules and 6j-symbols.

```julia
# Ising category example
Qx, x = QQ["x"]
F, a = NumberField(x^2 - 2, "√2")
I = RingCategory(F, ["𝟙", "χ", "X"])

# Set fusion rules
M = zeros(Int, 3, 3, 3)
M[1,1,:] = [1,0,0]          # 𝟙 ⊗ 𝟙 = 𝟙
M[1,2,:] = [0,1,0]          # 𝟙 ⊗ χ = χ
M[2,2,:] = [1,0,0]          # χ ⊗ χ = 𝟙
M[3,3,:] = [1,1,0]          # X ⊗ X = 𝟙 ⊕ χ
# ... more rules
set_tensor_product!(I, M)

# Set non-trivial associators
set_associator!(I, 2, 3, 2, matrices(-id(I[3])))
set_associator!(I, 3, 3, 3, [z, z, inv(a)*matrix(F, [1 1; 1 -1])])

# Use category
S = simples(I)
S[3] ⊗ S[3]                 # X ⊗ X = 𝟙 ⊕ χ
```

**Types:** `RingCategory`, `RingObject`, `RingMorphism`

**Methods:**
```julia
I[i]                        # i-th simple object
set_tensor_product!(C, M)   # Set fusion rules (3D array)
set_associator!(C, i,j,k, matrices)  # Set 6j-symbol
set_braiding!(C, ...)       # Set braiding morphisms
matrices(f::RingMorphism)   # Component matrices
```

---

## Functors

```julia
abstract type Functor end
```

### Functor Interface

A functor F: C → D requires:
- `domain(F)::Category`
- `codomain(F)::Category`
- `F(X::Object)::Object` - object map
- `F(f::Morphism)::Morphism` - morphism map

### Built-in Functors

```julia
# Hom functors
Hom(X, :)                   # Covariant Hom(X, -)
Hom(:, X)                   # Contravariant Hom(-, X)
Hom(C)                      # Bifunctor Hom(-,-)

# Forgetful functors
Forgetful(VecG, Vec)        # Forget grading

# Representation functors
Restriction(RepG, RepH)     # Res^G_H
Induction(RepH, RepG)       # Ind^G_H

# Sheaf functors
Pullback(CohY, CohX, f)     # f*
Pushforward(CohX, CohY, f)  # f_*
```

---

## Opposite and Product Categories

### Opposite Category

```julia
Cop = OppositeCategory(C)
Xop = OppositeObject(Cop, X)
fop = OppositeMorphism(Xop, Yop, f)  # Reversed morphism
```

### Product Category

```julia
CxD = ProductCategory(C, D)
XY = ProductObject(CxD, (X, Y))
fg = ProductMorphism(XY1, XY2, (f, g))

# Access factors
factors(XY)                 # (X, Y)
```

---

## Drinfeld Centre

The centre Z(C) of a fusion category C. Objects are pairs (X, γ) where γ is a half-braiding.

### Construction

```julia
G = symmetric_group(3)
F, ξ = CyclotomicField(3, "ξ")
VecG = GradedVectorSpaces(F, G)
Z = Center(VecG)
```

### Finding Simple Objects

```julia
S = simples(Z)              # Compute simple objects (may be incomplete)

# Check completeness
sum([dim(s)^2 for s in S])  # Should equal dim(C)^2

# Add missing simples manually
add_simple!(Z, I)
```

### Centre Methods

```julia
iscentral(X::Object)        # Check if X admits half-braiding
half_braidings(X)           # Compute all half-braidings for X
central_objects(X)          # Objects in Z(C) over X

# For centre objects
object(Z_obj)               # Underlying object in C
half_braiding(Z_obj, S_i)   # Half-braiding γ(S_i): X⊗S_i → S_i⊗X
```

### Centre Object Operations

```julia
# All standard operations work
Z1 ⊕ Z2                     # Direct sum (with combined half-braiding)
Z1 ⊗ Z2                     # Tensor product (with induced half-braiding)
dual(Z1)                    # Dual (with transposed half-braiding)
braiding(Z1, Z2)            # Braiding c_{Z1,Z2} = γ_{Z1}(Y)

Hom(Z1, Z2)                 # Central morphisms (subspace of Hom(X1,X2))
decompose(Z1 ⊗ Z2)          # Decompose product
smatrix(Z)                  # S-matrix (checks modularity)
```

**Types:** `CenterCategory`, `CenterObject`, `CenterMorphism`

---

## Grothendieck Ring

```julia
Gr = grothendieck_ring(C)   # Returns AlgAss (associative algebra)

# Multiplication table
print_multiplication_table(C)
multiplication_table(C)     # Raw table
```

---

## Cocycles

For twisted graded vector spaces:

```julia
# 3-cocycle type
struct Cocycle{T}
    group::GAPGroup
    values::Dict{Tuple,T}
end

# Standard cocycle for cyclic groups
c = cyclic_group_3cocycle(G, F, ξ)

# Trivial cocycle
c = trivial_3_cocycle(G, F)

# Access values
c[g, h, k]                  # ω(g,h,k)
```

---

## Utility Functions

### Linear Algebra

```julia
express_in_basis(v, basis)  # Express v in terms of basis
left_inverse(f)             # Left inverse of injective f
right_inverse(f)            # Right inverse of surjective f
```

### Decomposition

```julia
simple_subobjects(X)        # Find simple subobjects
ev_coev(X)                  # Check dual axioms
```

---

## Type Summary

| Category | Object Type | Morphism Type | Hom Type |
|----------|-------------|---------------|----------|
| `Sets` | `SetObject` | `SetMorphism` | `SetHomSet` |
| `VectorSpaces` | `VSObject` | `VSMorphism` | `VSHomSpace` |
| `GradedVectorSpaces` | `GVSObject` | `GVSMorphism` | `GVSHomSpace` |
| `GroupRepresentationCategory` | `GroupRepresentation` | `GroupRepresentationMorphism` | `GRHomSpace` |
| `CohSheaves` | `CohSheaf` | `CohSheafMorphism` | `CohSfHomSpace` |
| `ConvolutionCategory` | `ConvolutionObject` | `ConvolutionMorphism` | `ConvHomSpace` |
| `RingCategory` | `RingObject` | `RingMorphism` | (inherits) |
| `CenterCategory` | `CenterObject` | `CenterMorphism` | (inherits) |
| `OppositeCategory` | `OppositeObject` | `OppositeMorphism` | (inherits) |
| `ProductCategory{N}` | `ProductObject{N}` | `ProductMorphism{N}` | (inherits) |

---

## Quick Reference: Defining a New Category

Minimal requirements for a new category:

```julia
struct MyCategory <: Category
    base_ring::Field
end

struct MyObject <: Object
    parent::MyCategory
    # data...
end

struct MyMorphism <: Morphism
    domain::MyObject
    codomain::MyObject
    # data...
end

# Required methods
id(X::MyObject)::MyMorphism
compose(f::MyMorphism, g::MyMorphism)::MyMorphism
isisomorphic(X::MyObject, Y::MyObject)::Tuple{Bool, Union{MyMorphism,Nothing}}
```

Additional structure requires implementing corresponding methods:

| Structure | Methods to Implement |
|-----------|---------------------|
| Additive | `dsum`, `zero`, `zero_morphism`, `+` |
| Abelian | `kernel`, `cokernel` |
| k-linear | `+`, `*` (scalar) |
| Monoidal | `tensor_product`, `one`, `associator` |
| Rigid | `dual`, `ev`, `coev` |
| Braided | `braiding` |
| Fusion | `simples` |

Set properties with:
```julia
isfusion(C::MyCategory) = true  # Implies all below
```

---

## Example Session

```julia
using TensorCategories, Oscar

# Create graded vector spaces
G = symmetric_group(3)
F, ξ = CyclotomicField(3, "ξ")
VecG = GradedVectorSpaces(F, G)

# Work with simple objects
S = simples(VecG)
X = S[2] ⊕ S[3]^2
dim(X)                      # 3

# Tensor products
Y = X ⊗ X
decompose(Y)                # Decomposition into simples

# Compute centre
Z = Center(VecG)
Zs = simples(Z)
smatrix(Z)                  # S-matrix

# Check modularity
rank(smatrix(Z)) == length(Zs)  # true if modular

# Grothendieck ring
Gr = grothendieck_ring(VecG)
```

---

## References

- Etingof et al., *Tensor Categories* (2016)
- Müger, *From subfactors to categories and topology II* (2003)
- Oscar.jl documentation: https://oscar.computeralgebra.de
- Source: https://github.com/FabianMaeurer/TensorCategories.jl
