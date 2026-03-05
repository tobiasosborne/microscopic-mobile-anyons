"""
    Temperley-Lieb Category Module

    Provides TL category structures for the mobile anyons project.
    Complements the TensorCategories.jl package with TL-specific utilities.

    See: docs/temperley_lieb.md (§3.1a)
"""
module TemperleyLieb

using LinearAlgebra

export TLCategory, qnum, qfac, qbinom
export max_spin, quantum_dim, fusion_rule_tl
export fibonacci_tl, ising_tl, percolation_tl, potts3_tl

#==============================================================================#
#                         TL Category Data                                      #
#==============================================================================#

"""
    TLCategory

Temperley-Lieb category parametrised by quantum parameter q.

At roots of unity q = exp(iπ/p), the category truncates to p-1 simple objects
(spins 0, 1/2, 1, ..., (p-2)/2).

Fields:
- q: quantum parameter (e.g., exp(iπ/p) for roots of unity)
- δ: loop value = -(q + q⁻¹) = -2cos(π/p)
- p: truncation level (0 for generic q)
- n: loop fugacity = q + q⁻¹ = 2cos(π/p)

Refs: docs/temperley_lieb.md, Definition A3.1a.1
"""
struct TLCategory
    q::ComplexF64
    δ::ComplexF64
    p::Int
    n::ComplexF64

    function TLCategory(q::Number)
        n = q + 1/q
        δ = -n
        # Detect root of unity
        p = 0
        for k in 3:100
            if abs(q - exp(im * π / k)) < 1e-10
                p = k
                break
            end
        end
        new(ComplexF64(q), ComplexF64(δ), p, ComplexF64(n))
    end
end

# Convenience constructors for standard cases
"""Create TL category at root of unity q = exp(iπ/p)."""
TLCategory(; p::Int) = TLCategory(exp(im * π / p))

"""Fibonacci anyons: p=5, n=φ (golden ratio), c=7/10"""
fibonacci_tl() = TLCategory(p=5)

"""Ising anyons: p=4, n=√2, c=1/2"""
ising_tl() = TLCategory(p=4)

"""Percolation: p=3, n=1, c=0"""
percolation_tl() = TLCategory(p=3)

"""3-state Potts: p=6, n=√3, c=4/5"""
potts3_tl() = TLCategory(p=6)

#==============================================================================#
#                         Quantum Numbers                                       #
#==============================================================================#

"""
    qnum(tl::TLCategory, n::Int) -> ComplexF64

Quantum integer: [n]_q = (q^n - q^{-n}) / (q - q^{-1})

At q = exp(iπ/p): [n]_q = sin(nπ/p) / sin(π/p)
"""
function qnum(tl::TLCategory, n::Int)
    q = tl.q
    abs(q - 1) < 1e-10 && return ComplexF64(n)
    (q^n - q^(-n)) / (q - q^(-1))
end

"""
    qfac(tl::TLCategory, n::Int) -> ComplexF64

Quantum factorial: [n]!_q = [1]_q [2]_q ⋯ [n]_q
"""
function qfac(tl::TLCategory, n::Int)
    n <= 0 && return one(ComplexF64)
    prod(qnum(tl, k) for k in 1:n)
end

"""
    qbinom(tl::TLCategory, n::Int, k::Int) -> ComplexF64

Quantum binomial coefficient: [n choose k]_q = [n]!_q / ([k]!_q [n-k]!_q)
"""
function qbinom(tl::TLCategory, n::Int, k::Int)
    (k < 0 || k > n) && return zero(ComplexF64)
    qfac(tl, n) / (qfac(tl, k) * qfac(tl, n - k))
end

#==============================================================================#
#                         Simple Objects and Fusion                             #
#==============================================================================#

"""
    max_spin(tl::TLCategory) -> Union{Float64, Inf}

Maximum spin before truncation.
At roots of unity q = exp(iπ/p): j_max = (p-2)/2
For generic q: returns Inf
"""
max_spin(tl::TLCategory) = tl.p > 0 ? (tl.p - 2) / 2 : Inf

"""
    n_simples(tl::TLCategory) -> Int

Number of simple objects. Only defined at roots of unity.
"""
function n_simples(tl::TLCategory)
    tl.p == 0 && error("n_simples undefined for generic q")
    tl.p - 1
end

"""
    quantum_dim(tl::TLCategory, j) -> ComplexF64

Quantum dimension of spin-j object: d_j = [2j+1]_q
"""
quantum_dim(tl::TLCategory, j) = qnum(tl, Int(2j + 1))

"""
    fusion_rule_tl(tl::TLCategory, j1, j2) -> Vector{Rational{Int}}

Compute fusion product j1 ⊗ j2 for TL/SU(2)_q.

Returns list of allowed spins in the fusion:
j1 ⊗ j2 = ⊕_{j=|j1-j2|}^{min(j1+j2, j_max - j1 - j2)} j

where j_max = (p-2)/2 at roots of unity.
"""
function fusion_rule_tl(tl::TLCategory, j1, j2)
    j_min = abs(j1 - j2)
    j_max_fusion = j1 + j2

    # Apply truncation at roots of unity
    if tl.p > 0
        j_max_allowed = (tl.p - 2) // 2
        j_max_fusion = min(j_max_fusion, j_max_allowed, tl.p - 2 - j1 - j2)
    end

    result = Rational{Int}[]
    j = j_min
    while j <= j_max_fusion
        push!(result, Rational{Int}(j))
        j += 1
    end
    result
end

#==============================================================================#
#                         Central Charge                                        #
#==============================================================================#

"""
    central_charge(tl::TLCategory) -> Float64

Central charge of the CFT corresponding to TL at roots of unity:
c = 1 - 6(p-1)²/p

This corresponds to minimal model M(p, p-1).
"""
function central_charge(tl::TLCategory)
    tl.p == 0 && error("central_charge requires root of unity")
    p = tl.p
    1 - 6 * (p - 1)^2 / p
end

end # module
