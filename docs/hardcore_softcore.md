---
title: Hard-Core vs Soft-Core Anyons
section: "§4.4"
refs-in:
  - hilbert_space.md
  - config_space.md
refs-out:
  - hamiltonian_v0.md
  - limiting_cases.md
---

# Hard-Core vs Soft-Core Anyons

**Planning ref:** §4.4  
**Status:** Draft

---

## §4.4.1 Hard-Core Constraint

**Definition 4.4.1** (Hard-core anyons). Anyons are *hard-core* if at most one anyon occupies each site:
$$x_1 < x_2 < \cdots < x_N$$

**Consequence.** Maximum particle number is $N_{\max} = n$ (number of sites).

**Remark.** Hard-core is natural for:
- Impenetrable particles (infinite on-site repulsion)
- Lattice models where sites represent localised orbitals

---

## §4.4.2 Soft-Core: Multiple Occupancy

**Definition 4.4.2** (Soft-core anyons). Anyons are *soft-core* if multiple anyons may occupy the same site:
$$x_1 \leq x_2 \leq \cdots \leq x_N$$

**Definition 4.4.3** (On-site fusion space). When anyons $X_a, X_b$ occupy the same site, the local state space is:
$$\bigoplus_c N_{ab}^c \cdot \mathrm{Mor}(X_a \otimes X_b, X_c)$$
representing the possible fusion outcomes.

**Remark.** Soft-core requires tracking on-site fusion structure.

---

## §4.4.3 Hilbert Space Modifications

| Regime | Config space | Local structure | $N_{\max}$ |
|--------|--------------|-----------------|------------|
| Hard-core | $x_i < x_j$ for $i < j$ | One anyon/site | $n$ |
| Soft-core | $x_i \leq x_j$ for $i < j$ | Fusion at each site | $\infty$ (needs cutoff) |

**Definition 4.4.4** (Hard-core Hilbert space).
$$\mathcal{H}^{\mathrm{HC}} = \bigoplus_{N=0}^{n} \mathcal{H}_N^{\mathrm{HC}}$$
where $\mathcal{H}_N^{\mathrm{HC}}$ uses $\mathrm{Conf}_N^{\mathrm{HC}}$.

---

## §4.4.4 Physical Motivation

**Hard-core regime:**
- Models impenetrable anyons
- Connection to Girardeau mapping (§6.2)
- Simpler Hilbert space structure

**Soft-core regime:**
- Models "bosonic" anyons that can bunch
- Richer on-site physics
- Connection to Levin-Wen models when particles can annihilate

**Convention.** Unless stated otherwise, we work in the **hard-core** regime.

```julia
# file: src/julia/MobileAnyons/hardcore.jl
using .MobileAnyons

struct HardcoreHilbert
    hilbert::MobileAnyonHilbert
end

struct SoftcoreHilbert
    hilbert::MobileAnyonHilbert
    max_per_site::Int   # cutoff for soft-core
end

function max_particles(h::HardcoreHilbert)
    return h.hilbert.n_sites
end

function max_particles(h::SoftcoreHilbert)
    return h.hilbert.n_sites * h.max_per_site
end

# Hard-core: site occupation is 0 or 1
function site_occupation(config::LabelledConfig, site::Int)
    return count(==(site), config.positions)
end

function is_hardcore_valid(config::LabelledConfig)
    return allunique(config.positions)
end
```
