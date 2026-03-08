# Validate non-abelian braiding Hamiltonian for Fibonacci and Ising.
#
# Key relation: for a dense chain of identical anyons (type a),
# σ + σ† = 2Re(R_τ)·I + 2(Re(R_1) - Re(R_τ))·P_vac
# where R_1 = R^{a,a}_1, R_τ = R^{a,a}_τ.
#
# So the braiding Hamiltonian is a linear combination of identity and
# the golden chain (vacuum projector) Hamiltonian. This gives an exact
# spectral test.

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

# --- Fibonacci R-symbols ---
# R^{τ,τ}_1 = e^{-4πi/5}, R^{τ,τ}_τ = e^{3πi/5}
# (Standard convention; conjugate also valid — physics is the same.)
function fibonacci_rsymbols()
    r = Dict{Tuple{Int,Int,Int}, ComplexF64}()
    r[(1, 1, 1)] = 1.0     # R^{1,1}_1
    r[(1, 2, 2)] = 1.0     # R^{1,τ}_τ
    r[(2, 1, 2)] = 1.0     # R^{τ,1}_τ
    r[(2, 2, 1)] = exp(-4π*im/5)  # R^{τ,τ}_1
    r[(2, 2, 2)] = exp(3π*im/5)   # R^{τ,τ}_τ
    return build_rsymbol_cache_manual(r)
end

# --- Ising R-symbols ---
# Simples: 1=𝟙, 2=ψ, 3=σ (TensorCategories ordering)
# Fusion: σ⊗σ = 1⊕ψ, σ⊗ψ = σ, ψ⊗ψ = 1
# R^{σ,σ}_1 = e^{-πi/8}, R^{σ,σ}_ψ = e^{3πi/8}
# R^{ψ,ψ}_1 = -1
# R^{σ,ψ}_σ = R^{ψ,σ}_σ = -i
function ising_rsymbols()
    r = Dict{Tuple{Int,Int,Int}, ComplexF64}()
    # Vacuum braiding
    r[(1, 1, 1)] = 1.0
    r[(1, 2, 2)] = 1.0
    r[(1, 3, 3)] = 1.0
    r[(2, 1, 2)] = 1.0
    r[(3, 1, 3)] = 1.0
    # ψ⊗ψ = 1
    r[(2, 2, 1)] = -1.0
    # σ⊗ψ = σ, ψ⊗σ = σ
    r[(3, 2, 3)] = -im
    r[(2, 3, 3)] = -im
    # σ⊗σ = 1⊕ψ
    r[(3, 3, 1)] = exp(-π*im/8)
    r[(3, 3, 2)] = exp(3π*im/8)
    return build_rsymbol_cache_manual(r)
end


# ============================================================
# Fibonacci tests
# ============================================================

Fib = fibonacci_category()
fcache_fib = build_fsymbol_cache(Fib)
rcache_fib = fibonacci_rsymbols()

@testset "Fibonacci braiding Hamiltonian is Hermitian" begin
    for L in 3:6
        basis = build_basis(L, Fib)
        for c in 1:2
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue

            H = braiding_hamiltonian_sector(basis, fcache_fib, rcache_fib, L, c; λ=1.0)
            Hm = Matrix(H)

            @test norm(Hm - adjoint(Hm)) < 1e-10
        end
    end
end

@testset "Fibonacci: braiding = α·I + β·P_vac (dense chain)" begin
    # σ + σ† = 2Re(R_τ)·I + 2(Re(R_1) - Re(R_τ))·P_vac
    R_1 = exp(-4π*im/5)
    R_τ = exp(3π*im/5)
    α = 2 * real(R_τ)     # coefficient of I per bond
    β = 2 * (real(R_1) - real(R_τ))  # coefficient of P_vac per bond

    for L in 3:7
        basis = build_basis(L, Fib)
        for c in 1:2
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue

            H_braid = braiding_hamiltonian_sector(basis, fcache_fib, rcache_fib, L, c; λ=1.0)
            H_golden = interaction_hamiltonian_sector(basis, fcache_fib, L, c; J=1.0)

            dim = size(H_braid, 1)
            dim == 0 && continue

            # Expected: H_braid = α·(L-1)·I + β·H_golden
            H_expected = α * (L - 1) * I(dim) + β * H_golden

            @test Matrix(H_braid) ≈ Matrix(H_expected) atol=1e-10
        end
    end
end

