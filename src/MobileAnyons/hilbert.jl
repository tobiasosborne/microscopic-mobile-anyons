# Hilbert space for mobile anyons from a fusion category C.
#
# For N anyons with labels (a₁,...,aₙ) at positions (x₁,...,xₙ),
# the internal space is Mor(1, X_{a₁} ⊗ ... ⊗ X_{aₙ}) with total
# charge c, i.e. Mor(X_c, X_{a₁} ⊗ ... ⊗ X_{aₙ}).
#
# A basis state = (config, fusion_tree, total_charge).
# Fusion trees are sequences of intermediate charges from left-to-right fusion.

"""
    FusionTree

A left-associated fusion tree for labels [a₁, a₂, ..., aₙ] → total charge c.
intermediates[k] = result of fusing a₁⊗...⊗a_{k+1} (length N-1 for N particles).
For N=0 or N=1, intermediates is empty.
"""
struct FusionTree
    config::LabelledConfig
    intermediates::Vector{Int}   # indices into simples(C)
    total_charge::Int            # index into simples(C)
end

"""
    AnyonBasis

Full basis for mobile anyons on L sites using category C.
Organized by (N, c) sectors.
"""
struct AnyonBasis{T}
    L::Int
    C::T
    states::Vector{FusionTree}
    sector_ranges::Dict{Tuple{Int,Int}, UnitRange{Int}}  # (N,c) → index range
end

"""
    enumerate_fusion_trees(C, labels, c) -> Vector{Vector{Int}}

All sequences of intermediate charges for left-to-right fusion of `labels` → `c`.
Returns vectors of intermediate charge indices (into simples(C)).
"""
function enumerate_fusion_trees(C, labels::Vector{Int}, c::Int)
    S = simples(C)
    d = length(S)

    N = length(labels)
    N == 0 && return c == 1 ? [Int[]] : Vector{Int}[]
    N == 1 && return labels[1] == c ? [Int[]] : Vector{Int}[]

    trees = Vector{Int}[]

    function recurse(k::Int, partial::Vector{Int}, current_charge::Int)
        if k > N
            current_charge == c && push!(trees, copy(partial))
            return
        end
        for s in 1:d
            iszero(dim(Hom(S[current_charge] ⊗ S[labels[k]], S[s]))) && continue
            push!(partial, s)
            recurse(k + 1, partial, s)
            pop!(partial)
        end
    end

    # Start: first label fuses trivially to itself
    recurse(2, Int[], labels[1])
    return trees
end

"""
    build_basis(L, C; hardcore=true) -> AnyonBasis

Build complete basis for mobile anyons on L sites.
"""
function build_basis(L::Int, C; hardcore=true)
    S = simples(C)
    d = length(S)
    states = FusionTree[]
    sector_ranges = Dict{Tuple{Int,Int}, UnitRange{Int}}()

    max_N = hardcore ? L : error("Soft-core not yet implemented")

    for N in 0:max_N
        configs = enumerate_configs_hc(L, N, C)
        for c in 1:d
            start = length(states) + 1
            for cfg in configs
                for tree in enumerate_fusion_trees(C, cfg.labels, c)
                    push!(states, FusionTree(cfg, tree, c))
                end
            end
            stop = length(states)
            stop >= start && (sector_ranges[(N, c)] = start:stop)
        end
    end

    return AnyonBasis(L, C, states, sector_ranges)
end
