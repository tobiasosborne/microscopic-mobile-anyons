---
title: Hilbert Space for Mobile Anyons
section: "§4.2"
refs-in:
  - config_space.md
  - fusion_category.md
  - fock_space.md
refs-out:
  - operators.md
  - hamiltonian_v0.md
---

# Hilbert Space for Mobile Anyons

**Planning ref:** §4.2  
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A4.2.1 | Fusion category $\mathcal{C}$ with unit $\mathbf{1}$ and simples $X_1=\mathbf{1}, X_2, \ldots, X_d$ | Input | assumed |
| A4.2.2 | $n$ lattice sites, OBC | From §3.4 | assumed |

---

## §4.2.1 Morphism Spaces

**Definition 4.2.1** (Morphism space). For objects $A, B \in \mathcal{C}$:
$$\mathrm{Mor}(A, B) = \mathrm{Hom}_{\mathcal{C}}(A, B)$$
This is a finite-dimensional complex vector space with $\dim \mathrm{Mor}(A,B) = \delta_{A,B}$ for simple $A, B$ (in the multiplicity-free case).

**Remark.** With multiplicity: $\dim \mathrm{Mor}(X_a \otimes X_b, X_c) = N_{ab}^c$.

---

## §4.2.2 N-Anyon Sector with Definite Charge

**Definition 4.2.2** (Object for configuration). For labelled configuration $(\mathbf{x}, \mathbf{k})$, define:
$$\mathcal{O}(\mathbf{x}, \mathbf{k}) = X_{k_1} \otimes X_{k_2} \otimes \cdots \otimes X_{k_N}$$

**Definition 4.2.3** (N-anyon space, definite charge). The space of $N$ anyons with total charge $c$:
$$\mathcal{H}_N^{(c)} = \bigoplus_{(\mathbf{x},\mathbf{k}) \in \mathrm{Conf}_N} \mathrm{Mor}(\mathbf{1}, \mathcal{O}(\mathbf{x},\mathbf{k}))_c$$
where the subscript $c$ restricts to morphisms whose image fuses to $X_c$.

**Remark.** A state $|\psi\rangle \in \mathcal{H}_N^{(c)}$ is a superposition over configurations, with amplitudes in the appropriate morphism spaces.

---

## §4.2.3 N-Anyon Sector with Indefinite Charge

**Definition 4.2.4** (N-anyon space, indefinite charge).
$$\mathcal{H}_N = \bigoplus_{c=1}^{d} \mathcal{H}_N^{(c)}$$

**Remark.** Direct sum = "OR quantifier": the system has charge $c_1$ OR charge $c_2$ OR ...

---

## §4.2.4 Total Hilbert Space

**Definition 4.2.5** (Total Hilbert space).
$$\mathcal{H} = \bigoplus_{N=0}^{n} \mathcal{H}_N$$
where $\mathcal{H}_0 = \mathbb{C}$ (vacuum sector).

**Remark.** Direct sum over $N$ = "OR quantifier" for particle number. This is the first-quantised Fock space structure (cf. §3.2).

---

## §4.2.5 Explicit Construction

For hard-core anyons, a basis of $\mathcal{H}_N^{(c)}$ is indexed by:
1. Configuration $(\mathbf{x}, \mathbf{k}) \in \mathrm{Conf}_N^{\mathrm{HC}}$
2. Fusion tree $\tau$ from $X_{k_1} \otimes \cdots \otimes X_{k_N}$ to $X_c$
3. Multiplicity indices (if $N_{ab}^c > 1$)

**Claim 4.2.1.** For multiplicity-free categories:
$$\dim \mathcal{H}_N^{(c)} = \sum_{(\mathbf{x},\mathbf{k})} \dim \mathrm{Mor}(\mathbf{1}, \mathcal{O}(\mathbf{x},\mathbf{k}))_c$$

```julia
# file: src/julia/MobileAnyons/hilbert.jl
using .MobileAnyons

struct AnyonBasisState
    config::LabelledConfig      # positions and labels
    fusion_tree::Vector{Int}    # intermediate fusion outcomes
    total_charge::Int           # final charge c
end

struct MobileAnyonHilbert
    n_sites::Int
    fusion_cat::FusionCategory
    max_anyons::Int             # usually = n_sites for HC
    sectors::Dict{Tuple{Int,Int}, Vector{AnyonBasisState}}  # (N,c) -> basis
end

function build_basis_Nc(n_sites, cat, N, c)
    basis = AnyonBasisState[]
    for config in enumerate_configs_hc(n_sites, N, cat.d)
        for tree in enumerate_fusion_trees(cat, config.labels, c)
            push!(basis, AnyonBasisState(config, tree, c))
        end
    end
    return basis
end
```
