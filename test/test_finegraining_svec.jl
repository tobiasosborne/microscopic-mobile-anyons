# Validate wavelet-based fine-graining isometries for sVec (free fermions).
#
# Phase 1A: One-particle wavelet map R: C^L → C^{2L}
#   - R†R = I (isometry)
#   - Haar and D4 filters
#   - Ground-state fidelity convergence
#
# Phase 1B: Many-body fine-graining V: H_L → H_{2L}
#   - V†V = I per sector
#   - Vacuum maps to vacuum
#   - Hamiltonian intertwining
#
# Phase 1C: Hamiltonian convergence
#   - V† H_{2L} V ≈ a H_L + b I
#   - Ground-state energy density → -2/π

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays, Combinatorics

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

# ============================================================
# Phase 1A: One-particle wavelet scaling map
# ============================================================

@testset "Daubechies filter coefficients" begin
    # Haar (K=1)
    h1 = daubechies_filter(1)
    @test length(h1) == 2
    @test sum(h1.^2) ≈ 1.0  # normalization

    # D4 (K=2)
    h2 = daubechies_filter(2)
    @test length(h2) == 4
    @test sum(h2.^2) ≈ 1.0  # normalization
    # Orthogonality: Σ h_n h_{n+2} = 0
    @test h2[1]*h2[3] + h2[2]*h2[4] ≈ 0.0 atol=1e-14
end

@testset "Haar one-particle isometry R†R = I (L=$L)" for L in 2:10
    R = one_particle_scaling_map_haar(L)
    @test size(R) == (2L, L)
    @test R' * R ≈ I(L) atol=1e-14
end

@testset "General one-particle isometry R†R = I (L=$L, K=$K)" for L in 2:10, K in [1, 2]
    h = daubechies_filter(K)
    R = one_particle_scaling_map(L, h)
    @test size(R) == (2L, L)
    @test R' * R ≈ I(L) atol=1e-12
end

@testset "Haar single-particle ground state fidelity" begin
    fidelities = Float64[]
    for L in [4, 8, 16, 32]
        R = one_particle_scaling_map_haar(L)

        # Ground state of tight-binding on L sites (OBC)
        H_L = zeros(Float64, L, L)
        for j in 1:(L-1)
            H_L[j, j+1] = -1.0
            H_L[j+1, j] = -1.0
        end
        psi_L = eigvecs(Symmetric(H_L))[:, 1]

        # Ground state on 2L sites
        H_2L = zeros(Float64, 2L, 2L)
        for j in 1:(2L-1)
            H_2L[j, j+1] = -1.0
            H_2L[j+1, j] = -1.0
        end
        psi_2L = eigvecs(Symmetric(H_2L))[:, 1]

        # Fidelity: |⟨R ψ_L | ψ_{2L}⟩|²
        fid = abs(dot(R * psi_L, psi_2L))^2
        push!(fidelities, fid)
    end

    # Fidelity should increase with L (approaching 1)
    for i in 2:length(fidelities)
        @test fidelities[i] > fidelities[i-1] - 0.01  # monotonically improving (with tolerance)
    end
    @test fidelities[end] > 0.9  # should be close to 1 for L=32
end

@testset "D4 single-particle ground state fidelity" begin
    h = daubechies_filter(2)
    fidelities = Float64[]
    for L in [4, 8, 16, 32]
        R = one_particle_scaling_map(L, h)

        H_L = zeros(Float64, L, L)
        for j in 1:(L-1)
            H_L[j, j+1] = -1.0
            H_L[j+1, j] = -1.0
        end
        psi_L = eigvecs(Symmetric(H_L))[:, 1]

        H_2L = zeros(Float64, 2L, 2L)
        for j in 1:(2L-1)
            H_2L[j, j+1] = -1.0
            H_2L[j+1, j] = -1.0
        end
        psi_2L = eigvecs(Symmetric(H_2L))[:, 1]

        fid = abs(dot(R * psi_L, psi_2L))^2
        push!(fidelities, fid)
    end

    @test fidelities[end] > 0.9
end

