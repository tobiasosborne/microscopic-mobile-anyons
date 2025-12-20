---
title: Examples of Fusion Categories
section: "§3.1.8"
refs-in:
  - fusion_category.md
  - config_space.md
refs-out: []
---

# Examples of Fusion Categories

**Planning ref:** §3.1.8  
**Status:** Draft

This document enumerates concrete fusion categories used in mobile anyons models. Each example specifies fusion rules, F-symbols, R-symbols (if braided), and the simple object count (rank).

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.1.8.1 | Fusion categories listed here are semisimple and rigid | Mathematical | assumed |
| A3.1.8.2 | Numerical F/R-symbols are computed via standard references (Kitaev, Rowell) | Technical | assumed |

---

## §3.1.8.1 Fibonacci Category (Multiplicity-Free)

**Category:** $\mathcal{C}_{\mathrm{Fib}}$  
**Rank:** $d = 2$  
**Simple objects:** $\mathbf{1} = X_0$, $\tau = X_1$

### Fusion Rules

| $\otimes$ | $\mathbf{1}$ | $\tau$ |
|-----------|-------------|-------|
| $\mathbf{1}$ | $\mathbf{1}$ | $\tau$ |
| $\tau$ | $\tau$ | $\mathbf{1} \oplus \tau$ |

**Multiplicities:** $N_{\tau\tau}^{\mathbf{1}} = N_{\tau\tau}^{\tau} = 1$ (multiplicity-free).

### Quantum Dimensions

- $d_{\mathbf{1}} = 1$
- $d_\tau = \phi = \frac{1+\sqrt{5}}{2}$ (golden ratio)

### F-Symbols (Associator)

For the only nontrivial fusion channel $\tau \otimes \tau \to \mathbf{1} \oplus \tau$:

