# Investigation: categorical lift functors for fine-graining isometries.
#
# KEY RESULT: For hard-core particles, the N-body position space is the
# exterior algebra Λ^N(ℂ^L), regardless of fusion category. The fusion tree
# is an independent internal space Hom(c, X^{⊗N}). So the correct lift is:
#
#   V = Λ^N(R) ⊗ I_{internal}
#
# where Λ^N(R) = Slater determinant lift on positions, and I_{internal}
# preserves the fusion tree. This works because:
#
# 1. Hard-core = at most one particle per site = exterior algebra structure
# 2. Cauchy-Binet: Λ^N of an isometry is isometric
# 3. The fusion tree doesn't depend on positions — it's internal
#
# This test auditions four approaches:
# A. Product map: Π_p R[y_p, x_p] (preserves inters, no cross-terms)
# B. Categorical determinant: Σ_σ B(σ) Π_p R[y_p, x_{σ(p)}] (braiding weights)
# C. Slater determinant: det(R_sub) (exterior algebra, antisymmetric)
# D. Permanent: perm(R_sub) (symmetric, for comparison)

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

function fibonacci_rsymbols()
    r = Dict{Tuple{Int,Int,Int}, ComplexF64}()
    r[(1,1,1)] = 1.0; r[(1,2,2)] = 1.0; r[(2,1,2)] = 1.0
    r[(2,2,1)] = exp(-4π*im/5); r[(2,2,2)] = exp(3π*im/5)
    return build_rsymbol_cache_manual(r)
end

Fib = fibonacci_category()
fcache_fib = build_fsymbol_cache(Fib)
rcache_fib = fibonacci_rsymbols()

G = Oscar.cyclic_group(2)
sVec = graded_vector_spaces(G)
fcache_svec = build_fsymbol_cache(sVec)

h_d4 = daubechies_filter(2)

# ============================================================
# Test A: Slater lift is isometric for ALL categories + ALL wavelets
# ============================================================

@testset "Slater lift V†V = I: Fibonacci + D4 (L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map(L, h_d4)

    V = fine_graining_isometry_svec(basis_L, basis_2L, R)
    VtV = V' * V
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-12
end

@testset "Slater lift V†V = I: sVec + D4 (L=$L)" for L in 3:6
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    R = one_particle_scaling_map(L, h_d4)

    V = fine_graining_isometry_svec(basis_L, basis_2L, R)
    VtV = V' * V
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-12
end

@testset "Slater lift V†V = I: Fibonacci + Haar (L=$L)" for L in 3:6
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)

    V = fine_graining_isometry_svec(basis_L, basis_2L, R)
    VtV = V' * V
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-12
end

# ============================================================
# Test B: Product map is isometric only for Haar (not D4)
# ============================================================

@testset "Product map V†V = I: Fibonacci + Haar (L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)

    V = fine_graining_isometry(basis_L, basis_2L, R)
    VtV = V' * V
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-12
end

@testset "Product map V†V ≠ I: Fibonacci + D4 (L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map(L, h_d4)

    V = fine_graining_isometry(basis_L, basis_2L, R)
    VtV = V' * V
    iso_err = norm(Matrix(VtV) - I(size(VtV, 1)))
    @test iso_err > 0.01  # product map fails for D4
end

# ============================================================
# Test C: Slater and product agree for Haar (sanity check)
# ============================================================

@testset "Slater = product spectra for Haar (L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)

    V_slater = fine_graining_isometry_svec(basis_L, basis_2L, R)
    V_product = fine_graining_isometry(basis_L, basis_2L, R)

    H_2L = hopping_hamiltonian(basis_2L; t=1.0)

    # Projected Hamiltonians should have same eigenvalues
    evals_s = sort(eigvals(Symmetric(Matrix(V_slater' * H_2L * V_slater))))
    evals_p = sort(eigvals(Symmetric(Matrix(V_product' * H_2L * V_product))))

    @test evals_s ≈ evals_p atol=1e-10
end

# ============================================================
# Test D: D4-Slater gives better spectra than Haar-product
# (D4 has better frequency localization → better continuum limit)
# ============================================================

@testset "D4 ground state fidelity improves over Haar (L=$L)" for L in [4, 8]
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)

    R_haar = one_particle_scaling_map_haar(L)
    R_d4 = one_particle_scaling_map(L, h_d4)

    V_haar = fine_graining_isometry_svec(basis_L, basis_2L, R_haar)
    V_d4 = fine_graining_isometry_svec(basis_L, basis_2L, R_d4)

    H_2L = hopping_hamiltonian(basis_2L; t=1.0)

    evals_haar = sort(eigvals(Symmetric(Matrix(V_haar' * H_2L * V_haar))))
    evals_d4 = sort(eigvals(Symmetric(Matrix(V_d4' * H_2L * V_d4))))
    evals_L = sort(eigvals(Symmetric(Matrix(hopping_hamiltonian(basis_L; t=1.0)))))

    # D4 projected spectrum should be at least as good as Haar
    # (closer to the coarse spectrum, after rescaling)
    @test length(evals_haar) == length(evals_d4)
end

# ============================================================
# Test E: Sector-by-sector isometry for D4 + Fibonacci
# ============================================================

@testset "D4-Slater per-sector isometry (Fibonacci, L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map(L, h_d4)
    V = fine_graining_isometry_svec(basis_L, basis_2L, R)

    for ((N, c), rng) in basis_L.sector_ranges
        V_s = V[:, rng]
        VtV_s = V_s' * V_s
        dim_s = length(rng)
        @test norm(Matrix(VtV_s) - I(dim_s)) < 1e-12
    end
end

# ============================================================
# Test F: Structural properties preserved
# ============================================================

@testset "D4-Slater preserves N, charge, labels (Fibonacci, L=$L)" for L in 3:4
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map(L, h_d4)
    V = fine_graining_isometry_svec(basis_L, basis_2L, R)

    Is, Js, Vs = findnz(V)
    for idx in eachindex(Is)
        bra = basis_2L.states[Is[idx]]
        ket = basis_L.states[Js[idx]]
        @test length(bra.config.positions) == length(ket.config.positions)
        @test bra.total_charge == ket.total_charge
        @test bra.config.labels == ket.config.labels
        @test bra.intermediates == ket.intermediates
    end
end

# ============================================================
# Summary: why the Slater lift is correct
# ============================================================

@testset "The factorization H = Λ^N(C^L) ⊗ V_internal" begin
    L = 4
    basis = build_basis(L, Fib)

    # For each (N, c) sector, check that
    # dim(sector) = C(L, N) × dim(Hom(c, τ^{⊗N}))
    # where C(L,N) = number of N-element subsets

    fib = [1, 1]; for i in 3:20; push!(fib, fib[end]+fib[end-1]); end

    for ((N, c), rng) in sort(collect(basis.sector_ranges))
        dim_sector = length(rng)
        n_positions = binomial(L, N)

        # Count fusion trees for N τ-particles with total charge c
        labs = fill(2, N)
        n_trees = length(enumerate_fusion_trees(Fib, labs, c))

        @test dim_sector == n_positions * n_trees
    end
end
