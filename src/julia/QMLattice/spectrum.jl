# src/julia/QMLattice/spectrum.jl
# Planning ref: §3.3.3
# See: docs/qm_lattice.md

using LinearAlgebra

"""
    spectrum(H::Hermitian) -> Vector{Float64}

Compute spectrum (sorted eigenvalues) of Hermitian operator H.

See: docs/qm_lattice.md, Definition 3.3.7
"""
spectrum(H::Hermitian) = sort(real.(eigvals(H)))

"""
    spectrum(H::Matrix) -> Vector{Float64}

Compute spectrum of a matrix, treating it as Hermitian.
"""
function spectrum(H::Matrix)
    @assert is_hermitian(H) "Matrix must be Hermitian"
    return spectrum(Hermitian(H))
end

# Import is_hermitian from basics.jl or define locally
is_hermitian(A::Matrix{<:Number}; atol=1e-10) = isapprox(A, A'; atol=atol)

"""
    ground_state(H::Hermitian) -> Tuple{Float64, Vector}

Compute ground state energy and eigenvector.

Returns: (E₀, |ψ₀⟩)

See: docs/qm_lattice.md, Definition 3.3.8
"""
function ground_state(H::Hermitian)
    E, V = eigen(H)
    idx = argmin(real.(E))
    return real(E[idx]), V[:, idx]
end

function ground_state(H::Matrix)
    @assert is_hermitian(H) "Matrix must be Hermitian"
    return ground_state(Hermitian(H))
end

"""
    spectral_gap(H::Hermitian) -> Float64

Compute spectral gap Δ = E₁ - E₀.

See: docs/qm_lattice.md, Definition 3.3.9
"""
function spectral_gap(H::Hermitian)
    E = spectrum(H)
    @assert length(E) ≥ 2 "Need at least 2 eigenvalues for gap"
    return E[2] - E[1]
end

function spectral_gap(H::Matrix)
    @assert is_hermitian(H) "Matrix must be Hermitian"
    return spectral_gap(Hermitian(H))
end

"""
    partition_function(H::Hermitian, β::Real) -> Float64

Compute partition function Z(β) = Tr(e^{-βH}).

See: docs/qm_lattice.md, Definition 3.3.10
"""
function partition_function(H::Hermitian, β::Real)
    E = spectrum(H)
    return sum(exp.(-β .* E))
end

function partition_function(H::Matrix, β::Real)
    @assert is_hermitian(H) "Matrix must be Hermitian"
    return partition_function(Hermitian(H), β)
end

"""
    thermal_state(H::Hermitian, β::Real) -> Matrix

Compute thermal density matrix ρ = e^{-βH} / Z(β).
"""
function thermal_state(H::Hermitian, β::Real)
    Z = partition_function(H, β)
    return exp(-β * Matrix(H)) / Z
end

"""
    free_energy(H::Hermitian, β::Real) -> Float64

Compute Helmholtz free energy F = -1/β log(Z).
"""
function free_energy(H::Hermitian, β::Real)
    Z = partition_function(H, β)
    return -log(Z) / β
end
