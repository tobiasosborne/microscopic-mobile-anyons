# test_svec_verification.jl
# Verification tests for SC4: sVec reduces to fermionic Fock space
# See: docs/svec_verification.md

using Pkg
Pkg.activate(".")

include("src/julia/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons
using Test

println("Testing sVec verification (SC4)...")
println("="^50)

@testset "sVec Category Definition" begin
    cat = svec_category()

    @testset "Basic properties" begin
        @test cat.d == 2  # Two simples: vacuum (1) and fermion (2)
    end

    @testset "Fusion rules" begin
        # 1 ⊗ 1 = 1
        @test fusion_mult(cat, 1, 1, 1) == 1
        @test fusion_mult(cat, 1, 1, 2) == 0

        # 1 ⊗ f = f
        @test fusion_mult(cat, 1, 2, 2) == 1
        @test fusion_mult(cat, 1, 2, 1) == 0

        # f ⊗ 1 = f
        @test fusion_mult(cat, 2, 1, 2) == 1
        @test fusion_mult(cat, 2, 1, 1) == 0

        # f ⊗ f = 1 (key fermionic relation)
        @test fusion_mult(cat, 2, 2, 1) == 1
        @test fusion_mult(cat, 2, 2, 2) == 0
    end
end

@testset "Hilbert Space Dimension Matching" begin
    cat = svec_category()

    @testset "Small lattices" begin
        for L in 2:6
            hilb = MobileAnyonHilbert(L, cat)

            # Total dimension should be 2^L
            @test dim(hilb) == svec_total_dimension(L)
            @test dim(hilb) == 2^L

            # Each N-sector dimension should be binomial(L, N)
            for N in 0:L
                c = valid_svec_charge(N)  # Correct charge for N fermions
                expected_dim = svec_hilbert_dimension(L, N)
                actual_dim = dim(hilb, N, c)
                @test actual_dim == expected_dim
                @test actual_dim == binomial(L, N)

                # Wrong charge should give zero dimension
                wrong_c = c == 1 ? 2 : 1
                @test dim(hilb, N, wrong_c) == 0
            end
        end
    end

    @testset "Specific cases" begin
        # L=4 sites
        cat = svec_category()
        hilb = MobileAnyonHilbert(4, cat)

        # Check exact dimensions match fermionic Fock space
        @test dim(hilb, 0, 1) == 1      # Vacuum: C(4,0) = 1
        @test dim(hilb, 1, 2) == 4      # 1 fermion: C(4,1) = 4
        @test dim(hilb, 2, 1) == 6      # 2 fermions: C(4,2) = 6
        @test dim(hilb, 3, 2) == 4      # 3 fermions: C(4,3) = 4
        @test dim(hilb, 4, 1) == 1      # 4 fermions: C(4,4) = 1

        # Total: 1 + 4 + 6 + 4 + 1 = 16 = 2^4
        @test dim(hilb) == 16
    end
end

@testset "Charge (Parity) Conservation" begin
    @testset "Valid charge for N fermions" begin
        # Even number of fermions → vacuum (charge 1)
        @test valid_svec_charge(0) == 1
        @test valid_svec_charge(2) == 1
        @test valid_svec_charge(4) == 1
        @test valid_svec_charge(100) == 1

        # Odd number of fermions → fermion (charge 2)
        @test valid_svec_charge(1) == 2
        @test valid_svec_charge(3) == 2
        @test valid_svec_charge(5) == 2
        @test valid_svec_charge(99) == 2
    end
end

@testset "Fusion Trees are Trivial" begin
    cat = svec_category()

    @testset "Single fermion" begin
        # One fermion should have exactly one fusion tree to charge f
        trees = enumerate_fusion_trees(cat, [2], 2)
        @test length(trees) == 1

        # No fusion tree to vacuum from one fermion
        trees = enumerate_fusion_trees(cat, [2], 1)
        @test length(trees) == 0
    end

    @testset "Two fermions" begin
        # Two fermions should fuse only to vacuum
        trees = enumerate_fusion_trees(cat, [2, 2], 1)
        @test length(trees) == 1

        # Cannot fuse to fermion
        trees = enumerate_fusion_trees(cat, [2, 2], 2)
        @test length(trees) == 0
    end

    @testset "Three fermions" begin
        # Three fermions should fuse only to fermion
        trees = enumerate_fusion_trees(cat, [2, 2, 2], 2)
        @test length(trees) == 1

        # Cannot fuse to vacuum
        trees = enumerate_fusion_trees(cat, [2, 2, 2], 1)
        @test length(trees) == 0
    end
end

@testset "Jordan-Wigner Signs" begin
    @testset "Adjacent sites (no intermediate fermions)" begin
        config = LabelledConfig([0, 2], [2, 2])  # Fermions at sites 0 and 2
        # Moving from 0 to 1: no fermions in between
        @test jordan_wigner_sign(config, 0, 1) == 1
        # Moving from 1 to 2: no fermions in between
        @test jordan_wigner_sign(config, 1, 2) == 1
    end

    @testset "One intermediate fermion" begin
        config = LabelledConfig([0, 1, 3], [2, 2, 2])  # Fermions at 0, 1, 3
        # Moving from 0 to 2: one fermion at site 1 in between
        @test jordan_wigner_sign(config, 0, 2) == -1
        # Moving from 0 to 3: one fermion at site 1 in between (not 3, it's at endpoint)
        @test jordan_wigner_sign(config, 0, 2) == -1
    end

    @testset "Two intermediate fermions" begin
        config = LabelledConfig([0, 1, 2, 4], [2, 2, 2, 2])  # Fermions at 0, 1, 2, 4
        # Moving from 0 to 3: two fermions (at 1 and 2) in between
        @test jordan_wigner_sign(config, 0, 3) == 1  # (-1)^2 = 1
    end

    @testset "Symmetry under direction" begin
        config = LabelledConfig([1, 3], [2, 2])
        # Sign should be same regardless of direction
        @test jordan_wigner_sign(config, 0, 2) == jordan_wigner_sign(config, 2, 0)
        @test jordan_wigner_sign(config, 0, 4) == jordan_wigner_sign(config, 4, 0)
    end
end

@testset "Hard-core Constraint = Pauli Exclusion" begin
    cat = svec_category()
    L = 4

    @testset "No double occupancy" begin
        # All configurations should be hard-core
        for N in 0:L
            configs = enumerate_configs_hc(L, N, cat.d)
            for c in configs
                @test is_hardcore(c)
                @test allunique(c.positions)
            end
        end
    end

    @testset "Configuration count matches C(L,N)" begin
        for N in 0:L
            configs = enumerate_configs_hc(L, N, cat.d)
            # For sVec, d=2, so only label is 2 (fermion)
            # Each position gets label 2, so count = C(L,N)
            @test length(configs) == binomial(L, N)
        end
    end
end

@testset "Basis States Match Fermionic Occupation Basis" begin
    cat = svec_category()
    L = 3
    hilb = MobileAnyonHilbert(L, cat)

    @testset "Enumerate all basis states" begin
        # For L=3, we should have 2^3 = 8 states
        @test dim(hilb) == 8

        # Check each sector
        @test dim(hilb, 0, 1) == 1  # |000⟩
        @test dim(hilb, 1, 2) == 3  # |001⟩, |010⟩, |100⟩
        @test dim(hilb, 2, 1) == 3  # |011⟩, |101⟩, |110⟩
        @test dim(hilb, 3, 2) == 1  # |111⟩
    end

    @testset "Basis state positions" begin
        # 2-fermion sector should have positions {0,1}, {0,2}, {1,2}
        basis_2 = build_sector_basis(L, cat, 2, 1)
        positions_set = Set([b.config.positions for b in basis_2])
        @test positions_set == Set([[0,1], [0,2], [1,2]])
    end
end

println()
println("="^50)
println("All sVec verification tests completed!")
println("SC4 verification: sVec reduces to fermionic Fock space")
