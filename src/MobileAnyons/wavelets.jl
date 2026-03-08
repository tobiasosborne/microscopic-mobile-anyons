# Wavelet-based fine-graining isometries for OAR continuum limits.
#
# The fine-graining map R: ℂ^L → ℂ^{2L} embeds the one-particle Hilbert space
# of an L-site lattice into the 2L-site lattice using the wavelet scaling equation:
#
#   φ(x) = Σ_n h_n √2 φ(2x - n)
#
# where h_n are the low-pass filter coefficients of a compactly supported wavelet
# (Daubechies family). The matrix R satisfies R†R = I (isometry).
#
# For free fermions (sVec), the many-body isometry V lifts R to N-body via
# Slater determinants: V|x₁,...,xₙ⟩ = det(R_{xᵢ,yⱼ}) over fine-site configs.
#
# References:
#   Osborne-Stottmeister, arXiv:2107.13834, Sections 3-4
#   Stottmeister et al., arXiv:2002.01442 (PRL 127, 230601)

"""
    daubechies_filter(K::Int) -> Vector{Float64}

Return the low-pass filter coefficients h₀,...,h_{2K-1} for the Daubechies-K wavelet.
K=1 is the Haar wavelet (2 coefficients). K=2 is D4 (4 coefficients).
Coefficients satisfy: Σ hₙ² = 1, Σ hₙ h_{n+2m} = δ_{m,0} (orthogonality).
"""
function daubechies_filter(K::Int)
    K == 1 && return [1/√2, 1/√2]  # Haar
    if K == 2
        # D4 coefficients
        return [(1+√3)/(4√2), (3+√3)/(4√2), (3-√3)/(4√2), (1-√3)/(4√2)]
    end
    error("Daubechies-$K not implemented (only K=1,2)")
end

"""
    one_particle_scaling_map(L::Int, h::Vector{Float64}) -> Matrix{Float64}

Build the one-particle fine-graining isometry R: ℂ^L → ℂ^{2L}.

R maps basis vector eᵢ (particle at coarse site i) to a superposition of
fine-site basis vectors using the wavelet scaling equation:

  R[j, i] = h[j - 2(i-1)]  (1-indexed, for valid filter indices)

For OBC: columns near boundaries are truncated and renormalized so that R†R = I.
"""
function one_particle_scaling_map(L::Int, h::Vector{Float64})
    K2 = length(h)  # filter length = 2K
    L_fine = 2L
    R = zeros(Float64, L_fine, L)

    for i in 1:L
        # Coarse site i maps to fine sites centered around 2i-1, 2i
        # Filter index: j - 2(i-1), valid when 1 ≤ j - 2(i-1) ≤ K2
        for n in 1:K2
            j = 2(i - 1) + n  # fine site index (1-based)
            if 1 <= j <= L_fine
                R[j, i] = h[n]
            end
        end
    end

    # Symmetric (Löwdin) orthogonalization: R → R (R†R)^{-1/2}
    # This projects onto the nearest isometry while preserving the wavelet structure
    # (columns stay close to their original directions, unlike QR which rotates them)
    S = R' * R
    eig = eigen(Symmetric(S))
    S_inv_sqrt = eig.vectors * Diagonal(1.0 ./ sqrt.(max.(eig.values, 1e-14))) * eig.vectors'
    R_iso = R * S_inv_sqrt

    return R_iso
end

"""
    one_particle_scaling_map_haar(L::Int) -> Matrix{Float64}

Specialized Haar (K=1) scaling map. Each coarse site i maps to an equal
superposition of fine sites 2i-1 and 2i: R eᵢ = (e_{2i-1} + e_{2i})/√2.

This is exact (no boundary corrections needed) and always satisfies R†R = I.
"""
function one_particle_scaling_map_haar(L::Int)
    R = zeros(Float64, 2L, L)
    for i in 1:L
        R[2i - 1, i] = 1/√2
        R[2i, i] = 1/√2
    end
    return R
end

"""
    fine_graining_isometry_svec(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                 R::Matrix{Float64}) -> SparseMatrixCSC{Float64}

Build the many-body fine-graining isometry V: H_L → H_{2L} for sVec (free fermions).

The N-particle map is the antisymmetrized tensor product of R:
  V|x₁,...,xₙ⟩ = Σ_{y₁<...<yₙ} det(R[yₚ, xᵧ]) |y₁,...,yₙ⟩

where the sum runs over all N-element subsets {y₁,...,yₙ} of {1,...,2L}.
For the 0-particle (vacuum) sector: V|∅⟩ = |∅⟩.
"""
function fine_graining_isometry_svec(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                      R::Matrix{Float64})
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    # Build state index for fine basis: (positions, intermediates, charge) → index
    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        N = length(pos)
        tc = ket.total_charge

        if N == 0
            # Vacuum maps to vacuum
            bra_idx = get(fine_index, (Int[], Int[], tc), 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, 1.0)
            end
            continue
        end

        # Extract the N×2L submatrix of R for the occupied coarse sites
        R_sub = R[:, pos]  # 2L × N matrix

        # Sum over all N-element subsets of fine sites
        for fine_pos in Combinatorics.combinations(1:(2 * basis_L.L), N)
            # Compute the N×N minor: det of R_sub[fine_pos, :]
            minor = R_sub[fine_pos, :]  # N × N matrix
            d = det(minor)
            abs(d) < 1e-14 && continue

            # sVec: all labels = 2 (ψ), intermediates alternate 1,2,...
            # The fine state must have the same labels and compatible intermediates
            bra_key = (fine_pos, ket.intermediates, tc)
            bra_idx = get(fine_index, bra_key, 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, d)
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
end
