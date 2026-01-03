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
| A4.1.1 | Fusion category $\mathcal{C}$ with simples $\{X_0, X_1, \ldots, X_{d-1}\}$ where $X_0 = \mathbf{1}$ (see supported examples in §3.1.8) | Input | assumed |
| A4.1.2 | Lattice $\Lambda = \{0, \ldots, n-1\}$ with OBC | From §3.4 | assumed |

---

## §4.1.1 Anyon Positions

**Definition 4.1.1** (Configuration). A *configuration* of $N$ anyons is a tuple of site indices
$$\mathbf{s} = (s_1, s_2, \ldots, s_N) \in \Lambda^N$$
satisfying $0 \leq s_1 \leq s_2 \leq \cdots \leq s_N \leq n-1$.

**Remark.** We use $s_j$ (site index) rather than $x_j$ to distinguish from physical positions $x_j = \epsilon \cdot j$ defined in §3.4.2. The ordering $s_1 \leq \cdots \leq s_N$ reflects indistinguishability up to exchange. Distinct orderings related by permutation represent the same physical configuration.

---

## §4.1.2 Anyon Labels

**Definition 4.1.2** (Labelled configuration). A *labelled configuration* is a pair $(\mathbf{s}, \mathbf{k})$ where:
- $\mathbf{s} = (s_1, \ldots, s_N)$ is a configuration (site indices)
- $\mathbf{k} = (k_1, \ldots, k_N)$ with $k_j \in \{2, \ldots, d\}$ labels the anyon type at site $s_j$

**Convention.** Label $0$ denotes vacuum (no anyon). Labels $1, \ldots, d-1$ denote the nontrivial simple objects $X_1, \ldots, X_{d-1}$.

---

## §4.1.3 Configuration Space

**Definition 4.1.3** (N-anyon configuration space).
$$\mathrm{Conf}_N = \{(\mathbf{s}, \mathbf{k}) : \mathbf{s} \in \Lambda^N \text{ ordered}, \, k_j \in \{2,\ldots,d\}\}$$

**Definition 4.1.4** (Hard-core configuration space). With hard-core constraint:
$$\mathrm{Conf}_N^{\mathrm{HC}} = \{(\mathbf{s}, \mathbf{k}) \in \mathrm{Conf}_N : s_1 < s_2 < \cdots < s_N\}$$

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
    positions::Vector{Int}   # site indices, ordered: s₁ ≤ s₂ ≤ ... ≤ sₙ
    labels::Vector{Int}      # kⱼ ∈ {1,...,d-1}, where 0 = vacuum
end

function is_valid_config(c::LabelledConfig, n_sites::Int, d::Int)
    N = length(c.positions)
    length(c.labels) == N || return false
    all(1 .≤ c.labels .≤ (d-1)) || return false
    all(0 .≤ c.positions .< n_sites) || return false
    issorted(c.positions) || return false
    return true
end

is_hardcore(c::LabelledConfig) = allunique(c.positions)

function enumerate_configs_hc(n_sites::Int, N::Int, d::Int)
    configs = LabelledConfig[]
    for pos in combinations(0:(n_sites-1), N)
        for labels in Iterators.product(fill(1:(d-1), N)...)
            push!(configs, LabelledConfig(collect(pos), collect(labels)))
        end
    end
    return configs
end
```
