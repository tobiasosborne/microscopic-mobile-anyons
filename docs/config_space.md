---
title: Classical Configuration Space
section: "§4.1"
refs-in:
  - lattice.md
  - fusion_category.md
refs-out:
  - hilbert_space.md
---

# Classical Configuration Space

**Planning ref:** §4.1  
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A4.1.1 | Fusion category $\mathcal{C}$ with simples $\{1, X_2, \ldots, X_d\}$ | Input | assumed |
| A4.1.2 | Lattice $\Lambda = \{0, \ldots, n-1\}$ with OBC | From §3.4 | assumed |

---

## §4.1.1 Anyon Positions

**Definition 4.1.1** (Configuration). A *configuration* of $N$ anyons is a tuple
$$\mathbf{x} = (x_1, x_2, \ldots, x_N) \in \Lambda^N$$
satisfying $0 \leq x_1 \leq x_2 \leq \cdots \leq x_N \leq n-1$.

**Remark.** The ordering $x_1 \leq \cdots \leq x_N$ reflects indistinguishability up to exchange. Distinct orderings related by permutation represent the same physical configuration.

---

## §4.1.2 Anyon Labels

**Definition 4.1.2** (Labelled configuration). A *labelled configuration* is a pair $(\mathbf{x}, \mathbf{k})$ where:
- $\mathbf{x} = (x_1, \ldots, x_N)$ is a configuration
- $\mathbf{k} = (k_1, \ldots, k_N)$ with $k_j \in \{2, \ldots, d\}$ labels the anyon type at position $x_j$

**Convention.** Label $1$ denotes vacuum (no anyon). Labels $2, \ldots, d$ denote the nontrivial simple objects $X_2, \ldots, X_d$.

---

## §4.1.3 Configuration Space

**Definition 4.1.3** (N-anyon configuration space). 
$$\mathrm{Conf}_N = \{(\mathbf{x}, \mathbf{k}) : \mathbf{x} \in \Lambda^N \text{ ordered}, \, k_j \in \{2,\ldots,d\}\}$$

**Definition 4.1.4** (Hard-core configuration space). With hard-core constraint:
$$\mathrm{Conf}_N^{\mathrm{HC}} = \{(\mathbf{x}, \mathbf{k}) \in \mathrm{Conf}_N : x_1 < x_2 < \cdots < x_N\}$$

**Claim 4.1.1.** $|\mathrm{Conf}_N^{\mathrm{HC}}| = \binom{n}{N}(d-1)^N$.

---

## §4.1.4 Mixed Character

**Remark.** Configurations have mixed identical/distinguishable character:
- Anyons with *same label* $k_i = k_j$ are identical
- Anyons with *different labels* $k_i \neq k_j$ are distinguishable

This is handled by the morphism space structure in §4.2.

```julia
# file: src/julia/MobileAnyons/config.jl

struct LabelledConfig
    positions::Vector{Int}   # ordered: x₁ ≤ x₂ ≤ ... ≤ xₙ
    labels::Vector{Int}      # kⱼ ∈ {2,...,d}
end

function is_valid_config(c::LabelledConfig, n_sites::Int, d::Int)
    N = length(c.positions)
    length(c.labels) == N || return false
    all(2 .≤ c.labels .≤ d) || return false
    all(0 .≤ c.positions .< n_sites) || return false
    issorted(c.positions) || return false
    return true
end

is_hardcore(c::LabelledConfig) = allunique(c.positions)

function enumerate_configs_hc(n_sites::Int, N::Int, d::Int)
    configs = LabelledConfig[]
    for pos in combinations(0:(n_sites-1), N)
        for labels in Iterators.product(fill(2:d, N)...)
            push!(configs, LabelledConfig(collect(pos), collect(labels)))
        end
    end
    return configs
end
```
