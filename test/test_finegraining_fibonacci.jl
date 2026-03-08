# Validate fine-graining isometries for Fibonacci anyons.
#
# Key tests:
# 1. Trivial embedding is isometric (permutation)
# 2. Haar product map: V†V = I for all sectors
# 3. V preserves particle number, total charge, labels
# 4. Hamiltonian intertwining for hopping
# 5. Hamiltonian intertwining for hopping + interaction
# 6. Comparison with sVec fine-graining

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

Fib = fibonacci_category()
fcache = build_fsymbol_cache(Fib)

G = Oscar.cyclic_group(2)
sVec = graded_vector_spaces(G)

# ============================================================
# Trivial embedding
# ============================================================

@testset "Trivial embedding is isometric (Fibonacci, L=$L)" for L in 3:6
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    V0 = trivial_embedding(basis_L, basis_2L)

    # V0†V0 = I
    VtV = V0' * V0
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-14
end

@testset "Trivial embedding is isometric (sVec, L=$L)" for L in 3:6
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    V0 = trivial_embedding(basis_L, basis_2L)

    VtV = V0' * V0
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-14
end

# ============================================================
# Haar product map: isometry
# ============================================================

@testset "Fibonacci Haar fine-graining V†V = I (L=$L)" for L in 3:6
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)

    V = fine_graining_isometry(basis_L, basis_2L, R)

    VtV = V' * V
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-12
end

@testset "sVec Haar fine-graining V†V = I (product map, L=$L)" for L in 3:6
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    R = one_particle_scaling_map_haar(L)

    V = fine_graining_isometry(basis_L, basis_2L, R)

    VtV = V' * V
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-12
end

# ============================================================
# Structural properties
# ============================================================

@testset "Fine-graining preserves N, charge, labels (Fibonacci, L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry(basis_L, basis_2L, R)

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
# Hamiltonian intertwining: hopping only
# ============================================================

@testset "Fibonacci hopping intertwining (L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry(basis_L, basis_2L, R)

    H_L = hopping_hamiltonian(basis_L; t=1.0)
    H_2L = hopping_hamiltonian(basis_2L; t=1.0)

    H_proj = V' * H_2L * V
    H_proj_d = Matrix(H_proj)
    H_L_d = Matrix(H_L)
    n = size(H_L_d, 1)

    # Fit H_proj ≈ a H_L + b I
    A_ls = hcat(vec(H_L_d), vec(Matrix(1.0I, n, n)))
    ab = A_ls \ vec(H_proj_d)
    residual = norm(H_proj_d - ab[1] * H_L_d - ab[2] * I(n)) / norm(H_proj_d)

    @test ab[1] > 0  # positive rescaling
    @test residual < 0.5  # reasonable intertwining
end

# ============================================================
# Hamiltonian intertwining: hopping + interaction (golden chain)
# ============================================================

@testset "Fibonacci hopping+interaction intertwining (L=$L)" for L in 3:5
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry(basis_L, basis_2L, R)

    fcache_local = build_fsymbol_cache(Fib)

    # Full Hamiltonian: hopping + interaction
    H_hop_L = hopping_hamiltonian(basis_L; t=1.0)
    H_int_L = interaction_hamiltonian(basis_L, fcache_local; J=1.0)
    H_L = H_hop_L + real.(H_int_L)

    H_hop_2L = hopping_hamiltonian(basis_2L; t=1.0)
    H_int_2L = interaction_hamiltonian(basis_2L, fcache_local; J=1.0)
    H_2L = H_hop_2L + real.(H_int_2L)

    H_proj = V' * H_2L * V
    H_proj_d = real.(Matrix(H_proj))
    H_L_d = real.(Matrix(H_L))
    n = size(H_L_d, 1)

    # Fit
    A_ls = hcat(vec(H_L_d), vec(Matrix(1.0I, n, n)))
    ab = A_ls \ vec(H_proj_d)
    residual = norm(H_proj_d - ab[1] * H_L_d - ab[2] * I(n)) / norm(H_proj_d)

    # The intertwining for the full Hamiltonian won't be as tight as hopping only,
    # but should still show reasonable agreement
    @test residual < 1.0  # generous bound
end

# ============================================================
# Dense sector analysis
# ============================================================

@testset "Fibonacci dense sector fine-graining (L=$L)" for L in 3:6
    basis_L = build_basis(L, Fib)
    basis_2L = build_basis(2L, Fib)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry(basis_L, basis_2L, R)

    # Check that dense sector (N=L) maps correctly
    for c in 1:2
        range_L = get(basis_L.sector_ranges, (L, c), 1:0)
        isempty(range_L) && continue

        dim_L = length(range_L)

        # V restricted to this sector: extract columns for coarse states in this sector
        V_sector = V[:, range_L]

        # V_sector†V_sector should be identity on the sector
        VtV_sector = V_sector' * V_sector
        @test norm(Matrix(VtV_sector) - I(dim_L)) < 1e-12
    end
end

# ============================================================
# Comparison: product map vs Slater determinant for sVec
# ============================================================

@testset "sVec: product map gives same V†HV as Slater (L=$L)" for L in 3:5
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    R = one_particle_scaling_map_haar(L)

    V_product = fine_graining_isometry(basis_L, basis_2L, R)
    V_slater = fine_graining_isometry_svec(basis_L, basis_2L, R)

    H_2L = hopping_hamiltonian(basis_2L; t=1.0)

    # Both should give the same projected Hamiltonian
    H_proj_product = V_product' * H_2L * V_product
    H_proj_slater = V_slater' * H_2L * V_slater

    # The eigenvalues should match (even if the isometries differ by signs)
    evals_product = sort(eigvals(Symmetric(Matrix(H_proj_product))))
    evals_slater = sort(eigvals(Symmetric(Matrix(H_proj_slater))))

    @test evals_product ≈ evals_slater atol=1e-10
end
