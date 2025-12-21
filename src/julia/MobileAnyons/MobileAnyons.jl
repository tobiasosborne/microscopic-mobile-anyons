# src/julia/MobileAnyons/MobileAnyons.jl
# Module for mobile anyons from fusion categories
# Planning ref: §4
# Refactored to use TensorCategories.jl via FusionCategories wrapper

module MobileAnyons

using LinearAlgebra
using Combinatorics

# Configuration space exports
export LabelledConfig, n_anyons, is_valid, is_hardcore
export enumerate_configs_hc, n_configs_hc, occupation_vector

# Hilbert space exports (using TensorCategories backend)
export AnyonBasisState, MobileAnyonHilbert, dim
export enumerate_fusion_trees, build_sector_basis

# Operator exports
export MorphismTerm, LocalOperator, is_particle_conserving
export hopping_right, hopping_left, interaction_term

# Hamiltonian exports
export NumberConservingTerm, LocalHamiltonian
export is_number_conserving, is_hermitian, add_component!, make_hermitian!
export uniform_nn_hamiltonian, hopping_term, identity_term, two_anyon_interaction, n_bonds

# sVec helper functions
export jordan_wigner_sign
export svec_hilbert_dimension, svec_total_dimension, valid_svec_charge

# Re-export TensorCategories wrappers for convenience
export fibonacci_category, ising_category, svec_category
export n_simples, fusion_multiplicity, fusion_coefficients

include("config.jl")
include("hilbert.jl")
include("operators.jl")
include("hamiltonian_v0.jl")

# Re-export category constructors from FusionCategories module
using .FusionCategories: fibonacci_category, ising_category, svec_category
using .FusionCategories: n_simples, fusion_multiplicity, fusion_coefficients

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
