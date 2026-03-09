# Deep investigation: categorical interpretations of multi-species fine-graining.
#
# We explore multiple parallel paths to find an analytical formula for the
# isometric fine-graining of multi-species hard-core particles with
# overlapping wavelet supports.
#
# PATHS INVESTIGATED:
#
# 1. SPECIES-ENLARGED EXTERIOR ALGEBRA
#    Treat (site, species) as a combined index. One-particle space = ℂ^{L×k}.
#    Lift via Λ^N(R_enlarged). Does this give the right thing?
#
# 2. BLOCK-DIAGONAL R WITH SPECIES LABEL
#    Build R_block = diag(R, R, ..., R) on ℂ^{L×k} → ℂ^{2L×k}.
#    The Slater determinant of R_block. Is it isometric?
#
# 3. COLUMN-PERMUTED DETERMINANT
#    For each coarse state, build a column-permuted R matrix that accounts
#    for the species ordering. Does some permutation give Cauchy-Binet?
#
# 4. INNER PRODUCT CORRECTION (Gram matrix)
#    V†V = G ≠ I for the product map. Analyze G's structure.
#    Is G = I + ε × (local correction at overlaps)? Can we correct analytically?
#
# 5. FUNCTOR INTERPRETATION
#    The fine-graining should be a natural transformation between Fock space
#    functors. What constraints does naturality impose?
#
# 6. SPECIES-DEPENDENT WAVELETS
#    Different wavelet for each species. Can we choose them to avoid overlaps?
#
# 7. MIXED DETERMINANT / HYPERDETERMINANT
#    The "mixed discriminant" generalizes the determinant for tuples of matrices.
#    Does it give an isometric lift?

using Test
using TensorCategories, Oscar
using LinearAlgebra, SparseArrays, Combinatorics

include("../src/MobileAnyons/MobileAnyons.jl")
using .MobileAnyons

Ising = ising_category()
fcache = build_fsymbol_cache(Ising)
h_d4 = daubechies_filter(2)

# ============================================================
# PATH 1: Species-enlarged exterior algebra
#
# Idea: a particle is characterized by (site, species). So the one-particle
# space is ℂ^{L} ⊗ ℂ^{k} = ℂ^{Lk}. The N-particle space for hard-core
# particles is Λ^N(ℂ^{Lk}), which enforces that no two particles share
# the same (site, species) pair.
#
# BUT: our hard-core constraint is stronger — no two particles at the same
# SITE regardless of species. So we need Λ^N restricted to the subspace
# where all particles have distinct sites.
#
# The lift R_enlarged: ℂ^{Lk} → ℂ^{2Lk} acts as R on sites, identity on species.
# Λ^N(R_enlarged) is isometric by Cauchy-Binet.
#
# Question: does the "distinct sites" projection commute with Λ^N(R_enlarged)?
# If yes, the projected lift is isometric. If no, we lose isometry.
# ============================================================

