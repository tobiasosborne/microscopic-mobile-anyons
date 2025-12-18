# tests/test_hamiltonian_v0.jl
# Tests for particle-conserving local Hamiltonians
# Planning ref: §5.1.1

using Pkg
Pkg.activate(joinpath(@__DIR__, ".."))

include(joinpath(@__DIR__, "..", "src", "julia", "MobileAnyons", "MobileAnyons.jl"))
using .MobileAnyons
using Test

println("Testing particle-conserving Hamiltonians (§5.1.1)...")
println("="^50)

@testset "NumberConservingTerm" begin
    @testset "Construction" begin
        term = NumberConservingTerm(0)
        @test term.site == 0
        @test isempty(term.components)
    end

    @testset "Number conservation check" begin
        # Valid: hopping preserves particle count
        hop_components = Dict(
            ((1, 0), (0, 1)) => 1.0 + 0im,
            ((0, 1), (1, 0)) => 1.0 + 0im
        )
        hop_term = NumberConservingTerm(0, hop_components)
        @test is_number_conserving(hop_term)

        # Invalid: creation term
        create_components = Dict(
            ((0, 0), (1, 0)) => 1.0 + 0im  # 0 -> 1 particle
        )
        create_term = NumberConservingTerm(0, create_components)
        @test !is_number_conserving(create_term)

        # Valid: two-anyon identity
        two_anyon = Dict(
            ((1, 2), (1, 2)) => 1.0 + 0im
        )
        two_term = NumberConservingTerm(0, two_anyon)
        @test is_number_conserving(two_term)
    end

    @testset "Hermiticity check" begin
        # Hermitian: symmetric hopping
        herm_components = Dict(
            ((1, 0), (0, 1)) => 1.0 + 0im,
            ((0, 1), (1, 0)) => 1.0 + 0im
        )
        herm_term = NumberConservingTerm(0, herm_components)
        @test is_hermitian(herm_term)

        # Non-Hermitian: asymmetric
        nonherm_components = Dict(
            ((1, 0), (0, 1)) => 1.0 + 0im
        )
        nonherm_term = NumberConservingTerm(0, nonherm_components)
        @test !is_hermitian(nonherm_term)

        # Complex amplitude requires conjugate
        complex_components = Dict(
            ((1, 0), (0, 1)) => 1.0 + 1.0im,
            ((0, 1), (1, 0)) => 1.0 - 1.0im  # conj
        )
        complex_term = NumberConservingTerm(0, complex_components)
        @test is_hermitian(complex_term)
    end

    @testset "make_hermitian!" begin
        components = Dict(
            ((1, 0), (0, 1)) => 1.0 + 1.0im
        )
        term = NumberConservingTerm(0, components)
        @test !is_hermitian(term)

        make_hermitian!(term)
        @test is_hermitian(term)
        @test haskey(term.components, ((0, 1), (1, 0)))
        @test term.components[((0, 1), (1, 0))] == 1.0 - 1.0im
    end
end

@testset "Factory functions" begin
    @testset "hopping_term" begin
        term = hopping_term(0, 1, 0.5)
        @test term.site == 0
        @test is_number_conserving(term)
        @test is_hermitian(term)
        @test term.components[((1, 0), (0, 1))] == 0.5 + 0im
        @test term.components[((0, 1), (1, 0))] == 0.5 + 0im

        # Complex amplitude
        term2 = hopping_term(1, 2, 1.0im)
        @test is_hermitian(term2)
        @test term2.components[((2, 0), (0, 2))] == 1.0im
        @test term2.components[((0, 2), (2, 0))] == -1.0im
    end

    @testset "identity_term" begin
        term = identity_term(0, (1, 1), 2.5)
        @test is_number_conserving(term)
        @test is_hermitian(term)
        @test term.components[((1, 1), (1, 1))] == 2.5 + 0im
    end

    @testset "two_anyon_interaction" begin
        term = two_anyon_interaction(0, 1, 2, 3.0)
        @test is_number_conserving(term)
        @test is_hermitian(term)
        @test term.components[((1, 2), (1, 2))] == 3.0 + 0im
    end
end

@testset "LocalHamiltonian" begin
    @testset "uniform_nn_hamiltonian" begin
        n_sites = 4
        components = Dict(
            ((1, 0), (0, 1)) => 1.0 + 0im,
            ((0, 1), (1, 0)) => 1.0 + 0im
        )
        H = uniform_nn_hamiltonian(n_sites, components)

        @test H.n_sites == 4
        @test length(H.terms) == 3  # n_sites - 1 bonds
        @test n_bonds(H) == 3
        @test is_number_conserving(H)
        @test is_hermitian(H)

        # Check each term has correct site index
        for (j, term) in enumerate(H.terms)
            @test term.site == j - 1  # 0-indexed
        end
    end
end

println()
println("="^50)
println("All hamiltonian_v0 tests passed!")
