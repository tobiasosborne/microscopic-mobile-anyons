"""
    Spacetime Diagram Generator for TL Models

    Generates typical partition function contributions via Monte Carlo sampling.
    Uses Trotter-Suzuki decomposition: exp(-βH) ≈ ∏_τ exp(-Δβ H_local)

    Each imaginary time slice can have:
    - Identity (worldlines continue straight)
    - Hopping (worldline moves to adjacent site)
    - TL reconnection (adjacent worldlines swap partners)
    - Pair creation/annihilation (worldlines start/end)

    Usage:
        julia spacetime_diagrams.jl
"""

using Random
using Printf

#==============================================================================#
#                         Spacetime Configuration                               #
#==============================================================================#

"""
    SpacetimeConfig

Represents a spacetime worldline configuration.

Fields:
- n: number of spatial sites
- n_τ: number of imaginary time slices
- δ: loop weight (TL parameter)
- worldlines: Vector of worldlines, each is Vector{Int} of positions at each τ
- vertices: list of (τ, type, data) for non-trivial vertices
"""
mutable struct SpacetimeConfig
    n::Int                              # spatial sites
    n_τ::Int                            # time slices
    δ::Float64                          # loop weight
    # Worldline representation: worldlines[w][τ] = position of worldline w at time τ
    # -1 means worldline doesn't exist at that time
    worldlines::Vector{Vector{Int}}
    # Vertices: (τ, type, data)
    # Types: :cup (creation), :cap (annihilation), :crossing, :reconnect
    vertices::Vector{Tuple{Int, Symbol, Any}}
    # Weight accumulated (product of local weights)
    weight::ComplexF64
end

"""
    empty_spacetime(n, n_τ, δ)

Create empty spacetime with no worldlines.
"""
function empty_spacetime(n::Int, n_τ::Int, δ::Float64)
    SpacetimeConfig(n, n_τ, δ, Vector{Int}[], Tuple{Int, Symbol, Any}[], 1.0)
end

"""
    positions_at_time(config, τ)

Get list of occupied positions at time τ.
"""
function positions_at_time(config::SpacetimeConfig, τ::Int)
    pos = Int[]
    for wl in config.worldlines
        if 1 <= τ <= length(wl) && wl[τ] > 0
            push!(pos, wl[τ])
        end
    end
    sort(pos)
end

"""
    num_worldlines_at_time(config, τ)

Count worldlines present at time τ.
"""
function num_worldlines_at_time(config::SpacetimeConfig, τ::Int)
    count(wl -> 1 <= τ <= length(wl) && wl[τ] > 0, config.worldlines)
end

#==============================================================================#
#                         Monte Carlo Evolution                                 #
#==============================================================================#

"""
    MCParams

Monte Carlo parameters for spacetime sampling.
"""
struct MCParams
    Δβ::Float64     # imaginary time step
    t::Float64      # hopping strength
    J::Float64      # TL reconnection strength
    μ::Float64      # pair creation/annihilation strength
end

MCParams(; Δβ=0.1, t=1.0, J=0.5, μ=0.3) = MCParams(Δβ, t, J, μ)

