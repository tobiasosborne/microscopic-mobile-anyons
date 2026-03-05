# tests/test_operators_refactored.jl
# Tests for refactored operators using TensorCategories Hom spaces
# Planning ref: §4.3, TC-REFACTOR-007

using Pkg
Pkg.activate(joinpath(@__DIR__, ".."))

include(joinpath(@__DIR__, "..", "src", "julia", "MobileAnyons", "MobileAnyons.jl"))
using .MobileAnyons
using Test

println("Testing refactored operators (TC-REFACTOR-007)...")
println("="^60)

# Test 1: MorphismTerm structure with TensorCategories indices
@testset "MorphismTerm with morphism_idx" begin
    @testset "Construction" begin
        # MorphismTerm now includes morphism_idx for referencing basis elements
        term = MorphismTerm([1, 2], [2, 1], 1, 1.0 + 0.0im)
        @test term.source_labels == [1, 2]
        @test term.target_labels == [2, 1]
        @test term.morphism_idx == 1
        @test term.coeff == 1.0 + 0.0im
    end

    @testset "Particle counting" begin
        term = MorphismTerm([2, 3], [2, 3], 1, 1.0 + 0.0im)
        @test n_particles_in(term) == 2
        @test n_particles_out(term) == 2
        @test is_particle_conserving(term)

        term_create = MorphismTerm([1, 1], [2, 3], 1, 1.0 + 0.0im)
        @test !is_particle_conserving(term_create)
    end
end

# Test 2: Hopping terms with Fibonacci category
@testset "Hopping terms with TensorCategories" begin
    fib = fibonacci_category()
    
    @testset "hopping_right" begin
        # Label 2 is τ in Fibonacci (non-trivial)
        term_right = hopping_right(fib, 2, 1.0 + 0.0im)
        @test term_right.source_labels == [2, 1]
        @test term_right.target_labels == [1, 2]
        @test term_right.morphism_idx == 1
        @test is_particle_conserving(term_right)
    end

    @testset "hopping_left" begin
        term_left = hopping_left(fib, 2, 1.0 + 0.0im)
        @test term_left.source_labels == [1, 2]
        @test term_left.target_labels == [2, 1]
        @test term_left.morphism_idx == 1
        @test is_particle_conserving(term_left)
    end

    @testset "hopping for trivial object" begin
        # Hopping vacuum is identity (allowed but trivial)
        # The function should succeed but hopping_right(fib, 1) maps 1⊗1 → 1⊗1
        # This is allowed in fusion categories
        term = hopping_right(fib, 1, 1.0 + 0.0im)
        @test term.source_labels == [1, 1]
        @test term.target_labels == [1, 1]
    end
end

# Test 3: Interaction terms with Fibonacci
@testset "Interaction terms with TensorCategories" begin
    fib = fibonacci_category()
    
    @testset "interaction_term valid" begin
        # τ ⊗ τ has fusion channels (identity and τ in Fibonacci)
        term = interaction_term(fib, 2, 2, 1.0 + 0.0im; morphism_idx=1)
        @test term.source_labels == [2, 2]
        @test term.target_labels == [2, 2]
        @test term.morphism_idx == 1
        @test is_particle_conserving(term)
    end

    @testset "interaction_term with multiplicity selection" begin
        # If multiplicity > 1, can select specific basis morphism
        term2 = interaction_term(fib, 2, 2, 2.0 + 0.0im; morphism_idx=1)
        @test term2.coeff == 2.0 + 0.0im
    end

    @testset "interaction_term invalid morphism_idx" begin
        # Multiplicity of Hom(τ⊗τ, τ⊗τ) is 2 in Fibonacci
        @test_throws ErrorException interaction_term(fib, 2, 2, 1.0 + 0.0im; morphism_idx=3)
    end
end

# Test 4: LocalOperator with refactored MorphismTerms
@testset "LocalOperator with refactored terms" begin
    fib = fibonacci_category()
    
    @testset "Construction" begin
        term1 = hopping_right(fib, 2)
        term2 = hopping_left(fib, 2)
        op = LocalOperator(0, 2, [term1, term2])
        
        @test op.site == 0
        @test op.width == 2
        @test length(op.terms) == 2
        @test is_particle_conserving(op)
    end
end

# Test 5: Compatibility with sVec (fermionic check)
@testset "sVec (fermionic) operators" begin
    svec = svec_category()
    
    @testset "Fermionic hopping" begin
        # In sVec, label 2 is the fermion f
        term = hopping_right(svec, 2)
        @test is_particle_conserving(term)
    end
end

println("\n" * "="^60)
println("✓ All operator tests passed!")
println("✓ MorphismTerm now uses TensorCategories.jl morphism bases")
println("✓ hopping and interaction functions validate via fusion_multiplicity")
