# src/julia/MobileAnyons/MobileAnyons.jl
# Module for mobile anyons from fusion categories
# Planning ref: §4

module MobileAnyons

using LinearAlgebra
using Combinatorics

export LabelledConfig, n_anyons, is_valid, is_hardcore
export enumerate_configs_hc, n_configs_hc, occupation_vector
export FusionCategory, fusion_mult
export AnyonBasisState, MobileAnyonHilbert, dim
export enumerate_fusion_trees, build_sector_basis
export MorphismTerm, LocalOperator, is_particle_conserving
export hopping_right, hopping_left, interaction_term

include("config.jl")
include("hilbert.jl")
include("operators.jl")

# === Example fusion categories ===

"""
Fibonacci category: simples {1, τ}, fusion τ⊗τ = 1 + τ
"""
function fibonacci_category()
    N = Dict{Tuple{Int,Int,Int}, Int}()
    # 1 = vacuum, 2 = τ
    N[(1,1,1)] = 1
    N[(1,2,2)] = 1
    N[(2,1,2)] = 1
    N[(2,2,1)] = 1
    N[(2,2,2)] = 1
    return FusionCategory(2, N)
end

"""
Ising category: simples {1, σ, ψ}, fusion σ⊗σ = 1 + ψ
"""
function ising_category()
    N = Dict{Tuple{Int,Int,Int}, Int}()
    # 1 = vacuum, 2 = σ, 3 = ψ
    N[(1,1,1)] = 1
    N[(1,2,2)] = 1; N[(2,1,2)] = 1
    N[(1,3,3)] = 1; N[(3,1,3)] = 1
    N[(2,2,1)] = 1; N[(2,2,3)] = 1
    N[(2,3,2)] = 1; N[(3,2,2)] = 1
    N[(3,3,1)] = 1
    return FusionCategory(3, N)
end

end # module