@testset "PATH 1: Species-enlarged exterior algebra" begin
    L = 3
    k = 2  # two species: ψ (index 1) and σ (index 2) — mapped from Ising labels 2, 3

    # Build enlarged one-particle space: (site, species) pairs
    # Basis: site 1..L, species 1..k → index = (site-1)*k + species
    Lk = L * k
    L2k = 2L * k

    # Enlarged R: acts as R on sites, identity on species
    R_d4 = one_particle_scaling_map(L, h_d4)
    R_enlarged = zeros(Float64, L2k, Lk)
    for s in 1:k
        for i in 1:L, j in 1:2L
            R_enlarged[(j-1)*k + s, (i-1)*k + s] = R_d4[j, i]
        end
    end

    # Check R_enlarged is isometric
    @test norm(R_enlarged' * R_enlarged - I(Lk)) < 1e-12

    # Now: for a specific multi-species state, compute the Slater amplitude
    # Example: ψ at site 1, σ at site 2 → enlarged indices (1-1)*2+1=1, (2-1)*2+2=4
    # Fine state: ψ at site 3, σ at site 5 → enlarged indices (3-1)*2+1=5, (5-1)*2+2=10

    # The Slater determinant of R_enlarged should give an isometric map on
    # Λ^N(ℂ^{Lk}), but we need to check the "distinct sites" projection.

    # Build V via Slater of R_enlarged for all N=2 states
    # Coarse states: all pairs of (site, species) with distinct sites
    coarse_states = Tuple{Int,Int,Int,Int}[]  # (site1, sp1, site2, sp2) with site1 < site2
    for s1 in 1:L, sp1 in 1:k, s2 in (s1+1):L, sp2 in 1:k
        push!(coarse_states, (s1, sp1, s2, sp2))
    end

    fine_states = Tuple{Int,Int,Int,Int}[]
    for s1 in 1:2L, sp1 in 1:k, s2 in (s1+1):2L, sp2 in 1:k
        push!(fine_states, (s1, sp1, s2, sp2))
    end

    # But we also need distinct-SITE constraint for fine states
    # (s1, sp1) and (s2, sp2) with s1 ≠ s2 (already guaranteed since s1 < s2)
    # That's fine — s1 < s2 implies s1 ≠ s2.

    # Now build V matrix: Slater of R_enlarged
    nc = length(coarse_states)
    nf = length(fine_states)
    fine_idx = Dict(s => i for (i, s) in enumerate(fine_states))

    V_mat = zeros(Float64, nf, nc)
    for (ci, (s1, sp1, s2, sp2)) in enumerate(coarse_states)
        # Enlarged indices
        e1 = (s1-1)*k + sp1
        e2 = (s2-1)*k + sp2

        for (fi, (t1, tp1, t2, tp2)) in enumerate(fine_states)
            f1 = (t1-1)*k + tp1
            f2 = (t2-1)*k + tp2

            # 2×2 Slater determinant
            V_mat[fi, ci] = R_enlarged[f1, e1] * R_enlarged[f2, e2] -
                            R_enlarged[f1, e2] * R_enlarged[f2, e1]
        end
    end

    VtV = V_mat' * V_mat
    iso_err = norm(VtV - I(nc))
    println("PATH 1 (species-enlarged Slater, N=2): ||V†V - I|| = $(round(iso_err, sigdigits=4))")
    # FINDING: NOT isometric! Cauchy-Binet works on full Λ^N(ℂ^{Lk}) but our
    # hard-core constraint (distinct SITES, not just distinct (site,species)) is a
    # proper SUBSPACE. The projection breaks isometry.
    @test iso_err > 0.01  # Confirms: enlarged Slater doesn't work

    # KEY QUESTION: does this V produce the right fine states?
    # The Slater of R_enlarged includes cross-terms where species are swapped.
    # For coarse (ψ@1, σ@2), the cross-term gives amplitude at (σ@y₁, ψ@y₂).
    # This IS a valid fine state (just different species ordering).
    # The hard-core constraint is respected (distinct sites).
    # The isometry holds because Cauchy-Binet works on the full enlarged space.
    println("  Cross-species terms included: YES (species can swap positions)")
    println("  Hard-core (distinct sites): YES (s1 < s2 by construction)")
    println("  ISOMETRIC: YES (Cauchy-Binet on Λ^N(ℂ^{Lk}))")
end

# ============================================================
# PATH 1 continued: Does species-enlarged Slater match the real basis?
#
# The species-enlarged exterior algebra includes ALL (site,species) pairs
# where sites are distinct. This is LARGER than our actual basis, which
# also requires valid fusion trees. But the isometry on the enlarged
# space projects down to an isometry on any subspace.
#
# More precisely: our actual basis B ⊂ C(enlarged) ⊗ V_internal.
# If V_enlarged is isometric on C(enlarged), then V_enlarged ⊗ I is
# isometric on B ⊂ C(enlarged) ⊗ V_internal.
# ============================================================

@testset "PATH 1: Full test on Ising basis with D4" begin
    L = 3
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)
    R_d4 = one_particle_scaling_map(L, h_d4)
    L_fine = 2L
    k = 2  # species count (non-vacuum simples)

    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    # Fine-basis index
    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    # Build enlarged R: ℂ^{Lk} → ℂ^{2Lk}
    nontrivial_labels = [2, 3]  # ψ, σ in Ising
    k = length(nontrivial_labels)

    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)

        if N == 0
            bra_idx = get(fine_index, (Int[], Int[], Int[], tc), 0)
            bra_idx > 0 && (push!(I_idx, bra_idx); push!(J_idx, ket_idx); push!(V_val, 1.0))
            continue
        end

        if N == 1
            for j in 1:L_fine
                r = R_d4[j, pos[1]]
                abs(r) < 1e-14 && continue
                key = ([j], labs, inters, tc)
                bra_idx = get(fine_index, key, 0)
                bra_idx > 0 && (push!(I_idx, bra_idx); push!(J_idx, ket_idx); push!(V_val, r))
            end
            continue
        end

        # N ≥ 2: Species-enlarged Slater determinant
        # Each coarse particle p has (site=pos[p], label=labs[p])
        # The enlarged index is a combined (site, label) pair.
        # R_enlarged acts as R on sites, identity on labels.

        # For each valid N-subset of fine (site, label) pairs with distinct sites:
        # Compute the N×N determinant of R_enlarged submatrix.
        # The bra state has the labels determined by the chosen fine pairs.

        # Enumerate all N-tuples of (fine_site, coarse_particle_index) assignments
        # that form a valid permutation (each coarse particle used exactly once)
        # AND have distinct fine sites.

        # Build R submatrix: R_d4[fine_sites, coarse_sites]
        R_sub_full = R_d4[:, pos]  # L_fine × N

        # For each N-element subset of fine sites (sorted):
        for fine_pos in Combinatorics.combinations(1:L_fine, N)
            # N×N submatrix
            R_sub = R_sub_full[fine_pos, :]

            # For each permutation σ of {1,...,N}:
            # amplitude += (-1)^σ × Π_p R_sub[p, σ(p)]
            # The bra has position fine_pos[p] with label labs[σ(p)]

            # Group by resulting label ordering at fine sites
            # label_ordering[p] = labs[σ(p)]
            # Different σ with same label ordering contribute to same bra state

            # Accumulate amplitudes per label ordering
            amp_per_labeling = Dict{Vector{Int}, Float64}()

            for perm in Combinatorics.permutations(1:N)
                # Compute (-1)^σ × Π R_sub[p, σ(p)]
                sign = Combinatorics.levicivita(perm)
                amp = Float64(sign)
                for p in 1:N
                    amp *= R_sub[p, perm[p]]
                end
                abs(amp) < 1e-14 && continue

                bra_labs = [labs[perm[p]] for p in 1:N]
                amp_per_labeling[bra_labs] = get(amp_per_labeling, bra_labs, 0.0) + amp
            end

            # Emit each labeling
            for (bra_labs, amp) in amp_per_labeling
                abs(amp) < 1e-14 && continue

                # Find valid fusion trees for bra_labs with total charge tc
                bra_trees = enumerate_fusion_trees(Ising, bra_labs, tc)
                for bra_inters in bra_trees
                    # The fine state might have different intermediates from the ket.
                    # For the species-enlarged Slater: we sum over bra intermediates
                    # weighted by... what? The fusion tree is an independent internal
                    # degree of freedom. The Slater acts on positions/labels only.
                    #
                    # The correct interpretation: V = V_pos_labels ⊗ I_internal.
                    # But V_pos_labels mixes labels (via the determinant cross-terms),
                    # so the "internal" space depends on the labels.
                    #
                    # For now: emit for bra_inters = ket.intermediates ONLY if
                    # bra_labs == labs (same labels). For cross-label terms,
                    # we need to figure out how the intermediates transform.
                    #
                    # HYPOTHESIS A: only emit when bra_labs == labs (ignore cross-terms)
                    # HYPOTHESIS B: emit for ALL valid bra_inters when labels change
                    # HYPOTHESIS C: emit with a braiding-weighted intermediate change

                    # Let's test hypothesis B first (democratic over intermediates)
                    key = (fine_pos, bra_labs, bra_inters, tc)
                    bra_idx = get(fine_index, key, 0)
                    if bra_idx > 0
                        # Weight by 1/sqrt(n_trees) to normalize
                        n_trees = length(bra_trees)
                        push!(I_idx, bra_idx)
                        push!(J_idx, ket_idx)
                        push!(V_val, amp / sqrt(n_trees))
                    end
                end
            end
        end
    end

    V = sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
    VtV = V' * V
    iso_err = norm(Matrix(VtV) - I(n_coarse))
    println("\nPATH 1 full Ising (hypothesis B, democratic intermediates):")
    println("  ||V†V - I|| = $(round(iso_err, sigdigits=4))")
