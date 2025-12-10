module FusionCategories

export FusionRing, fusion_product, is_associative

include("fusion_category.jl")

"""
    FusionRing(basis::Vector{Symbol}, N::Dict{NTuple{3,Symbol},Int})

Grothendieck fusion ring with basis elements and non-negative integer structure
constants `N[(a,b,c)] = N_{ab}^c`. Unit is `:one` by convention.
Refs: docs/fusion_ring.md, Definition 3.1.
"""
struct FusionRing
    basis::Vector{Symbol}
    N::Dict{NTuple{3,Symbol},Int}
end

fusion_product(R::FusionRing, a::Symbol, b::Symbol) =
    Dict(c => get(R.N, (a, b, c), 0) for c in R.basis)

is_associative(R::FusionRing) = all(
    sum(get(R.N, (a, b, e), 0) * get(R.N, (e, c, f), 0) for e in R.basis) ==
    sum(get(R.N, (b, c, e), 0) * get(R.N, (a, e, f), 0) for e in R.basis)
    for a in R.basis, b in R.basis, c in R.basis, f in R.basis
)

end # module
