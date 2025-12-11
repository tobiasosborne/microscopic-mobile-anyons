# Mathematical Symbols Reference

This document provides a comprehensive reference for all mathematical symbols used in the mobile anyons project, organized by topic.

> **Note:** The authoritative machine-readable version is maintained in [`symbols.yaml`](./symbols.yaml).

---

## Fusion Rings and Categories

| Symbol | Type | Description | Defined In |
|--------|------|-------------|------------|
| $R$ | FusionRing | Fusion ring (finitely generated free abelian group with ring structure) | [fusion_ring.md](docs/fusion_ring.md) |
| $I$ | Set | Index set for basis elements of fusion ring (with 0 ∈ I) | [fusion_ring.md](docs/fusion_ring.md) |
| $k$ | Field | Algebraically closed field (usually k = ℂ) for fusion categories | [fusion_category.md](docs/fusion_category.md) |
| $\mathcal{C}$ | FusionCategory | Fusion category (k-linear, semisimple, rigid monoidal category) | [fusion_category.md](docs/fusion_category.md) |
| $K_0(\mathcal{C})$ | FusionRing | Grothendieck ring of fusion category C (decategorification) | [fusion_category.md](docs/fusion_category.md) |
| $\mathrm{Irr}(\mathcal{C})$ | Set | Set of isomorphism classes of simple (irreducible) objects in C | [fusion_category.md](docs/fusion_category.md) |
| $d$ | Int | Number of simple objects (rank of the category/ring) | [fusion_ring.md](docs/fusion_ring.md) |

---

## Simple Objects and Duality

| Symbol | Type | Description | Defined In |
|--------|------|-------------|------------|
| $\mathbf{1}$ | SimpleObject | Tensor unit (vacuum), equal to X_0 | [fusion_ring.md](docs/fusion_ring.md) |
| $X_i$ | SimpleObject | Simple objects of the fusion ring/category (anyon labels), where i ∈ I and X_0 = 𝟙 | [fusion_ring.md](docs/fusion_ring.md) |
| $i^*$ | Index | Dual index under the involution map (duality) | [fusion_ring.md](docs/fusion_ring.md) |
| $X_i^*$ | SimpleObject | Dual of simple object X_i, equal to X_{i*} | [fusion_ring.md](docs/fusion_ring.md) |

---

## Morphisms and Fusion Data

| Symbol | Type | Description | Defined In |
|--------|------|-------------|------------|
| $\mathrm{Mor}(A, B)$ | VectorSpace | Morphism space from object A to B (finite-dimensional k-vector space) | [morphism_spaces.md](docs/morphism_spaces.md) |
| $\mathrm{End}(X)$ | VectorSpace | Endomorphism space Hom(X,X) of object X | [fusion_category.md](docs/fusion_category.md) |
| $N_{ij}^k$ | Int | Fusion coefficients/multiplicities (non-negative integers), with N_{i,i*}^0 = 1 | [fusion_ring.md](docs/fusion_ring.md) |
| $F$ | Tensor | Associator (F-symbols) including multiplicity indices | [fusion_category.md](docs/fusion_category.md) |
| $R$ | Tensor | Braiding (R-symbols) including multiplicity indices | [fusion_category.md](docs/fusion_category.md) |

---

## Lattice and Configuration Space

| Symbol | Type | Description | Defined In |
|--------|------|-------------|------------|
| $\Lambda$ | Set | Lattice of sites (set of indices) | [lattice.md](docs/lattice.md) |
| $n$ | Int | Number of lattice sites | [lattice.md](docs/lattice.md) |
| $\mathcal{H}_{\mathrm{loc}}$ | HilbertSpace | Local Hilbert space (isomorphic for all sites) | [lattice.md](docs/lattice.md) |
| $\mathrm{Conf}_N$ | Set | Configuration space for N anyons | [config_space.md](docs/config_space.md) |
| $\mathrm{Conf}_N^{\mathrm{HC}}$ | Set | Hard-core configuration space (distinct positions) | [config_space.md](docs/config_space.md) |
| $\mathcal{O}(\mathbf{x}, \mathbf{k})$ | Object | Tensor product object corresponding to a labelled configuration | [hilbert_space.md](docs/hilbert_space.md) |

---

## Hilbert Spaces

| Symbol | Type | Description | Defined In |
|--------|------|-------------|------------|
| $\mathcal{H}$ | HilbertSpace | Total Hilbert space for mobile anyons (direct sum over N) | [hilbert_space.md](docs/hilbert_space.md) |
| $\mathcal{H}_N$ | HilbertSpace | N-anyon Hilbert space with unspecified total charge | [hilbert_space.md](docs/hilbert_space.md) |
| $\mathcal{H}_N^{(c)}$ | HilbertSpace | N-anyon Hilbert space with fixed total charge c | [hilbert_space.md](docs/hilbert_space.md) |
| $\mathcal{F}$ | HilbertSpace | Standard Fock space (direct sum of n-particle spaces) | [fock_space.md](docs/fock_space.md) |

---

## Operators and Observables

| Symbol | Type | Description | Defined In |
|--------|------|-------------|------------|
| $H$ | Operator | Hamiltonian operator | [qm_lattice.md](docs/qm_lattice.md) |
| $E_n$ | Real | Energy eigenvalues (level index n) | [qm_lattice.md](docs/qm_lattice.md) |
| $\Delta$ | Real | Spectral gap (E_1 - E_0) | [qm_lattice.md](docs/qm_lattice.md) |
| $\beta$ | Real | Inverse temperature | [qm_lattice.md](docs/qm_lattice.md) |
| $Z(\beta)$ | Real | Partition function at inverse temperature beta | [qm_lattice.md](docs/qm_lattice.md) |

---

## Quick Index

### By Category
- **Fusion Theory:** R, I, k, C, K₀(C), Irr(C), d, 𝟙, Xᵢ, i*, Xᵢ*, Nᵢⱼᵏ, F, R
- **Morphisms:** Mor(A,B), End(X)
- **Lattice:** Λ, n, ℋₗₒ꜀
- **Configuration:** Confₙ, Confₙᴴᶜ, O(x,k)
- **Hilbert Spaces:** ℋ, ℋₙ, ℋₙ⁽ᶜ⁾, ℱ
- **Dynamics:** H, Eₙ, Δ, β, Z(β)

### Alphabetical
A B C D E F H I K L M N O R X Z Δ Λ β

---

*Last updated: 2025-12-11*
*Total symbols: 33*
