# Test pair creation/annihilation operator.
#
# Validates the cross-sector pair creation operator h† and pair Hamiltonian Δ(h+h†).
# Key tests:
# 1. sVec (Vec_{Z/2}) amplitudes are +1 (trivial F-symbols)
# 2. Hermiticity of pair Hamiltonian
# 3. Total charge preserved
# 4. N changes by exactly +2
# 5. sVec spectrum matches bosonic pair creation reference
# 6. Vacuum → 2-particle creation
# 7. Fibonacci has nontrivial amplitudes

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays, Combinatorics

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

# ============================================================
# sVec tests (Vec_{Z/2}, trivial associator, all F = +1)
# ============================================================

G = Oscar.cyclic_group(2)
sVec = graded_vector_spaces(G)
fcache_svec = build_fsymbol_cache(sVec)

@testset "dual_pairs for sVec" begin
    dp = dual_pairs(fcache_svec)
    @test length(dp) == 1
    @test (2, 2) in dp  # ψ ⊗ ψ → 1
end

@testset "sVec pair creation: structural properties (L=$L)" for L in 3:6
    basis = build_basis(L, sVec)
    h_dag = pair_creation_operator(basis, fcache_svec)

    Is, Js, Vs = findnz(h_dag)

    @test length(Is) > 0  # should have nonzero entries

    for idx in eachindex(Is)
        bra = basis.states[Is[idx]]
        ket = basis.states[Js[idx]]

        # N changes by exactly +2
        @test length(bra.config.positions) == length(ket.config.positions) + 2

        # Total charge preserved
        @test bra.total_charge == ket.total_charge

        # Amplitudes are +1 for Vec_{Z/2} (trivial F-symbols)
        @test Vs[idx] ≈ 1.0
    end
end

@testset "sVec pair Hamiltonian is Hermitian (L=$L)" for L in 3:6
    basis = build_basis(L, sVec)
    H_pair = pair_hamiltonian(basis, fcache_svec; Δ=1.0)
    Hm = Matrix(H_pair)
    @test norm(Hm - adjoint(Hm)) < 1e-12
end

@testset "Vacuum → 2-particle creation (L=$L)" for L in 3:5
    basis = build_basis(L, sVec)
    h_dag = pair_creation_operator(basis, fcache_svec)

    # Find vacuum state(s): N=0
    vac_indices = findall(st -> length(st.config.positions) == 0, basis.states)
    @test length(vac_indices) >= 1

    for vi in vac_indices
        col = h_dag[:, vi]
        bra_indices, vals = findnz(col)

        # Each created state should have exactly 2 particles at adjacent sites
        for (bi, v) in zip(bra_indices, vals)
            bra = basis.states[bi]
            @test length(bra.config.positions) == 2
            @test bra.config.positions[2] == bra.config.positions[1] + 1
            @test bra.total_charge == basis.states[vi].total_charge
            @test v ≈ 1.0
        end

        # Number of created pairs = L-1 (one per adjacent bond)
        @test length(bra_indices) == L - 1
    end
end

# ============================================================
# sVec spectrum test: compare with direct bosonic construction
# ============================================================

"""
    bosonic_pair_spectrum(L; t=1.0, Δ=1.0) -> Vector{Float64}

Build the hopping + pair creation Hamiltonian directly for hard-core bosons
on L sites (occupation number basis, no signs). Returns sorted eigenvalues.

H = -t Σ(hop) + Δ Σ(pair create + pair annihilate)
"""
function bosonic_pair_spectrum(L; t=1.0, Δ=1.0)
    # All hard-core configurations: subsets of 1:L
    configs = Vector{Int}[]
    for N in 0:L
        for pos in Combinatorics.combinations(1:L, N)
            push!(configs, pos)
        end
    end
    n = length(configs)
    config_idx = Dict(c => i for (i, c) in enumerate(configs))

    H = zeros(Float64, n, n)

    for (idx, cfg) in enumerate(configs)
        occ = Set(cfg)
        N = length(cfg)

        # Hopping: -t (move one particle to adjacent vacant site)
        for p in 1:N
            site = cfg[p]
            for delta in [-1, 1]
                ns = site + delta
                (1 <= ns <= L && ns ∉ occ) || continue
                new_cfg = copy(cfg)
                new_cfg[p] = ns
                sort!(new_cfg)
                bra = get(config_idx, new_cfg, 0)
                bra > 0 && (H[bra, idx] += -t)
            end
        end

        # Pair creation: Δ (create pair at adjacent vacant sites)
        for j in 1:(L - 1)
            if j ∉ occ && (j + 1) ∉ occ
                new_cfg = sort([cfg; j; j + 1])
                bra = get(config_idx, new_cfg, 0)
                bra > 0 && (H[bra, idx] += Δ)
            end
        end

        # Pair annihilation: Δ (remove pair at adjacent occupied sites)
        for j in 1:(L - 1)
            if j ∈ occ && (j + 1) ∈ occ
                new_cfg = sort(filter(x -> x != j && x != j + 1, cfg))
                bra = get(config_idx, new_cfg, 0)
                bra > 0 && (H[bra, idx] += Δ)
            end
        end
    end

    return sort(eigvals(Symmetric(H)))
