module MobileAnyons

using TensorCategories, Oscar
using LinearAlgebra, Combinatorics

include("config.jl")
include("hilbert.jl")
include("operators.jl")

export LabelledConfig, enumerate_configs_hc
export FusionTree, AnyonBasis, build_basis, enumerate_fusion_trees
export operator_matrix

end # module
