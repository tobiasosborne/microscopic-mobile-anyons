# Classical configuration space for mobile anyons on a 1D lattice.
#
# A configuration is an ordered list of (position, anyon_type) pairs.
# Hard-core: at most one anyon per site.
# Labels are 1-based indices into simples(C); label 1 = vacuum.

using Combinatorics

"""
    LabelledConfig(positions, labels)

N anyons at ordered positions with anyon type labels.
Positions are 1-based site indices. Labels are indices into simples(C),
where 1 = vacuum (trivial object).
"""
struct LabelledConfig
    positions::Vector{Int}   # 1-based site indices, sorted
    labels::Vector{Int}      # indices into simples(C), ≥ 2 for nontrivial
end

n_anyons(c::LabelledConfig) = length(c.positions)

"""
    enumerate_configs_hc(L, N, C) -> Vector{LabelledConfig}

All hard-core configs of N anyons on L sites, using nontrivial simples from C.
"""
function enumerate_configs_hc(L::Int, N::Int, C)
    S = simples(C)
    d = length(S)  # total simples including vacuum
    d < 2 && return LabelledConfig[]
    N > L && return LabelledConfig[]
    N == 0 && return [LabelledConfig(Int[], Int[])]

    configs = LabelledConfig[]
    for pos in combinations(1:L, N)
        for labels in Iterators.product(fill(2:d, N)...)
            push!(configs, LabelledConfig(collect(pos), collect(labels)))
        end
    end
    return configs
end
