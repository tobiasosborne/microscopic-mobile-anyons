# TensorCategories.jl Skill

## Purpose
This skill provides comprehensive knowledge of the TensorCategories.jl package, enabling AI agents to write correct Julia code for tensor category computations.

## When to Use This Skill
Use this skill when:
- Writing code to define or work with categories (fusion, tensor, abelian, etc.)
- Computing with tensor products, direct sums, or other categorical operations
- Working with group representations, graded vector spaces, or coherent sheaves
- Computing Drinfeld centres or S-matrices
- Creating new category implementations

## Package Overview
TensorCategories.jl is a Julia package for working with tensor categories, fusion categories, and their algebraic structures. It builds on Oscar.jl for algebraic computations and GAP.jl for group-theoretic operations.

### Key Capabilities
- Framework for defining and computing with (fusion) categories
- Explicit implementations of common category examples
- Generic methods for categorical operations (direct sums, tensor products, duals, traces)
- Computation of the Drinfeld centre of fusion categories
- Grothendieck ring calculations
- S-matrix computation for modular categories

## Type Hierarchy
All categories inherit from `abstract type Category`
All objects inherit from `abstract type Object`
All morphisms inherit from `abstract type Morphism`

### Common Type Suffixes by Category
| Category | Object | Morphism | HomSpace |
|----------|--------|----------|----------|
| VectorSpaces | VSObject | VSMorphism | VSHomSpace |
| GradedVectorSpaces | GVSObject | GVSMorphism | GVSHomSpace |
| GroupRepresentationCategory | GroupRepresentation | GroupRepresentationMorphism | GRHomSpace |
| CohSheaves | CohSheaf | CohSheafMorphism | CohSfHomSpace |

## Core Methods by Category Property

### All Categories (Minimum)
```julia
parent(X::Object)           # Parent category
base_ring(X::Object)        # Base field
id(X::Object)               # Identity morphism
compose(f, g)               # Composition f ∘ g
f ∘ g                       # Composition operator
domain(f), codomain(f)      # Domain/codomain of morphism
isisomorphic(X, Y)          # Returns (bool, iso_or_nothing)
```

### Additive Categories
```julia
dsum(X, Y)                  # Direct sum
X ⊕ Y                       # Direct sum operator
zero(C::Category)           # Zero object
zero_morphism(X, Y)         # Zero morphism
f + g                       # Sum of morphisms
λ * f                       # Scalar multiplication
```

### Monoidal Categories
```julia
tensor_product(X, Y)        # Tensor product
X ⊗ Y                       # Tensor operator
one(C::Category)            # Unit object 𝟙
associator(X, Y, Z)         # Associativity constraint
```

### Rigid Categories (Duals)
```julia
dual(X::Object)             # Left dual X*
left_dual(X), right_dual(X) # Explicit duals
ev(X)                       # Evaluation X* ⊗ X → 𝟙
coev(X)                     # Coevaluation 𝟙 → X ⊗ X*
spherical(X)                # Spherical structure
```

### Semisimple Categories
```julia
simples(C::Category)        # Simple objects (up to isomorphism)
decompose(X)                # Decompose into [(simple, multiplicity)]
```

### Fusion/Modular Categories
```julia
braiding(X, Y)              # Braiding c_{X,Y}: X⊗Y → Y⊗X
smatrix(C)                  # S-matrix (for premodular categories)
drinfeld_morphism(X)        # Drinfeld element
grothendieck_ring(C)        # Grothendieck ring as AlgAss
```

## Important Implemented Categories

### VectorSpaces(k)
Category of finite-dimensional k-vector spaces. Fully abelian and rigid.
```julia
Vec = VectorSpaces(QQ)
V = VectorSpaceObject(QQ, 3)
```

### GradedVectorSpaces(k, G)
G-graded vector spaces for finite group G. Has tensor product with grading rules.
```julia
G = symmetric_group(3)
VecG = GradedVectorSpaces(QQ, G)
```

### GradedVectorSpaces(k, G, ω)
Twisted graded vector spaces with 3-cocycle ω. Associator depends on ω.
```julia
c = cyclic_group_3cocycle(G, F, ξ)
VecGω = GradedVectorSpaces(F, G, c)
```

### RepresentationCategory(G, k)
Finite-dimensional representations of group G over field k. Semisimple, uses MeatAxe for decomposition.
```julia
RepG = RepresentationCategory(symmetric_group(5), FiniteField(23)[1])
```

### CohSheaves(X, k)
G-equivariant coherent sheaves on finite G-sets. Key method: `stalks(F)` gives representations.
```julia
G = symmetric_group(3)
X = gset(G, [1, 2, 3, 4])
Coh = CohSheaves(X, FiniteField(23)[1])
```

