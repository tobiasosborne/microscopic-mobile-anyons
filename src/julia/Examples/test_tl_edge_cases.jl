#!/usr/bin/env julia
# Test edge cases for TL anyon simulation

include("tl_anyons.jl")

println("N=0 vacuum fix check:")
println("-"^40)
tl = fibonacci_tl()
for n in [1, 3, 5, 7]
    H = build_hilbert_space(tl, n, 0)
    println("n=$n, N=0: dim(H) = $(length(H))")
end

println("\n" * "="^60)
println("Fusion tree counts = Fibonacci numbers")
println("="^60)
println("\nN  | trees | F_{N+1}")
println("-"^30)
fib = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
for N in 1:10
    trees = all_fusion_trees(tl, N)
    match = length(trees) == fib[N+1] ? "✓" : "✗"
    println("$N  |   $(lpad(length(trees), 2))   |   $(lpad(fib[N+1], 2))  $match")
end

println("\n" * "="^60)
println("Total charge sectors (N=4 Fibonacci)")
println("="^60)
for charge in [0, 1//2, 1, 3//2, 2]
    trees = all_fusion_trees(tl, 4; total_charge=charge)
    if length(trees) > 0
        println("charge=$charge: $(length(trees)) trees")
    end
end

println("\n" * "="^60)
println("Ising vs Fibonacci: fusion tree comparison")
println("="^60)
tl_fib = fibonacci_tl()
tl_ising = ising_tl()
println("\nN  | Fib trees | Ising trees")
println("-"^35)
for N in 1:8
    fib_trees = length(all_fusion_trees(tl_fib, N))
    ising_trees = length(all_fusion_trees(tl_ising, N))
    println("$N  |    $(lpad(fib_trees, 3))    |     $(lpad(ising_trees, 3))")
end

println("\n" * "="^60)
println("Full dimension table: dim(H) = C(n,N) × trees")
println("="^60)
println("\nn=7, Fibonacci:")
for N in 0:7
    H = build_hilbert_space(tl_fib, 7, N)
    configs = N > 0 ? binomial(7, N) : 1
    trees = N > 0 ? length(all_fusion_trees(tl_fib, N)) : 1
    println("  N=$N: dim=$(length(H)) = $configs × $trees")
end
