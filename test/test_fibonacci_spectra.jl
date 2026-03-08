# SC4: Fibonacci exact diag spectra with hopping and interaction.
#
# The anyonic t-J model: H = -t Σ hop + J Σ P_vac
# where P_vac projects adjacent pairs onto the vacuum fusion channel.
#
# Key checks:
# 1. Hilbert space dimensions match Fibonacci counting
# 2. H is Hermitian in each (N, c) sector
# 3. Dense limit (N=L) recovers pure golden chain
# 4. Single-particle (N=1) has no interaction (P_vac needs 2 anyons)
# 5. Spectra at various (t, J) couplings are physical

using Test
using TensorCategories, Oscar
using LinearAlgebra, Combinatorics

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

Fib = fibonacci_category()
fcache = build_fsymbol_cache(Fib)

# Expected Fibonacci Hilbert space dimensions
# Total dim for L sites = F(2L+1) (Fibonacci number)
# Dense (N=L) dim in vacuum sector = F(L-1), in τ sector = F(L)
# where F(n) is the n-th Fibonacci number (F(1)=1, F(2)=1, F(3)=2, ...)
fib_seq = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597]

@testset "Fibonacci t-J Hamiltonian properties (L=$L)" for L in 3:7
    basis = build_basis(L, Fib)

    for ((N, c), rng) in basis.sector_ranges
        dim = length(rng)
        dim == 0 && continue

        H_hop = hopping_hamiltonian_sector(basis, N, c)
        H_int = interaction_hamiltonian_sector(basis, fcache, N, c; J=1.0)
        H_total = H_hop + H_int

        Hm = Matrix(H_total)

        # Hermitian
        @test norm(Hm - adjoint(Hm)) < 1e-10

        # N=1: interaction should be zero (need ≥2 adjacent anyons)
        if N == 1
            @test norm(Matrix(H_int)) < 1e-14
        end
    end
end

@testset "Dense limit recovers golden chain (L=$L)" for L in 3:8
    basis = build_basis(L, Fib)

    for c in 1:2
        range = get(basis.sector_ranges, (L, c), 1:0)
        isempty(range) && continue

        # H_total with t=0 should be pure golden chain
        H_hop = hopping_hamiltonian_sector(basis, L, c)
        H_int = interaction_hamiltonian_sector(basis, fcache, L, c; J=1.0)

        # Hopping in dense chain: every site occupied, no hops possible
        @test nnz(H_hop) == 0

        # Interaction alone = golden chain
        H_golden = H_int
        dim = size(H_golden, 1)
        dim == 0 && continue

        spec = sort(real.(eigvals(Hermitian(real.(Matrix(H_golden))))))

        # P_vac is positive semidefinite, so spectrum ≥ 0 for J > 0
        @test spec[1] >= -1e-10
    end
end

@testset "Fibonacci dimension check" begin
    for L in 3:8
        basis = build_basis(L, Fib)

        # Dense chain dimensions
        for c in 1:2
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue
            dim = length(range)
            if c == 1  # vacuum sector: F(L-1)
                @test dim == fib_seq[L - 1]
            else  # τ sector: F(L)
                @test dim == fib_seq[L]
            end
        end

        # Total dimension (all N, all c): F(2L+1)
        total = length(basis.states)
        @test total == fib_seq[2L + 1]
    end
end

@testset "Fibonacci t-J spectra (L=$L)" for L in 3:6
    basis = build_basis(L, Fib)

    println("\n=== Fibonacci t-J spectra, L=$L ===")

    for N in 1:L
        for c in 1:2
            range = get(basis.sector_ranges, (N, c), 1:0)
            isempty(range) && continue

            dim = length(range)

            # Compute spectra at several coupling ratios
            H_hop = Matrix(hopping_hamiltonian_sector(basis, N, c))
            H_int = Matrix(interaction_hamiltonian_sector(basis, fcache, N, c; J=1.0))

            for (t_val, J_val) in [(1.0, 0.0), (1.0, 1.0), (0.0, 1.0)]
                H = -t_val .* H_hop + J_val .* real.(H_int)
                evals = sort(real.(eigvals(Symmetric(H))))
                E0 = evals[1]
                gap = dim > 1 ? evals[2] - evals[1] : NaN

                if N <= 3 || N == L  # don't print too much
                    println("  N=$N, c=$c, dim=$dim, t=$t_val, J=$J_val: " *
                            "E0=$(round(E0, digits=6)), gap=$(round(gap, digits=6))")
                end
            end

            # Physical checks on t=1, J=1 spectrum
            H = -H_hop + real.(H_int)
            evals = sort(real.(eigvals(Symmetric(H))))

            # Spectrum should be bounded
            @test all(isfinite, evals)

            # For N≥2 with interaction, spectrum should have some spread
            if N >= 2 && dim > 1
                @test evals[end] - evals[1] > 1e-10
            end
        end
    end