end

@testset "sVec hopping+pair spectrum matches bosonic reference (L=$L)" for L in 3:6
    basis = build_basis(L, sVec)
    H_hop = hopping_hamiltonian(basis; t=1.0)
    H_pair = pair_hamiltonian(basis, fcache_svec; Δ=0.5)
    H_total = H_hop + real.(H_pair)

    anyonic_spec = sort(eigvals(Symmetric(Matrix(H_total))))
    bosonic_spec = bosonic_pair_spectrum(L; t=1.0, Δ=0.5)

    @test length(anyonic_spec) == length(bosonic_spec)
    @test anyonic_spec ≈ bosonic_spec atol=1e-10
end

# ============================================================
# Fibonacci tests
# ============================================================

Fib = fibonacci_category()
fcache_fib = build_fsymbol_cache(Fib)

@testset "dual_pairs for Fibonacci" begin
    dp = dual_pairs(fcache_fib)
    @test length(dp) == 1
    @test (2, 2) in dp  # τ ⊗ τ → 1 (τ is self-dual)
end

@testset "Fibonacci pair Hamiltonian is Hermitian (L=$L)" for L in 3:6
    basis = build_basis(L, Fib)
    H_pair = pair_hamiltonian(basis, fcache_fib; Δ=1.0)
    Hm = Matrix(H_pair)
    @test norm(Hm - adjoint(Hm)) < 1e-10
end

@testset "Fibonacci pair creation has nontrivial amplitudes" begin
    L = 5
    basis = build_basis(L, Fib)
    h_dag = pair_creation_operator(basis, fcache_fib)

    Is, Js, Vs = findnz(h_dag)
    @test length(Is) > 0

    # Check that not all amplitudes are ±1 (Fibonacci has φ-dependent F-symbols)
    has_nontrivial = any(v -> abs(abs(v) - 1.0) > 0.01, Vs)
    @test has_nontrivial

    # Structural: N changes by +2, total charge preserved
    for idx in eachindex(Is)
        bra = basis.states[Is[idx]]
        ket = basis.states[Js[idx]]
        @test length(bra.config.positions) == length(ket.config.positions) + 2
        @test bra.total_charge == ket.total_charge
    end
end

@testset "Fibonacci vacuum → 2-particle creation" begin
    L = 4
    basis = build_basis(L, Fib)
    h_dag = pair_creation_operator(basis, fcache_fib)

    vac_indices = findall(st -> length(st.config.positions) == 0, basis.states)
    @test length(vac_indices) >= 1

    for vi in vac_indices
        col = h_dag[:, vi]
        bra_indices, vals = findnz(col)

        for (bi, v) in zip(bra_indices, vals)
            bra = basis.states[bi]
            @test length(bra.config.positions) == 2
            @test bra.config.positions[2] == bra.config.positions[1] + 1
            @test bra.total_charge == basis.states[vi].total_charge
        end

        # From vacuum: all amplitudes should be +1 (F^{1,τ,τ}_1 is trivial)
        for v in vals
            @test v ≈ 1.0
        end
    end
end

@testset "Fibonacci combined H is Hermitian (L=$L)" for L in 3:5
    basis = build_basis(L, Fib)
    H_hop = hopping_hamiltonian(basis; t=1.0)
    H_int = interaction_hamiltonian(basis, fcache_fib; J=1.0)
    H_pair = pair_hamiltonian(basis, fcache_fib; Δ=0.3)
    H_total = H_hop + H_int + H_pair

    Hm = Matrix(H_total)
    @test norm(Hm - adjoint(Hm)) < 1e-10
end
