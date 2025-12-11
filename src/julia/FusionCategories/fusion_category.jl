# src/julia/FusionCategories/fusion_category.jl
# Planning ref: §3.1.2
# See: docs/fusion_category.md

export FusionCategory, fusion_multiplicity, associator_value, braiding_value,
       is_rigid, morphism_dim, multiplicity_basis_labels

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
    all(fusion_multiplicity(C, x, C.dual[x], C.unit) > 0 for x in C.simples)
end

"""
    morphism_dim(C::FusionCategory, a::Symbol, b::Symbol, c::Symbol) -> Int

Return dim Mor(X_a \\otimes X_b, X_c) = N_{ab}^c.
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