@testset "Fibonacci: braiding spectrum matches golden chain prediction" begin
    R_1 = exp(-4π*im/5)
    R_τ = exp(3π*im/5)
    α = 2 * real(R_τ)
    β = 2 * (real(R_1) - real(R_τ))

    for L in 3:7
        basis = build_basis(L, Fib)
        for c in 1:2
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue

            H_braid = braiding_hamiltonian_sector(basis, fcache_fib, rcache_fib, L, c; λ=1.0)
            H_golden = interaction_hamiltonian_sector(basis, fcache_fib, L, c; J=1.0)

            dim = size(H_braid, 1)
            dim == 0 && continue

            spec_braid = sort(real.(eigvals(Matrix(H_braid))))
            spec_golden = sort(real.(eigvals(Hermitian(Matrix(H_golden)))))

            # E_braid = α(L-1) + β·E_golden
            spec_predicted = sort(α * (L - 1) .+ β .* spec_golden)

            @test spec_braid ≈ spec_predicted atol=1e-10
        end
    end
end


# ============================================================
# Ising tests
# ============================================================

Ising = ising_category()
fcache_ising = build_fsymbol_cache(Ising)
rcache_ising = ising_rsymbols()

@testset "Ising braiding Hamiltonian is Hermitian (dense σ chain)" begin
    for L in 3:6
        basis = build_basis(L, Ising)
        # Dense σ chain: N=L, all labels=3
        for c in 1:3
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue

            H = braiding_hamiltonian_sector(basis, fcache_ising, rcache_ising, L, c; λ=1.0)
            Hm = Matrix(H)
            dim = size(Hm, 1)
            dim == 0 && continue

            @test norm(Hm - adjoint(Hm)) < 1e-10
        end
    end
end

@testset "Ising: braiding spectrum (dense σ sub-block)" begin
    # For σ⊗σ: R^{σσ}_1 = e^{-πi/8}, R^{σσ}_ψ = e^{3πi/8}
    R_1 = exp(-π*im/8)
    R_ψ = exp(3π*im/8)
    α = 2 * real(R_ψ)
    β = 2 * (real(R_1) - real(R_ψ))

    for L in 3:6
        basis = build_basis(L, Ising)
        for c in 1:3
            range = get(basis.sector_ranges, (L, c), 1:0)
            isempty(range) && continue

            states = basis.states[range]
            # Find indices of all-σ states within the sector
            sigma_idx = [i for (i, st) in enumerate(states)
                         if all(l -> l == 3, st.config.labels)]
            length(sigma_idx) < 2 && continue

            H_braid = Matrix(braiding_hamiltonian_sector(
                basis, fcache_ising, rcache_ising, L, c; λ=1.0))
            H_golden = Matrix(interaction_hamiltonian_sector(
                basis, fcache_ising, L, c; J=1.0))

            # Extract all-σ sub-blocks
            Hb_sub = H_braid[sigma_idx, sigma_idx]
            Hg_sub = H_golden[sigma_idx, sigma_idx]
            dim = length(sigma_idx)

            # Braiding spectrum = α(L-1) + β × golden chain spectrum
            spec_braid = sort(real.(eigvals(Hermitian(real.(Hb_sub)))))
            spec_golden = sort(real.(eigvals(Hermitian(real.(Hg_sub)))))
            spec_predicted = sort(α * (L - 1) .+ β .* spec_golden)

            @test spec_braid ≈ spec_predicted atol=1e-10
        end
    end
end


# ============================================================
# Verlinde API extraction test
# ============================================================

@testset "Verlinde(QQBar,3) R-symbol extraction" begin
    V3 = verlinde_category(QQBar, 3)
    rcache_v = build_rsymbol_cache(V3)

    # Subcategory {1,3} = Fibonacci. Check R^{3,3}_1 and R^{3,3}_3.
    # Verlinde may use conjugate convention; check |R| = 1 and phases.
    R_vac = rcache_v.r_values[(3, 3, 1)]
    R_tau = rcache_v.r_values[(3, 3, 3)]

    @test abs(R_vac) ≈ 1.0 atol=1e-10
    @test abs(R_tau) ≈ 1.0 atol=1e-10

    # The two R-phases should be distinct
    @test !(R_vac ≈ R_tau)

    # Check: R_vac = e^{±4πi/5}, R_tau = e^{∓3πi/5}
    @test isapprox(R_vac, exp(4π*im/5), atol=1e-10) || isapprox(R_vac, exp(-4π*im/5), atol=1e-10)
    @test isapprox(R_tau, exp(3π*im/5), atol=1e-10) || isapprox(R_tau, exp(-3π*im/5), atol=1e-10)
end
