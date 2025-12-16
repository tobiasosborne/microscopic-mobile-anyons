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
export svec_category, jordan_wigner_sign
export svec_hilbert_dimension, svec_total_dimension, valid_svec_charge

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

"""
    svec_category()

sVec: Category of super-vector spaces. Simples {1, f} with f⊗f = 1.
This must reduce to standard fermionic Fock space (PRD SC4).

# Properties
- 1 = vacuum (even parity)
- f = fermion (odd parity)
- Fusion: Z₂ parity conservation
- F-symbols: All trivial (F = 1)
- R-symbols: R^{ff}_1 = -1 (fermionic exchange)

See: docs/svec_verification.md
"""
function svec_category()
    N = Dict{Tuple{Int,Int,Int}, Int}()
    # 1 = vacuum (even), 2 = fermion (odd)
    N[(1,1,1)] = 1  # 1 ⊗ 1 = 1
    N[(1,2,2)] = 1  # 1 ⊗ f = f
    N[(2,1,2)] = 1  # f ⊗ 1 = f
    N[(2,2,1)] = 1  # f ⊗ f = 1
    return FusionCategory(2, N)
end

"""
    jordan_wigner_sign(config::LabelledConfig, i::Int, j::Int)

Compute the Jordan-Wigner sign for moving a fermion from site i to site j.
This equals (-1)^(number of fermions between i and j).

For sVec, this arises from the R-symbol R^{ff}_1 = -1.
"""
function jordan_wigner_sign(config::LabelledConfig, i::Int, j::Int)
    if i > j
        i, j = j, i  # Ensure i < j
    end
    count = sum((i < x < j ? 1 : 0 for x in config.positions); init=0)
    return (-1)^count
end

"""
    svec_hilbert_dimension(L::Int, N::Int)

Dimension of N-fermion sector on L sites for sVec.
This should equal binomial(L, N).
"""
svec_hilbert_dimension(L::Int, N::Int) = N <= L ? binomial(L, N) : 0

"""
    svec_total_dimension(L::Int)

Total Fock space dimension for sVec on L sites.
This should equal 2^L.
"""
svec_total_dimension(L::Int) = 2^L

"""
    valid_svec_charge(N::Int)

Return the valid total charge for N fermions in sVec.
Even N → charge 1 (vacuum), odd N → charge 2 (fermion).
"""
valid_svec_charge(N::Int) = iseven(N) ? 1 : 2

end # module
