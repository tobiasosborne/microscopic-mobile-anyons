# src/julia/QMLattice/tensor.jl
# Planning ref: §3.3.4
# See: docs/qm_lattice.md

using LinearAlgebra

# Import HilbertSpace from basics.jl
include("basics.jl")

"""
    tensor_product(H1::HilbertSpace, H2::HilbertSpace) -> HilbertSpace

Tensor product of Hilbert spaces.

See: docs/qm_lattice.md, Definition 3.3.11
"""
tensor_product(H1::HilbertSpace, H2::HilbertSpace) = HilbertSpace(H1.dim * H2.dim)

"""
    ⊗(H1::HilbertSpace, H2::HilbertSpace) -> HilbertSpace

Unicode operator for tensor product.
"""
⊗(H1::HilbertSpace, H2::HilbertSpace) = tensor_product(H1, H2)

"""
    multisite_space(d::Int, n::Int) -> HilbertSpace

Multi-site Hilbert space: n copies of local space of dimension d.

See: docs/qm_lattice.md, Definition 3.3.12
"""
multisite_space(d::Int, n::Int) = HilbertSpace(d^n)

"""
    tensor_product(ψ1::Vector, ψ2::Vector) -> Vector

Tensor product of state vectors: |ψ₁⟩ ⊗ |ψ₂⟩
"""
tensor_product(ψ1::Vector, ψ2::Vector) = kron(ψ1, ψ2)

"""
    ⊗(ψ1::Vector, ψ2::Vector) -> Vector

Unicode operator for tensor product of vectors.
"""
⊗(ψ1::Vector, ψ2::Vector) = tensor_product(ψ1, ψ2)

"""
    tensor_product(A::Matrix, B::Matrix) -> Matrix

Tensor product of operators: A ⊗ B
"""
tensor_product(A::Matrix, B::Matrix) = kron(A, B)

"""
    ⊗(A::Matrix, B::Matrix) -> Matrix

Unicode operator for tensor product of matrices.
"""
⊗(A::Matrix, B::Matrix) = tensor_product(A, B)

"""
    tensor_power(ψ::Vector, n::Int) -> Vector

n-fold tensor product: |ψ⟩^⊗n
"""
function tensor_power(ψ::Vector, n::Int)
    @assert n ≥ 1 "Power must be ≥ 1"
    result = ψ
    for _ in 2:n
        result = kron(result, ψ)
    end
    return result
end

"""
    tensor_power(A::Matrix, n::Int) -> Matrix

n-fold tensor product: A^⊗n
"""
function tensor_power(A::Matrix, n::Int)
    @assert n ≥ 1 "Power must be ≥ 1"
    result = A
    for _ in 2:n
        result = kron(result, A)
    end
    return result
end

"""
    partial_trace(ρ::Matrix, dims::Vector{Int}, trace_over::Int) -> Matrix

Partial trace over subsystem `trace_over` of density matrix ρ.
dims specifies the dimensions of each subsystem.
"""
function partial_trace(ρ::Matrix, dims::Vector{Int}, trace_over::Int)
    @assert 1 ≤ trace_over ≤ length(dims)
    @assert size(ρ, 1) == prod(dims)
    
    n = length(dims)
    d_trace = dims[trace_over]
    d_keep = prod(dims) ÷ d_trace
    
    # Reshape, trace, reshape back
    # This is a simplified implementation; production code would be more careful
    result = zeros(eltype(ρ), d_keep, d_keep)
    
    # For 2-subsystem case (most common)
    if n == 2
        d1, d2 = dims
        if trace_over == 1
            # Trace over first subsystem
            for i in 1:d1
                for j in 1:d2
                    for k in 1:d2
                        result[j, k] += ρ[(i-1)*d2 + j, (i-1)*d2 + k]
                    end
                end
            end
        else
            # Trace over second subsystem
            for i in 1:d1
                for k in 1:d1
                    for j in 1:d2
                        result[i, k] += ρ[(i-1)*d2 + j, (k-1)*d2 + j]
                    end
                end
            end
        end
    else
        error("General partial trace not yet implemented for n > 2 subsystems")
    end
    
    return result
end
