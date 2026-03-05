# Test Hilbert space construction for small systems.

using Test
using TensorCategories, Oscar

# Include module directly for now
include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

@testset "sVec: fermion Hilbert space dimensions" begin
    G = Oscar.cyclic_group(2)
    sVec = TensorCategories.graded_vector_spaces(G)

    # L sites, hard-core fermions → dimension should be 2^L
    for L in 1:5
        basis = build_basis(L, sVec)
        @test length(basis.states) == 2^L
    end
end

@testset "Fibonacci: small system basis" begin
    Fib = fibonacci_category()

    # L=1: vacuum (1 state) + one τ (1 state) = 2 states
    basis1 = build_basis(1, Fib)
    @test length(basis1.states) == 2

    # L=2: N=0 (1), N=1 (2 positions × 1 type), N=2 (1 config, fusion trees)
    # τ⊗τ → {1, τ} so 2 fusion trees for N=2
    basis2 = build_basis(2, Fib)
    @test length(basis2.states) == 1 + 2 + 2  # = 5
end

@testset "Config enumeration" begin
    Fib = fibonacci_category()

    # L=3, N=2: C(3,2) = 3 position configs × 1 anyon type = 3
    configs = enumerate_configs_hc(3, 2, Fib)
    @test length(configs) == 3

    # N=0: exactly 1 (empty config)
    configs0 = enumerate_configs_hc(3, 0, Fib)
    @test length(configs0) == 1
end
