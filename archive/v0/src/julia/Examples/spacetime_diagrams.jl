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
- pairings: Dict mapping worldline index to its partner index
- vertices: list of (τ, type, data) for non-trivial vertices
"""
mutable struct SpacetimeConfig
    n::Int                              # spatial sites
    n_τ::Int                            # time slices
    δ::Float64                          # loop weight
    # Worldline representation: worldlines[w][τ] = position of worldline w at time τ
    # -1 means worldline doesn't exist at that time
    worldlines::Vector{Vector{Int}}
    # Pairings: which worldline is paired to which (for valid annihilation)
    # pairings[w] = partner of worldline w
    pairings::Dict{Int, Int}
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
    SpacetimeConfig(n, n_τ, δ, Vector{Int}[], Dict{Int,Int}(), Tuple{Int, Symbol, Any}[], 1.0)
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

"""
    worldline_at_position(config, τ, pos)

Find the worldline index at position pos at time τ. Returns nothing if none.
"""
function worldline_at_position(config::SpacetimeConfig, τ::Int, pos::Int)
    for (w, wl) in enumerate(config.worldlines)
        if 1 <= τ <= length(wl) && wl[τ] == pos
            return w
        end
    end
    nothing
end

"""
    active_worldlines_at_time(config, τ)

Get list of (worldline_index, position) for active worldlines at time τ.
"""
function active_worldlines_at_time(config::SpacetimeConfig, τ::Int)
    result = Tuple{Int, Int}[]
    for (w, wl) in enumerate(config.worldlines)
        if 1 <= τ <= length(wl) && wl[τ] > 0
            push!(result, (w, wl[τ]))
        end
    end
    sort!(result, by = x -> x[2])  # Sort by position
    result
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

MCParams(; Δβ=0.5, t=1.0, J=0.5, μ=0.5) = MCParams(Δβ, t, J, μ)

"""
    evolve_one_step!(config, params, rng)

Evolve configuration by one imaginary time step using local Monte Carlo updates.

Uses rejection sampling to ensure only compatible Hamiltonian terms are applied:
- Pair creation: creates two worldlines that are paired to each other
- Pair annihilation: only allowed for worldlines that are paired to each other
- Hopping: worldlines move but maintain their pairing

