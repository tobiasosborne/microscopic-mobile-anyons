# src/julia/QMLattice/hamiltonian.jl
# Planning ref: §3.3.2
# See: docs/qm_lattice.md

using LinearAlgebra

"""
    embed_local_term(local_h::Matrix, i::Int, n_sites::Int, d::Int) -> Matrix

Embed a local term acting on sites i, i+1 into the full Hilbert space.

Arguments:
- local_h: operator on ℂ^d ⊗ ℂ^d (dimension d² × d²)
- i: site index (1-based for this function)
- n_sites: total number of sites  
- d: local dimension

Returns: matrix of dimension d^n_sites × d^n_sites

See: docs/qm_lattice.md, Definition 3.3.5
"""
function embed_local_term(local_h::Matrix, i::Int, n_sites::Int, d_loc::Int)
    @assert 1 ≤ i < n_sites "Site index out of range: need 1 ≤ i < n_sites"
    @assert size(local_h) == (d_loc^2, d_loc^2) "Local term has wrong dimension: expected $(d_loc^2)×$(d_loc^2), got $(size(local_h))"
    
    # Build: I ⊗ ... ⊗ I ⊗ local_h ⊗ I ⊗ ... ⊗ I
    #        (i-1 sites)              (n-i-1 sites)
    left_dim = d_loc^(i-1)
    right_dim = d_loc^(n_sites - i - 1)
    
    result = kron(Matrix{ComplexF64}(I, left_dim, left_dim), 
                  ComplexF64.(local_h),
                  Matrix{ComplexF64}(I, right_dim, right_dim))
    return result
end

"""
    nn_hamiltonian(local_h::Matrix, n_sites::Int, d::Int) -> Matrix

Build nearest-neighbour Hamiltonian from a translation-invariant local term.

H = Σᵢ hᵢ,ᵢ₊₁

See: docs/qm_lattice.md, Definition 3.3.6
"""
function nn_hamiltonian(local_h::Matrix, n_sites::Int, d_loc::Int)
    total_dim = d_loc^n_sites
    H = zeros(ComplexF64, total_dim, total_dim)
    
    for i in 1:(n_sites-1)
        H += embed_local_term(local_h, i, n_sites, d)
    end
    
    return H
end

"""
    single_site_term(op::Matrix, i::Int, n_sites::Int, d::Int) -> Matrix

Embed a single-site operator at site i into the full Hilbert space.

Arguments:
- op: operator on ℂ^d (dimension d × d)
- i: site index (1-based)
- n_sites: total number of sites
- d: local dimension
"""
function single_site_term(op::Matrix, i::Int, n_sites::Int, d::Int)
    @assert 1 ≤ i ≤ n_sites "Site index out of range"
    @assert size(op) == (d, d) "Operator has wrong dimension"
    
    left_dim = d^(i-1)
    right_dim = d^(n_sites - i)
    
    result = kron(Matrix{ComplexF64}(I, left_dim, left_dim),
                  ComplexF64.(op),
                  Matrix{ComplexF64}(I, right_dim, right_dim))
    return result
end
