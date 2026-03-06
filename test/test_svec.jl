# Validate sVec hopping Hamiltonian against free fermion spectrum (SC1, SC2).

using Test
using TensorCategories, Oscar
using LinearAlgebra

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

@testset "sVec Hilbert space dimension (SC2)" begin
    G = Oscar.cyclic_group(2)
    sVec = TensorCategories.graded_vector_spaces(G)

    for L in 1:6
        basis = build_basis(L, sVec)
        @test length(basis.states) == 2^L
    end
end

@testset "sVec hopping Hamiltonian properties" begin
    G = Oscar.cyclic_group(2)
    sVec = TensorCategories.graded_vector_spaces(G)

    for L in 2:5
        basis = build_basis(L, sVec)
        H = hopping_hamiltonian(basis)

        # Hermitian (real symmetric)
        @test H ≈ H' atol=1e-14

        # Block diagonal in (N, c) sectors
        for ((N, c), rng) in basis.sector_ranges
            H_sector = hopping_hamiltonian_sector(basis, N, c)
            @test issymmetric(Matrix(H_sector))
        end
    end
end

@testset "sVec free fermion spectrum (SC1)" begin
    G = Oscar.cyclic_group(2)
    sVec = TensorCategories.graded_vector_spaces(G)

    for L in 2:7
        basis = build_basis(L, sVec)

        for ((N, c), rng) in basis.sector_ranges
            N == 0 && continue  # trivial sector

            H_sector = hopping_hamiltonian_sector(basis, N, c)
            size(H_sector, 1) == 0 && continue

            computed = sort(eigvals(Matrix(H_sector)))
            expected = free_fermion_energies(L, N)

            @test length(computed) == length(expected)
            @test computed ≈ expected atol=1e-10
        end
    end
end

@testset "Single particle tight-binding" begin
    G = Oscar.cyclic_group(2)
    sVec = TensorCategories.graded_vector_spaces(G)

    for L in 2:8
        basis = build_basis(L, sVec)

        # N=1 sector: charge = 2 (ψ)
        H1 = hopping_hamiltonian_sector(basis, 1, 2)
        @test size(H1) == (L, L)

        evals = sort(eigvals(Matrix(H1)))
        expected = sort([-2 * cos(π * k / (L + 1)) for k in 1:L])

        @test evals ≈ expected atol=1e-10
    end
end
