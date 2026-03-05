#!/usr/bin/env julia
"""
Comparison: Pure Temperley-Lieb vs Fusion Category (Rep U_q(sl_2))

Two different structures with different counting:

1. PURE TL (no trivalent vertices):
   - Objects: n = number of strands (0, 1, 2, ...)
   - Morphisms: planar diagrams (cups, caps, through-lines)
   - Hom(0, 2n) = ways to create 2n strands from vacuum = C_n (Catalan)
   - Key: strands must PAIR UP, no "fusion to different charge"

2. REP(U_q(sl_2)) / Fusion picture:
   - Objects: spin j = 0, 1/2, 1, 3/2, ...
   - Morphisms: include trivalent fusion/splitting vertices
   - τ ⊗ τ = 0 ⊕ 1 is a genuine fusion with intermediate channels
   - Counting: Fibonacci numbers

The confusion: TL algebra generators e_i look like they're "fusing two strands"
but actually they're creating a cup-cap pair, not a fusion vertex.
"""

using Combinatorics

println("="^70)
println("PURE TEMPERLEY-LIEB: Strand Pairings")
println("="^70)

println("""
In pure TL, N strand endpoints must pair up planarly.
Number of planar pairings of 2n points = Catalan number C_n

    C_n = (2n)! / ((n+1)! n!)

For N strands (N must be even to close):
    N=2: C_1 = 1   (one way to pair 2 points)
    N=4: C_2 = 2   (two planar pairings)
    N=6: C_3 = 5   (five planar pairings)
""")

"""
    catalan(n)

n-th Catalan number: C_n = (2n)! / ((n+1)! * n!)
"""
catalan(n) = binomial(2n, n) ÷ (n + 1)

"""
    planar_pairings(n)

Generate all planar pairings of 2n points labeled 1, 2, ..., 2n.
A pairing is planar if no two pairs cross.
"""
function planar_pairings(n)
    n == 0 && return [Tuple{Int,Int}[]]
    n == 1 && return [[(1, 2)]]

    # Recursive construction using Catalan recurrence
    result = Vector{Vector{Tuple{Int,Int}}}()

    # Point 1 must pair with some point 2k (even position for planarity)
    # Then we have k-1 pairs inside and n-k pairs outside
    for k in 1:n
        partner = 2k
        inner = planar_pairings(k - 1)
        outer = planar_pairings(n - k)

        for inn in inner, out in outer
            pairing = [(1, partner)]
            # Shift inner pairs to positions 2, 3, ..., 2k-1
            for (a, b) in inn
                push!(pairing, (a + 1, b + 1))
            end
            # Shift outer pairs to positions 2k+1, ..., 2n
            for (a, b) in out
                push!(pairing, (a + 2k, b + 2k))
            end
            push!(result, pairing)
        end
    end
    result
end

println("Catalan numbers and explicit pairings:")
println("-"^70)
for n in 0:5
    pairings = planar_pairings(n)
    println("\nN = $(2n) strands: C_$n = $(catalan(n)) pairings")
    if n <= 3
        for (i, p) in enumerate(pairings)
            println("  $i: $p")
        end
    end
end

println("\n" * "="^70)
println("FUSION PICTURE: Rep(U_q(sl_2)) with trivalent vertices")
println("="^70)

println("""
In the fusion picture, we have spin-1/2 objects τ with:
    τ ⊗ τ = 0 ⊕ 1  (fusion to spin-0 or spin-1)

This gives TRIVALENT vertices (splitting/fusion).
The counting is different:

    N=1: 1 tree (single τ)
    N=2: 2 trees (fuse to 0 or 1)
    N=3: 3 trees
    N=4: 5 trees
    ...
    N=k: F_{k+1} (Fibonacci)
""")

# Include the fusion tree code
include("tl_anyons.jl")

tl = fibonacci_tl()
println("\nFusion tree counts (Fibonacci):")
println("-"^70)
fib = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
for N in 1:8
    trees = all_fusion_trees(tl, N)
    println("N = $N: $(length(trees)) trees (F_{$(N+1)} = $(fib[N+1]))")
end

println("\n" * "="^70)
println("COMPARISON TABLE")
println("="^70)
println("\n N  | TL pairings | Fusion trees | Ratio")
println("-"^50)
for N in 2:2:10
    tl_count = catalan(N ÷ 2)
    fusion_count = length(all_fusion_trees(tl, N))
    ratio = fusion_count / tl_count
    println(" $N  |      $(lpad(tl_count, 3))      |      $(lpad(fusion_count, 3))      | $(round(ratio, digits=2))")
end

println("\n" * "="^70)
println("KEY INSIGHT")
println("="^70)
println("""
The difference:

PURE TL (pairings):
  - Strands either connect (cup) or pass through
  - No "intermediate charge" - strands are strands
  - Example N=4: either (1-2)(3-4) or (1-4)(2-3)

FUSION (Rep U_q sl_2):
  - Trivalent vertices allow τ⊗τ → j with j ∈ {0,1}
  - The intermediate charge j is a quantum number
  - Example N=4: five different fusion trees with different
    intermediate charges

For MOBILE ANYONS on a chain:
  - If anyons can only pair-annihilate: use TL counting
  - If anyons have internal "charge" degrees of freedom: use fusion

The golden chain / Fibonacci anyons use the FUSION picture.
Pure TL loop models use the PAIRING picture.
""")

println("\n" * "="^70)
println("PHYSICAL INTERPRETATION")
println("="^70)
println("""
Pure TL (N strands on n sites):
  - Configuration: which sites have strand endpoints
  - Internal: how strands pair up (planar matching)
  - dim(H) = C(n, N) × C_{N/2}  (for even N)

Fusion (N τ-anyons on n sites):
  - Configuration: which sites have anyons
  - Internal: fusion tree (intermediate charges)
  - dim(H) = C(n, N) × F_{N+1}

Example n=6, N=4:
  - TL: C(6,4) × C_2 = 15 × 2 = 30
  - Fusion: C(6,4) × F_5 = 15 × 5 = 75
""")

# Verify
println("\nVerification for n=6, N=4:")
H_fusion = build_hilbert_space(tl, 6, 4)
println("  Fusion dim(H) = $(length(H_fusion))")
println("  Expected: C(6,4) × F_5 = $(binomial(6,4)) × 5 = $(binomial(6,4) * 5)")
println("  TL would give: C(6,4) × C_2 = $(binomial(6,4)) × 2 = $(binomial(6,4) * 2)")
