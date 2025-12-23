#!/usr/bin/env julia
# Explicit enumeration of basis states for small N

include("tl_anyons.jl")

println("="^70)
println("EXPLICIT BASIS ENUMERATION")
println("="^70)

println("""
Fusion rules for τ (spin-1/2) in TL/SU(2)_q:
  τ ⊗ τ = 0 ⊕ 1     (spin-1/2 ⊗ spin-1/2 = spin-0 ⊕ spin-1)

Fusion tree structure:
  N=1: single τ, no fusion needed
       total charge = 1/2
       trees: [] (empty channel list)

  N=2: τ ⊗ τ → c₁ ∈ {0, 1}
       total charge = c₁
       trees: [0] or [1]

  N=3: (τ ⊗ τ) ⊗ τ → c₁ ⊗ τ → c₂
       c₁=0: 0 ⊗ τ = 1/2, so c₂=1/2
       c₁=1: 1 ⊗ τ = 1/2 ⊕ 3/2, so c₂ ∈ {1/2, 3/2}
       trees: [0, 1/2], [1, 1/2], [1, 3/2]
""")

tl = fibonacci_tl()
println("Using Fibonacci: q = exp(iπ/5), max_spin = ", max_spin(tl))
println()

# N=1
println("-"^70)
println("N=1: Single anyon")
println("-"^70)
trees1 = all_fusion_trees(tl, 1)
println("Expected: 1 tree with channels=[]")
println("Got: $(length(trees1)) tree(s)")
for (i, t) in enumerate(trees1)
    println("  Tree $i: channels = $(t.channels)")
end
println()

# N=2
println("-"^70)
println("N=2: Two anyons, τ ⊗ τ = 0 ⊕ 1")
println("-"^70)
trees2 = all_fusion_trees(tl, 2)
println("Expected: 2 trees with channels [0] and [1]")
println("Got: $(length(trees2)) tree(s)")
for (i, t) in enumerate(trees2)
    total_charge = isempty(t.channels) ? "1/2" : t.channels[end]
    println("  Tree $i: channels = $(t.channels), total charge = $total_charge")
end
println()

# N=3
println("-"^70)
println("N=3: Three anyons")
println("-"^70)
trees3 = all_fusion_trees(tl, 3)
println("Expected: 3 trees")
println("  [0, 1/2] - fuse to 0, then fuse with τ to get 1/2")
println("  [1, 1/2] - fuse to 1, then fuse with τ to get 1/2")
println("  [1, 3/2] - fuse to 1, then fuse with τ to get 3/2")
println("Got: $(length(trees3)) tree(s)")
for (i, t) in enumerate(trees3)
    println("  Tree $i: channels = $(t.channels)")
end
println()

# Now check configurations × trees for specific n values
println("="^70)
println("FULL BASIS: configurations × fusion trees")
println("="^70)

for n in [3, 5, 7]
    println("\n" * "-"^70)
    println("n = $n sites")
    println("-"^70)

    for N in 1:min(n, 3)
        println("\n  N = $N anyons:")
        configs = all_configurations(n, N)
        trees = all_fusion_trees(tl, N)
        H = build_hilbert_space(tl, n, N)

        println("    Configurations (positions): $(length(configs))")
        if length(configs) <= 10
            for c in configs
                println("      $(c.positions)")
            end
        else
            println("      ($(length(configs)) total, showing first 5)")
            for c in configs[1:5]
                println("      $(c.positions)")
            end
        end

        println("    Fusion trees: $(length(trees))")
        for t in trees
            println("      channels = $(t.channels)")
        end

        println("    Total dim(H) = $(length(configs)) × $(length(trees)) = $(length(H))")

        # Verify
        expected = length(configs) * length(trees)
        if length(H) == expected
            println("    ✓ Matches expected")
        else
            println("    ✗ MISMATCH: got $(length(H)), expected $expected")
        end
    end
end

# Show total charge decomposition
println("\n" * "="^70)
println("TOTAL CHARGE DECOMPOSITION")
println("="^70)

for N in 2:4
    println("\nN = $N:")
    trees = all_fusion_trees(tl, N)

    # Group by total charge
    charge_groups = Dict{Rational{Int}, Vector{Vector{Rational{Int}}}}()
    for t in trees
        charge = isempty(t.channels) ? 1//2 : t.channels[end]
        if !haskey(charge_groups, charge)
            charge_groups[charge] = Vector{Rational{Int}}[]
        end
        push!(charge_groups[charge], t.channels)
    end

    for charge in sort(collect(keys(charge_groups)))
        group = charge_groups[charge]
        println("  Total charge = $charge: $(length(group)) tree(s)")
        for channels in group
            println("    $channels")
        end
    end
end
