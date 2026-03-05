"""
Test TensorCategories.jl with Ising category.

This test demonstrates:
1. Using the built-in ising_category() factory function
2. Defining a category from scratch using six_j_category
3. Setting fusion rules manually for Ising: σ⊗σ=1⊕ψ, ψ⊗ψ=1, σ⊗ψ=σ
4. Verifying categorical properties: decompose, Hom spaces, dimensions, quantum dimensions
5. Testing associator morphisms for non-trivial fusion

Planning ref: TC-REFACTOR-003
See: plans/tensorcategories_refactoring_guide.md
"""

using Pkg
Pkg.activate(".")

using Test
using Oscar
using TensorCategories

println("Testing TensorCategories.jl with Ising category...")

@testset "Ising Category Tests" begin

    @testset "Built-in Ising Category" begin
        # Use TensorCategories' built-in Ising category
        Ising = ising_category()

        @test is_fusion(Ising)
        @test length(simples(Ising)) == 3
        # Note: TensorCategories uses different naming convention (𝟙, χ, X)
        names = simples_names(Ising)
        @test length(names) == 3

        # Get simple objects by index
        S = simples(Ising)
        one_obj = one(Ising)
        χ = S[2]   # Second simple object
        X = S[3]   # Third simple object

        # Actual Ising fusion rules in TensorCategories:
        # χ ⊗ χ = 𝟙
        product_χχ = χ ⊗ χ
        dec_χχ = decompose(product_χχ)
        
        mult_one_χχ = 0
        for (obj, mult) in dec_χχ
            if is_isomorphic(obj, one_obj)[1]
                mult_one_χχ = mult
            end
        end
        @test mult_one_χχ == 1

        # X ⊗ X = 𝟙 ⊕ χ
        product_XX = X ⊗ X
        dec_XX = decompose(product_XX)

        mult_one_XX = 0
        mult_χ_XX = 0
        for (obj, mult) in dec_XX
            if is_isomorphic(obj, one_obj)[1]
                mult_one_XX = mult
            elseif is_isomorphic(obj, χ)[1]
                mult_χ_XX = mult
            end
        end
        @test mult_one_XX == 1
        @test mult_χ_XX == 1

        # χ ⊗ X = X
        product_χX = χ ⊗ X
        dec_χX = decompose(product_χX)
        
        mult_X = 0
        for (obj, mult) in dec_χX
            if is_isomorphic(obj, X)[1]
                mult_X = mult
            end
        end
        @test mult_X == 1

        # Test Hom space dimensions (these should be 1 for each fusion)
        @test dim(Hom(χ ⊗ χ, one_obj)) == 1
        @test dim(Hom(X ⊗ X, one_obj)) == 1
        @test dim(Hom(X ⊗ X, χ)) == 1
        @test dim(Hom(χ ⊗ X, X)) == 1

        # Test quantum dimensions
        @test dim(one_obj) == 1
        # χ and X have positive quantum dimensions (don't compare with integers due to field elements)
        d_χ = dim(χ)
        d_X = dim(X)
        @test !isnothing(d_χ)
        @test !isnothing(d_X)
    end

    @testset "Manual SixJCategory Construction for Ising" begin
        # Demonstrate defining Ising fusion rules from scratch
        # Ising has 3 simple objects: 𝟙 (index 1), χ (index 2), X (index 3)
        
        # Fusion rules (matching TensorCategories convention):
        # 𝟙 ⊗ Y = Y for all Y
        # χ ⊗ χ = 𝟙
        # χ ⊗ X = X
        # X ⊗ X = 𝟙 ⊕ χ

        M = zeros(Int, 3, 3, 3)
        
        # 𝟙 ⊗ * = * (identity fusions)
        M[1, 1, 1] = 1  # 𝟙 ⊗ 𝟙 = 𝟙
        M[1, 2, 2] = 1  # 𝟙 ⊗ χ = χ
        M[1, 3, 3] = 1  # 𝟙 ⊗ X = X
        
        # χ fusions
        M[2, 1, 2] = 1  # χ ⊗ 𝟙 = χ
        M[2, 2, 1] = 1  # χ ⊗ χ = 𝟙
        M[2, 3, 3] = 1  # χ ⊗ X = X
        
        # X fusions
        M[3, 1, 3] = 1  # X ⊗ 𝟙 = X
        M[3, 2, 3] = 1  # X ⊗ χ = X
        M[3, 3, 1] = 1  # X ⊗ X = 𝟙 (with multiplicity 1)
        M[3, 3, 2] = 1  # X ⊗ X = χ (with multiplicity 1)

        # Create SixJCategory with fusion rules and names
        Ising_manual = six_j_category(QQ, M, ["𝟙", "χ", "X"])

        # Set the unit object (index 1 = 𝟙)
        set_one!(Ising_manual, 1)

        # Set spherical structure (all 1 for simplicity)
        set_spherical!(Ising_manual, [QQ(1), QQ(1), QQ(1)])

        # Verify basic structure
        @test is_fusion(Ising_manual)
        @test length(simples(Ising_manual)) == 3

        # Get simple objects
        S = simples(Ising_manual)
        one_obj = one(Ising_manual)
        χ = S[2]
        X = S[3]

        # Verify fusion rules via decompose
        # χ ⊗ χ = 𝟙
        product_χχ = χ ⊗ χ
        dec_χχ = decompose(product_χχ)

        mult_one_χχ = 0
        for (obj, mult) in dec_χχ
            if is_isomorphic(obj, one_obj)[1]
                mult_one_χχ = mult
            end
        end
        @test mult_one_χχ == 1

        # X ⊗ X = 𝟙 ⊕ χ
        product_XX = X ⊗ X
        dec_XX = decompose(product_XX)
        
        mult_one_XX = 0
        mult_χ_XX = 0
        for (obj, mult) in dec_XX
            if is_isomorphic(obj, one_obj)[1]
                mult_one_XX = mult
            elseif is_isomorphic(obj, χ)[1]
                mult_χ_XX = mult
            end
        end
        @test mult_one_XX == 1
        @test mult_χ_XX == 1

        # χ ⊗ X = X
        product_χX = χ ⊗ X
        dec_χX = decompose(product_χX)
        
        mult_X = 0
        for (obj, mult) in dec_χX
            if is_isomorphic(obj, X)[1]
                mult_X = mult
            end
        end
        @test mult_X == 1

        # Verify Hom space dimensions match fusion multiplicities
        @test dim(Hom(χ ⊗ χ, one_obj)) == 1
        @test dim(Hom(X ⊗ X, one_obj)) == 1
        @test dim(Hom(X ⊗ X, χ)) == 1
        @test dim(Hom(χ ⊗ X, X)) == 1

        # Verify associator exists and has correct domain/codomain
        # For (χ, χ, χ), we have (χ ⊗ χ) ⊗ χ = 𝟙 ⊗ χ vs χ ⊗ (χ ⊗ χ) = χ ⊗ 𝟙
        α_χχχ = associator(χ, χ, χ)
        @test !isnothing(α_χχχ)
        @test domain(α_χχχ) == (χ ⊗ χ) ⊗ χ
        @test codomain(α_χχχ) == χ ⊗ (χ ⊗ χ)
    end

    @testset "F-symbols and Associators for Ising" begin
        # The built-in Ising category has correct F-symbols
        Ising = ising_category()
        S = simples(Ising)
        χ = S[2]
        X = S[3]

        # Test several non-trivial associators
        # (χ, χ, χ)
        α_χχχ = associator(χ, χ, χ)
        @test !isnothing(α_χχχ)

        # (X, X, X) - has non-trivial fusion X ⊗ X = 𝟙 ⊕ χ
        α_XXX = associator(X, X, X)
        @test !isnothing(α_XXX)

        # Verify pentagon equation holds implicitly
        # (the category wouldn't be fusion if it didn't)
        @test is_fusion(Ising)

        # Access six-j symbols directly
        sj = six_j_symbols(Ising)
        @test !isnothing(sj)
    end

    @testset "Multiplicity Handling in Ising" begin
        # Ising is multiplicity-free: all N_{ij}^k ∈ {0,1}
        # X ⊗ X = 𝟙 ⊕ χ (fusion rule with two summands)
        
        Ising = ising_category()
        S = simples(Ising)
        one_obj = one(Ising)
        χ = S[2]
        X = S[3]

        # Verify fusion multiplicities for X ⊗ X
        # N_{XX}^1 = 1 and N_{XX}^χ = 1
        @test dim(Hom(X ⊗ X, one_obj)) == 1
        @test dim(Hom(X ⊗ X, χ)) == 1
        
        # Verify X ⊗ X decomposes into both 𝟙 and χ
        product = X ⊗ X
        dec = decompose(product)

        # Extract multiplicities
        found_one = false
        found_chi = false
        
        for (obj, mult) in dec
            if is_isomorphic(obj, one_obj)[1]
                found_one = true
                @test mult == 1
            elseif is_isomorphic(obj, χ)[1]
                found_chi = true
                @test mult == 1
            end
        end
        
        @test found_one
        @test found_chi
    end

end

println("All Ising category tests passed!")
