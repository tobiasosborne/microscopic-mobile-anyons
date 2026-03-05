---
title: Hilbert Space for Mobile Anyons
section: "§4.2"
refs-in:
  - config_space.md
  - fusion_category.md
  - morphism_spaces.md
  - fock_space.md
  - operators.md
refs-out:
  - hamiltonian_v0.md
---

# Hilbert Space for Mobile Anyons

**Planning ref:** §4.2  
**Status:** Draft

---

## Notation: Disambiguation of Symbol N

**Critical:** The symbol $N$ is overloaded in this section with three distinct meanings. Context distinguishes them:

| Context | Meaning | Example |
|---------|---------|---------|
| Subscript: $\mathcal{H}_N$, $\mathcal{H}_N^{(c)}$ | **Particle number sector** — space of exactly $N$ anyons | $\mathcal{H}_3$ = sector with 3 anyons |
| Superscript: $N_{ab}^c$ | **Fusion multiplicity** — dimension of morphism space $\mathrm{Mor}(X_a \otimes X_b, X_c)$ | $N_{12}^0 \in \{0,1\}$ in Fibonacci |
| Variable: $N \in \{1, \ldots, n\}$ (in loops/summations) | **Particle number (variable)** — used when summing over sectors | $\bigoplus_{N=0}^{n}$ |

All three use the same letter but are syntactically distinct. Avoid using plain $N$ alone; always include subscript/superscript or context.

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A4.2.1 | Fusion category $\mathcal{C}$ with unit $\mathbf{1}$ and simples $X_0=\mathbf{1}, X_1, \ldots, X_{d-1}$ | Input | assumed |
| A4.2.2 | $n$ lattice sites, OBC | From §3.4 | assumed |

---

## §4.2.1 Morphism Spaces

**Definition 4.2.1** (Morphism space). See Definition 3.1.3 in `docs/morphism_spaces.md` for the canonical definition.

For simple objects $A, B \in \mathcal{C}$: $\dim \mathrm{Mor}(A,B) = \delta_{A,B}$.  
With multiplicity: $\dim \mathrm{Mor}(X_a \otimes X_b, X_c) = N_{ab}^c$ (Definition 3.1.3.2 in §3.1.3).

---

## §4.2.2 N-Anyon Sector with Definite Charge

**Definition 4.2.2** (Site occupation). For a labelled configuration $(\mathbf{x}, \mathbf{k})$ on $n$ sites, define the *site label* $s_j \in \{0, 1, \ldots, d-1\}$ for each site $j \in \{0, \ldots, n-1\}$:
$$s_j = \begin{cases} k_i & \text{if } x_i = j \text{ for some } i \in \{1, \ldots, N\} \\ 0 & \text{otherwise (site unoccupied, i.e., vacuum } \mathbf{1}) \end{cases}$$

**Definition 4.2.3** (Object for configuration). The *tensor product object* for a labelled configuration $(\mathbf{x}, \mathbf{k})$ is:
$$\mathcal{O}(\mathbf{x}, \mathbf{k}) = X_{s_0} \otimes X_{s_1} \otimes \cdots \otimes X_{s_{n-1}}$$
This is a tensor product over all $n$ sites, with $X_0 = \mathbf{1}$ (vacuum) at unoccupied sites.

**Definition 4.2.4** (N-anyon space, definite charge). The space of $N$ anyons with total charge $c$:
$$\mathcal{H}_N^{(c)} = \bigoplus_{(\mathbf{x},\mathbf{k}) \in \mathrm{Conf}_N} \mathrm{Mor}(X_c, \mathcal{O}(\mathbf{x},\mathbf{k}))$$

**Remark.** A state $|\psi\rangle \in \mathcal{H}_N^{(c)}$ is a superposition over configurations, with amplitudes in the appropriate morphism spaces. The morphism $\mathrm{Mor}(X_c, \mathcal{O}(\mathbf{x},\mathbf{k}))$ describes how anyons at the specified positions fuse to total charge $X_c$.

---

## §4.2.3 N-Anyon Sector with Indefinite Charge

**Definition 4.2.5** (N-anyon space, indefinite charge).
$$\mathcal{H}_N = \bigoplus_{c=0}^{d-1} \mathcal{H}_N^{(c)}$$

**Remark.** Direct sum = "OR quantifier": the system has charge $X_0$ OR charge $X_1$ OR ...

---

## §4.2.4 Total Hilbert Space

**Definition 4.2.6** (Total Hilbert space).
$$\mathcal{H} = \bigoplus_{N=0}^{n} \mathcal{H}_N$$
where $\mathcal{H}_0 = \mathbb{C}$ (vacuum sector).

**Remark.** Direct sum over $N$ = "OR quantifier" for particle number. This construction corresponds to a finite-dimensional truncation of the general Fock space $\mathcal{F} = \bigoplus_{N=0}^\infty \mathcal{H}_N$ defined in `docs/fock_space.md`. The upper bound $N \le n$ arises from the hard-core constraint or finite lattice size. In the thermodynamic limit ($n \to \infty$), we recover the full structure of $\mathcal{F}$.

---

## §4.2.5 Fusion Trees

**Definition 4.2.5** (Fusion tree). A *fusion tree* $\tau$ for a configuration $(\mathbf{x}, \mathbf{k})$ with $N$ anyons is a labeling of internal nodes in a **binary tree** that encodes how the anyons fuse step-by-step to produce a final total charge. Formally:

1. **Leaves:** The $N$ anyons occupy the leaves, labeled with their types $X_{k_1}, \ldots, X_{k_N}$.
2. **Internal nodes:** Each internal node is labeled with an intermediate fusion result $X_e$ (some simple object of $\mathcal{C}$).
3. **Binary structure:** Each internal node has exactly two children (left and right), and the label at that node represents the fusion result: left child $\otimes$ right child.
4. **Root:** The root node is labeled with the final total charge $X_c$.

**Remark.** The fusion tree is not unique (not canonical) due to associativity of tensor products: different parenthesizations yield different tree structures, all yielding the same tensor product result. For multiplicity-free categories ($N_{ab}^c \in \{0,1\}$), all choices span the same morphism space $\mathrm{Mor}(X_c, \mathcal{O}(\mathbf{x},\mathbf{k}))$, but individual basis vectors depend on the choice.

**Claim 4.2.2.** Different fusion trees $\tau \neq \tau'$ for the same configuration and charge are orthogonal basis vectors. The transition amplitudes between different tree bases are determined by the F-symbols of the category.

---

## §4.2.6 Explicit Construction

For hard-core anyons, a basis of $\mathcal{H}_N^{(c)}$ is indexed by:
1. Configuration $(\mathbf{x}, \mathbf{k}) \in \mathrm{Conf}_N^{\mathrm{HC}}$
2. Fusion tree $\tau$ from $\mathcal{O}(\mathbf{x}, \mathbf{k})$ to $X_c$
3. Multiplicity indices (if $N_{ab}^c > 1$)

**Claim 4.2.3.** For multiplicity-free categories:
$$\dim \mathcal{H}_N^{(c)} = \sum_{(\mathbf{x},\mathbf{k})} \dim \mathrm{Mor}(X_c, \mathcal{O}(\mathbf{x},\mathbf{k}))$$

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