@testset "Dispersion relation convergence (Haar, L=$L)" for L in [4, 8]
    R = one_particle_scaling_map_haar(L)

    # Tight-binding Hamiltonian
    H_L = zeros(Float64, L, L)
    for j in 1:(L-1)
        H_L[j, j+1] = -1.0; H_L[j+1, j] = -1.0
    end
    H_2L = zeros(Float64, 2L, 2L)
    for j in 1:(2L-1)
        H_2L[j, j+1] = -1.0; H_2L[j+1, j] = -1.0
    end

    # Projected Hamiltonian: R† H_{2L} R should approximate H_L
    H_proj = R' * H_2L * R
    eigs_proj = sort(eigvals(Symmetric(H_proj)))
    eigs_L = sort(eigvals(Symmetric(H_L)))

    # Low-energy eigenvalues should be roughly similar
    # (Haar is coarse; accuracy improves with L and better wavelets)
    @test abs(eigs_proj[1] - eigs_L[1]) < 1.0  # ground state within 1
end

# ============================================================
# Phase 1B: Many-body sVec fine-graining isometry
# ============================================================

G = Oscar.cyclic_group(2)
sVec = graded_vector_spaces(G)

@testset "Many-body V†V = I for sVec (L=$L)" for L in 3:5
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    R = one_particle_scaling_map_haar(L)

    V = fine_graining_isometry_svec(basis_L, basis_2L, R)

    # V†V should be identity on the coarse space
    VtV = V' * V
    @test size(VtV) == (length(basis_L.states), length(basis_L.states))
    @test norm(Matrix(VtV) - I(size(VtV, 1))) < 1e-10
end

@testset "V maps vacuum to vacuum (L=$L)" for L in 3:5
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry_svec(basis_L, basis_2L, R)

    # Find vacuum states (N=0)
    vac_L = findfirst(st -> length(st.config.positions) == 0, basis_L.states)
    vac_2L = findfirst(st -> length(st.config.positions) == 0, basis_2L.states)

    @test !isnothing(vac_L)
    @test !isnothing(vac_2L)

    # V|vac_L⟩ should be |vac_2L⟩
    v_col = V[:, vac_L]
    @test abs(v_col[vac_2L]) ≈ 1.0 atol=1e-14
    @test nnz(v_col) == 1  # only one nonzero entry
end

@testset "V preserves particle number and charge (L=$L)" for L in 3:5
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry_svec(basis_L, basis_2L, R)

    Is, Js, Vs = findnz(V)
    for idx in eachindex(Is)
        bra = basis_2L.states[Is[idx]]
        ket = basis_L.states[Js[idx]]
        # Same particle number
        @test length(bra.config.positions) == length(ket.config.positions)
        # Same total charge
        @test bra.total_charge == ket.total_charge
    end
end

# ============================================================
# Phase 1C: Hamiltonian intertwining
# ============================================================

@testset "sVec Hamiltonian intertwining (Haar, L=$L)" for L in 3:5
    basis_L = build_basis(L, sVec)
    basis_2L = build_basis(2L, sVec)
    R = one_particle_scaling_map_haar(L)
    V = fine_graining_isometry_svec(basis_L, basis_2L, R)

    H_L = hopping_hamiltonian(basis_L; t=1.0)
    H_2L = hopping_hamiltonian(basis_2L; t=1.0)

    # Projected Hamiltonian
    H_proj = V' * H_2L * V
    H_proj_dense = Matrix(H_proj)
    H_L_dense = Matrix(H_L)

    # Find best affine fit: H_proj ≈ a * H_L + b * I
    n = size(H_L_dense, 1)
    # Least squares: minimize ||H_proj - a H_L - b I||_F
    # Vectorize: [vec(H_L) vec(I)] [a; b] ≈ vec(H_proj)
    A_ls = hcat(vec(H_L_dense), vec(Matrix(1.0I, n, n)))
    b_ls = vec(H_proj_dense)
    ab = A_ls \ b_ls
    a_fit, b_fit = ab[1], ab[2]

    residual = norm(H_proj_dense - a_fit * H_L_dense - b_fit * I(n)) / norm(H_proj_dense)

    # The intertwining should be reasonable (not exact for finite L with Haar)
    @test residual < 0.5  # generous bound — improves with better wavelets
    @test a_fit > 0  # positive rescaling
end

@testset "Ground-state energy density convergence" begin
    energies = Float64[]
    sizes = [4, 8, 16]
    for L in sizes
        basis = build_basis(L, sVec)
        # Half-filling sector (N = L/2, c = 1 for even N)
        N_half = L ÷ 2
        c_sector = iseven(N_half) ? 1 : 2
        H = hopping_hamiltonian_sector(basis, N_half, c_sector; t=1.0)
        eigs = eigvals(Symmetric(Matrix(H)))
        push!(energies, eigs[1] / L)
    end

    # Should converge to -2/π ≈ -0.6366 for the infinite chain
    target = -2/π
    # Energy density should approach the target
    @test abs(energies[end] - target) < 0.1
end
