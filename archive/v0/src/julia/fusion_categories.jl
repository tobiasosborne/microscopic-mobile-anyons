# fusion_categories.jl
# Julia implementation of fusion category data structures
# Uses TensorCategories.jl as the backend (per AGENTS.md requirement)
#
# Section §3.1.8 companion code
# Cross-references: docs/fusion_category.md, tex/sections/fusion_category_examples.tex

using TensorCategories
using Oscar

# ============================================================
# Built-in Categories
# ============================================================

"""
    get_fibonacci_category()

Returns the Fibonacci fusion category from TensorCategories.jl.

Simple objects: 𝟙 (vacuum), τ (Fibonacci anyon)
Fusion rule: τ ⊗ τ = 𝟙 ⊕ τ
Quantum dimension: d_τ = φ = (1 + √5)/2

# Example
```julia
Fib = get_fibonacci_category()
S = simples(Fib)
τ = S[2]
decompose(τ ⊗ τ)  # Returns [(𝟙, 1), (τ, 1)]
```
"""
function get_fibonacci_category()
    return fibonacci_category()
end

"""
    get_ising_category()

Returns the Ising fusion category from TensorCategories.jl.

Simple objects: 𝟙 (vacuum), σ (Ising anyon), ψ (fermion)
Fusion rules:
  - σ ⊗ σ = 𝟙 ⊕ ψ
  - σ ⊗ ψ = σ
  - ψ ⊗ ψ = 𝟙
Quantum dimensions: d_σ = √2, d_ψ = 1

# Example
```julia
Ising = get_ising_category()
S = simples(Ising)
σ = S[2]
decompose(σ ⊗ σ)  # Returns [(𝟙, 1), (ψ, 1)]
```
"""
function get_ising_category()
    return ising_category()
end

# ============================================================
# Fusion Data Extraction
# ============================================================

"""
    fusion_multiplicity(C, a, b, c)

Compute the fusion multiplicity N_{a,b}^c = dim Hom(a ⊗ b, c).

# Arguments
- `C`: Fusion category
- `a, b`: Simple objects to fuse
- `c`: Target simple object

# Returns
Integer multiplicity N_{a,b}^c

# Example
```julia
Fib = get_fibonacci_category()
S = simples(Fib)
τ = S[2]
fusion_multiplicity(Fib, τ, τ, τ)  # Returns 1
```
"""
function fusion_multiplicity(C, a, b, c)
    H = Hom(a ⊗ b, c)
    d = dim(H)
    # Convert to integer (dimension should always be a non-negative integer)
    if d isa Integer
        return Int(d)
    else
        # For algebraic numbers that should be integers
        return Int(round(Float64(real(complex_embeddings(parent(d))[1](d)))))
    end
end

"""
    fusion_rules_matrix(C)

Compute the full fusion rules tensor N_{ab}^c for a fusion category.

# Arguments
- `C`: Fusion category

# Returns
3D array `N` where `N[i,j,k]` is the multiplicity N_{S[i], S[j]}^{S[k]}

# Example
```julia
Fib = get_fibonacci_category()
N = fusion_rules_matrix(Fib)
# N[2,2,1] = 1 (τ ⊗ τ → 𝟙)
# N[2,2,2] = 1 (τ ⊗ τ → τ)
```
"""
function fusion_rules_matrix(C)
    S = simples(C)
    n = length(S)
    N = zeros(Int, n, n, n)
    for i in 1:n, j in 1:n, k in 1:n
        N[i, j, k] = fusion_multiplicity(C, S[i], S[j], S[k])
    end
    return N
end

"""
    quantum_dimensions(C)

Compute quantum dimensions of all simple objects.

# Arguments
- `C`: Fusion category

# Returns
Vector of quantum dimensions [d_{S[1]}, d_{S[2]}, ...]

# Example
```julia
Fib = get_fibonacci_category()
d = quantum_dimensions(Fib)
# d ≈ [1.0, 1.618...]  (golden ratio)
```
"""
function quantum_dimensions(C)
    S = simples(C)
    return [dim(s) for s in S]
end

"""
    total_dimension(C)

Compute the total (categorical) dimension: dim(C) = Σ_i d_i²

# Arguments
- `C`: Fusion category

# Returns
Total dimension as a number
"""
function total_dimension(C)
    d = quantum_dimensions(C)
    return sum(d .^ 2)
