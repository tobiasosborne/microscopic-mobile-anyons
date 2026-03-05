# src/julia/QMLattice/QMLattice.jl
# Module for quantum mechanics on lattice systems
# Planning ref: §3.3

module QMLattice

using LinearAlgebra

export HilbertSpace, is_hermitian, normalise, inner_product, expectation
export embed_local_term, nn_hamiltonian, single_site_term
export spectrum, ground_state, spectral_gap, partition_function, thermal_state, free_energy
export tensor_product, ⊗, multisite_space, tensor_power, partial_trace

include("basics.jl")
include("hamiltonian.jl")
include("spectrum.jl")
include("tensor.jl")

end # module