"""
    evolve_one_step!(config, params, rng)

Evolve configuration by one imaginary time step using local Monte Carlo updates.

For small Δβ, probability of applying operator O is ≈ Δβ × coupling.
Returns the updated configuration.
"""
function evolve_one_step!(config::SpacetimeConfig, params::MCParams, rng::AbstractRNG)
    n = config.n
    τ = config.n_τ + 1  # Next time slice

    # Get current positions
    curr_pos = positions_at_time(config, config.n_τ)
    N_curr = length(curr_pos)

    # Extend all existing worldlines by one step (initially continuing straight)
    for wl in config.worldlines
        if length(wl) == config.n_τ && wl[end] > 0
            push!(wl, wl[end])  # Continue at same position
        end
    end

    config.n_τ = τ

    # === Apply local updates with appropriate probabilities ===

    # 1. Hopping: each worldline can hop left/right
    if params.t > 0
        for (w, wl) in enumerate(config.worldlines)
            if length(wl) == τ && wl[τ] > 0
                pos = wl[τ]

                # Probability to hop ~ Δβ × t
                p_hop = min(1.0, params.Δβ * params.t)

                if rand(rng) < p_hop
                    # Choose direction
                    can_left = pos > 1 && !(pos - 1 in positions_at_time(config, τ))
                    can_right = pos < n && !(pos + 1 in positions_at_time(config, τ))

                    if can_left && can_right
                        wl[τ] = rand(rng, Bool) ? pos - 1 : pos + 1
                    elseif can_left
                        wl[τ] = pos - 1
                    elseif can_right
                        wl[τ] = pos + 1
                    end
                end
            end
        end
    end

    # 2. Pair creation: create two new worldlines at adjacent empty sites
    if params.μ > 0
        p_create = min(0.5, params.Δβ * params.μ)  # Cap probability

        for site in 1:(n-1)
            curr_occupied = positions_at_time(config, τ)
            if !(site in curr_occupied) && !(site + 1 in curr_occupied)
                if rand(rng) < p_create
                    # Create pair at (site, site+1)
                    wl1 = fill(-1, τ - 1)
                    push!(wl1, site)
                    wl2 = fill(-1, τ - 1)
                    push!(wl2, site + 1)
                    push!(config.worldlines, wl1)
                    push!(config.worldlines, wl2)
                    push!(config.vertices, (τ, :cup, (site, site + 1)))
                    break  # Only one creation per step
                end
            end
        end
    end

    # 3. Pair annihilation: adjacent worldlines can annihilate
    if params.μ > 0
        p_annihilate = min(0.5, params.Δβ * params.μ)

        # Find adjacent pairs
        curr_occupied = positions_at_time(config, τ)
        for i in 1:(length(curr_occupied) - 1)
            if curr_occupied[i + 1] == curr_occupied[i] + 1
                if rand(rng) < p_annihilate
                    # Annihilate this pair
                    site1, site2 = curr_occupied[i], curr_occupied[i + 1]

                    # Find and terminate the worldlines
                    for (w, wl) in enumerate(config.worldlines)
                        if length(wl) == τ && wl[τ] == site1
                            wl[τ] = -1  # Terminate
                        elseif length(wl) == τ && wl[τ] == site2
                            wl[τ] = -1  # Terminate
                        end
                    end

                    push!(config.vertices, (τ, :cap, (site1, site2)))
                    config.weight *= config.δ  # Loop weight
                    break  # Only one annihilation per step
                end
            end
        end
    end

    # 4. TL reconnection (crossing/reconnecting adjacent worldlines)
    # This is more subtle - for now, skip as it requires tracking pairings

    config
end

"""
    generate_spacetime(n, n_τ, δ, params; seed=nothing, N_init=0)

Generate a spacetime configuration by Monte Carlo evolution.

Arguments:
- n: number of spatial sites
- n_τ: number of imaginary time slices
- δ: loop weight
- params: MCParams with coupling strengths
- seed: random seed (optional)
- N_init: initial number of worldlines (0 = start from vacuum)
"""
function generate_spacetime(n::Int, n_τ::Int, δ::Float64, params::MCParams;
                           seed::Union{Int,Nothing}=nothing, N_init::Int=0)
    rng = isnothing(seed) ? Random.default_rng() : MersenneTwister(seed)

    config = empty_spacetime(n, 1, δ)

    # Initialize with N_init worldlines at random positions
    if N_init > 0 && N_init <= n
        init_pos = sort(shuffle(rng, 1:n)[1:N_init])
        for pos in init_pos
            push!(config.worldlines, [pos])
        end
    end

    # Evolve for n_τ steps
    for _ in 2:n_τ
        evolve_one_step!(config, params, rng)
    end

    config
end

#==============================================================================#
#                         ASCII Rendering                                       #
#==============================================================================#