### RingCategory(k, names)
Abstract semisimple ring categories defined by fusion rules (3D array) and 6j-symbols.
```julia
I = RingCategory(F, ["𝟙", "χ", "X"])
set_tensor_product!(I, fusion_rules)      # 3D array M[i,j,k]
set_associator!(I, i, j, k, matrices)
```

## Center of a Fusion Category

### Construction and Usage
```julia
Z = Center(C)               # Compute centre Z(C)
S = simples(Z)              # Simple objects (may be incomplete)

# Verify completeness: sum([dim(s)^2 for s in S]) should equal dim(C)^2
add_simple!(Z, I)           # Add missing simples manually
```

### Centre-Specific Methods
```julia
object(Z_obj)               # Underlying object in C
half_braiding(Z_obj, S_i)   # Half-braiding γ(S_i): X⊗S_i → S_i⊗X
iscentral(X::Object)        # Check if X admits half-braiding

# Operations automatically handle half-braidings
Z1 ⊕ Z2                     # Combined half-braiding
Z1 ⊗ Z2                     # Induced half-braiding
braiding(Z1, Z2)            # Uses half-braiding
```

## Common Patterns

### Pattern: Create and Decompose
```julia
C = SomeCategory()
simples(C)                  # Get list of simple objects S_i
X = S[i]^2 ⊕ S[j] ⊕ S[k]^3 # Build object from simples
decompose(X)                # Get [(S_i, mult_i), ...]
```

### Pattern: Hom Spaces
```julia
H = Hom(X, Y)              # Get Hom-space (a VectorSpaceObject)
dim(H)                      # Dimension of Hom-space
basis(H)                    # List of basis morphisms
f = basis(H)[1]             # Access specific morphism
```

### Pattern: Tensor Products and Decomposition
```julia
Y = X ⊗ W
decompose(Y)                # Automatically decomposes into simples
```

### Pattern: Duals and Traces
```julia
X_star = dual(X)
f_star = dual(f)            # Dual morphism
t = tr(f)                   # Left trace (spherical)
d = dim(X)                  # Categorical dimension = Tr(id_X)
```

### Pattern: Working with Group-Like Structures
When using RepresentationCategory, GradedVectorSpaces with groups, or CohSheaves:
```julia
G = symmetric_group(n)      # or cyclic_group(n), etc.
# For Rep(G):
S = simples(RepG)           # Via MeatAxe
ρ = S[2]^2 ⊕ S[4]          # Build representation
ρ ⊗ τ                       # Tensor product (uses Kronecker)
decompose(ρ ⊗ τ)            # MeatAxe decomposition
```

## Best Practices

1. **Check Category Properties First**: Before using a method, verify the category has that structure
   ```julia
   istensor(C)  # true if monoidal
   isfusion(C)  # true if semisimple, rigid, finite
   ```

2. **Use Simples as Building Blocks**: In semisimple categories, build everything from simple objects
   ```julia
   S = simples(C)
   X = S[i]^2 ⊕ S[j]  # Explicit decomposition
   ```

3. **Centre Completeness**: Always verify simples are complete (manually add missing ones if needed)
   ```julia
   S = simples(Z)
   sum([dim(s)^2 for s in S]) == dim(C)^2  # Should be true
   ```

4. **Group Representations**: Use decompose() on tensor products to get explicit multiplicities
   ```julia
   decompose(ρ ⊗ τ)  # Returns [(S_i, m_i), ...]
   ```

5. **Twisted Categories**: When using 3-cocycles, associators are automatically twisted—don't compute them manually
   ```julia
   VecGω = GradedVectorSpaces(F, G, c)
   # associator automatically uses ω
   ```

## Common Operations Quick Lookup

| Goal | Syntax |
|------|--------|
| Create category | `C = VectorSpaces(QQ)` or specific constructor |
| Get simple objects | `S = simples(C)` |
| Build object | `X = S[i] ⊕ S[j]^2` or `X = S[i] ⊗ S[j]` |
| Decompose object | `decompose(X)` returns `[(S_i, mult_i), ...]` |
| Get morphisms | `H = Hom(X, Y)` then `basis(H)` |
| Direct sum | `X ⊕ Y` |
| Tensor product | `X ⊗ Y` |
| Dual | `dual(X)`, `dual(f)` |
| Trace | `tr(f)` or `dim(X)` |
| Braiding | `braiding(X, Y)` |
| S-matrix | `smatrix(C)` |
| Centre | `Z = Center(C)` |
| Grothendieck ring | `grothendieck_ring(C)` |

## Error Avoidance

- **Don't** call `tensor_product` on non-monoidal categories
- **Don't** call `dual` on non-rigid categories  
- **Don't** call `braiding` on non-braided categories
- **Don't** assume `simples()` returns the complete list for Centre without verification
- **Don't** use group operations directly on representation objects; use the representation functor
- **For twisted categories**: Don't manually compute associators; the twist is built in

## Quick API Reference Link
Full API: `/literature/julia/api.md` in the repository root
