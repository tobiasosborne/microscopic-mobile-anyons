# Validate per-bond projectors and Koo-Saleur lattice Virasoro generators.
#
# Tests:
# 1. Per-bond projectors sum to the interaction Hamiltonian
# 2. Each P_j is Hermitian and a projector (P² = P)
# 3. Fourier modes have correct symmetry
# 4. Virasoro commutator structure (qualitative)

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

Fib = fibonacci_category()
fcache = build_fsymbol_cache(Fib)

# ============================================================
# Per-bond projectors
# ============================================================

@testset "Bond projectors sum to interaction H (L=$L, c=$c)" for L in 4:8, c in 1:2
    basis = build_basis(L, Fib)
    range = get(basis.sector_ranges, (L, c), 1:0)
    isempty(range) && continue

    projectors = bond_projectors_dense(basis, fcache, L, c)
    @test length(projectors) == L - 1

    # Sum should equal the interaction Hamiltonian
    H_int = interaction_hamiltonian_sector(basis, fcache, L, c; J=1.0)
    H_sum = sum(projectors)

    @test norm(Matrix(H_sum) - Matrix(H_int)) < 1e-10
end

@testset "Bond projectors are Hermitian (L=$L)" for L in 4:7
    basis = build_basis(L, Fib)
    for c in 1:2
        range = get(basis.sector_ranges, (L, c), 1:0)
        isempty(range) && continue

        projectors = bond_projectors_dense(basis, fcache, L, c)
        for (j, Pj) in enumerate(projectors)
            Pj_m = Matrix(Pj)
            @test norm(Pj_m - adjoint(Pj_m)) < 1e-10
        end
    end
end

@testset "Bond projectors are idempotent P² = P (L=$L)" for L in 4:7
    basis = build_basis(L, Fib)
    for c in 1:2
        range = get(basis.sector_ranges, (L, c), 1:0)
        isempty(range) && continue

        projectors = bond_projectors_dense(basis, fcache, L, c)
        for (j, Pj) in enumerate(projectors)
            Pj_m = Matrix(Pj)
            @test norm(Pj_m^2 - Pj_m) < 1e-10
        end
    end
end

@testset "Non-adjacent bond projectors commute [P_j, P_k] = 0 (L=$L)" for L in 5:8
    basis = build_basis(L, Fib)
    c = 2
    range = get(basis.sector_ranges, (L, c), 1:0)
    isempty(range) && continue

    projectors = bond_projectors_dense(basis, fcache, L, c)

    for j in 1:(L - 3)
        Pj = Matrix(projectors[j])
        Pk = Matrix(projectors[j + 2])
        comm = Pj * Pk - Pk * Pj
        @test norm(comm) < 1e-10
    end
end

# ============================================================
# Fourier modes
# ============================================================

@testset "Fourier modes (L=$L)" for L in 5:8
    basis = build_basis(L, Fib)
    c = 2
    range = get(basis.sector_ranges, (L, c), 1:0)
    isempty(range) && continue

    projectors = bond_projectors_dense(basis, fcache, L, c)
    modes = hamiltonian_fourier_modes(projectors, L; n_modes=3)

    # H_1 should be nonzero (Fourier mode of the density)
    @test norm(modes[1]) > 1e-10

    # Modes should be Hermitian (since projectors are Hermitian and sine is real)
    for (n, Hn) in modes
        @test norm(Hn - adjoint(Hn)) < 1e-10
    end
end

# ============================================================
# Virasoro commutator structure (qualitative)
# ============================================================

@testset "Fourier mode commutators (L=$L)" for L in 6:8
    basis = build_basis(L, Fib)
    c = 2
    range = get(basis.sector_ranges, (L, c), 1:0)
    isempty(range) && continue

    projectors = bond_projectors_dense(basis, fcache, L, c)
    modes = hamiltonian_fourier_modes(projectors, L; n_modes=4)

    # [H_1, H_2] should be nonzero (Virasoro algebra has [L_1, L_2] = -L_3)
    comm_12 = modes[1] * modes[2] - modes[2] * modes[1]
    @test norm(comm_12) > 1e-14

    # [H_1, H_1] = 0 (trivially)
    comm_11 = modes[1] * modes[1] - modes[1] * modes[1]
    @test norm(comm_11) < 1e-14

    # Note: the full Virasoro algebra [L_m, L_n] = (m-n)L_{m+n} requires PBC.
    # For OBC with sine-transform modes, the algebra structure is modified by
    # boundary corrections. The nonzero commutator [H_1, H_2] ≠ 0 is still
    # evidence of nontrivial operator algebra, but it won't be proportional to H_3.
end
