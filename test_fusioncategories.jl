using Pkg
Pkg.activate(".")

include("src/julia/FusionCategories/fusion_ring.jl")
using .FusionCategories
using Test

println("Testing FusionCategories module...")

@testset "FusionCategory Rigidity" begin
    # Define a simple non-rigid fusion category (example: truncated U(1))
    # This is a minimal example, N_{X,X*}^1 should be 0 or >1 for non-rigid
    simples_non_rigid = [:vacuum, :x]
    unit_non_rigid = :vacuum
    dual_non_rigid = Dict(:vacuum => :vacuum, :x => :x) # x is its own dual
    N_non_rigid = Dict(
        (:vacuum, :vacuum, :vacuum) => 1,
        (:x, :x, :vacuum) => 0 # Should be 1 for rigidity
    )
    non_rigid_cat = FusionCategory(simples_non_rigid, unit_non_rigid, dual_non_rigid, N_non_rigid)
    @test !is_rigid(non_rigid_cat) # Expecting false for non-rigid

    # Define a simple rigid fusion category (example: Z_2 fusion category)
    # Simples: {1, σ}, 1* = 1, σ* = σ. Fusion: σ⊗σ = 1.
    simples_rigid = [:vacuum, :sigma]
    unit_rigid = :vacuum
    dual_rigid = Dict(:vacuum => :vacuum, :sigma => :sigma)
    N_rigid = Dict(
        (:vacuum, :vacuum, :vacuum) => 1,
        (:sigma, :sigma, :vacuum) => 1,
        (:vacuum, :sigma, :sigma) => 1,
        (:sigma, :vacuum, :sigma) => 1
    )
    rigid_cat = FusionCategory(simples_rigid, unit_rigid, dual_rigid, N_rigid)
    @test is_rigid(rigid_cat) # Expecting true for rigid
end
