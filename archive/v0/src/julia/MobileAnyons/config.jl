# src/julia/MobileAnyons/config.jl
# Planning ref: §4.1
# See: docs/config_space.md

using Combinatorics

"""
    LabelledConfig

A labelled configuration of N anyons.
- positions: ordered site indices (x₁ ≤ x₂ ≤ ... ≤ xₙ)
- labels: anyon types (kⱼ ∈ {2,...,d}, where 1 = vacuum in FusionCategory)

Note: Labels use FusionCategory indexing where 1 = unit (vacuum).
Nontrivial simple objects are indexed 2 to d.
"""
struct LabelledConfig
    positions::Vector{Int}
    labels::Vector{Int}
end

n_anyons(c::LabelledConfig) = length(c.positions)

function is_valid(c::LabelledConfig, n_sites::Int, d::Int)
    N = n_anyons(c)
    length(c.labels) == N || return false
    all(2 .≤ c.labels .≤ d) || return false
    all(0 .≤ c.positions .< n_sites) || return false
    issorted(c.positions) || return false
    return true
end

is_hardcore(c::LabelledConfig) = allunique(c.positions)

"""
Enumerate all hard-core configurations with N anyons on n sites.
Labels range from 2 to d (nontrivial simples in FusionCategory indexing).
Total nontrivial types: d-1.
"""
function enumerate_configs_hc(n_sites::Int, N::Int, d::Int)
    N > n_sites && return LabelledConfig[]
    d < 2 && return LabelledConfig[]

    configs = LabelledConfig[]
    for pos in combinations(0:(n_sites-1), N)
        for labels in Iterators.product(fill(2:d, N)...)
            push!(configs, LabelledConfig(collect(pos), collect(labels)))
        end
    end
    return configs
end

"""
Number of hard-core configurations.
"""
n_configs_hc(n_sites::Int, N::Int, d::Int) = binomial(n_sites, N) * (d-1)^N

"""
Site occupation vector from configuration.
"""
function occupation_vector(c::LabelledConfig, n_sites::Int)
    occ = zeros(Int, n_sites)
    for x in c.positions
        occ[x+1] += 1  # Julia 1-indexed
    end
    return occ
end
