# Operators for mobile anyons as morphisms in the fusion category.
#
# A 2-local operator acting on sites (j, j+1) is a morphism
# in Mor(X_a ⊗ X_b, X_c ⊗ X_d) for various label combinations.
#
# Matrix elements require F-symbol contractions to convert between
# the fusion tree basis and the local tensor product basis.
#
# TODO: This is the critical computation to implement.
# The approach:
# 1. Extract F-matrices from TensorCategories.jl associators
# 2. For each pair (bra, ket), compute the overlap via F-move sequences
# 3. Apply the local morphism in the 2-site window
# 4. F-move back to canonical fusion tree form

"""
    operator_matrix(basis::AnyonBasis, op_func) -> Matrix{ComplexF64}

Build the matrix representation of an operator on the given basis.
`op_func(C, bra::FusionTree, ket::FusionTree)` returns the matrix element.

This is a placeholder API — the hard part is implementing op_func
using F-symbol contractions from TensorCategories.jl.
"""
function operator_matrix(basis::AnyonBasis, op_func)
    d = length(basis.states)
    M = zeros(ComplexF64, d, d)
    for i in 1:d, j in 1:d
        M[i, j] = op_func(basis.C, basis.states[i], basis.states[j])
    end
    return M
end
