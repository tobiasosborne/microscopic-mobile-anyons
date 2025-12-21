# src/julia/MobileAnyons/operators.jl
# Planning ref: §4.3
# See: docs/operators.md
# Refactored to use TensorCategories.jl Hom spaces (TC-REFACTOR-007)

# Include hilbert.jl to define MobileAnyonHilbert if not already defined (e.g., when run standalone)
if !isdefined(@__MODULE__, :MobileAnyonHilbert)
    include("hilbert.jl")
end

# Include FusionCategories to access Hom space operations
include("../FusionCategories/fusion_ring.jl")
using .FusionCategories: n_simples, fusion_multiplicity

"""
    MorphismTerm

Component of an operator in Mor(A, B) represented as a morphism from TensorCategories.jl.

# Fields
- `source_labels::Vector{Int}`: Simple object labels for source object A (1=vacuum)
- `target_labels::Vector{Int}`: Simple object labels for target object B (1=vacuum)
- `morphism_idx::Int`: Index into basis(Hom(A, B))
- `coeff::ComplexF64`: Overall coefficient

The actual morphism element can be retrieved as:
    morphism = basis(Hom(A, B))[morphism_idx]
"""
struct MorphismTerm
    source_labels::Vector{Int}         # object A as simple labels
    target_labels::Vector{Int}         # object B as simple labels
    morphism_idx::Int                   # index into Hom(A,B) basis
    coeff::ComplexF64
end

n_particles_in(t::MorphismTerm) = count(>(1), t.source_labels)
n_particles_out(t::MorphismTerm) = count(>(1), t.target_labels)
is_particle_conserving(t::MorphismTerm) = n_particles_in(t) == n_particles_out(t)

"""
    LocalOperator

k-local operator acting on consecutive sites.
"""
struct LocalOperator
    site::Int                       # leftmost site (0-indexed)
    width::Int                      # number of sites
    terms::Vector{MorphismTerm}
end

is_particle_conserving(op::LocalOperator) = all(is_particle_conserving, op.terms)

"""
    hopping_right(cat, label::Int, coeff::ComplexF64 = 1.0) -> MorphismTerm

Anyon hopping right: Mor(X⊗1, 1⊗X).

Uses TensorCategories.jl Hom spaces to select morphisms. Selects first basis element
of Hom space if multiplicity > 1.
"""
function hopping_right(cat::AbstractFusionCategory, label::Int, coeff::ComplexF64 = 1.0 + 0.0im)
    # Check that Hom(label⊗1, 1⊗label) has dimension > 0
    mult = fusion_multiplicity(cat, label, 1, label)
    if mult == 0
        error("No morphism in Hom(label⊗1, 1⊗label) for label=$label")
    end
    # Select first basis morphism (index 1)
    MorphismTerm([label, 1], [1, label], 1, coeff)
end

"""
    hopping_left(cat, label::Int, coeff::ComplexF64 = 1.0) -> MorphismTerm

Anyon hopping left: Mor(1⊗X, X⊗1).

Uses TensorCategories.jl Hom spaces to select morphisms. Selects first basis element
of Hom space if multiplicity > 1.
"""
function hopping_left(cat::AbstractFusionCategory, label::Int, coeff::ComplexF64 = 1.0 + 0.0im)
    # Check that Hom(1⊗label, label⊗1) has dimension > 0
    mult = fusion_multiplicity(cat, 1, label, label)
    if mult == 0
        error("No morphism in Hom(1⊗label, label⊗1) for label=$label")
    end
    # Select first basis morphism (index 1)
    MorphismTerm([1, label], [label, 1], 1, coeff)
end

"""
    interaction_term(cat, a::Int, b::Int, coeff::ComplexF64 = 1.0; morphism_idx::Int = 1) -> MorphismTerm

Two-anyon interaction: Mor(X⊗Y, X⊗Y).

Uses TensorCategories.jl Hom spaces. For multiplicity > 1, allows selecting specific
basis morphism via morphism_idx.
"""
function interaction_term(cat::AbstractFusionCategory, a::Int, b::Int, coeff::ComplexF64 = 1.0 + 0.0im; morphism_idx::Int = 1)
    # Check that Hom(a⊗b, a⊗b) has dimension > 0
    mult = fusion_multiplicity(cat, a, b, a)
    if mult == 0
        error("No morphism in Hom(a⊗b, a⊗b) for a=$a, b=$b (no fusion channel a⊗b→a)")
    end
    if morphism_idx < 1 || morphism_idx > mult
        error("morphism_idx=$morphism_idx out of range [1, $mult] for Hom(a⊗b, a⊗b)")
    end
    MorphismTerm([a, b], [a, b], morphism_idx, coeff)
end

"""
    operator_matrix(op::LocalOperator, hilb::MobileAnyonHilbert) -> Matrix{ComplexF64}

Build matrix representation of operator on Hilbert space.

Uses morphism basis indices from TensorCategories.jl Hom spaces to compute
matrix elements via categorical operations (F-symbols, R-symbols).
"""
function operator_matrix(op::LocalOperator, hilb::MobileAnyonHilbert)
    d = dim(hilb)
    M = zeros(ComplexF64, d, d)
    
    for (i, bra) in enumerate(hilb.basis)
        for (j, ket) in enumerate(hilb.basis)
            M[i, j] = matrix_element(op, bra, ket, hilb)
        end
    end
    return M
end

"""
    matrix_element(op::LocalOperator, bra::AnyonBasisState, ket::AnyonBasisState, 
                   hilb::MobileAnyonHilbert) -> ComplexF64

Compute single matrix element ⟨bra|op|ket⟩.

The operator terms reference morphism bases via morphism_idx from TensorCategories.jl.
Actual computation requires:
  1. Retrieve morphism from Hom(source, target) basis
  2. Evaluate morphism on lattice configuration
  3. Apply F-symbols/R-symbols as needed to match basis states
  4. Sum contributions from all operator terms with their coefficients

TODO: Implement full computation using F-symbol algebra and categorical morphism evaluation.
      See also: docs/operators.md, literature/tensor_category_computations.md
"""
function matrix_element(op::LocalOperator, bra::AnyonBasisState, ket::AnyonBasisState, hilb::MobileAnyonHilbert)
    # Placeholder implementation
    # TODO: Use morphism_idx to access actual basis morphisms from TensorCategories
    return 0.0 + 0.0im
end
