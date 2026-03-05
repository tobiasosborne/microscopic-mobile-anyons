# TensorCategories.jl Refactoring Guide

**Status:** Draft
**Date:** December 2025
**Purpose:** Replace custom fusion category Julia code with TensorCategories.jl package

---

## Executive Summary

The project currently uses custom Julia structs (`FusionRing`, `FusionCategory`) to represent fusion category data. TensorCategories.jl provides a mature, well-tested implementation with:

- Built-in pentagon/hexagon equation verification
- Proper categorical operations (tensor product, Hom spaces, duals)
- Concrete F-symbol and R-symbol computation
- Integration with Oscar.jl for algebraic computations

**Recommendation:** Replace the custom implementation incrementally, preserving the mobile-anyon-specific logic (configurations, Hilbert space construction, Hamiltonians) while delegating categorical operations to TensorCategories.jl.

---

## Current Implementation Analysis

### Files to Refactor

| File | Current Role | Refactoring Priority |
|------|--------------|---------------------|
| `src/julia/FusionCategories/fusion_ring.jl` | Custom `FusionRing`, `FusionCategory` structs | **HIGH** - Core replacement |
| `src/julia/MobileAnyons/hilbert.jl` | Hilbert space using custom `FusionCategory` | **HIGH** - Depends on above |
| `src/julia/MobileAnyons/operators.jl` | Morphism terms using integer labels | **MEDIUM** - Use `Hom` spaces |
| `src/julia/MobileAnyons/hamiltonian_v0.jl` | Local Hamiltonians | **LOW** - Structure OK, just update types |
| `docs/*.md` Julia snippets | Documentation examples | **LOW** - Update after code stable |

### Current Custom Structs vs TensorCategories.jl

| Current Code | Issue | TensorCategories.jl Replacement |
|--------------|-------|--------------------------------|
| `FusionRing` struct | Re-invents fusion ring algebra | `grothendieck_ring(C)` returns `AlgAss` |
| `FusionCategory` struct | Manual F/R-symbol storage | `RingCategory` with proper associators |
| `basis::Vector{Symbol}` | Static label list | `simples(C)` returns actual objects |
| `N::Dict{NTuple{3,Symbol},Int}` | Manual fusion rules | `decompose(X ⊗ Y)` gives multiplicities |
| `fusion_product(R, a, b)` | Manual computation | `X ⊗ Y` then `decompose(...)` |
| `dual::Dict{Symbol,Symbol}` | Manual duality map | `dual(X)` built-in operation |
| `F::Dict{NTuple{6,Symbol},ComplexF64}` | Manual F-symbol storage | `associator(X, Y, Z)` returns morphism |
| `R::Dict{NTuple{3,Symbol},ComplexF64}` | Manual R-symbol storage | `braiding(X, Y)` returns morphism |
| `fusion_multiplicity(C, a, b, c)` | Dictionary lookup | `dim(Hom(X ⊗ Y, Z))` |
| `morphism_dim(C, a, b, c)` | Alias for above | `dim(Hom(X ⊗ Y, Z))` |

---

## Refactoring Plan

### Phase 1: Add TensorCategories.jl Dependency

```julia
# In src/julia/Project.toml
[deps]
TensorCategories = "..."
Oscar = "..."
```

**Note:** TensorCategories.jl requires Oscar.jl ecosystem. This may increase load times.

### Phase 2: Define Standard Fusion Categories

Replace custom category definitions with `RingCategory`:

#### Current (fusion_ring.jl):
```julia
struct FusionCategory
    simples::Vector{Symbol}
    unit::Symbol
    dual::Dict{Symbol,Symbol}
    N::Dict{NTuple{3,Symbol},Int}
    F::Dict{NTuple{6,Symbol},ComplexF64}
    R::Dict{NTuple{3,Symbol},ComplexF64}
end
```

