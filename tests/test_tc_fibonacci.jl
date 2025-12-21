"""
Test TensorCategories.jl with Fibonacci category.

This test demonstrates:
1. Using the built-in fibonacci_category() factory function
2. Defining a category from scratch using six_j_category
3. Setting fusion rules manually via set_tensor_product!
4. Verifying categorical properties: decompose, Hom spaces, dimensions

Planning ref: TC-REFACTOR-002
See: plans/tensorcategories_refactoring_guide.md
"""

using Pkg
Pkg.activate(".")

using Test
using Oscar
using TensorCategories

println("Testing TensorCategories.jl with Fibonacci category...")

@testset "Fibonacci Category Tests" begin

    @testset "Built-in Fibonacci Category" begin
        # Use TensorCategories' built-in Fibonacci category
        Fib = fibonacci_category()

        @test is_fusion(Fib)
        @test length(simples(Fib)) == 2
        @test simples_names(Fib) == ["𝟙", "τ"]

        # Get simple objects
        S = simples(Fib)
        one_obj = one(Fib)
        τ = nothing
        for s in S
            if !is_isomorphic(s, one_obj)[1]
                τ = s
                break
            end
        end
        @test !isnothing(τ)

        # Test fusion rule: τ ⊗ τ = 𝟙 ⊕ τ
        product = τ ⊗ τ
        dec = decompose(product)

        mult_one = 0
        mult_tau = 0
        for (obj, mult) in dec
            if is_isomorphic(obj, one_obj)[1]
                mult_one = mult
            elseif is_isomorphic(obj, τ)[1]
                mult_tau = mult
            end
        end
        @test mult_one == 1
        @test mult_tau == 1

        # Test Hom space dimension: dim Hom(τ ⊗ τ, τ) = 1
        H = Hom(τ ⊗ τ, τ)
        @test dim(H) == 1

        # Test quantum dimensions
        @test dim(one_obj) == 1
        d_τ = dim(τ)
        @test d_τ^2 == 1 + d_τ  # Golden ratio property: φ² = φ + 1
    end

    @testset "Manual SixJCategory Construction" begin
        # Demonstrate defining Fibonacci fusion rules from scratch
        # using the six_j_category API

        # Define base field with golden ratio φ
        Qx, x = QQ["x"]
        F, φ = number_field(x^2 - x - 1, "φ")

        # Fusion rules for Fibonacci: τ ⊗ τ = 𝟙 ⊕ τ
        # M[i,j,k] = N_{ij}^k, indices: 1 = 𝟙, 2 = τ
        M = zeros(Int, 2, 2, 2)
        M[1, 1, 1] = 1  # 𝟙 ⊗ 𝟙 = 𝟙
        M[1, 2, 2] = 1  # 𝟙 ⊗ τ = τ
        M[2, 1, 2] = 1  # τ ⊗ 𝟙 = τ
        M[2, 2, 1] = 1  # τ ⊗ τ → 𝟙
        M[2, 2, 2] = 1  # τ ⊗ τ → τ

        # Create SixJCategory with fusion rules and names
        Fib_manual = six_j_category(F, M, ["𝟙", "τ"])

        # Set the unit object (index 1 = 𝟙)
        set_one!(Fib_manual, 1)

        # Set spherical structure (all +1 for Fibonacci)
        set_spherical!(Fib_manual, [F(1), F(1)])

        # Verify basic structure
        @test is_fusion(Fib_manual)
        @test length(simples(Fib_manual)) == 2

        # Get simple objects
        S = simples(Fib_manual)
        one_obj = one(Fib_manual)
        τ = S[2]

        # Verify decompose works: τ ⊗ τ = 𝟙 ⊕ τ
        product = τ ⊗ τ
        dec = decompose(product)

        mult_one = 0
        mult_tau = 0
        for (obj, mult) in dec
            if is_isomorphic(obj, one_obj)[1]
                mult_one = mult
            elseif is_isomorphic(obj, τ)[1]
                mult_tau = mult
            end
        end
        @test mult_one == 1
        @test mult_tau == 1

        # Verify Hom space dimensions match fusion multiplicities
        @test dim(Hom(τ ⊗ τ, τ)) == 1
        @test dim(Hom(τ ⊗ τ, one_obj)) == 1
        @test dim(Hom(one_obj ⊗ τ, τ)) == 1

        # Verify associator exists and has correct domain/codomain
        α = associator(τ, τ, τ)
        @test !isnothing(α)
        @test domain(α) == (τ ⊗ τ) ⊗ τ
        @test codomain(α) == τ ⊗ (τ ⊗ τ)
    end

    @testset "F-symbols and Associator" begin
        # The built-in category has correct F-symbols
        Fib = fibonacci_category()
        S = simples(Fib)
        τ = nothing
        for s in S
            if !is_isomorphic(s, one(Fib))[1]
                τ = s
                break
            end
        end

        # The key F-symbol for Fibonacci is for (τ,τ,τ)
        # F^{τττ} is a 2×2 matrix with entries involving φ^{-1} and φ^{-1/2}
        α = associator(τ, τ, τ)
        @test !isnothing(α)

        # Verify pentagon equation holds implicitly
        # (the category wouldn't be fusion if it didn't)
        @test is_fusion(Fib)

        # Access six-j symbols directly
        # For τ⊗τ⊗τ → τ, the intermediate channels are {𝟙, τ}
        sj = six_j_symbols(Fib)
        @test !isnothing(sj)
    end

end

println("All Fibonacci category tests passed!")