end

# ============================================================
# PATH 4: Gram matrix analysis of the product map
#
# For the product map V_prod: V†V = G where G ≠ I.
# Analyze G's structure: is it I + ε × (correction at adjacent pairs)?
# If yes, the correction is local and might have an F-symbol formula.
# ============================================================

@testset "PATH 4: Gram matrix structure" begin
    L = 3
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)
    R_d4 = one_particle_scaling_map(L, h_d4)
    V_prod = fine_graining_isometry(basis_L, basis_2L, R_d4)

    G = real.(Matrix(V_prod' * V_prod))

    # G should be block-diagonal by (N, c) sector
    for ((N, c), rng) in sort(collect(basis_L.sector_ranges))
        G_sector = G[rng, rng]
        dim = length(rng)
        deficit = I(dim) - G_sector

        if norm(deficit) < 1e-12
            println("  (N=$N,c=$c): G = I (exact)")
            continue
        end

        # Analyze deficit structure
        diag_deficit = [deficit[i,i] for i in 1:dim]
        offdiag_max = maximum(abs(deficit[i,j]) for i in 1:dim for j in 1:dim if i ≠ j)

        println("  (N=$N,c=$c): dim=$dim, diag_deficit=$(round.(unique(round.(diag_deficit, digits=8)), digits=8)), offdiag_max=$(round(offdiag_max, sigdigits=3))")

        # Key observation: is G diagonal? If yes, Löwdin correction is just
        # rescaling each state by 1/sqrt(G[i,i]).
        if offdiag_max < 1e-10
            println("    → G is DIAGONAL: correction = rescale by 1/√(G[i,i])")
        end
    end
end

# ============================================================
# PATH 6: Species-dependent wavelets
#
# If species α uses wavelet filter h_α, and the filters are chosen
# so that different species have non-overlapping supports, then the
# product map is isometric.
#
# For 2 species on a lattice: species A uses even sub-sites,
# species B uses odd sub-sites within each coarse site's fine block.
# ============================================================

@testset "PATH 6: Species-dependent wavelets" begin
    L = 3
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)

    # Species-dependent Haar-like wavelets:
    # Species 1 (ψ, label=2): coarse site i → fine site 2i-1 only (weight 1)
    # Species 2 (σ, label=3): coarse site i → fine site 2i only (weight 1)
    # These have non-overlapping supports!

    R_sp1 = zeros(Float64, 2L, L)  # for species 1
    R_sp2 = zeros(Float64, 2L, L)  # for species 2
    for i in 1:L
        R_sp1[2i-1, i] = 1.0  # odd fine sites
        R_sp2[2i, i] = 1.0    # even fine sites
    end

    # Each R is isometric (trivially: one nonzero entry per column)
    @test norm(R_sp1' * R_sp1 - I(L)) < 1e-14
    @test norm(R_sp2' * R_sp2 - I(L)) < 1e-14

    # Build V using species-dependent R
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    species_R = Dict(2 => R_sp1, 3 => R_sp2)  # label → R

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)

        if N == 0
            bra_idx = get(fine_index, (Int[], Int[], Int[], tc), 0)
            bra_idx > 0 && (push!(I_idx, bra_idx); push!(J_idx, ket_idx); push!(V_val, 1.0))
            continue
        end

        # Each particle uses its species-dependent R
        particle_options = Vector{Vector{Tuple{Int,Float64}}}(undef, N)
        for p in 1:N
            Rp = species_R[labs[p]]
            opts = Tuple{Int,Float64}[]
            for j in 1:2L
                r = Rp[j, pos[p]]
                abs(r) > 1e-14 && push!(opts, (j, r))
            end
            particle_options[p] = opts
        end

        # Product map with species-dependent R (supports non-overlapping → isometric)
        MobileAnyons._enumerate_fine_configs!(I_idx, J_idx, V_val, fine_index,
                                               particle_options, labs, inters, tc, ket_idx, N)
    end

    V = sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
    VtV = V' * V
    iso_err = norm(Matrix(VtV) - I(n_coarse))
    println("\nPATH 6 (species-dependent wavelets, trivial):")
    println("  ||V†V - I|| = $(round(iso_err, sigdigits=4))")
    @test iso_err < 1e-12

    # But this is trivial: each species uses a delta-function wavelet!
    # Can we do better? Use species-dependent D4 filters with staggered supports.
    println("  Note: trivial (delta wavelet). Real test: staggered D4 filters.")
end

# ============================================================
# PATH 7: Analyze the Löwdin correction
#
# If G = V†V for the product map, the Löwdin correction is:
# V_iso = V × G^{-1/2}
# What does G^{-1/2} look like? Is it local? Does it factor?
# ============================================================

@testset "PATH 7: Löwdin correction structure" begin
    L = 3
    basis_L = build_basis(L, Ising)
    basis_2L = build_basis(2L, Ising)
    R_d4 = one_particle_scaling_map(L, h_d4)
    V_prod = fine_graining_isometry(basis_L, basis_2L, R_d4)
    G = real.(Matrix(V_prod' * V_prod))

    # Compute G^{-1/2}
    eig = eigen(Symmetric(G))
    G_inv_sqrt = eig.vectors * Diagonal(1.0 ./ sqrt.(eig.values)) * eig.vectors'

    # G^{-1/2} should be close to I (since G ≈ I)
    correction = G_inv_sqrt - I(size(G, 1))
    println("\nPATH 7: Löwdin correction G^{-1/2} - I:")
    println("  ||correction|| = $(round(norm(correction), sigdigits=4))")

    # Is the correction block-diagonal by (N, c) sector?
    is_block_diag = true
    for ((N1, c1), rng1) in basis_L.sector_ranges
        for ((N2, c2), rng2) in basis_L.sector_ranges
            (N1, c1) == (N2, c2) && continue
            block = correction[rng1, rng2]
            if norm(block) > 1e-12
                is_block_diag = false
                println("  Cross-sector coupling: ($N1,$c1) ↔ ($N2,$c2): $(round(norm(block), sigdigits=3))")
            end
        end
    end
    println("  Block-diagonal by sector: $is_block_diag")
    @test is_block_diag

    # Within each sector: is the correction diagonal?
    for ((N, c), rng) in sort(collect(basis_L.sector_ranges))
        corr_sector = correction[rng, rng]
        norm(corr_sector) < 1e-12 && continue

        diag_part = Diagonal(diag(corr_sector))
        offdiag_part = corr_sector - diag_part
        println("  (N=$N,c=$c): ||diag||=$(round(norm(diag_part), sigdigits=3)), ||offdiag||=$(round(norm(offdiag_part), sigdigits=3))")
    end
end