#### Refactored (using TensorCategories.jl):
```julia
using TensorCategories, Oscar

# Fibonacci category
function fibonacci_category()
    # Use a suitable field (cyclotomic for exact arithmetic)
    Qx, x = QQ["x"]
    F, phi = NumberField(x^2 - x - 1, "φ")  # φ = golden ratio

    C = RingCategory(F, ["𝟙", "τ"])

    # Fusion rules: τ ⊗ τ = 𝟙 ⊕ τ
    M = zeros(Int, 2, 2, 2)
    M[1,1,1] = 1  # 𝟙 ⊗ 𝟙 = 𝟙
    M[1,2,2] = 1  # 𝟙 ⊗ τ = τ
    M[2,1,2] = 1  # τ ⊗ 𝟙 = τ
    M[2,2,1] = 1  # τ ⊗ τ → 𝟙
    M[2,2,2] = 1  # τ ⊗ τ → τ
    set_tensor_product!(C, M)

    # Set associator (F-symbols for τ⊗τ⊗τ)
    # ...compute and call set_associator!...

    return C
end

# Ising category
function ising_category()
    Qx, x = QQ["x"]
    F, a = NumberField(x^2 - 2, "√2")

    C = RingCategory(F, ["𝟙", "σ", "ψ"])

    # Fusion rules
    M = zeros(Int, 3, 3, 3)
    M[1,1,1] = 1  # 𝟙 ⊗ 𝟙 = 𝟙
    M[1,2,2] = 1  # 𝟙 ⊗ σ = σ
    M[1,3,3] = 1  # 𝟙 ⊗ ψ = ψ
    M[2,1,2] = 1  # σ ⊗ 𝟙 = σ
    M[2,2,1] = 1  # σ ⊗ σ → 𝟙
    M[2,2,3] = 1  # σ ⊗ σ → ψ
    M[2,3,2] = 1  # σ ⊗ ψ = σ
    M[3,1,3] = 1  # ψ ⊗ 𝟙 = ψ
    M[3,2,2] = 1  # ψ ⊗ σ = σ
    M[3,3,1] = 1  # ψ ⊗ ψ = 𝟙
    set_tensor_product!(C, M)

    # Set associators
    # set_associator!(C, 2, 2, 2, [matrices...])

    return C
end

# sVec (super-vector spaces / fermionic)
function svec_category()
    C = RingCategory(QQ, ["𝟙", "ψ"])

    M = zeros(Int, 2, 2, 2)
    M[1,1,1] = 1  # 𝟙 ⊗ 𝟙 = 𝟙
    M[1,2,2] = 1  # 𝟙 ⊗ ψ = ψ
    M[2,1,2] = 1  # ψ ⊗ 𝟙 = ψ
    M[2,2,1] = 1  # ψ ⊗ ψ = 𝟙
    set_tensor_product!(C, M)

    # Braiding: R_{ψ,ψ} = -1
    # set_braiding!(C, ...)

    return C
end
```

### Phase 3: Update Helper Functions

#### Fusion Multiplicity

**Current:**
```julia
fusion_multiplicity(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) =
    get(C.N, (a, b, c), 0)
```

**Refactored:**
```julia
using TensorCategories

function fusion_multiplicity(C::RingCategory, a_idx::Int, b_idx::Int, c_idx::Int)
    S = simples(C)
    X, Y, Z = S[a_idx], S[b_idx], S[c_idx]
    return dim(Hom(X ⊗ Y, Z))
end

# Or use decomposition:
function fusion_coefficients(C::RingCategory, a_idx::Int, b_idx::Int)
    S = simples(C)
    product = S[a_idx] ⊗ S[b_idx]
    dec = decompose(product)  # Returns [(simple, multiplicity), ...]
    return Dict(findfirst(==(s), S) => m for (s, m) in dec)
end
```

#### Morphism Spaces

**Current:**
```julia
morphism_dim(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) =
    fusion_multiplicity(C, a, b, c)
```

**Refactored:**
```julia
function morphism_space_dim(C::RingCategory, source_idx::Int, target_idx::Int)
    S = simples(C)
    return dim(Hom(S[source_idx], S[target_idx]))
end

function fusion_morphism_space(C::RingCategory, a_idx::Int, b_idx::Int, c_idx::Int)
    S = simples(C)
    return Hom(S[a_idx] ⊗ S[b_idx], S[c_idx])
end
```

#### F-Symbols (Associator)

**Current:**
```julia
associator_value(C::FusionCategory, a, b, c, d, e, f) =
    get(C.F, (a, b, c, d, e, f), 0 + 0im)
```

**Refactored:**
```julia
function get_associator(C::RingCategory, a_idx::Int, b_idx::Int, c_idx::Int)
    S = simples(C)
    X, Y, Z = S[a_idx], S[b_idx], S[c_idx]
    return associator(X, Y, Z)  # Returns morphism (X⊗Y)⊗Z → X⊗(Y⊗Z)
end
```

#### R-Symbols (Braiding)

**Current:**
```julia
braiding_value(C::FusionCategory, a, b, c) =
    get(C.R, (a, b, c), 0 + 0im)
```

**Refactored:**
```julia
function get_braiding(C::RingCategory, a_idx::Int, b_idx::Int)
    S = simples(C)
    X, Y = S[a_idx], S[b_idx]
    return braiding(X, Y)  # Returns morphism X⊗Y → Y⊗X
end
```

### Phase 4: Update Hilbert Space Construction

The `MobileAnyons/hilbert.jl` needs updates to use TensorCategories objects:

