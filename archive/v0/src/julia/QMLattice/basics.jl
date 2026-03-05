# src/julia/QMLattice/basics.jl
# Planning ref: §3.3.1
# See: docs/qm_lattice.md

using LinearAlgebra

"""
    HilbertSpace

A finite-dimensional Hilbert space represented by its dimension.
States are vectors in ℂ^dim.

See: docs/qm_lattice.md, Definition 3.3.1
"""
struct HilbertSpace
    dim::Int
    
    function HilbertSpace(d::Int)
        @assert d ≥ 1 "Hilbert space dimension must be ≥ 1"
        new(d)
    end
end

"""
    is_hermitian(A::Matrix{<:Number}) -> Bool

Check if operator A is Hermitian (observable).

See: docs/qm_lattice.md, Definition 3.3.3
"""
is_hermitian(A::Matrix{<:Number}; atol=1e-10) = isapprox(A, A'; atol=atol)

"""
    normalise(ψ::Vector{<:Number}) -> Vector

Normalise a state vector to unit norm.

See: docs/qm_lattice.md, Definition 3.3.2
"""
function normalise(ψ::Vector{<:Number})
    n = norm(ψ)
    @assert n > 0 "Cannot normalise zero vector"
    return ψ / n
end

"""
    inner_product(ψ::Vector, ϕ::Vector) -> Number

Compute ⟨ψ|ϕ⟩ = ψ† ⋅ ϕ
"""
inner_product(ψ::Vector{<:Number}, ϕ::Vector{<:Number}) = dot(ψ, ϕ)

"""
    expectation(A::Matrix, ψ::Vector) -> Number

Compute expectation value ⟨ψ|A|ψ⟩ for normalised state ψ.
"""
function expectation(A::Matrix{<:Number}, ψ::Vector{<:Number})
    return real(dot(ψ, A * ψ))
end
