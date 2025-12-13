module FusionCategories

export FusionRing, fusion_product, is_associative, has_valid_duality, FusionCategory, fusion_multiplicity, associator_value, braiding_value, is_rigid, morphism_dim, multiplicity_basis_labels

"""
    FusionRing(basis::Vector{Symbol}, unit::Symbol, dual::Dict{Symbol,Symbol},
               N::Dict{NTuple{3,Symbol},Int})

A fusion ring as per Etingof–Nikshych–Ostrik (2005), Definition 3.1.

# Fields
- `basis`: Basis elements {X_i | i ∈ I}, with X_0 = unit
- `unit`: The unit element (X_0 = 𝟙)
- `dual`: The involution map i ↦ i*, implementing duality
- `N`: Fusion coefficients N[(i,j,k)] = N_{ij}^k ∈ ℤ_{≥0}

# Axioms
1. X_0 is the unit
2. X_i X_j = ∑_k N_{ij}^k X_k with N_{ij}^k ≥ 0
3. N_{i,i*}^0 = 1 and N_{ij}^0 = 0 for j ≠ i*

See: docs/fusion_ring.md, Definition 3.1
"""
struct FusionRing
    basis::Vector{Symbol}
    unit::Symbol
    dual::Dict{Symbol,Symbol}
    N::Dict{NTuple{3,Symbol},Int}
    function FusionRing(basis, unit, dual, N)
        @assert unit ∈ basis "Unit must be in basis"
        @assert all(dual[dual[x]] == x for x in basis) "Dual must be an involution"
        new(basis, unit, dual, N)
    end
end

"""
    fusion_product(R::FusionRing, a::Symbol, b::Symbol) -> Dict{Symbol,Int}

Compute X_a · X_b = ∑_c N_{ab}^c X_c, returning coefficients as a dictionary.
"""
fusion_product(R::FusionRing, a::Symbol, b::Symbol) =
    Dict(c => get(R.N, (a, b, c), 0) for c in R.basis)

"""
    is_associative(R::FusionRing) -> Bool

Check if ∑_e N_{ij}^e N_{ek}^ℓ = ∑_e N_{jk}^e N_{ie}^ℓ for all i,j,k,ℓ.
"""
is_associative(R::FusionRing) = all(
    sum(get(R.N, (i, j, e), 0) * get(R.N, (e, k, ℓ), 0) for e in R.basis) ==
    sum(get(R.N, (j, k, e), 0) * get(R.N, (i, e, ℓ), 0) for e in R.basis)
    for i in R.basis, j in R.basis, k in R.basis, ℓ in R.basis
)

"""
    has_valid_duality(R::FusionRing) -> Bool

Check that N_{i,i*}^0 = 1 for all i (and implicitly N_{ij}^0 = 0 for j ≠ i*).
"""
has_valid_duality(R::FusionRing) = all(
    get(R.N, (i, R.dual[i], R.unit), 0) == 1 for i in R.basis
)


"""
    FusionCategory(simples, unit, dual, N; F=Dict(), R=Dict())

Semisimple rigid monoidal data: simple labels `simples`, unit label `unit`,
dual map `dual[a] = a_dual`, fusion multiplicities `N[(a,b,c)] = N_{ab}^c`, and
optional associator/braiding tensors `F` and `R`.
"""
struct FusionCategory
    simples::Vector{Symbol}
    unit::Symbol
    dual::Dict{Symbol,Symbol}
    N::Dict{NTuple{3,Symbol},Int}
    F::Dict{NTuple{6,Symbol},ComplexF64}
    R::Dict{NTuple{3,Symbol},ComplexF64}
    function FusionCategory(simples, unit, dual, N;
                            F=Dict{NTuple{6,Symbol},ComplexF64}(),
                            R=Dict{NTuple{3,Symbol},ComplexF64}())
        new(simples, unit, dual, N, F, R)
    end
end

fusion_multiplicity(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) =
    get(C.N, (a, b, c), 0)

associator_value(C::FusionCategory, a, b, c, d, e, f) =
    get(C.F, (a, b, c, d, e, f), 0 + 0im)

braiding_value(C::FusionCategory, a, b, c) =
    get(C.R, (a, b, c), 0 + 0im)

"""
    is_rigid(C)

Checks dual involutivity and existence of coevaluation-evaluation channels.
"""
function is_rigid(C::FusionCategory)
    all(C.dual[C.dual[x]] == x for x in C.simples) &&
    all(fusion_multiplicity(C, x, C.dual[x], C.unit) == 1 for x in C.simples)
end

"""
    morphism_dim(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) -> Int

Return dim Mor(X_a ⊗ X_b, X_c) = N_{ab}^c.
See: docs/morphism_spaces.md, Definition 3.4.
"""
morphism_dim(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) =
    fusion_multiplicity(C, a, b, c)

"""
    multiplicity_basis_labels(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol)
        -> Vector{Tuple{Symbol,Symbol,Symbol,Int}}

Return abstract labels for a multiplicity basis f_{ab->c}^{(mu)} with
mu = 1,...,N_{ab}^c. This is basis-independent bookkeeping only.
See: docs/morphism_spaces.md, Definition 3.4.
"""
function multiplicity_basis_labels(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol)
    n = fusion_multiplicity(C, a, b, c)
    [(a, b, c, mu) for mu in 1:n]
end

end # module