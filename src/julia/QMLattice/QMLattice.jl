# src/julia/QMLattice/QMLattice.jl
# Module for quantum mechanics on lattice systems
# Planning ref: §3.3

module QMLattice

using LinearAlgebra

export HilbertSpace, is_hermitian, normalise, inner_product, expectation
export embed_local_term, nn_hamiltonian, single_site_term
export spectrum, ground_state, spectral_gap, partition_function, thermal_state, free_energy
export tensor_product, ⊗, multisite_space, tensor_power, partial_trace

include("basics.jl")
include("hamiltonian.jl")
include("spectrum.jl")
# tensor.jl has include("basics.jl") which would cause redefinition
# Instead, we define tensor operations here:

"""
    tensor_product(H1::HilbertSpace, H2::HilbertSpace) -> HilbertSpace

Tensor product of Hilbert spaces.
"""
tensor_product(H1::HilbertSpace, H2::HilbertSpace) = HilbertSpace(H1.dim * H2.dim)
⊗(H1::HilbertSpace, H2::HilbertSpace) = tensor_product(H1, H2)

"""
    multisite_space(d::Int, n::Int) -> HilbertSpace

Multi-site Hilbert space: n copies of local space of dimension d.
"""
multisite_space(d::Int, n::Int) = HilbertSpace(d^n)

"""
    tensor_product(ψ1::Vector, ψ2::Vector) -> Vector
    tensor_product(A::Matrix, B::Matrix) -> Matrix

Tensor product of vectors or matrices.
"""
tensor_product(ψ1::Vector, ψ2::Vector) = kron(ψ1, ψ2)
tensor_product(A::Matrix, B::Matrix) = kron(A, B)
⊗(ψ1::Vector, ψ2::Vector) = tensor_product(ψ1, ψ2)
⊗(A::Matrix, B::Matrix) = tensor_product(A, B)

"""
    tensor_power(x, n::Int)

n-fold tensor product.
"""
function tensor_power(x, n::Int)
    @assert n ≥ 1
    result = x
    for _ in 2:n
        result = kron(result, x)
    end
    return result
end

end # module