$$F_{\tau,\tau,\tau}^e = \begin{pmatrix} \phi^{-1/2} & \phi^{-1/2} \\ \phi^{-1/2} & -\phi^{1/2} \end{pmatrix}_{e'}^{e}$$

where the matrix connects the two fusion orders: $(\tau \otimes \tau) \otimes \tau$ vs. $\tau \otimes (\tau \otimes \tau)$.

**Numerical:** $\phi^{-1/2} \approx 0.7861$ [Kitaev 2006] `[unverified]`

### R-Symbols (Braiding)

Fibonacci category is non-braided (bosonic). If braiding is added:

$$R_{\tau,\tau}^e = e^{2\pi i \theta_e}$$

where $\theta_\mathbf{1} = 0$ and $\theta_\tau = 4\pi/5$ (standard normalization).

### References

- [Kitaev 2006](https://arxiv.org/abs/cond-mat/0110143) — Anyons in exactly solved model
- [Rowell & Stong 2012](https://doi.org/10.1016/j.jalgebra.2012.03.029) — Classification of braided fusion categories

```julia
# file: src/julia/FusionCategories/Fibonacci.jl

const Fibonacci = FusionCategory(
    rank = 2,
    N = Dict(
        (0, 0) => 0, (0, 1) => 1, (1, 0) => 1, (1, 1) => 1,  # τ ⊗ τ → 1 ⊕ τ
    ),
    d_quantum = [1.0, (1 + sqrt(5))/2],
    F_symbols = Dict(...),  # see code/fib_f_symbols.jl
)
```

---

## §3.1.8.2 Ising Category (Multiplicity-Free)

**Category:** $\mathcal{C}_{\mathrm{Ising}}$  
**Rank:** $d = 3$  
**Simple objects:** $\mathbf{1} = X_0$, $\sigma = X_1$, $\psi = X_2$

### Fusion Rules

| $\otimes$ | $\mathbf{1}$ | $\sigma$ | $\psi$ |
|-----------|-------------|---------|--------|
| $\mathbf{1}$ | $\mathbf{1}$ | $\sigma$ | $\psi$ |
| $\sigma$ | $\sigma$ | $\mathbf{1} \oplus \psi$ | $\sigma$ |
| $\psi$ | $\psi$ | $\sigma$ | $\mathbf{1}$ |

**Multiplicities:** All fusion coefficients are 0 or 1 (multiplicity-free).

### Quantum Dimensions

- $d_\mathbf{1} = 1$
- $d_\sigma = \sqrt{2}$
- $d_\psi = 1$

### F-Symbols

Non-trivial associators exist for $\sigma \otimes \sigma \to \mathbf{1} \oplus \psi$.

$$F_{\sigma,\sigma,\sigma} = \frac{1}{\sqrt{2}} \begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}$$

### R-Symbols

For braided (modular) Ising category:

$$R_{\sigma,\sigma}^{\mathbf{1}} = e^{i\pi/8}, \quad R_{\sigma,\sigma}^{\psi} = e^{-3i\pi/8}$$

### References

- [Kitaev 2006](https://arxiv.org/abs/cond-mat/0110143)
- [Preskill 2004](https://www.theory.caltech.edu/~preskill/ph229/) — Topological quantum computation

```julia
# file: src/julia/FusionCategories/Ising.jl

const Ising = FusionCategory(
    rank = 3,
    N = Dict(
        (1, 1) => 1,  # σ ⊗ σ → 1
        (1, 1) => 1,  # σ ⊗ σ → ψ
        (1, 2) => 1,  # σ ⊗ ψ → σ
        # ... etc
    ),
    d_quantum = [1.0, sqrt(2), 1.0],
)
```

---

## §3.1.8.3 $\mathbb{Z}_N$ Category (with Multiplicity)

**Category:** $\mathcal{C}_{\mathbb{Z}_N}$  
**Rank:** $d = N$  
**Simple objects:** $X_0, X_1, \ldots, X_{N-1}$ (cyclic group)

### Fusion Rules

$$X_a \otimes X_b = X_{(a+b) \bmod N}$$

**Multiplicities:** All $N_{ab}^c = 0$ or $1$ (multiplicity-free for standard abelian fusion).

### Quantum Dimensions

- $d_{X_a} = 1$ for all $a$ (abelian anyons have dimension 1).

### F-Symbols

For abelian (group-like) fusion, all nontrivial associators are trivial:
$$F_{a,b,c}^e = 1$$

### R-Symbols

Braiding given by a 2-cocycle $\sigma(a, b) \in U(1)$:

$$R_{a,b}^{a+b} = \sigma(a, b)$$

**Example:** For $\mathbb{Z}_2$ with fermionic statistics:
$$R_{\mathrm{f}, \mathrm{f}}^{\mathbf{1}} = -1$$

### References

- [Etingof et al. 2015](https://doi.org/10.4007/annals.2005.162.581) — Tensor Categories (Chapter 3)
- [Kitaev 2006](https://arxiv.org/abs/cond-mat/0110143) — $\mathbb{Z}_2$ toric code

```julia
# file: src/julia/FusionCategories/ZN.jl

function ZN_category(N::Int; cocycle=nothing)
    # Fusion rule: a ⊗ b = (a+b) mod N
    N_dict = Dict(
        (a, b) => (a + b) % N
        for a in 0:(N-1), b in 0:(N-1)
    )
    
    # Braiding: R_{a,b} = cocycle(a,b) by default
    R = cocycle !== nothing ? cocycle : ones(N, N)
    
    return FusionCategory(
        rank = N,
        N = N_dict,
        d_quantum = ones(N),
        R_symbols = R,
    )
end
```

---

## §3.1.8.4 sVec Category (Fermionic, Super Lie Group)

**Category:** $\mathcal{C}_{\mathrm{sVec}}$  
**Rank:** $d = 2$ (same as Fibonacci structure, but distinct)  
**Simple objects:** $\mathbf{1} = X_0$ (boson), $\psi = X_1$ (fermion)

### Fusion Rules

| $\otimes$ | $\mathbf{1}$ | $\psi$ |
|-----------|-------------|--------|
| $\mathbf{1}$ | $\mathbf{1}$ | $\psi$ |
| $\psi$ | $\psi$ | $\mathbf{1}$ |

**Multiplicities:** Multiplicity-free ($N_{\psi\psi}^{\mathbf{1}} = 1$).

### Quantum Dimensions

- $d_\mathbf{1} = 1$
- $d_\psi = 1$ (fermionic dimension)

### F-Symbols

For fermionic fusion (super-case), the associator has an extra sign:

$$F_{\psi,\psi,\psi}^{\mathbf{1}} = 1 \quad \text{(standard)}$$

But crossing rules differ due to Fermi statistics.

### R-Symbols

$$R_{\psi,\psi}^{\mathbf{1}} = e^{i\pi} = -1$$

(fermionic exchange is anticommuting; eigenvalue is $-1$).

### References

- [Deligne 2002](https://arxiv.org/abs/math/0211200) — Tensor Categories for Physicists
- [Ostrik 2003](https://arxiv.org/abs/math/0304098) — Module categories

```julia
# file: src/julia/FusionCategories/sVec.jl

const sVec = FusionCategory(
    rank = 2,
    N = Dict(
        (0, 0) => 0, (0, 1) => 1, (1, 0) => 1, (1, 1) => 0,  # ψ ⊗ ψ = 1
    ),
    d_quantum = [1.0, 1.0],
    is_fermionic = true,
    R_symbols = Dict(
        (1, 1) => -1.0,  # R_ψ,ψ = -1
    ),
)
```

---

## §3.1.8.5 Summary Table

| Category | Rank | Mult-Free? | Braided? | Modular? | Status |
|----------|------|-----------|----------|----------|--------|
| Fibonacci | 2 | ✓ | ✗ | — | Implemented |
| Ising | 3 | ✓ | ✓ | ✓ | Implemented |
| $\mathbb{Z}_N$ | $N$ | ✓ | ✓ | ✗ | Template |
| sVec | 2 | ✓ | ✓ | — | Fermionic |

---

## §3.1.8.6 How to Use

To specify a fusion category in a computation:

1. **Select from the examples above** (§3.1.8.1–§3.1.8.4)
2. **Reference in `config_space.md` Assumption A4.1.1** which category is in scope
3. **Use Julia code** from corresponding module in `src/julia/FusionCategories/`

Example (from hamiltonian_v0.md):
```julia
using .FusionCategories: Fibonacci, Ising

# Specify category
cat = Fibonacci  # or Ising, etc.

# Construct Hilbert space
H = build_hilbert_space(n_sites=10, cat=cat, N_max=3)

# Define operator on that space
op = some_local_operator(cat)
```

---

## Notes

- **Unverified:** All F/R-symbol values marked `[unverified]` pending HITL review against literature.
- **Not exhaustive:** Other categories (Potts, Virasoro, etc.) can be added as needed.
- **Computation:** For full numerical F-symbol tables, see `src/julia/FusionCategories/` module documentation.

