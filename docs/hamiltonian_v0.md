---
title: Particle-Conserving Local Hamiltonians
section: "§5.1.1"
refs-in:
  - hilbert_space.md
  - operators.md
  - hardcore_softcore.md
  - qm_lattice.md
refs-out:
  - hamiltonian_v1.md
  - hamiltonian_free.md
  - limiting_cases.md
---

# Particle-Conserving Local Hamiltonians

**Planning ref:** §5.1.1
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A5.1.1 | Fusion category $\mathcal{C}$ with unit $\mathbf{1}$ and simples $X_0=\mathbf{1}, X_1, \ldots, X_{d-1}$ | Input | assumed |
| A5.1.2 | $n$ lattice sites labelled $0, \ldots, n-1$, OBC | From §3.4 | assumed |
| A5.1.3 | Hard-core regime: at most one anyon per site | From §4.4 | assumed |
| A5.1.4 | Hilbert space $\mathcal{H} = \bigoplus_{N=0}^{n} \mathcal{H}_N$ as in §4.2 | From §4.2 | assumed |

---

## §5.1.1.1 Number-Conserving Hamiltonians

**Definition 5.1.1** (Number operator). The *number operator* $\hat{N} : \mathcal{H} \to \mathcal{H}$ acts as
$$\hat{N} |\psi\rangle = N |\psi\rangle \quad \text{for } |\psi\rangle \in \mathcal{H}_N$$

**Definition 5.1.2** (Number-conserving Hamiltonian). A Hamiltonian $H$ is *number-conserving* (or *particle-conserving*) if it commutes with the number operator:
$$[\hat{N}, H] = 0$$
Equivalently, $H$ preserves each $N$-particle sector:
$$H : \mathcal{H}_N \to \mathcal{H}_N \quad \text{for all } N \in \{0, 1, \ldots, n\}$$

**Remark.** Number-conserving Hamiltonians do not create or annihilate anyons. They may move existing anyons between sites or introduce interactions between them.

---

## §5.1.1.2 Local Hamiltonians

**Definition 5.1.3** (Local Hamiltonian). A Hamiltonian $H$ is *local* if it decomposes as
$$H = \sum_{j=0}^{n-2} h_j$$
where each $h_j$ acts nontrivially only on a bounded neighbourhood of site $j$.

**Definition 5.1.4** (Nearest-neighbour Hamiltonian). A Hamiltonian $H$ is *nearest-neighbour* if each local term $h_j$ acts nontrivially only on sites $j$ and $j+1$:
$$h_j : \mathcal{H} \to \mathcal{H}, \quad h_j = \mathbb{1}_{<j} \otimes \tilde{h}_j \otimes \mathbb{1}_{>j+1}$$
where $\tilde{h}_j$ acts on the two-site space.

---

## §5.1.1.3 Morphism Decomposition

For mobile anyons, local terms decompose into morphism spaces. A number-conserving, nearest-neighbour term $h_j$ has components:

**Definition 5.1.5** (Morphism components of local term). A nearest-neighbour term $h_j$ acting on sites $j, j+1$ decomposes as:
$$h_j \in \bigoplus_{A,B} \mathrm{Mor}(A, B)$$
where $A, B$ are objects of the form $X_a \otimes X_b$ with $a, b \in \{0, 1, \ldots, d-1\}$, and the sum is over pairs $(A,B)$ with equal numbers of nontrivial (non-vacuum) factors.

**Proposition 5.1.1** (Number conservation criterion). A local term $h_j$ is number-conserving if and only if for every nonzero component in $\mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$:
$$|\{a,b\} \cap \{1,\ldots,d-1\}| = |\{c,d\} \cap \{1,\ldots,d-1\}|$$
where $|S|$ denotes the count of indices in $S$ that are nonzero (nontrivial).

---

## §5.1.1.4 Classification of Two-Site Processes

For hard-core anyons, the possible two-site configurations and number-conserving transitions are:

| Source $X_a \otimes X_b$ | Target $X_c \otimes X_d$ | Process | Particle count |
|--------------------------|--------------------------|---------|----------------|
| $\mathbf{1} \otimes \mathbf{1}$ | $\mathbf{1} \otimes \mathbf{1}$ | Vacuum identity | 0 |
| $X_a \otimes \mathbf{1}$ | $\mathbf{1} \otimes X_a$ | Hop right | 1 |
| $\mathbf{1} \otimes X_a$ | $X_a \otimes \mathbf{1}$ | Hop left | 1 |
| $X_a \otimes \mathbf{1}$ | $X_a \otimes \mathbf{1}$ | Stay left | 1 |
| $\mathbf{1} \otimes X_a$ | $\mathbf{1} \otimes X_a$ | Stay right | 1 |
| $X_a \otimes X_b$ | $X_a \otimes X_b$ | Two-anyon identity | 2 |
| $X_a \otimes X_b$ | $X_c \otimes X_d$ | Two-anyon scattering | 2 |

**Remark.** Note that hopping does NOT involve braiding: the anyon moves to an empty site without passing through another anyon. Braiding processes are treated in §5.1.3.

---

## §5.1.1.5 Hermiticity

**Definition 5.1.6** (Hermitian local term). A local term $h_j$ is *Hermitian* if $h_j = h_j^\dagger$.

For morphism components, this means:
$$\langle B | h_j | A \rangle = \overline{\langle A | h_j | B \rangle}$$
where the bar denotes complex conjugation.

**Proposition 5.1.2** (Hermiticity in terms of morphisms). A local term with component $\alpha \in \mathrm{Mor}(A, B)$ is Hermitian if and only if it also has component $\alpha^\dagger \in \mathrm{Mor}(B, A)$ with matching coefficient.

---

## Julia Implementation

```julia
# file: src/julia/MobileAnyons/hamiltonian_v0.jl
using LinearAlgebra

"""
    NumberConservingTerm

A nearest-neighbour term that conserves particle number.
Acts on sites (site, site+1).
"""
struct NumberConservingTerm
    site::Int                           # left site index (0-based)
    components::Dict{Tuple{Tuple{Int,Int}, Tuple{Int,Int}}, ComplexF64}
    # (source, target) => coefficient
    # source/target are (label_left, label_right), 0 = vacuum
end

"""
Check that all components conserve particle number.
"""
function is_number_conserving(term::NumberConservingTerm)
    for ((a, b), (c, d)) in keys(term.components)
        n_source = (a != 0) + (b != 0)
        n_target = (c != 0) + (d != 0)
        if n_source != n_target
            return false
        end
    end
    return true
end

"""
Check that the term is Hermitian.
"""
function is_hermitian(term::NumberConservingTerm)
    for (k, v) in term.components
        ((a,b), (c,d)) = k
        conj_key = ((c,d), (a,b))
        if !haskey(term.components, conj_key)
            return false
        end
        if term.components[conj_key] != conj(v)
            return false
        end
    end
    return true
end

"""
    LocalHamiltonian

A number-conserving nearest-neighbour Hamiltonian.
"""
struct LocalHamiltonian
    n_sites::Int
    terms::Vector{NumberConservingTerm}
end

"""
Build a uniform nearest-neighbour Hamiltonian from a single local term.
"""
function uniform_nn_hamiltonian(n_sites::Int, local_components::Dict)
    terms = [NumberConservingTerm(j, local_components) for j in 0:(n_sites-2)]
    return LocalHamiltonian(n_sites, terms)
end
```

---

## Summary

| Concept | Symbol | Definition |
|---------|--------|------------|
| Number operator | $\hat{N}$ | Counts anyons: $\hat{N}\vert\psi\rangle = N\vert\psi\rangle$ for $\vert\psi\rangle \in \mathcal{H}_N$ |
| Number-conserving | $[\hat{N}, H] = 0$ | Preserves particle number |
| Nearest-neighbour | $h_j$ | Acts on sites $j, j+1$ only |
| Morphism component | $\mathrm{Mor}(A, B)$ | Transitions between local configurations |

---

## Next Steps

- §5.1.1.2: Laplacian-type models (free hopping)
- §5.1.1.3: Hard-core blocking behaviour
- §5.1.2: Interactions without braiding
- §5.1.3: Free anyons with braiding
