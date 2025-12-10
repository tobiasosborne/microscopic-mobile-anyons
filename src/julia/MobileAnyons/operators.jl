# src/julia/MobileAnyons/operators.jl
# Planning ref: §4.3
# See: docs/operators.md

"""
    MorphismTerm

Component of an operator in Mor(A, B).
"""
struct MorphismTerm
    source::Vector{Int}         # object A as simple labels (1=vacuum)
    target::Vector{Int}         # object B as simple labels
    coefficient::ComplexF64
end

n_particles_in(t::MorphismTerm) = count(>(1), t.source)
n_particles_out(t::MorphismTerm) = count(>(1), t.target)
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
    HoppingTerm

Anyon hopping: Mor(X⊗1, 1⊗X) or Mor(1⊗X, X⊗1).
"""
function hopping_right(label::Int)
    MorphismTerm([label, 1], [1, label], 1.0)
end

function hopping_left(label::Int)
    MorphismTerm([1, label], [label, 1], 1.0)
end

"""
    InteractionTerm

Two-anyon interaction: Mor(X⊗Y, X⊗Y).
"""
function interaction_term(a::Int, b::Int, coeff::ComplexF64)
    MorphismTerm([a, b], [a, b], coeff)
end

"""
Build matrix representation of operator on Hilbert space.
"""
function operator_matrix(op::LocalOperator, H::MobileAnyonHilbert)
    d = dim(H)
    M = zeros(ComplexF64, d, d)
    
    for (i, bra) in enumerate(H.basis)
        for (j, ket) in enumerate(H.basis)
            M[i, j] = matrix_element(op, bra, ket, H)
        end
    end
    return M
end

# Placeholder - actual implementation requires F-symbol data
function matrix_element(op::LocalOperator, bra::AnyonBasisState, ket::AnyonBasisState, H::MobileAnyonHilbert)
    # TODO: implement using fusion category F-symbols
    return 0.0 + 0.0im
end
