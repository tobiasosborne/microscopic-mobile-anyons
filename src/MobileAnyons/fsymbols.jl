# F-symbol extraction from TensorCategories.jl.
#
# F-symbols (6j-symbols) encode the associator of the fusion category:
#   [F^{abc}_d]_{ef} = matrix element of the associator (a⊗b)⊗c → a⊗(b⊗c)
#   restricted to total charge d, with left intermediate e and right intermediate f.
#
# We use TensorCategories.jl's six_j_symbols(C) which returns a 4D array of matrices
# indexed by simple object indices.

"""
    FSymbolCache{T}

Cached F-symbol data for a fusion category. Stores both exact and numerical F-matrices.
"""
struct FSymbolCache{T}
    C::T
    exact::Array{<:MatElem, 4}    # six_j_symbols(C)[a,b,c,d]
    numerical::Dict{NTuple{4,Int}, Matrix{ComplexF64}}
end

"""
    build_fsymbol_cache(C) -> FSymbolCache

Compute and cache all F-symbols for category C.
"""
function build_fsymbol_cache(C)
    sj = six_j_symbols(C)
    d = length(simples(C))
    numerical = Dict{NTuple{4,Int}, Matrix{ComplexF64}}()

    for a in 1:d, b in 1:d, c in 1:d, dd in 1:d
        F = sj[a, b, c, dd]
        r, s = size(F)
        r > 0 && s > 0 || continue
        numerical[(a, b, c, dd)] = _to_complex_matrix(C, F)
    end

    return FSymbolCache(C, sj, numerical)
end

"""
    f_matrix(cache, a, b, c, d) -> Matrix{ComplexF64}

Return the numerical F-matrix [F^{abc}_d]_{ef} as a ComplexF64 matrix.
Rows indexed by left-association intermediates e, columns by right-association intermediates f.
Returns empty 0×0 matrix if the F-symbol vanishes.
"""
function f_matrix(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int)
    return get(cache.numerical, (a, b, c, d), Matrix{ComplexF64}(undef, 0, 0))
end

"""
    f_symbol(cache, a, b, c, d, e_idx, f_idx) -> ComplexF64

Return a single F-symbol entry [F^{abc}_d]_{e_idx, f_idx}.
Indices e_idx, f_idx are 1-based into the rows/columns of the F-matrix.
"""
function f_symbol(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int,
                  e_idx::Int, f_idx::Int)
    F = f_matrix(cache, a, b, c, d)
    size(F, 1) == 0 && return zero(ComplexF64)
    return F[e_idx, f_idx]
end

"""
    fusion_channels(cache, a, b) -> Vector{Int}

Return indices of simple objects c such that N_{ab}^c > 0.
"""
function fusion_channels(cache::FSymbolCache, a::Int, b::Int)
    S = simples(cache.C)
    d = length(S)
    channels = Int[]
    for c in 1:d
        !iszero(dim(Hom(S[a] ⊗ S[b], S[c]))) && push!(channels, c)
    end
    return channels
end

"""
    left_intermediates(cache, a, b, c, d) -> Vector{Int}

Return indices e such that N_{ab}^e > 0 and N_{ec}^d > 0 (rows of F-matrix).
"""
function left_intermediates(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int)
    ab_channels = fusion_channels(cache, a, b)
    return filter(e -> d in fusion_channels(cache, e, c), ab_channels)
end

"""
    right_intermediates(cache, a, b, c, d) -> Vector{Int}

Return indices f such that N_{bc}^f > 0 and N_{af}^d > 0 (cols of F-matrix).
"""
function right_intermediates(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int)
    bc_channels = fusion_channels(cache, b, c)
    return filter(f -> d in fusion_channels(cache, a, f), bc_channels)
end

# --- Numerical conversion internals ---

function _to_complex_matrix(C, F::MatElem)
    r, c = size(F)
    M = Matrix{ComplexF64}(undef, r, c)
    for i in 1:r, j in 1:c
        M[i, j] = _to_complex(C, F[i, j])
    end
    return M
end

function _to_complex(C, x::QQFieldElem)
    return ComplexF64(Float64(x))
end

function _to_complex(C, x::ZZRingElem)
    return ComplexF64(Float64(x))
end

function _to_complex(C, x::AbsSimpleNumFieldElem)
    K = base_ring(C)
    emb = _physical_embedding(K)
    val = emb(x)
    return ComplexF64(real(val), imag(val))
end

function _to_complex(C, x::QQBarFieldElem)
    return ComplexF64(Float64(real(x)), Float64(imag(x)))
end

# Fallback for other number types
function _to_complex(C, x)
    return ComplexF64(Float64(x))
end

"""
    _physical_embedding(K::AbsSimpleNumField) -> embedding

Choose the "physical" embedding of a number field into the complexes.
For Fibonacci (degree 2): picks the embedding where the golden ratio φ > 1.
For general fields: picks the embedding with largest real part of the generator.
"""
function _physical_embedding(K::AbsSimpleNumField)
    embs = complex_embeddings(K)
    length(embs) == 1 && return embs[1]

    # Heuristic: pick the embedding where gen(K) has the largest real part.
    # For Fibonacci, this gives φ ≈ 1.618 rather than -0.618.
    best_idx = argmax(Float64(real(e(gen(K)))) for e in embs)
    return embs[best_idx]
end