"""
    render_ascii(config; show_weight=true)

Render spacetime diagram as ASCII art.
Time flows upward (bottom = τ=1, top = τ=n_τ).
"""
function render_ascii(config::SpacetimeConfig; show_weight::Bool=true)
    n = config.n
    n_τ = config.n_τ

    # Build character grid (2 chars per site for spacing)
    # Each time slice uses 1 row for worldlines, 1 row for connections
    grid = fill(' ', 2 * n_τ, 2 * n + 1)

    # Track which worldlines are at each position at each time
    pos_to_wl = [Dict{Int, Int}() for _ in 1:n_τ]
    for (w, wl) in enumerate(config.worldlines)
        for τ in 1:min(length(wl), n_τ)
            if wl[τ] > 0
                pos_to_wl[τ][wl[τ]] = w
            end
        end
    end

    # Draw worldlines
    for τ in 1:n_τ
        row = 2 * (n_τ - τ + 1)  # Flip so time goes up

        for site in 1:n
            col = 2 * site

            if haskey(pos_to_wl[τ], site)
                # Draw worldline marker
                grid[row, col] = '●'

                # Draw connection to previous time
                if τ > 1
                    w = pos_to_wl[τ][site]
                    wl = config.worldlines[w]
                    prev_pos = τ > 1 ? wl[τ-1] : 0

                    if prev_pos > 0
                        prev_col = 2 * prev_pos
                        conn_row = row + 1

                        if prev_pos == site
                            # Straight up
                            grid[conn_row, col] = '│'
                        elseif prev_pos < site
                            # Coming from left
                            grid[conn_row, col] = '╱'
                        else
                            # Coming from right
                            grid[conn_row, col] = '╲'
                        end
                    end
                end
            else
                grid[row, col] = '·'
            end
        end
    end

    # Mark vertices
    for (τ, vtype, data) in config.vertices
        row = 2 * (n_τ - τ + 1) + 1  # Connection row
        if vtype == :cup
            site1, site2 = data
            col = 2 * site1 + 1
            if 1 <= row <= size(grid, 1) && 1 <= col <= size(grid, 2)
                grid[row, col] = '∪'
            end
        elseif vtype == :cap
            site1, site2 = data
            col = 2 * site1 + 1
            if 1 <= row <= size(grid, 1) && 1 <= col <= size(grid, 2)
                grid[row, col] = '∩'
            end
        end
    end

    # Build output string
    lines = String[]

    push!(lines, "Spacetime Diagram (n=$n, n_τ=$n_τ, δ=$(config.δ))")
    push!(lines, "─" ^ (2 * n + 5))

    # Time axis label
    push!(lines, "τ")

    for row in 1:size(grid, 1)
        τ_label = ""
        if row % 2 == 0
            τ_idx = n_τ - (row ÷ 2) + 1
            τ_label = @sprintf("%2d│", τ_idx)
        else
            τ_label = "  │"
        end
        push!(lines, τ_label * String(grid[row, :]))
    end

    # Site labels
    push!(lines, "  └" * "─" ^ (2 * n + 1) * " x")
    site_labels = "   "
    for site in 1:n
        site_labels *= @sprintf("%2d", site)
    end
    push!(lines, site_labels)

    if show_weight
        push!(lines, "")
        push!(lines, "Weight: $(config.weight)")
        push!(lines, "Vertices: $(length(config.vertices))")
    end

    join(lines, "\n")
end

#==============================================================================#
#                         SVG Rendering                                         #
#==============================================================================#