#### Current (hilbert.jl):
```julia
struct FusionCategory  # Custom duplicate definition!
    d::Int
    N::Dict{Tuple{Int,Int,Int}, Int}
end

fusion_mult(cat::FusionCategory, a, b, c) = get(cat.N, (a,b,c), 0)
```

#### Refactored:
```julia
using TensorCategories

# Use RingCategory directly
const TCCategory = RingCategory  # Type alias for clarity

struct MobileAnyonHilbert
    n_sites::Int
    cat::TCCategory
    hardcore::Bool
    basis::Vector{AnyonBasisState}
    sector_ranges::Dict{Tuple{Int,Int}, UnitRange{Int}}
end

# Fusion multiplicity via Hom space
function tc_fusion_mult(cat::TCCategory, a::Int, b::Int, c::Int)
    S = simples(cat)
    return dim(Hom(S[a] ⊗ S[b], S[c]))
end

# Number of simple objects
n_simples(cat::TCCategory) = length(simples(cat))
```

### Phase 5: Update Fusion Tree Enumeration

Replace manual fusion tree enumeration with TensorCategories decomposition:

**Current:**
```julia
function enumerate_fusion_trees(cat::FusionCategory, labels::Vector{Int}, c::Int)
    isempty(labels) && return c == 1 ? [Int[]] : Vector{Int}[]
    # ... manual recursion
end
```

**Refactored:**
```julia
function enumerate_fusion_trees_tc(cat::TCCategory, labels::Vector{Int}, c::Int)
    S = simples(cat)

    # Compute tensor product of all objects
    if isempty(labels)
        return c == 1 ? [Int[]] : Vector{Int}[]
    end

    # Build tensor product step by step, track intermediates
    # This uses TensorCategories decompose at each step
    current = S[labels[1]]
    trees = Vector{Vector{Int}}()

    function recurse(idx::Int, partial_tree::Vector{Int}, current_obj)
        if idx > length(labels)
            # Check if current_obj contains S[c]
            dec = decompose(current_obj)
            for (simple, mult) in dec
                if findfirst(==(simple), S) == c
                    for _ in 1:mult
                        push!(trees, copy(partial_tree))
                    end
                end
            end
            return
        end

        next_label = labels[idx]
        product = current_obj ⊗ S[next_label]
        dec = decompose(product)

        for (simple, mult) in dec
            simple_idx = findfirst(==(simple), S)
            for _ in 1:mult
                new_tree = vcat(partial_tree, [simple_idx])
                recurse(idx + 1, new_tree, simple)
            end
        end
    end

    recurse(2, Int[], current)
    return trees
end
```

---

## API Mapping Reference

### Core Type Mapping

| Old Type | New Type | Notes |
|----------|----------|-------|
| `FusionRing` | `AlgAss` via `grothendieck_ring(C)` | Algebraic structure |
| `FusionCategory` | `RingCategory` | Primary replacement |
| `Symbol` (labels) | `RingObject` | Actual category objects |
| `Int` (label indices) | Index into `simples(C)` | Keep for efficiency |

### Core Function Mapping

| Old Function | New Code | Return Type |
|--------------|----------|-------------|
| `fusion_product(R, a, b)` | `decompose(X ⊗ Y)` | `Vector{(Object, Int)}` |
| `fusion_multiplicity(C, a, b, c)` | `dim(Hom(X ⊗ Y, Z))` | `Int` |
| `is_associative(R)` | Automatic (pentagon verified on construction) | N/A |
| `has_valid_duality(R)` | `isfusion(C)` | `Bool` |
| `is_rigid(C)` | `isfusion(C)` | `Bool` |
| `morphism_dim(C, a, b, c)` | `dim(Hom(X ⊗ Y, Z))` | `Int` |
| `associator_value(C, ...)` | `associator(X, Y, Z)` | `Morphism` |
| `braiding_value(C, ...)` | `braiding(X, Y)` | `Morphism` |
| `dual[x]` | `dual(X)` | `Object` |

### HomSpace Operations

```julia
# Get morphism space
H = Hom(X ⊗ Y, Z)

# Dimension (= fusion multiplicity)
n = dim(H)

# Get basis morphisms
B = basis(H)

# Compose morphisms
f, g = B[1], B[2]
composed = compose(f, g)  # or f ∘ g
```

---

## Migration Strategy

### Step 1: Parallel Implementation
1. Add TensorCategories.jl dependency
2. Create wrapper module `src/julia/TCWrapper.jl` that provides old API on top of new types
3. Run existing tests against wrapper

### Step 2: Gradual Replacement
1. Replace `FusionCategories/fusion_ring.jl` with wrapper
2. Update `MobileAnyons/hilbert.jl` to use new types
3. Update `MobileAnyons/operators.jl` to use `Hom` spaces
4. Update tests