end

@testset "Two-particle Fibonacci spectra" begin
    # Two τ anyons on L sites. Fusion: τ⊗τ = 1⊕τ.
    # In vacuum sector (c=1): the two anyons must fuse to 1.
    # In τ sector (c=2): they fuse to τ.
    # Dimensions: C(L,2) for each sector (since there's one fusion tree per sector).

    for L in 4:8
        basis = build_basis(L, Fib)
        N = 2

        for c in 1:2
            range = get(basis.sector_ranges, (N, c), 1:0)
            isempty(range) && continue
            dim = length(range)

            # C(L, 2) = L(L-1)/2 configurations, one fusion tree each
            @test dim == L * (L - 1) ÷ 2

            H_hop = hopping_hamiltonian_sector(basis, N, c)
            H_int = interaction_hamiltonian_sector(basis, fcache, N, c; J=1.0)

            # Pure hopping (J=0): both sectors should have same spectrum
            # (fusion channel doesn't affect hopping)
            spec_hop = sort(eigvals(Matrix(H_hop)))

            # With interaction (t=1, J=1)
            H = Matrix(H_hop) + real.(Matrix(H_int))
            spec_full = sort(real.(eigvals(Symmetric(H))))

            # In vacuum sector (c=1): interaction shifts eigenvalues
            # (adjacent τ-pairs can fuse to vacuum → P_vac ≠ 0)
            # In τ sector (c=2): P_vac = 0 (two τ's fusing to τ have no vacuum channel)
            if c == 1 && dim > 1
                @test !(spec_hop ≈ spec_full)
            end
        end

        # Check: vacuum and τ sectors have same hopping spectrum
        r1 = get(basis.sector_ranges, (2, 1), 1:0)
        r2 = get(basis.sector_ranges, (2, 2), 1:0)
        if !isempty(r1) && !isempty(r2)
            spec1 = sort(eigvals(Matrix(hopping_hamiltonian_sector(basis, 2, 1))))
            spec2 = sort(eigvals(Matrix(hopping_hamiltonian_sector(basis, 2, 2))))
            @test spec1 ≈ spec2 atol=1e-10
        end
    end
end

@testset "Charge-anyon separation signature" begin
    # Poilblanc's key result: at low density, the spectrum decomposes into
    # charge (= free particle positions) and anyon (= fusion tree) sectors.
    # The charge sector should look like free hard-core bosons.
    #
    # Test: for N=2, the hopping spectrum should match C(L,2) free
    # particle configurations with hard-core exclusion (same for both
    # fusion sectors since hopping is category-blind).

    for L in 4:8
        basis = build_basis(L, Fib)

        # N=2 hopping spectrum in vacuum sector
        H_2 = hopping_hamiltonian_sector(basis, 2, 1)
        spec_anyon = sort(eigvals(Matrix(H_2)))

        # Reference: 2 hard-core particles on L sites, OBC
        # This is the same as 2 spinless fermions (or bosons) hopping
        configs = collect(Combinatorics.combinations(1:L, 2))
        n = length(configs)
        config_index = Dict(cfg => i for (i, cfg) in enumerate(configs))
        H_ref = zeros(Float64, n, n)
        for (idx, cfg) in enumerate(configs)
            occ = Set(cfg)
            for p in 1:2
                site = cfg[p]
                for delta in [-1, 1]
                    ns = site + delta
                    (1 <= ns <= L && ns ∉ occ) || continue
                    nc = copy(cfg); nc[p] = ns; sort!(nc)
                    bra = get(config_index, nc, 0)
                    bra > 0 && (H_ref[bra, idx] += -1.0)
                end
            end
        end
        spec_ref = sort(eigvals(Symmetric(H_ref)))

        @test spec_anyon ≈ spec_ref atol=1e-10
    end
end