"""
    render_svg(config; width=400, height=500, filename=nothing)

Render spacetime diagram as SVG.
Returns SVG string. If filename given, also writes to file.
"""
function render_svg(config::SpacetimeConfig;
                   width::Int=400, height::Int=500,
                   filename::Union{String,Nothing}=nothing)
    n = config.n
    n_τ = config.n_τ

    # Margins and spacing
    margin = 40
    x_spacing = (width - 2 * margin) / (n - 1)
    y_spacing = (height - 2 * margin) / (n_τ - 1)

    # Convert (site, τ) to (x, y) coordinates
    # τ=1 at bottom, τ=n_τ at top
    site_to_x(s) = margin + (s - 1) * x_spacing
    tau_to_y(τ) = height - margin - (τ - 1) * y_spacing

    svg_parts = String[]

    # SVG header
    push!(svg_parts, """<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="$width" height="$height" viewBox="0 0 $width $height">
  <style>
    .worldline { stroke: #2563eb; stroke-width: 2; fill: none; }
    .site-dot { fill: #94a3b8; }
    .worldline-dot { fill: #2563eb; }
    .vertex-cup { fill: none; stroke: #16a34a; stroke-width: 2; }
    .vertex-cap { fill: none; stroke: #dc2626; stroke-width: 2; }
    .axis { stroke: #334155; stroke-width: 1; }
    .label { font-family: monospace; font-size: 12px; fill: #334155; }
  </style>
  <rect width="100%" height="100%" fill="white"/>
""")

    # Draw grid of site positions (faint dots)
    for τ in 1:n_τ
        y = tau_to_y(τ)
        for site in 1:n
            x = site_to_x(site)
            push!(svg_parts, """  <circle cx="$x" cy="$y" r="2" class="site-dot"/>""")
        end
    end

    # Draw worldlines
    for (w, wl) in enumerate(config.worldlines)
        path_parts = String[]
        started = false

        for τ in 1:min(length(wl), n_τ)
            if wl[τ] > 0
                x = site_to_x(wl[τ])
                y = tau_to_y(τ)

                if !started
                    push!(path_parts, "M $x $y")
                    started = true
                else
                    push!(path_parts, "L $x $y")
                end
            elseif started
                # Worldline terminated, start new segment if it resumes
                started = false
            end
        end

        if length(path_parts) > 0
            path_d = join(path_parts, " ")
            push!(svg_parts, """  <path d="$path_d" class="worldline"/>""")
        end

        # Draw dots at worldline positions
        for τ in 1:min(length(wl), n_τ)
            if wl[τ] > 0
                x = site_to_x(wl[τ])
                y = tau_to_y(τ)
                push!(svg_parts, """  <circle cx="$x" cy="$y" r="4" class="worldline-dot"/>""")
            end
        end
    end

    # Draw vertices (cups and caps)
    for (τ, vtype, data) in config.vertices
        y = tau_to_y(τ) - y_spacing / 4
        if vtype == :cup
            site1, site2 = data
            x1, x2 = site_to_x(site1), site_to_x(site2)
            xm = (x1 + x2) / 2
            # Draw cup (upward arc)
            push!(svg_parts, """  <path d="M $x1 $(y + y_spacing/4) Q $xm $(y - y_spacing/4) $x2 $(y + y_spacing/4)" class="vertex-cup"/>""")
        elseif vtype == :cap
            site1, site2 = data
            x1, x2 = site_to_x(site1), site_to_x(site2)
            xm = (x1 + x2) / 2
            # Draw cap (downward arc)
            push!(svg_parts, """  <path d="M $x1 $y Q $xm $(y + y_spacing/2) $x2 $y" class="vertex-cap"/>""")
        end
    end

    # Draw axes
    push!(svg_parts, """  <line x1="$(margin-10)" y1="$(height-margin)" x2="$(width-margin+10)" y2="$(height-margin)" class="axis"/>""")
    push!(svg_parts, """  <line x1="$(margin-10)" y1="$(height-margin)" x2="$(margin-10)" y2="$(margin-10)" class="axis"/>""")

    # Labels
    push!(svg_parts, """  <text x="$(width/2)" y="$(height-10)" class="label" text-anchor="middle">site</text>""")
    push!(svg_parts, """  <text x="15" y="$(height/2)" class="label" transform="rotate(-90, 15, $(height/2))">τ (imaginary time)</text>""")

    # Site labels
    for site in 1:n
        x = site_to_x(site)
        push!(svg_parts, """  <text x="$x" y="$(height-margin+20)" class="label" text-anchor="middle">$site</text>""")
    end

    # Time labels (every 5 or so)
    step = max(1, n_τ ÷ 5)
    for τ in 1:step:n_τ
        y = tau_to_y(τ)
        push!(svg_parts, """  <text x="$(margin-20)" y="$(y+4)" class="label" text-anchor="end">$τ</text>""")
    end

    # Title
    push!(svg_parts, """  <text x="$(width/2)" y="25" class="label" text-anchor="middle" font-weight="bold">TL Spacetime (n=$n, n_τ=$n_τ, δ=$(round(config.δ, digits=2)))</text>""")

    push!(svg_parts, "</svg>")

    svg_str = join(svg_parts, "\n")

    if !isnothing(filename)
        write(filename, svg_str)
        println("Wrote SVG to $filename")
    end

    svg_str