### Step 3: Direct Usage
1. Remove wrapper, use TensorCategories.jl directly
2. Update documentation snippets
3. Leverage advanced features (Centre, S-matrix, etc.)

---

## Benefits of Refactoring

### Correctness
- Pentagon/hexagon equations verified by package
- Proper associativity and coherence
- Exact arithmetic via Oscar.jl number fields

### Features
- Drinfeld centre computation `Center(C)`
- S-matrix for modular categories `smatrix(C)`
- Grothendieck ring `grothendieck_ring(C)`
- Decomposition into simples `decompose(X)`
- Built-in examples and constructions

### Maintenance
- Well-tested external package
- Active development community
- Documentation and examples

---

## Risks and Mitigations

| Risk | Mitigation |
|------|------------|
| Oscar.jl heavy dependency | Accept longer load times; consider precompilation |
| API differences | Create thin wrapper for project-specific conventions |
| Performance overhead | Profile critical paths; use indices not objects internally |
| Learning curve | Document key patterns; create helper functions |

---

## Files Requiring Updates

### High Priority (Core Logic)
- [ ] `src/julia/FusionCategories/fusion_ring.jl` - Replace entirely
- [ ] `src/julia/MobileAnyons/hilbert.jl` - Update `FusionCategory` type
- [ ] `tests/test_fusioncategories.jl` - Update to new types

### Medium Priority (Operations)
- [ ] `src/julia/MobileAnyons/operators.jl` - Use `Hom` spaces
- [ ] `src/julia/MobileAnyons/hamiltonian_v0.jl` - Minor type updates

### Low Priority (Documentation)
- [ ] `docs/fusion_ring.md` - Update code snippets
- [ ] `docs/morphism_spaces.md` - Update code snippets
- [ ] `docs/fusion_category_examples.md` - Rewrite examples
- [ ] `docs/hilbert_space.md` - Update code snippets
- [ ] `docs/operators.md` - Update code snippets

---

## Example: Complete Fibonacci Category

```julia
using TensorCategories, Oscar

function mobile_anyons_fibonacci()
    # Define field with golden ratio
    Qx, x = QQ["x"]
    F, phi = NumberField(x^2 - x - 1, "φ")
    inv_phi = phi - 1  # φ^{-1} = φ - 1
    sqrt_inv_phi = sqrt(inv_phi)  # Need extension for this

    # Create category with labels
    C = RingCategory(F, ["𝟙", "τ"])

    # Set fusion rules
    M = zeros(Int, 2, 2, 2)
    M[1,1,1] = 1; M[1,2,2] = 1; M[2,1,2] = 1
    M[2,2,1] = 1; M[2,2,2] = 1
    set_tensor_product!(C, M)

    # Set associator (F-matrix for τ⊗τ⊗τ)
    # F_{τ,τ,τ} = [φ^{-1}  φ^{-1/2}; φ^{-1/2}  -φ^{-1}]
    F_matrix = matrix(F, [inv_phi sqrt_inv_phi; sqrt_inv_phi -inv_phi])
    set_associator!(C, 2, 2, 2, [F_matrix])

    return C
end

# Usage
C = mobile_anyons_fibonacci()
S = simples(C)
τ = S[2]

# Fusion: τ ⊗ τ = 𝟙 ⊕ τ
dec = decompose(τ ⊗ τ)
# => [(S[1], 1), (S[2], 1)]

# Morphism space dimension
dim(Hom(τ ⊗ τ, τ))  # => 1

# Associator
α = associator(τ, τ, τ)  # Morphism (τ⊗τ)⊗τ → τ⊗(τ⊗τ)
```

---

## Appendix: TensorCategories.jl Key Types

```julia
abstract type Category end
abstract type Object end
abstract type Morphism end
abstract type HomSpace end

# RingCategory - main type for fusion categories
struct RingCategory <: Category
    base_ring::Field
    simples::Vector{RingObject}
    # ... internal data
end

# Methods
simples(C::Category) -> Vector{Object}
one(C::Category) -> Object           # Unit object 𝟙
dual(X::Object) -> Object
tensor_product(X, Y) -> Object       # or X ⊗ Y
associator(X, Y, Z) -> Morphism
braiding(X, Y) -> Morphism
Hom(X, Y) -> HomSpace
basis(H::HomSpace) -> Vector{Morphism}
dim(H::HomSpace) -> Int
decompose(X) -> Vector{Tuple{Object, Int}}
```

---

## References

- TensorCategories.jl: https://github.com/FabianMaeurer/TensorCategories.jl
- Oscar.jl: https://oscar.computeralgebra.de
- Package documentation: See `literature/julia/api.md`
