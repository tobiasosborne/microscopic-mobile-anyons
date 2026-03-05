# test_fusion_categories.jl
# Tests for fusion category implementations
# Run with: julia test_fusion_categories.jl

using Test

# Add project to load path
push!(LOAD_PATH, joinpath(@__DIR__, "..", "src", "julia"))

include(joinpath(@__DIR__, "..", "src", "julia", "fusion_categories.jl"))

# Helper to convert Oscar algebraic numbers to Float64
# AbsSimpleNumFieldElem requires special conversion via the stored embedding
function to_float(x::AbsSimpleNumFieldElem)
    # Get the parent number field and find a real embedding
    K = parent(x)
    embs = complex_embeddings(K)
    # Try all embeddings and find one that gives a real, positive value if expected
    for emb in embs
        val = emb(x)
        if abs(imag(val)) < 1e-10
            return Float64(real(val))
        end
    end
    # Fallback to first embedding
    return Float64(real(embs[1](x)))
end
to_float(x::Float64) = x
to_float(x::Int) = Float64(x)
to_float(x::Rational) = Float64(x)
to_float(x::Integer) = Float64(x)
to_float(x::QQFieldElem) = Float64(x)

@testset "Fibonacci Category" begin
    Fib = get_fibonacci_category()
    S = simples(Fib)

    @testset "Basic structure" begin
        @test length(S) == 2  # 𝟙 and τ
    end

    @testset "Quantum dimensions" begin
        d = quantum_dimensions(Fib)
        @test to_float(d[1]) ≈ 1.0  # d_𝟙 = 1
        φ = (1 + sqrt(5)) / 2
        @test isapprox(to_float(d[2]), φ, rtol=1e-10)  # d_τ = φ
    end

    @testset "Fusion rules" begin
        N = fusion_rules_matrix(Fib)
        # τ ⊗ τ = 𝟙 ⊕ τ
        @test N[2, 2, 1] == 1  # N_{ττ}^𝟙 = 1
        @test N[2, 2, 2] == 1  # N_{ττ}^τ = 1
        # 𝟙 ⊗ anything = anything
        @test N[1, 1, 1] == 1
        @test N[1, 2, 2] == 1
        @test N[2, 1, 2] == 1
    end

    @testset "Total dimension" begin
        D = total_dimension(Fib)
        φ = (1 + sqrt(5)) / 2
        expected = 1 + φ^2  # d_𝟙² + d_τ²
        @test isapprox(to_float(D), expected, rtol=1e-10)
    end
end

@testset "Ising Category" begin
    Ising = get_ising_category()
    S = simples(Ising)
    d = quantum_dimensions(Ising)
    N = fusion_rules_matrix(Ising)

    @testset "Basic structure" begin
        @test length(S) == 3  # 𝟙, σ, ψ
    end

    @testset "Quantum dimensions" begin
        d_floats = [abs(to_float(x)) for x in d]  # abs since embedding may give negative
        # Should have two objects with d=1 and one with d=√2
        @test count(x -> abs(x - 1.0) < 0.01, d_floats) == 2
        @test count(x -> abs(x - sqrt(2)) < 0.01, d_floats) == 1
    end

    @testset "Total dimension" begin
        D = total_dimension(Ising)
        expected = 1 + 2 + 1  # d_𝟙² + d_σ² + d_ψ² = 1 + 2 + 1 = 4
        @test isapprox(to_float(D), expected, rtol=1e-10)
    end

    @testset "Fusion rules structure" begin
        # Find σ by its quantum dimension (√2)
        d_floats = [abs(to_float(x)) for x in d]
        idx_sigma = findfirst(x -> abs(x - sqrt(2)) < 0.01, d_floats)

        # σ ⊗ σ should decompose into two objects (𝟙 ⊕ ψ)
        sigma_sigma = sum(N[idx_sigma, idx_sigma, :])
        @test sigma_sigma == 2  # Two fusion channels
    end
end

@testset "Morphism spaces" begin
    Fib = get_fibonacci_category()
    S = simples(Fib)
    τ = S[2]

    @testset "Fusion multiplicity" begin
        @test fusion_multiplicity(Fib, τ, τ, S[1]) == 1
        @test fusion_multiplicity(Fib, τ, τ, τ) == 1
    end

    @testset "Tensor product decomposition" begin
        dec = decompose_tensor_product(τ, τ)
        @test length(dec) == 2  # decomposes into 𝟙 ⊕ τ
    end
end

println("\n✓ All fusion category tests passed!")
