# src/julia/MobileAnyons/hilbert.jl
# Planning ref: §4.2
# See: docs/hilbert_space.md

include("config.jl")

"""
    FusionCategory

Minimal fusion category data for Hilbert space construction.
"""
struct FusionCategory
    d::Int                                      # number of simple objects
    N::Dict{Tuple{Int,Int,Int}, Int}           # fusion multiplicities N[a,b,c]
end

fusion_mult(cat::FusionCategory, a, b, c) = get(cat.N, (a,b,c), 0)

"""
    AnyonBasisState

Basis state for mobile anyon Hilbert space.
"""
struct AnyonBasisState
    config::LabelledConfig
    fusion_tree::Vector{Int}    # intermediate charges in left-to-right fusion
    total_charge::Int
end

"""
    MobileAnyonHilbert

Hilbert space for mobile anyons on a 1D lattice.
"""
struct MobileAnyonHilbert
    n_sites::Int
    cat::FusionCategory
    hardcore::Bool
    basis::Vector{AnyonBasisState}
    sector_ranges::Dict{Tuple{Int,Int}, UnitRange{Int}}  # (N,c) -> indices
end

"""
Enumerate fusion trees for labels → charge c.
Returns list of intermediate charge sequences.
"""
function enumerate_fusion_trees(cat::FusionCategory, labels::Vector{Int}, c::Int)
    isempty(labels) && return c == 1 ? [Int[]] : Vector{Int}[]
    length(labels) == 1 && return labels[1] == c ? [Int[]] : Vector{Int}[]
    
    trees = Vector{Int}[]
    # Recursive: fuse first two, then continue
    a, b = labels[1], labels[2]
    for ab in 1:cat.d
        fusion_mult(cat, a, b, ab) == 0 && continue
        rest = vcat([ab], labels[3:end])
        for subtree in enumerate_fusion_trees(cat, rest, c)
            push!(trees, vcat([ab], subtree))
        end
    end
    return trees
end

"""
Build full basis for (N, c) sector.
"""
function build_sector_basis(n_sites::Int, cat::FusionCategory, N::Int, c::Int; hardcore=true)
    basis = AnyonBasisState[]
    configs = hardcore ? enumerate_configs_hc(n_sites, N, cat.d) : 
                         error("Soft-core not implemented")
    
    for config in configs
        for tree in enumerate_fusion_trees(cat, config.labels, c)
            push!(basis, AnyonBasisState(config, tree, c))
        end
    end
    return basis
end

"""
Construct full Hilbert space.
"""
function MobileAnyonHilbert(n_sites::Int, cat::FusionCategory; hardcore=true)
    basis = AnyonBasisState[]
    sector_ranges = Dict{Tuple{Int,Int}, UnitRange{Int}}()
    
    max_N = hardcore ? n_sites : error("Need cutoff for soft-core")
    
    for N in 0:max_N
        for c in 1:cat.d
            start_idx = length(basis) + 1
            sector_basis = build_sector_basis(n_sites, cat, N, c; hardcore)
            append!(basis, sector_basis)
            if !isempty(sector_basis)
                sector_ranges[(N, c)] = start_idx:length(basis)
            end
        end
    end
    
    return MobileAnyonHilbert(n_sites, cat, hardcore, basis, sector_ranges)
end

dim(hilb::MobileAnyonHilbert) = length(hilb.basis)
dim(hilb::MobileAnyonHilbert, N::Int, c::Int) = length(get(hilb.sector_ranges, (N,c), 1:0))