end

#==============================================================================#
#                         Examples                                              #
#==============================================================================#

function example_spacetime_diagrams()
    println("="^70)
    println("SPACETIME DIAGRAM GENERATION")
    println("="^70)

    # Parameters
    δ = (1 + sqrt(5)) / 2  # Golden ratio (Fibonacci)

    # Example 1: Small system, dilute
    println("\n--- Example 1: Dilute regime (n=5, small μ) ---")
    params_dilute = MCParams(Δβ=0.15, t=1.0, J=0.0, μ=0.1)
    config1 = generate_spacetime(5, 15, δ, params_dilute; seed=42, N_init=0)
    println(render_ascii(config1))
    render_svg(config1; filename="spacetime_n5_dilute.svg")

    # Example 2: Small system, denser
    println("\n--- Example 2: Denser regime (n=6, larger μ) ---")
    params_dense = MCParams(Δβ=0.15, t=0.8, J=0.0, μ=0.4)
    config2 = generate_spacetime(6, 20, δ, params_dense; seed=123, N_init=2)
    println(render_ascii(config2))
    render_svg(config2; filename="spacetime_n6_dense.svg")

    # Example 3: n=7
    println("\n--- Example 3: n=7 system ---")
    params3 = MCParams(Δβ=0.12, t=1.0, J=0.0, μ=0.3)
    config3 = generate_spacetime(7, 25, δ, params3; seed=456, N_init=0)
    println(render_ascii(config3))
    render_svg(config3; filename="spacetime_n7.svg")

    # Example 4: Ising loop weight
    println("\n--- Example 4: Ising point (δ=√2, n=6) ---")
    δ_ising = sqrt(2)
    params4 = MCParams(Δβ=0.1, t=1.0, J=0.0, μ=0.25)
    config4 = generate_spacetime(6, 18, δ_ising, params4; seed=789)
    println(render_ascii(config4))
    render_svg(config4; filename="spacetime_ising.svg")

    println("\n" * "="^70)
    println("Generated SVG files:")
    println("  - spacetime_n5_dilute.svg")
    println("  - spacetime_n6_dense.svg")
    println("  - spacetime_n7.svg")
    println("  - spacetime_ising.svg")
    println("="^70)

    return config1, config2, config3, config4
end

function generate_ensemble(n::Int, n_τ::Int, δ::Float64, params::MCParams,
                          n_samples::Int; verbose::Bool=true)
    """
    Generate ensemble of spacetime configurations.
    Returns vector of configs.
    """
    configs = SpacetimeConfig[]

    for i in 1:n_samples
        config = generate_spacetime(n, n_τ, δ, params; seed=i)
        push!(configs, config)

        if verbose && i % 10 == 0
            println("Generated $i / $n_samples configurations")
        end
    end

    configs
end

function ensemble_statistics(configs::Vector{SpacetimeConfig})
    """
    Compute statistics over ensemble of configurations.
    """
    n_samples = length(configs)

    # Average number of vertices
    avg_vertices = mean(length(c.vertices) for c in configs)

    # Average final worldline count
    avg_final_N = mean(num_worldlines_at_time(c, c.n_τ) for c in configs)

    # Vertex type counts
    cup_counts = [count(v -> v[2] == :cup, c.vertices) for c in configs]
    cap_counts = [count(v -> v[2] == :cap, c.vertices) for c in configs]

    println("Ensemble statistics (n_samples=$n_samples):")
    println("  Average vertices: $(round(avg_vertices, digits=2))")
    println("  Average final N: $(round(avg_final_N, digits=2))")
    println("  Average cups (creation): $(round(mean(cup_counts), digits=2))")
    println("  Average caps (annihilation): $(round(mean(cap_counts), digits=2))")
end

# Helper
mean(x) = sum(x) / length(x)

# Run examples
if abspath(PROGRAM_FILE) == @__FILE__
    example_spacetime_diagrams()
end
