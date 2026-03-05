# Smoke test: verify TensorCategories.jl works for our target categories.

using Test
using TensorCategories, Oscar

@testset "Fibonacci category" begin
    Fib = fibonacci_category()
    S = simples(Fib)
    @test length(S) == 2

    # τ ⊗ τ = 1 ⊕ τ
    tau = S[2]
    dec = decompose(tau ⊗ tau)
    @test length(dec) == 2

    # Fusion multiplicities
    @test Int(dim(Hom(tau ⊗ tau, S[1]))) == 1  # N_{ττ}^1 = 1
    @test Int(dim(Hom(tau ⊗ tau, tau))) == 1    # N_{ττ}^τ = 1

    # Associator exists
    alpha = associator(tau, tau, tau)
    @test !isnothing(alpha)
end

@testset "Ising category" begin
    Ising = ising_category()
    S = simples(Ising)
    @test length(S) == 3

    sigma = S[2]
    psi = S[3]

    # σ ⊗ σ = 1 ⊕ ψ
    dec = decompose(sigma ⊗ sigma)
    @test length(dec) == 2

    # ψ ⊗ ψ = 1
    dec_psi = decompose(psi ⊗ psi)
    @test length(dec_psi) == 1
end

@testset "sVec (Z/2 graded)" begin
    G = Oscar.cyclic_group(2)
    sVec = TensorCategories.graded_vector_spaces(G)
    S = simples(sVec)
    @test length(S) == 2

    psi = S[2]
    dec = decompose(psi ⊗ psi)
    # ψ ⊗ ψ = 1
    @test length(dec) == 1
end
