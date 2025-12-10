# src/julia/FusionCategories/fusion_category.jl
# Planning ref: §3.1.2
# See: docs/fusion_category.md

export FusionCategory, fusion_multiplicity, associator_value, braiding_value, is_rigid

"""
    FusionCategory(simples, unit, dual, N; F=Dict(), R=Dict())

Semisimple rigid monoidal data: simple labels `simples`, unit label `unit`,
dual map `dual[a] = ā`, fusion multiplicities `N[(a,b,c)] = N_{ab}^c`, and
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

