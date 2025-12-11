---
title: Fock Space Perspective (First Quantisation)
section: "§3.2"
refs-in:
  - research_plan.md
refs-out:
  - hilbert_space.md
  - operators.md
---

# Fock Space Perspective (First Quantisation)

**Planning ref:** §3.2  
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.2.1 | First-quantised formalism only (no $a^\dagger, a$) | Constraint | assumed |
| A3.2.2 | Fock space is a direct sum of fixed-number sectors | Definition | assumed |

---

## §3.2.1 Standard Fock Space

**Definition 3.2.1** (Fock Space). The *Fock space* $\mathcal{F}$ is the direct sum of $N$-particle Hilbert spaces $\mathcal{H}_N$ for all possible particle numbers $N \ge 0$:
$$ \mathcal{F} = \bigoplus_{N=0}^{\infty} \mathcal{H}_N = \mathcal{H}_0 \oplus \mathcal{H}_1 \oplus \mathcal{H}_2 \oplus \cdots $$
where $\mathcal{H}_0 \cong \mathbb{C}$ is the vacuum sector spanned by the vacuum state $|\Omega\rangle$.

**Remark.** In this first-quantised approach, a state $|\Psi\rangle \in \mathcal{F}$ is a sequence of wavefunctions (or categorical states) $|\Psi\rangle = (\psi_0, \psi_1, \psi_2, \ldots)$, where $\psi_N \in \mathcal{H}_N$ is the projection of the state onto the $N$-particle sector.

**Constraint.** We strictly avoid the use of second-quantised creation/annihilation operators ($a_i^\dagger, a_i$) as fundamental building blocks. While convenient for bosons/fermions, they obscure the categorical data (braiding, fusion) essential for anyons.

---

## §3.2.2 Direct Sum as "OR Quantifier"

**Interpretation.** The direct sum ($\oplus$) operation represents a logical "OR" or superposition of different particle number sectors.

- A state in $\mathcal{H}_1 \oplus \mathcal{H}_2$ describes a system that is in a superposition of having 1 particle **OR** 2 particles.
- This contrasts with the tensor product (see §3.2.3).

This perspective is emphasized in [arXiv:1910.10619, §2] `[unverified]`, highlighting that the total Hilbert space allows for quantum fluctuations in particle number, even if dynamics (Hamiltonian) conserve it.

---

## §3.2.3 Tensor Product as "AND Quantifier"

**Interpretation.** The tensor product ($\otimes$) operation represents a logical "AND" or composition of subsystems.

- Within a fixed $N$-particle sector $\mathcal{H}_N$, the structure involves tensor products of single-particle spaces (or local site spaces):
  $$ \mathcal{H}_N \sim \mathcal{H}_{\text{loc}} \otimes \cdots \otimes \mathcal{H}_{\text{loc}} \quad \text{(schematically)} $$
- A state $|ucketsymbol{\phi}\rangle \otimes |ucketsymbol{\phi}\rangle$ describes a system where part A is in state $\phi$ **AND** part B is in state $\chi$.

**Anyonic Nuance.** For anyons, $\mathcal{H}_N$ is not a simple tensor product of single-particle spaces due to fusion constraints (fusion spaces are not product spaces). However, the *ambient* space in which $\mathcal{H}_N$ is embedded (before fusion constraints) often has a tensor product structure (e.g., sites on a lattice).

---

## §3.2.4 First-Quantised Operators

**Definition 3.2.2** (Operator on Fock Space). An operator $\hat{O} : \mathcal{F} \to \mathcal{F}$ is defined by its action on each sector $\mathcal{H}_N$ and maps between sectors. It can be represented as a matrix of operators $\hat{O}_{MN} : \mathcal{H}_N \to \mathcal{H}_M$.

**Definition 3.2.3** (Number-Conserving Operator). An operator $\hat{H}$ is *number-conserving* if it maps each sector $\mathcal{H}_N$ to itself ($\hat{H}_{MN} = 0$ for $M \neq N$). It decomposes as a direct sum of operators acting on fixed-number sectors:
$$ \hat{H} = \bigoplus_{N=0}^{\infty} \hat{H}_N $$
where $\hat{H}_N : \mathcal{H}_N \to \mathcal{H}_N$.

**Example.** The Hamiltonian for mobile anyons is typically number-conserving (unless studying source terms), so we construct it by defining a sequence of Hamiltonians $H_N$ for each $N$-anyon configuration space.
```
```julia
# file: src/julia/MobileAnyons/hilbert.jl (snippet)

"""
Abstract representation of an operator on Fock space.
In practice, we work with specific H_N blocks.
"""
struct FockOperator
    blocks::Dict{Int, Matrix} # N => H_N
end

"""
Apply number-conserving operator to a state in sector N.
"""
function apply_operator(op::FockOperator, N::Int, ψ::Vector)
    if haskey(op.blocks, N)
        return op.blocks[N] * ψ
    else
        return zeros(eltype(ψ), length(ψ))
    end
end
```

---

## Summary

| Structure | Symbol | Interpretation | Logical Equivalent |
|-----------|--------|----------------|--------------------|
| Direct Sum | $\oplus$ | Superposition of sectors | **OR** (0 particles OR 1 particle...) |
| Tensor Product | $\otimes$ | Composition of parts | **AND** (Particle 1 at x AND Particle 2 at y) |
| Fock Space | $\mathcal{F}$ | $\bigoplus_N \mathcal{H}_N$ | Total space of variable particle number |
| Operator | $\hat{O}$ | $\bigoplus_N \hat{O}_N$ (if conserved) | Collection of N-particle operators |

```