---
title: Quantum Mechanics for Lattice Models
section: "§3.3"
refs-in: []
refs-out:
  - lattice.md
  - hilbert_space.md
---

# Quantum Mechanics for Lattice Models

**Planning ref:** §3.3  
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.3.1 | All Hilbert spaces are finite-dimensional | Technical | assumed |
| A3.3.2 | Hamiltonians are Hermitian | Physical | assumed |

---

## §3.3.1 Hilbert Spaces, States, Observables

**Definition 3.3.1** (Hilbert space). A *Hilbert space* $\mathcal{H}$ is a complex vector space equipped with an inner product $\langle \cdot | \cdot \rangle : \mathcal{H} \times \mathcal{H} \to \mathbb{C}$ that is complete with respect to the induced norm. In this work, all Hilbert spaces are finite-dimensional.
[Standard] `[verified]`

**Definition 3.3.2** (State). A *state* is a nonzero vector $|\psi\rangle \in \mathcal{H}$. Two states are physically equivalent if they differ by a nonzero scalar. Normalised states satisfy $\langle\psi|\psi\rangle = 1$.

**Definition 3.3.3** (Observable). An *observable* is a Hermitian operator $A : \mathcal{H} \to \mathcal{H}$, i.e., $A = A^\dagger$ where $\langle \phi | A \psi \rangle = \langle A\phi | \psi \rangle$ for all $|\phi\rangle, |\psi\rangle$.

```julia
# file: src/julia/QMLattice/basics.jl
using LinearAlgebra

"""
A finite-dimensional Hilbert space represented by its dimension.
States are vectors in ℂ^dim.
"""
struct HilbertSpace
    dim::Int
end

"""
Check if operator A is Hermitian (observable).
"""
is_hermitian(A::Matrix{<:Number}) = A ≈ A'

"""
Normalise a state vector.
"""
normalise(ψ::Vector{<:Number}) = ψ / norm(ψ)
```

---

## §3.3.2 Hamiltonians for Lattice Systems

**Definition 3.3.4** (Hamiltonian). A *Hamiltonian* is a Hermitian operator $H : \mathcal{H} \to \mathcal{H}$ representing the total energy of the system.

**Definition 3.3.5** (Local Hamiltonian). A Hamiltonian $H$ is *local* if it decomposes as a sum of terms, each acting nontrivially on a bounded number of sites:
$$H = \sum_j h_j$$
where each $h_j$ acts on sites in a neighbourhood of $j$.

**Definition 3.3.6** (Nearest-neighbour Hamiltonian). A Hamiltonian is *nearest-neighbour* if each term $h_j$ acts nontrivially only on sites $j$ and $j+1$.

```julia
# file: src/julia/QMLattice/hamiltonian.jl

"""
Local term acting on sites i, i+1 embedded in full Hilbert space.
- local_h: operator on ℂ^d ⊗ ℂ^d
- i: site index (1-based)
- n_sites: total number of sites
- d: local dimension
"""
function embed_local_term(local_h::Matrix, i::Int, n_sites::Int, d::Int)
    @assert 1 ≤ i < n_sites "Site index out of range"
    @assert size(local_h) == (d^2, d^2) "Local term has wrong dimension"
    
    # Build: I ⊗ ... ⊗ I ⊗ local_h ⊗ I ⊗ ... ⊗ I
    left_dim = d^(i-1)
    right_dim = d^(n_sites - i - 1)
    
    kron(I(left_dim), local_h, I(right_dim))
end

"""
Build nearest-neighbour Hamiltonian from local term.
"""
function nn_hamiltonian(local_h::Matrix, n_sites::Int, d::Int)
    H = zeros(ComplexF64, d^n_sites, d^n_sites)
    for i in 1:(n_sites-1)
        H += embed_local_term(local_h, i, n_sites, d)
    end
    return H
end
```

---

## §3.3.3 Ground States, Spectrum, Partition Function

**Definition 3.3.7** (Spectrum). The *spectrum* of $H$ is the set of eigenvalues $\{E_0, E_1, \ldots\}$ ordered so that $E_0 \leq E_1 \leq \cdots$.

