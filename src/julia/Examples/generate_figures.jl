"""
    Generate publication-quality spacetime diagrams

    This script generates a variety of spacetime diagrams demonstrating
    the structure of partition function contributions in TL models.
"""

include("spacetime_diagrams.jl")

function generate_publication_figures()
    figdir = joinpath(dirname(dirname(dirname(@__DIR__))), "tex", "figures")
    mkpath(figdir)

    println("="^70)
    println("Generating publication figures to: $figdir")
    println("="^70)

    # Golden ratio (Fibonacci CFT, c=7/10)
    δ_fib = (1 + sqrt(5)) / 2
    # Ising (c=1/2)
    δ_ising = sqrt(2)
    # Percolation (c=0)
    δ_perc = 1.0

    # === Figure 1: Very dilute vs moderately dense comparison ===
    println("\n--- Figure 1a: Dilute regime ---")
    params_dilute = MCParams(Δβ=0.08, t=0.5, J=0.0, μ=0.15)
    c1 = generate_spacetime(6, 30, δ_fib, params_dilute; seed=101, N_init=0)
    render_svg(c1; width=350, height=450, filename=joinpath(figdir, "fig_dilute.svg"))
    println(render_ascii(c1; show_weight=false))

    println("\n--- Figure 1b: Dense regime ---")
    params_dense = MCParams(Δβ=0.05, t=0.3, J=0.0, μ=0.6)
    c2 = generate_spacetime(6, 30, δ_fib, params_dense; seed=202, N_init=4)
    render_svg(c2; width=350, height=450, filename=joinpath(figdir, "fig_dense.svg"))
    println(render_ascii(c2; show_weight=false))

    # === Figure 2: Different loop weights ===
    println("\n--- Figure 2a: Fibonacci (δ=φ) ---")
    params2 = MCParams(Δβ=0.06, t=0.4, J=0.0, μ=0.4)
    c3 = generate_spacetime(5, 25, δ_fib, params2; seed=303, N_init=2)
    render_svg(c3; width=300, height=400, filename=joinpath(figdir, "fig_fibonacci.svg"))

    println("\n--- Figure 2b: Ising (δ=√2) ---")
    c4 = generate_spacetime(5, 25, δ_ising, params2; seed=404, N_init=2)
    render_svg(c4; width=300, height=400, filename=joinpath(figdir, "fig_ising.svg"))

    println("\n--- Figure 2c: Percolation (δ=1) ---")
    c5 = generate_spacetime(5, 25, δ_perc, params2; seed=505, N_init=2)
    render_svg(c5; width=300, height=400, filename=joinpath(figdir, "fig_percolation.svg"))

    # === Figure 3: Larger system n=7 ===
    println("\n--- Figure 3: Larger system (n=7) ---")
    params3 = MCParams(Δβ=0.05, t=0.35, J=0.0, μ=0.45)
    c6 = generate_spacetime(7, 35, δ_fib, params3; seed=606, N_init=2)
    render_svg(c6; width=400, height=500, filename=joinpath(figdir, "fig_n7_spacetime.svg"))
    println(render_ascii(c6; show_weight=false))

    # === Figure 4: Multiple samples to show variability ===
    println("\n--- Figure 4: Sample variability (3 samples, same parameters) ---")
    for i in 1:3
        ci = generate_spacetime(5, 20, δ_fib, params2; seed=700+i, N_init=0)
        render_svg(ci; width=280, height=350, filename=joinpath(figdir, "fig_sample_$i.svg"))
    end

    # === Figure 5: High activity (many creation/annihilation events) ===
    println("\n--- Figure 5: High activity regime ---")
    params_high = MCParams(Δβ=0.04, t=0.2, J=0.0, μ=0.8)
    c7 = generate_spacetime(5, 40, δ_ising, params_high; seed=808, N_init=0)
    render_svg(c7; width=350, height=550, filename=joinpath(figdir, "fig_high_activity.svg"))
    println(render_ascii(c7; show_weight=false))

    println("\n" * "="^70)
    println("Generated figures:")
    for f in readdir(figdir)
        if endswith(f, ".svg")
            println("  - $f")
        end
    end
    println("="^70)
end

# Also generate some nice ASCII diagrams for the terminal
function show_representative_diagrams()
    println("\n" * "="^70)
    println("REPRESENTATIVE SPACETIME DIAGRAMS")
    println("="^70)

    δ = (1 + sqrt(5)) / 2

    # Try multiple seeds to find a nice example
    best_config = nothing
    best_score = 0

    for seed in 1:50
        params = MCParams(Δβ=0.06, t=0.35, J=0.0, μ=0.5)
        config = generate_spacetime(6, 25, δ, params; seed=seed, N_init=0)

        # Score: prefer configs with some activity but not too chaotic
        n_vertices = length(config.vertices)
        n_final = num_worldlines_at_time(config, config.n_τ)
        score = n_vertices * 10 + n_final * 5 - abs(n_vertices - 4) * 3

        if score > best_score
            best_score = score
            best_config = config
        end
    end

    if best_config !== nothing
        println("\nBest example found:")
        println(render_ascii(best_config))
    end
end

if abspath(PROGRAM_FILE) == @__FILE__
    generate_publication_figures()
    show_representative_diagrams()
end