Returns the updated configuration.
"""
function evolve_one_step!(config::SpacetimeConfig, params::MCParams, rng::AbstractRNG)
    n = config.n
    τ = config.n_τ + 1  # Next time slice

    # Extend all existing active worldlines by one step (continuing straight)
    for wl in config.worldlines
        if length(wl) == config.n_τ && wl[end] > 0
            push!(wl, wl[end])  # Continue at same position
        end
    end

    config.n_τ = τ

    # === Apply local updates with appropriate probabilities ===

    # 1. Hopping: each worldline can hop left/right (preserves pairings)
    if params.t > 0
        for (w, wl) in enumerate(config.worldlines)
            if length(wl) == τ && wl[τ] > 0
                pos = wl[τ]

                # Probability to hop ~ Δβ × t
                p_hop = min(1.0, params.Δβ * params.t)

                if rand(rng) < p_hop
                    # Choose direction - check occupancy
                    curr_occupied = positions_at_time(config, τ)
                    can_left = pos > 1 && !(pos - 1 in curr_occupied)
                    can_right = pos < n && !(pos + 1 in curr_occupied)

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
        p_create = min(0.9, params.Δβ * params.μ)

        # Try each possible creation site
        for site in shuffle(rng, 1:(n-1))
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

                    # Record pairing: these two worldlines are partners
                    w1 = length(config.worldlines) - 1
                    w2 = length(config.worldlines)
                    config.pairings[w1] = w2
                    config.pairings[w2] = w1

                    push!(config.vertices, (τ, :cup, (site, site + 1)))
                    break  # Only one creation per step
                end
            end
        end
    end

    # 3. Pair annihilation: ONLY for worldlines that are paired to each other
    if params.μ > 0
        p_annihilate = min(0.9, params.Δβ * params.μ)

        # Get active worldlines with their positions
        active = active_worldlines_at_time(config, τ)

        # Find adjacent pairs that are actually paired (partners)
        annihilatable = Tuple{Int, Int, Int, Int}[]  # (w1, pos1, w2, pos2)
        for i in 1:(length(active) - 1)
            w1, pos1 = active[i]
            w2, pos2 = active[i + 1]

            # Check if adjacent AND paired to each other
            if pos2 == pos1 + 1 && haskey(config.pairings, w1) && config.pairings[w1] == w2
                push!(annihilatable, (w1, pos1, w2, pos2))
            end
        end

        # Try to annihilate one valid pair
        if !isempty(annihilatable) && rand(rng) < p_annihilate
            # Pick a random valid pair
            w1, pos1, w2, pos2 = rand(rng, annihilatable)

            # Terminate both worldlines
            config.worldlines[w1][τ] = -1
            config.worldlines[w2][τ] = -1

            # Remove pairing
            delete!(config.pairings, w1)
            delete!(config.pairings, w2)

            push!(config.vertices, (τ, :cap, (pos1, pos2)))
            config.weight *= config.δ  # Loop weight for closed loop
        end
    end

    # 4. TL reconnection: swap partners between adjacent worldlines
    # When two worldlines from different pairs are adjacent, they can
    # "reconnect" - swap their partners
    if params.J > 0
        p_reconnect = min(0.9, params.Δβ * params.J)

        active = active_worldlines_at_time(config, τ)

        # Find adjacent pairs from DIFFERENT pairings
        reconnectable = Tuple{Int, Int, Int, Int}[]  # (w1, w2) where w1, w2 are adjacent but not partners
        for i in 1:(length(active) - 1)
            w1, pos1 = active[i]
            w2, pos2 = active[i + 1]

            # Check if adjacent but NOT paired to each other
            if pos2 == pos1 + 1 && haskey(config.pairings, w1) && config.pairings[w1] != w2
                push!(reconnectable, (w1, pos1, w2, pos2))
            end
        end

        if !isempty(reconnectable) && rand(rng) < p_reconnect
            w1, pos1, w2, pos2 = rand(rng, reconnectable)

            # Get current partners
            p1 = config.pairings[w1]  # w1's current partner
            p2 = config.pairings[w2]  # w2's current partner

            # Swap: w1 pairs with w2, p1 pairs with p2
            config.pairings[w1] = w2
            config.pairings[w2] = w1
            config.pairings[p1] = p2
            config.pairings[p2] = p1

            push!(config.vertices, (τ, :reconnect, (pos1, pos2)))
        end
    end

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
- N_init: initial number of PAIRS (creates 2*N_init worldlines, 0 = start from vacuum)
"""
function generate_spacetime(n::Int, n_τ::Int, δ::Float64, params::MCParams;
                           seed::Union{Int,Nothing}=nothing, N_init::Int=0)
    rng = isnothing(seed) ? Random.default_rng() : MersenneTwister(seed)

    config = empty_spacetime(n, 1, δ)

    # Initialize with N_init PAIRS of worldlines at adjacent positions
    # Each pair is properly registered in pairings
    if N_init > 0
        # Find N_init non-overlapping adjacent pairs
        available_pairs = [(i, i+1) for i in 1:2:(n-1)]  # (1,2), (3,4), (5,6), ...
        shuffle!(rng, available_pairs)
        n_pairs_to_create = min(N_init, length(available_pairs))

        for i in 1:n_pairs_to_create
            pos1, pos2 = available_pairs[i]
            push!(config.worldlines, [pos1])
            push!(config.worldlines, [pos2])

            # Register pairing
            w1 = length(config.worldlines) - 1
            w2 = length(config.worldlines)
            config.pairings[w1] = w2
            config.pairings[w2] = w1

            push!(config.vertices, (1, :cup, (pos1, pos2)))
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
    println("SPACETIME DIAGRAM GENERATION (Large Δβ for visual interest)")
    println("="^70)

    # Parameters
    δ = (1 + sqrt(5)) / 2  # Golden ratio (Fibonacci)

    # Example 1: Moderate activity with large Δβ
    println("\n--- Example 1: n=5, large Δβ=0.8 ---")
    params1 = MCParams(Δβ=0.8, t=1.0, J=0.3, μ=0.6)
    config1 = generate_spacetime(5, 30, δ, params1; seed=42, N_init=0)
    println(render_ascii(config1))
    render_svg(config1; filename="spacetime_n5_active.svg")

    # Example 2: n=6 with high activity
    println("\n--- Example 2: n=6, high activity (Δβ=1.0, μ=0.7) ---")
    params2 = MCParams(Δβ=1.0, t=0.8, J=0.3, μ=0.7)
    config2 = generate_spacetime(6, 40, δ, params2; seed=123, N_init=0)
    println(render_ascii(config2))
    render_svg(config2; filename="spacetime_n6_busy.svg")

    # Example 3: n=7, long time extent
    println("\n--- Example 3: n=7, β=50 (Δβ=1.0) ---")
    params3 = MCParams(Δβ=1.0, t=1.0, J=0.3, μ=0.5)
    config3 = generate_spacetime(7, 50, δ, params3; seed=456, N_init=0)
    println(render_ascii(config3))
    render_svg(config3; width=450, height=700, filename="spacetime_n7_long.svg")

    # Example 4: Ising loop weight, high activity
    println("\n--- Example 4: Ising (δ=√2), high activity ---")
    δ_ising = sqrt(2)
    params4 = MCParams(Δβ=0.8, t=1.0, J=0.3, μ=0.65)
    config4 = generate_spacetime(6, 35, δ_ising, params4; seed=789)
    println(render_ascii(config4))
    render_svg(config4; filename="spacetime_ising_active.svg")

    # Example 5: Very dense regime (N_init=1 means 1 pair = 2 worldlines)
    println("\n--- Example 5: Very dense (n=5, μ=0.9) ---")
    params5 = MCParams(Δβ=1.2, t=0.5, J=0.4, μ=0.9)
    config5 = generate_spacetime(5, 35, δ, params5; seed=999, N_init=1)
    println(render_ascii(config5))
    render_svg(config5; filename="spacetime_very_dense.svg")

    println("\n" * "="^70)
    println("Generated SVG files:")
    println("  - spacetime_n5_active.svg")
    println("  - spacetime_n6_busy.svg")
    println("  - spacetime_n7_long.svg")
    println("  - spacetime_ising_active.svg")
    println("  - spacetime_very_dense.svg")
    println("="^70)

    return config1, config2, config3, config4, config5
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
