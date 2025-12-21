# src/julia/MobileAnyons/hilbert.jl
# Planning ref: §4.2
# See: docs/hilbert_space.md
# Refactored to use TensorCategories.jl via FusionCategories wrapper

# Note: config.jl is included by MobileAnyons.jl before this file
# Do not include it here to avoid duplicate struct definitions

# Include the FusionCategories wrapper module (TensorCategories backend)
include("../FusionCategories/fusion_ring.jl")
using .FusionCategories: n_simples, fusion_multiplicity, fusion_coefficients, simples, one

# Type alias for any TensorCategories-compatible category
# Uses duck-typing: any type that supports n_simples(), fusion_multiplicity(), etc.
const AbstractFusionCategory = Any

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
    MobileAnyonHilbert{C}

Hilbert space for mobile anyons on a 1D lattice.

The category type C can be any TensorCategories-compatible type
(e.g., SixJCategory from TensorCategories.jl).
"""
struct MobileAnyonHilbert{C}
    n_sites::Int
    cat::C
    hardcore::Bool
    basis::Vector{AnyonBasisState}
    sector_ranges::Dict{Tuple{Int,Int}, UnitRange{Int}}  # (N,c) -> indices
end

"""
    enumerate_fusion_trees(cat, labels, c) -> Vector{Vector{Int}}

Enumerate fusion trees for labels → charge c.
Returns list of intermediate charge sequences.

Uses TensorCategories.jl's fusion_multiplicity via FusionCategories wrapper.
Labels are 1-based indices into simples(cat).
"""
function enumerate_fusion_trees(cat::AbstractFusionCategory, labels::Vector{Int}, c::Int)
    d = n_simples(cat)

    isempty(labels) && return c == 1 ? [Int[]] : Vector{Int}[]
    length(labels) == 1 && return labels[1] == c ? [Int[]] : Vector{Int}[]

    trees = Vector{Int}[]
    # Recursive: fuse first two, then continue
    a, b = labels[1], labels[2]
    for ab in 1:d
        fusion_multiplicity(cat, a, b, ab) == 0 && continue
        rest = vcat([ab], labels[3:end])
        for subtree in enumerate_fusion_trees(cat, rest, c)
            push!(trees, vcat([ab], subtree))
        end
    end
    return trees
end

"""
    build_sector_basis(n_sites, cat, N, c; hardcore=true) -> Vector{AnyonBasisState}

Build full basis for (N, c) sector.

Uses TensorCategories.jl via FusionCategories wrapper for fusion rules.
"""
function build_sector_basis(n_sites::Int, cat::AbstractFusionCategory, N::Int, c::Int; hardcore=true)
    d = n_simples(cat)
    basis = AnyonBasisState[]
    configs = hardcore ? enumerate_configs_hc(n_sites, N, d) :
                         error("Soft-core not implemented")

    for config in configs
        for tree in enumerate_fusion_trees(cat, config.labels, c)
            push!(basis, AnyonBasisState(config, tree, c))
        end
    end
    return basis
end

"""
    MobileAnyonHilbert(n_sites, cat; hardcore=true)

Construct full Hilbert space for mobile anyons.

# Arguments
- `n_sites::Int`: Number of lattice sites
- `cat`: A TensorCategories-compatible fusion category (e.g., from fibonacci_category())
- `hardcore::Bool`: If true, at most one anyon per site

# Returns
- `MobileAnyonHilbert{C}`: The constructed Hilbert space
"""
function MobileAnyonHilbert(n_sites::Int, cat::C; hardcore=true) where C
    d = n_simples(cat)
    basis = AnyonBasisState[]
    sector_ranges = Dict{Tuple{Int,Int}, UnitRange{Int}}()

    max_N = hardcore ? n_sites : error("Need cutoff for soft-core")

    for N in 0:max_N
        for c in 1:d
            start_idx = length(basis) + 1
            sector_basis = build_sector_basis(n_sites, cat, N, c; hardcore)
            append!(basis, sector_basis)
            if !isempty(sector_basis)
                sector_ranges[(N, c)] = start_idx:length(basis)
            end
        end
    end

    return MobileAnyonHilbert{C}(n_sites, cat, hardcore, basis, sector_ranges)
end

dim(hilb::MobileAnyonHilbert) = length(hilb.basis)
dim(hilb::MobileAnyonHilbert, N::Int, c::Int) = length(get(hilb.sector_ranges, (N,c), 1:0))