end

# ============================================================
# F-Symbols (Associator Data)
# ============================================================

"""
    get_associator(C, a, b, c)

Get the associator morphism α_{a,b,c}: (a ⊗ b) ⊗ c → a ⊗ (b ⊗ c)

# Arguments
- `C`: Fusion category
- `a, b, c`: Objects

# Returns
Associator morphism

# Example
```julia
Fib = get_fibonacci_category()
S = simples(Fib)
τ = S[2]
α = get_associator(Fib, τ, τ, τ)
```
"""
function get_associator(C, a, b, c)
    return associator(a, b, c)
end

# ============================================================
# Morphism Space Operations
# ============================================================

"""
    morphism_space_basis(a, b)

Get a basis for the morphism space Hom(a, b).

# Arguments
- `a`: Source object
- `b`: Target object

# Returns
Vector of basis morphisms

# Example
```julia
Fib = get_fibonacci_category()
S = simples(Fib)
τ = S[2]
B = morphism_space_basis(τ ⊗ τ, τ)
length(B)  # Returns 1 (multiplicity-free)
```
"""
function morphism_space_basis(a, b)
    H = Hom(a, b)
    return basis(H)
end

"""
    decompose_tensor_product(a, b)

Decompose a tensor product into simple summands with multiplicities.

# Arguments
- `a, b`: Objects to tensor

# Returns
Vector of (simple_object, multiplicity) pairs

# Example
```julia
Fib = get_fibonacci_category()
S = simples(Fib)
τ = S[2]
decompose_tensor_product(τ, τ)
# Returns something like [(<𝟙>, 1), (<τ>, 1)]
```
"""
function decompose_tensor_product(a, b)
    return decompose(a ⊗ b)
end

# ============================================================
# Category Information Display
# ============================================================

"""
    print_category_info(C, name="Category")

Print summary information about a fusion category.

# Arguments
- `C`: Fusion category
- `name`: Display name for the category
"""
function print_category_info(C, name="Category")
    S = simples(C)
    d = quantum_dimensions(C)
    D = total_dimension(C)

    println("=" ^ 50)
    println("$name")
    println("=" ^ 50)
    println("Rank (number of simple objects): $(length(S))")
    println("Simple objects: $S")
    println("Quantum dimensions: $d")
    println("Total dimension: $D")
    println()

    # Print fusion rules
    println("Fusion rules:")
    N = fusion_rules_matrix(C)
    for i in 1:length(S), j in 1:length(S)
        summands = []
        for k in 1:length(S)
            if N[i, j, k] > 0
                mult = N[i, j, k] == 1 ? "" : "$(N[i,j,k])·"
                push!(summands, "$mult$(S[k])")
            end
        end
        if !isempty(summands)
            println("  $(S[i]) ⊗ $(S[j]) = $(join(summands, " ⊕ "))")
        end
    end
    println("=" ^ 50)
end

# ============================================================
# Verification Functions
# ============================================================

"""
    verify_pentagon(C, a, b, c, d)

Verify the pentagon equation for given objects.
Returns true if the pentagon equation holds (up to numerical tolerance).

# Arguments
- `C`: Fusion category
- `a, b, c, d`: Four objects to test
"""
function verify_pentagon(C, a, b, c, d)
    # The pentagon equation states that two different ways of
    # re-associating ((a⊗b)⊗c)⊗d to a⊗(b⊗(c⊗d)) must agree.
    # TensorCategories.jl constructs categories that satisfy this by construction.
    # This function verifies it explicitly.

    α1 = associator(a ⊗ b, c, d)
    α2 = associator(a, b, c ⊗ d)
    α3 = associator(a, b, c) ⊗ id(d)
    α4 = associator(a, b ⊗ c, d)
    α5 = id(a) ⊗ associator(b, c, d)

    # Pentagon: α_{a⊗b,c,d} ∘ α_{a,b,c⊗d} = (α_{a,b,c} ⊗ id_d) ∘ α_{a,b⊗c,d} ∘ (id_a ⊗ α_{b,c,d})
    lhs = α1 ∘ α2
    rhs = α3 ∘ α4 ∘ α5

    # Compare morphisms (implementation-dependent)
    return lhs == rhs
end
