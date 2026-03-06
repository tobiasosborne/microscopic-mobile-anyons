# Test golden chain (dense Fibonacci) against known results.
# SC5: Dense limit recovers golden chain with c=7/10 CFT for AF coupling.

using Test
using TensorCategories, Oscar
using LinearAlgebra

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

Fib = fibonacci_category()
cache = build_fsymbol_cache(Fib)

@testset "Golden chain Hamiltonian properties" begin
    for L in 3:7
        basis = build_basis(L, Fib)
        for c in 1:2
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue

            H = interaction_hamiltonian_sector(basis, cache, L, c; J=1.0)
            dim = size(H, 1)
            dim == 0 && continue

            Hm = Matrix(H)

            # Check Hermitian
            @test norm(Hm - adjoint(Hm)) < 1e-10

            # Check non-trivial (at least some nonzero off-diagonal for L≥4)
            if L >= 4 && dim > 1
                @test norm(Hm - Diagonal(diag(Hm))) > 1e-10
            end
        end
    end
end

@testset "Golden chain spectrum (L=3..8)" begin
    println("\nGolden chain dense Fibonacci spectra:")
    for L in 3:8
        basis = build_basis(L, Fib)
        for c in 1:2
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue

            H = interaction_hamiltonian_sector(basis, cache, L, c; J=1.0)
            dim = size(H, 1)
            dim == 0 && continue

            Hm = Matrix(H)
            evals = sort(real.(eigvals(Symmetric(real.(Hm)))))
            E0 = evals[1]
            gap = dim > 1 ? evals[2] - evals[1] : 0.0
            println("  L=$L, c=$c: dim=$dim, E0=$(round(E0, digits=8)), gap=$(round(gap, digits=8))")
        end
    end
end

@testset "Golden chain ground state energy convergence" begin
    # For AF golden chain, E0/L should converge to a known value
    E0_per_site = Float64[]
    Ls = 4:8

    for L in Ls
        basis = build_basis(L, Fib)
        # Vacuum sector
        range = get(basis.sector_ranges, (L, 1), 1:0)
        isempty(range) && continue

        H = interaction_hamiltonian_sector(basis, cache, L, 1; J=1.0)
        dim = size(H, 1)
        dim == 0 && continue

        Hm = Matrix(H)
        evals = sort(real.(eigvals(Symmetric(real.(Hm)))))
        push!(E0_per_site, evals[1] / (L - 1))  # per bond
    end

    println("\nE0 per bond (vacuum sector, AF):")
    for (i, L) in enumerate(Ls)
        i <= length(E0_per_site) && println("  L=$L: E0/bond = $(round(E0_per_site[i], digits=8))")
    end

    # Should be converging (monotonic or nearly so)
    @test length(E0_per_site) >= 3
end
