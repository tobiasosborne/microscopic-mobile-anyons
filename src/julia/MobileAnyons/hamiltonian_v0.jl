# src/julia/MobileAnyons/hamiltonian_v0.jl
# Particle-conserving local Hamiltonians for mobile anyons
# Planning ref: §5.1.1
#
# See: docs/hamiltonian_v0.md

using LinearAlgebra

"""
    NumberConservingTerm

A nearest-neighbour term that conserves particle number.
Acts on sites (site, site+1).

# Fields
- `site::Int`: Left site index (0-based)
- `components::Dict{Tuple{Tuple{Int,Int}, Tuple{Int,Int}}, ComplexF64}`:
  Maps (source, target) => coefficient, where source/target are
  (label_left, label_right) with 0 = vacuum (𝟙), and 1,2,... = simple objects.

# Example
A hopping term that moves anyon type 1 rightward with amplitude t:
```julia
components = Dict(
    ((1, 0), (0, 1)) => t,     # hop right
    ((0, 1), (1, 0)) => conj(t) # hop left (Hermitian conjugate)
)
term = NumberConservingTerm(0, components)
```
"""
struct NumberConservingTerm
    site::Int
    components::Dict{Tuple{Tuple{Int,Int}, Tuple{Int,Int}}, ComplexF64}
end

"""
    NumberConservingTerm(site::Int)

Create an empty number-conserving term at the given site.
"""
NumberConservingTerm(site::Int) = NumberConservingTerm(site, Dict{Tuple{Tuple{Int,Int}, Tuple{Int,Int}}, ComplexF64}())

"""
    particle_count(label::Int)

Return 0 if label is vacuum (0), else 1.
"""
particle_count(label::Int) = label == 0 ? 0 : 1

"""
    source_particle_count(source::Tuple{Int,Int})

Count particles in source configuration.
"""
source_particle_count(source::Tuple{Int,Int}) = particle_count(source[1]) + particle_count(source[2])

"""
    is_number_conserving(term::NumberConservingTerm)

Check that all components conserve particle number.
Returns true if for every transition (source -> target),
the number of nontrivial particles is the same.
"""
function is_number_conserving(term::NumberConservingTerm)
    for ((a, b), (c, d)) in keys(term.components)
        n_source = particle_count(a) + particle_count(b)
        n_target = particle_count(c) + particle_count(d)
        if n_source != n_target
            return false
        end
    end
    return true
end

"""
    is_hermitian(term::NumberConservingTerm)

Check that the term is Hermitian: for each (A,B)->c component,
there exists a (B,A)->conj(c) component.
"""
function is_hermitian(term::NumberConservingTerm; atol=1e-12)
    for (k, v) in term.components
        (source, target) = k
        conj_key = (target, source)
        if !haskey(term.components, conj_key)
            return false
        end
        if abs(term.components[conj_key] - conj(v)) > atol
            return false
        end
    end
    return true
end

"""
    add_component!(term::NumberConservingTerm, source::Tuple{Int,Int},
                   target::Tuple{Int,Int}, coeff::Number)

Add a morphism component to the term.
"""
function add_component!(term::NumberConservingTerm, source::Tuple{Int,Int},
                        target::Tuple{Int,Int}, coeff::Number)
    key = (source, target)
    if haskey(term.components, key)
        term.components[key] += coeff
    else
        term.components[key] = ComplexF64(coeff)
    end
    return term
end

"""
    make_hermitian!(term::NumberConservingTerm)

Add Hermitian conjugate components to make the term Hermitian.
"""
function make_hermitian!(term::NumberConservingTerm)
    # Collect all keys first to avoid modifying dict during iteration
    original = collect(term.components)
    for ((source, target), coeff) in original
        conj_key = (target, source)
        if !haskey(term.components, conj_key)
            term.components[conj_key] = conj(coeff)
        end
    end
    return term
end

"""
    LocalHamiltonian

A number-conserving nearest-neighbour Hamiltonian for mobile anyons.

# Fields
- `n_sites::Int`: Number of lattice sites
- `terms::Vector{NumberConservingTerm}`: Local terms, one per bond
"""
struct LocalHamiltonian
    n_sites::Int
    terms::Vector{NumberConservingTerm}
end

"""
    n_bonds(H::LocalHamiltonian)

Number of bonds (nearest-neighbour pairs) in the Hamiltonian.
"""
n_bonds(H::LocalHamiltonian) = H.n_sites - 1

"""
    is_number_conserving(H::LocalHamiltonian)

Check if the entire Hamiltonian conserves particle number.
"""
is_number_conserving(H::LocalHamiltonian) = all(is_number_conserving, H.terms)

"""
    is_hermitian(H::LocalHamiltonian)

Check if the entire Hamiltonian is Hermitian.
"""
is_hermitian(H::LocalHamiltonian) = all(is_hermitian, H.terms)

"""
    uniform_nn_hamiltonian(n_sites::Int, local_components::Dict)

Build a uniform nearest-neighbour Hamiltonian from a single local term.
The same components are used at every bond.

# Arguments
- `n_sites::Int`: Number of lattice sites
- `local_components::Dict`: Components dictionary mapping
  (source, target) => coefficient
"""
function uniform_nn_hamiltonian(n_sites::Int, local_components::Dict)
    terms = [NumberConservingTerm(j, copy(local_components)) for j in 0:(n_sites-2)]
    return LocalHamiltonian(n_sites, terms)
end

# === Factory functions for standard terms ===

"""
    hopping_term(site::Int, anyon_type::Int, amplitude::Number=1.0)

Create a hopping term for anyon of given type at the specified bond.
Includes both left and right hopping to make Hermitian.

# Process
- `(anyon, vacuum) <-> (vacuum, anyon)`
"""
function hopping_term(site::Int, anyon_type::Int, amplitude::Number=1.0)
    @assert anyon_type > 0 "Anyon type must be nonzero (vacuum cannot hop)"
    t = ComplexF64(amplitude)
    components = Dict{Tuple{Tuple{Int,Int}, Tuple{Int,Int}}, ComplexF64}(
        ((anyon_type, 0), (0, anyon_type)) => t,       # hop right
        ((0, anyon_type), (anyon_type, 0)) => conj(t)  # hop left
    )
    return NumberConservingTerm(site, components)
end

"""
    identity_term(site::Int, source::Tuple{Int,Int}, coefficient::Number=1.0)

Create an identity/diagonal term for a specific configuration.

# Process
- `(a, b) -> (a, b)` with given coefficient
"""
function identity_term(site::Int, source::Tuple{Int,Int}, coefficient::Number=1.0)
    components = Dict{Tuple{Tuple{Int,Int}, Tuple{Int,Int}}, ComplexF64}(
        (source, source) => ComplexF64(coefficient)
    )
    return NumberConservingTerm(site, components)
end

"""
    two_anyon_interaction(site::Int, type_a::Int, type_b::Int, energy::Real)

Create a diagonal interaction term when anyons of types a, b occupy
adjacent sites. This is a potential energy term (no dynamics).

# Process
- `(a, b) -> (a, b)` with energy coefficient
"""
function two_anyon_interaction(site::Int, type_a::Int, type_b::Int, energy::Real)
    @assert type_a > 0 && type_b > 0 "Both anyon types must be nonzero"
    return identity_term(site, (type_a, type_b), energy)
end
