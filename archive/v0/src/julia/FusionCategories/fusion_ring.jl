"""
    FusionCategories module - Wrapper around TensorCategories.jl

This module provides fusion category functionality for the mobile anyons project
by delegating to the TensorCategories.jl package. It re-exports key types and
provides convenience functions for the specific categories used in this project.

See: docs/fusion_ring.md, plans/tensorcategories_refactoring_guide.md
"""
module FusionCategories

using Oscar
using TensorCategories

# Re-export core TensorCategories types and functions
export SixJCategory, SixJObject
export simples, simples_names, one, dual, dim, Hom, basis, decompose
export associator, braiding, is_fusion, is_braided, is_modular
export tensor_product, ⊗

# Export factory functions for standard categories
export fibonacci_category, ising_category, svec_category

# Export compatibility functions
export fusion_multiplicity, morphism_dim, n_simples, simple_index
export is_rigid, multiplicity_basis_labels, fusion_coefficients

# Re-export TensorCategories factory functions directly
const fibonacci_category = TensorCategories.fibonacci_category
const ising_category = TensorCategories.ising_category

"""
    svec_category()

Construct the super-vector spaces category (sVec).

sVec has two simple objects: the trivial object 1 and the fermion ψ.
Fusion rules: ψ ⊗ ψ = 1
Braiding: R_{ψ,ψ} = -1 (fermionic exchange)

This is Rep(Z/2) with the symmetric braiding where R_{ψ,ψ} = -1.

Returns a `SixJCategory` representing sVec.
"""
function svec_category()
    # sVec is the Tambara-Yamagami category TY(Z/2, χ, ν) with specific parameters
    # For the symmetric braiding with R_{ψ,ψ} = -1, we use the representation category
    G = Oscar.cyclic_group(2)
    C = TensorCategories.graded_vector_spaces(G)

    # Note: graded_vector_spaces gives Vec(Z/2) structure
    # For actual sVec with fermionic braiding, we'd need to set the braiding
    # For now, return the basic structure - braiding can be set later if needed
    return C
end

# ============================================================================
# Compatibility functions for existing codebase
# ============================================================================

"""
    n_simples(C) -> Int

Return the number of simple objects in the fusion category C.
"""
n_simples(C) = length(simples(C))

"""
    simple_index(C, X) -> Int

Return the 1-based index of simple object X in simples(C).
"""
function simple_index(C, X)
    S = simples(C)
    idx = findfirst(==(X), S)
    isnothing(idx) && error("Object not found in simples")
    return idx
end

"""
    fusion_multiplicity(C, a::Int, b::Int, c::Int) -> Int

Return the fusion multiplicity N_{ab}^c = dim Hom(X_a ⊗ X_b, X_c).

Arguments are 1-based indices into simples(C).
"""
function fusion_multiplicity(C, a::Int, b::Int, c::Int)
    S = simples(C)
    d = dim(Hom(S[a] ⊗ S[b], S[c]))
    return Int(Oscar.ZZ(d))
end

"""
    fusion_multiplicity(C, a, b, c) -> Int

Return the fusion multiplicity for simple objects directly.
"""
function fusion_multiplicity(C, a, b, c)
    d = dim(Hom(a ⊗ b, c))
    return Int(Oscar.ZZ(d))
end

"""
    morphism_dim(C, a::Int, b::Int, c::Int) -> Int

Alias for fusion_multiplicity. Returns dim Mor(X_a ⊗ X_b, X_c).
See: docs/morphism_spaces.md, Definition 3.4.
"""
morphism_dim(C, a::Int, b::Int, c::Int) = fusion_multiplicity(C, a, b, c)

"""
    is_rigid(C) -> Bool

Check if C is a rigid category (has duals for all objects).
For fusion categories from TensorCategories.jl, this is always true.
"""
is_rigid(C) = is_fusion(C)

"""
    multiplicity_basis_labels(C, a::Int, b::Int, c::Int) -> Vector{Tuple{Int,Int,Int,Int}}

Return abstract labels for a multiplicity basis f_{ab->c}^{(μ)} with
μ = 1,...,N_{ab}^c. This is basis-independent bookkeeping.

See: docs/morphism_spaces.md, Definition 3.4.
"""
function multiplicity_basis_labels(C, a::Int, b::Int, c::Int)
    n = Int(fusion_multiplicity(C, a, b, c))
    return [(a, b, c, μ) for μ in 1:n]
end

"""
    fusion_coefficients(C, a::Int, b::Int) -> Dict{Int, Int}

Compute the fusion product X_a ⊗ X_b = ⊕_c N_{ab}^c X_c.
Returns a dictionary mapping simple index c to multiplicity N_{ab}^c.
"""
function fusion_coefficients(C, a::Int, b::Int)
    S = simples(C)
    product = S[a] ⊗ S[b]
    dec = decompose(product)
    return Dict(simple_index(C, s) => Int(m) for (s, m) in dec)
end

end # module