**Definition 3.3.8** (Ground state). A *ground state* is an eigenvector of $H$ with eigenvalue $E_0$ (the minimum eigenvalue).

**Definition 3.3.9** (Spectral gap). The *spectral gap* is $\Delta = E_1 - E_0$.

**Definition 3.3.10** (Partition function). The *partition function* at inverse temperature $\beta$ is
$$Z(\beta) = \mathrm{Tr}(e^{-\beta H}) = \sum_n e^{-\beta E_n}$$

```julia
# file: src/julia/QMLattice/spectrum.jl
using LinearAlgebra

"""
Compute spectrum (sorted eigenvalues) of Hermitian H.
"""
spectrum(H::Hermitian) = sort(eigvals(H))
spectrum(H::Matrix) = spectrum(Hermitian(H))

"""
Ground state energy and vector.
"""
function ground_state(H::Hermitian)
    E, V = eigen(H)
    idx = argmin(E)
    return E[idx], V[:, idx]
end

"""
Spectral gap.
"""
function spectral_gap(H::Hermitian)
    E = spectrum(H)
    return E[2] - E[1]
end

"""
Partition function at inverse temperature β.
"""
function partition_function(H::Hermitian, β::Real)
    E = spectrum(H)
    return sum(exp.(-β .* E))
end
```

---

## §3.3.4 Tensor Product Structure

**Definition 3.3.11** (Tensor product of Hilbert spaces). Given Hilbert spaces $\mathcal{H}_1, \mathcal{H}_2$, the *tensor product* $\mathcal{H}_1 \otimes \mathcal{H}_2$ is a Hilbert space with:
- $\dim(\mathcal{H}_1 \otimes \mathcal{H}_2) = \dim(\mathcal{H}_1) \cdot \dim(\mathcal{H}_2)$
- Basis: $\{|i\rangle \otimes |j\rangle\}$ for bases $\{|i\rangle\}$ of $\mathcal{H}_1$ and $\{|j\rangle\}$ of $\mathcal{H}_2$

**Definition 3.3.12** (Multi-site Hilbert space). For $n$ sites with local Hilbert space $\mathcal{H}_{\mathrm{loc}}$ of dimension $d$, the total Hilbert space is
$$\mathcal{H}_{\mathrm{total}} = \bigotimes_{j=1}^{n} \mathcal{H}_{\mathrm{loc}} \cong \mathbb{C}^{d^n}$$

**Remark.** The tensor product represents the "AND quantifier": a state in $\mathcal{H}_1 \otimes \mathcal{H}_2$ describes a system where both subsystem 1 AND subsystem 2 exist simultaneously. Cf. §3.2.

```julia
# file: src/julia/QMLattice/tensor.jl
using LinearAlgebra

"""
Tensor product of Hilbert spaces (dimensions).
"""
tensor_product(H1::HilbertSpace, H2::HilbertSpace) = HilbertSpace(H1.dim * H2.dim)

"""
Multi-site Hilbert space: n copies of local space of dimension d.
"""
multisite_space(d::Int, n::Int) = HilbertSpace(d^n)

"""
Tensor product of state vectors.
"""
tensor_product(ψ1::Vector, ψ2::Vector) = kron(ψ1, ψ2)

"""
Tensor product of operators.
"""
tensor_product(A::Matrix, B::Matrix) = kron(A, B)
```

---

## Summary

| Concept | Symbol | Definition |
|---------|--------|------------|
| Hilbert space | $\mathcal{H}$ | Finite-dim complex inner product space |
| State | $\vert\psi\rangle$ | Nonzero vector in $\mathcal{H}$ |
| Observable | $A$ | Hermitian operator |
| Hamiltonian | $H$ | Hermitian operator (energy) |
| Ground state | $\vert\psi_0\rangle$ | Eigenvector with minimal eigenvalue |
| Partition function | $Z(\beta)$ | $\mathrm{Tr}(e^{-\beta H})$ |
| Tensor product | $\otimes$ | "AND quantifier" for composite systems |
