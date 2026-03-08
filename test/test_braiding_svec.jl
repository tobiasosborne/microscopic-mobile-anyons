# Validate sVec braiding Hamiltonian against the t-V model.
#
# The braiding operator R^{ψ,ψ}_1 = -1 is the defining sign of fermions.
# Combined with hopping, H = -t hop + λ(σ+σ†) gives the t-V model
# of spinless fermions: H = -t Σ(c†c + h.c.) + V Σ nⱼnⱼ₊₁ with V = -2λ.
# (Factor of 2 from σ+σ† with real R = -1: 2Re(R) = -2.)
#
# This is the first test that actually probes fermionic statistics —
# the pure hopping test (SC1) is category-blind.

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

# Construct braided sVec: Vec_{Z/2} with R^{ψ,ψ} = -1
function make_braided_svec()
    G = Oscar.cyclic_group(2)
    K = QQ
    elems = collect(elements(G))
    chi_map = Dict{Tuple{typeof(elems[1]), typeof(elems[1])}, QQFieldElem}()
    for g in elems, h in elems
        chi_map[(g, h)] = (order(g) > 1 && order(h) > 1) ? K(-1) : K(1)
    end
    chi = TensorCategories.BilinearForm(G, K, K(-1), chi_map)
    return graded_vector_spaces(K, G, chi)
end

@testset "sVec R-symbol extraction" begin
    C = make_braided_svec()
    rcache = build_rsymbol_cache(C)

    @test rcache.r_values[(1, 1, 1)] ≈ 1.0   # R^{1,1}_1 = 1
    @test rcache.r_values[(1, 2, 2)] ≈ 1.0   # R^{1,ψ}_ψ = 1
    @test rcache.r_values[(2, 1, 2)] ≈ 1.0   # R^{ψ,1}_ψ = 1
    @test rcache.r_values[(2, 2, 1)] ≈ -1.0  # R^{ψ,ψ}_1 = -1 (fermionic sign)
end

@testset "Braiding Hamiltonian is diagonal (abelian)" begin
    C = make_braided_svec()
    rcache = build_rsymbol_cache(C)

    G = Oscar.cyclic_group(2)
    sVec = graded_vector_spaces(G)

    for L in 3:5
        basis = build_basis(L, sVec)
        H_braid = braiding_hamiltonian(basis, rcache)

        # Should be diagonal
        for (i, j, v) in zip(findnz(H_braid)...)
            @test i == j
        end

        # Should be Hermitian
        @test H_braid ≈ H_braid' atol=1e-14
    end
end

@testset "sVec t-V model spectrum" begin
    C = make_braided_svec()
    rcache = build_rsymbol_cache(C)

    G = Oscar.cyclic_group(2)
    sVec = graded_vector_spaces(G)

    # For sVec: R^{ψ,ψ}_1 = -1 (real), σ+σ† = 2Re(R) = -2 per adjacent pair
    # H_braid(λ) = -2λ Σ nⱼnⱼ₊₁ → t-V model with V = -2λ

    for L in 3:7
        basis = build_basis(L, sVec)

        for λ in [0.25, 0.5, 1.0, -0.5]
            V = -2λ  # σ+σ† with R=-1 gives 2Re(R)=-2 per pair

            for ((N, c), rng) in basis.sector_ranges
                N < 2 && continue

                H_hop = hopping_hamiltonian_sector(basis, N, c)
                H_braid = braiding_hamiltonian_sector(basis, rcache, N, c; λ=λ)
                H_total = H_hop + real.(H_braid)

                computed = sort(eigvals(Matrix(Symmetric(H_total))))
                expected = tv_model_spectrum(L, N; t=1.0, V=V)

                @test length(computed) == length(expected)
                @test computed ≈ expected atol=1e-10
            end
        end
    end
end

@testset "V=0 recovers free fermion spectrum" begin
    C = make_braided_svec()
    rcache = build_rsymbol_cache(C)

    G = Oscar.cyclic_group(2)
    sVec = graded_vector_spaces(G)

    for L in 3:6
        basis = build_basis(L, sVec)

        for ((N, c), rng) in basis.sector_ranges
            N == 0 && continue

            H_hop = hopping_hamiltonian_sector(basis, N, c)
            H_braid = braiding_hamiltonian_sector(basis, rcache, N, c; λ=0.0)

            @test nnz(H_braid) == 0

            computed = sort(eigvals(Matrix(H_hop)))
            expected = free_fermion_energies(L, N)
            @test computed ≈ expected atol=1e-10
        end
    end
end

@testset "Bosonic vs fermionic sign" begin
    G = Oscar.cyclic_group(2)
    sVec_unbraided = graded_vector_spaces(G)

    # Fermionic: R^{ψ,ψ}_1 = -1
    C_f = make_braided_svec()
    rcache_f = build_rsymbol_cache(C_f)

    # Bosonic: R^{ψ,ψ}_1 = +1
    rcache_b = build_rsymbol_cache_manual(Dict(
        (1,1,1) => 1.0+0im, (1,2,2) => 1.0+0im,
        (2,1,2) => 1.0+0im, (2,2,1) => 1.0+0im))

    L = 6
    basis = build_basis(L, sVec_unbraided)
    λ = 0.5

    N, c = 2, 1
    H_hop = hopping_hamiltonian_sector(basis, N, c)

    H_f = H_hop + real.(braiding_hamiltonian_sector(basis, rcache_f, N, c; λ=λ))
    H_b = H_hop + real.(braiding_hamiltonian_sector(basis, rcache_b, N, c; λ=λ))

    spec_f = sort(eigvals(Matrix(Symmetric(H_f))))
    spec_b = sort(eigvals(Matrix(Symmetric(H_b))))

    # Spectra must differ (fermion sign matters!)
    @test !(spec_f ≈ spec_b)

    # Fermion: V = -2λ = -1
    expected_f = tv_model_spectrum(L, N; t=1.0, V=-2λ)
    @test spec_f ≈ expected_f atol=1e-10

    # Boson: V = +2λ = +1
    expected_b = tv_model_spectrum(L, N; t=1.0, V=+2λ)
    @test spec_b ≈ expected_b atol=1e-10
end
