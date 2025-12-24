---
title: Temperley-Lieb Categories
section: "§3.1a"
refs-in:
  - fusion_category.md
  - fusion_ring.md
  - diagrammatic_calculus.md
  - research_plan.md
refs-out:
  - hilbert_space.md
  - hamiltonian_v0.md
  - partition_functions.md
---

# Temperley-Lieb Categories

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.1a.1 | Loop fugacity $n = q + q^{-1}$ for quantum parameter $q$ | Definition | assumed |
| A3.1a.2 | At roots of unity $q = e^{i\pi/p}$, the category truncates to finitely many simples | Technical | assumed |
| A3.1a.3 | Standard normalisation: loop evaluates to $\delta = -[2]_q$ | Convention | assumed |

## Overview

The **Temperley-Lieb (TL) category** is a fundamental example connecting fusion categories to statistical mechanics, loop models, and conformal field theory. TL categories provide:

1. A continuous interpolation between solvable models via the loop fugacity parameter
2. Concrete realisations of Fibonacci ($q = e^{i\pi/5}$) and Ising ($q = e^{i\pi/4}$) anyons
3. Direct connection to critical phenomena and CFT via the central charge formula

**Physical significance:** TL categories describe the fusion structure of worldlines in dense loop models, where loops carry weight $n = q + q^{-1} = 2\cos(\pi/p)$.

## Loop Fugacity Parametrisation

The TL category is parametrised by the **loop fugacity** $n$, related to the quantum parameter $q$ by:
\[
n = q + q^{-1} = 2\cos\theta, \qquad q = e^{i\theta}
\]

**Key values:**

| $p$ (for $q = e^{i\pi/p}$) | $n = 2\cos(\pi/p)$ | Physical model |
|---|---|---|
| $p = 3$ | $n = 1$ | Percolation |
| $p = 4$ | $n = \sqrt{2}$ | Ising ($\sigma$-anyon) |
| $p = 5$ | $n = \phi = \frac{1+\sqrt{5}}{2}$ | Fibonacci ($\tau$-anyon) |
| $p = 6$ | $n = \sqrt{3}$ | 3-state Potts |
| $p \to \infty$ | $n \to 2$ | Free fermion |

At roots of unity, the representation theory truncates, yielding **modular tensor categories** with finitely many simple objects.

## Quantum Numbers

For $q = e^{i\pi/p}$, define the **quantum integer**:
\[
[n]_q = \frac{q^n - q^{-n}}{q - q^{-1}} = \frac{\sin(n\pi/p)}{\sin(\pi/p)}
\]

The **quantum factorial** and **quantum binomial** follow:
\[
[n]!_q = [1]_q [2]_q \cdots [n]_q, \qquad \binom{n}{k}_q = \frac{[n]!_q}{[k]!_q [n-k]!_q}
\]

Note: $[p-1]_q = 0$ at roots of unity, causing the truncation.

## Simple Objects and Fusion Rules

At generic $q$, the TL category has infinitely many simple objects labelled by half-integers $j \in \{0, \frac{1}{2}, 1, \frac{3}{2}, \ldots\}$, corresponding to spins in the representation theory of $U_q(\mathfrak{sl}_2)$.

At roots of unity $q = e^{i\pi/p}$, the category **truncates** to:
\[
j \in \left\{0, \frac{1}{2}, 1, \ldots, \frac{p-2}{2}\right\}
\]

The **fusion rules** are the $SU(2)_q$ rules with truncation:
\[
j_1 \otimes j_2 = \bigoplus_{j = |j_1 - j_2|}^{\min(j_1 + j_2, p-2-j_1-j_2)} j
\]

## Connection to Key Examples

**Fibonacci anyons** ($p = 5$): Two simple objects $\{\mathbf{1}, \tau\}$ with $\tau \otimes \tau = \mathbf{1} \oplus \tau$.

**Ising anyons** ($p = 4$): Three simple objects $\{\mathbf{1}, \sigma, \psi\}$ with:
- $\sigma \otimes \sigma = \mathbf{1} \oplus \psi$
- $\psi \otimes \psi = \mathbf{1}$
- $\sigma \otimes \psi = \sigma$

## Critical Behaviour

At $q = e^{i\pi/p}$, the TL algebra describes critical points with **central charge**:
\[
c = 1 - \frac{6(p-1)^2}{p}
\]

This connects TL categories to minimal model CFTs $\mathcal{M}(p, p-1)$.

## Implementation

Julia code for TL categories is in:
- `src/julia/Examples/tl_anyons.jl` — Full simulation with F-symbols, Hilbert space, Hamiltonians
- `src/julia/Examples/tl_pure.jl` — Pure TL dynamics

Key structures:
```julia
struct TLCategory
    q::ComplexF64    # quantum parameter
    δ::ComplexF64    # loop value = -(q + q⁻¹)
    p::Int           # truncation level (0 = generic)
end

fibonacci_tl() = TLCategory(p=5)   # δ = -φ
ising_tl() = TLCategory(p=4)       # δ = -√2
```

## Subsections

Detailed content is developed in the following sub-issues:

| Section | Topic | BEAD |
|---------|-------|------|
| §3.1a.1 | TL category definition: generators, relations, loop parameter | BEAD-0019a |
| §3.1a.2 | TL as quotient of Brauer; connection to $\mathrm{Rep}(U_q(\mathfrak{sl}_2))$ | BEAD-0019b |
| §3.1a.3 | Simple objects and Jones-Wenzl projectors | BEAD-0019c |
| §3.1a.4 | F-symbols for TL in terms of $q$-numbers | BEAD-0019d |
| §3.1a.5 | TL at roots of unity: truncation and minimal models | BEAD-0019e |
| §3.1a.6 | Dense loop model: partition function as TL trace | BEAD-0019f |
| §3.1a.7 | Critical behaviour: central charge formula | BEAD-0019g |
| §3.1a.8 | Julia implementation | BEAD-0019h |

## References

- [Kauffman-Lins, *Temperley-Lieb Recoupling Theory and Invariants of 3-Manifolds*](https://doi.org/10.1142/2055) `[unverified]`
- [Jones, *Inventiones Math.* **72** (1983), 1-25](https://doi.org/10.1007/BF01389127) `[unverified]`
- [Wenzl, *Inventiones Math.* **92** (1987), 349-383](https://doi.org/10.1007/BF01218063) `[unverified]`
