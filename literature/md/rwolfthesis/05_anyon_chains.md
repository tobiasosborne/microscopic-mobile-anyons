# Chapter 5: Anyon Chains

## Overview

Anyon chains are 1D quantum spin systems constructed from UMTCs that provide a route to extract CFT information. They are the primary tool for investigating whether a CFT corresponds to the Haagerup subfactor.

## Motivation

### Topological Quantum Computation

Anyons enable **fault-tolerant quantum computation** because:
- Only topological properties matter (insensitive to quasiparticle details)
- Resistant to control errors
- Examples:
  - **Toric code** (Kitaev 2003): Topological error-correcting code
  - **Fibonacci anyons**: Universal quantum computation (any n-qubit circuit with 4n anyons)

### Experimental Observation

- Fractional quantum Hall effect shows anyonic statistics
- Direct observation of anyonic statistics: Nakamura et al. 2020
- Indirect evidence via noise correlations: Bartolomei et al. 2020

### Connection to CFTs

1D anyon chains connect to CFTs:
- At quantum phase transition: correlation length diverges
- Entanglement entropy diverges
- Can extract **central charge** (key CFT parameter)
- Successful examples: Fibonacci anyons, SO(5)_2 anyons

## Anyonic Statistics

### 3D vs 2D Exchange

**In 3D**:
- Path C_1 (encircling particle) can be continuously deformed to C_2 (trivial path)
- Exchange operator R satisfies R² = 1
- Only two solutions: R = +1 (bosons), R = -1 (fermions)

**In 2D**:
- C_1 cannot be deformed to C_2 (topologically distinct)
- No constraint on exchange operator
- **Abelian anyons**: Arbitrary phase e^{iφ}
- **Non-abelian anyons**: Higher-dimensional unitary matrix

### Physical Requirements for Non-Abelian Statistics

- Degenerate ground state subspace
- Matrix evolution transforms between states in subspace
- Different states must be **indistinguishable** (no local measurement distinguishes them)

## Algebraic Theory of Anyons

### Dictionary: Anyons ↔ UMTCs

| Anyonic System | Unitary MTC |
|----------------|-------------|
| Anyon | Simple object |
| Fusion | Tensor product |
| Fusion rules | Fusion rules |
| Antiparticle | Dual object |
| Quantum dimension | Object dimension |
| Particle exchange | Braiding |

### Fusion Rules

For particle types M = {**1**, a, b, c, ...}:
```
a ⊗ b = Σ_c N_ab^c · c
```

**Properties**:
- Commutativity: a ⊗ b = b ⊗ a
- Unit: a ⊗ **1** = a
- Antiparticle: Unique a* with N_ab^**1** = δ_{b,a*}
- Associativity: Σ_e N_ab^e N_ec^d = Σ_f N_af^d N_bc^f

**Abelian vs Non-Abelian**:
- Abelian: a ⊗ b = c (single outcome)
- Non-Abelian: Σ_c N_ab^c > 1 (multiple outcomes)

### Definition: Multiplicity-Free

A fusion rule is **multiplicity-free** if N_ab^c ∈ {0, 1} for all a, b, c.

### Quantum Dimension

For particle a:
```
d_a = |F_a^{aa*a}_{**1****1**}|^{-1}
```

**Properties**:
- d_a ≥ 1 (equality iff a is abelian)
- Total quantum dimension: D = √(Σ_a d_a²)
- Loop value: ○_a = d_a

## Fusion and Splitting Spaces

### Minimal Spaces

For particles a, b fusing to c with N_ab^c = 1:
- **Fusion space** V_{ab}^c: 1-dimensional
- **Splitting space** V_c^{ab}: Dual to fusion space

### Standard Basis

For splitting u → a_1, a_2, ..., a_N:
```
V_u^{a_1,...,a_N} = ⊕_{e_2,...,e_{N-1}} V_{e_2}^{a_1,a_2} ⊗ V_{e_3}^{e_2,a_3} ⊗ ... ⊗ V_u^{e_{N-1},a_N}
```

Graphically: Left-leaning tree with internal edges labeled e_i.

### F-Matrices

Basis change between different parenthesizations:
```
|p⟩_left = Σ_q (F_u^{abc})_{qp} |q⟩_right
```

**Key Relations**:
- Pentagon equation (consistency)
- Inverse: (F_u^{abc})_{qp}^{-1} = (F_u^{abc})†_{qp} = conj(F_u^{abc})_{pq}
- Mirror symmetry (from spherical structure)

### Completeness Relation

```
|a⟩|b⟩ = Σ_c,α √(d_c/d_a d_b) |fuse to c with label α⟩
```

### Bigon Relation

```
⟨c|fuse|split|c'⟩ = δ_{c,c'} √(d_a d_b / d_c)
```

Implies: Lollipop diagrams = 0 (unless c = **1**).

## Bending Lines and Traces

### Vertical Bending

Vertical bending is non-trivial due to **Frobenius-Schur indicator**:
```
κ_a = d_a (F_a^{aa*a})_{**1****1**}
```

**Properties**:
- |κ_a| = 1
- κ_{a*} = κ_a*
- For self-dual a: Can choose gauge with κ_a = 1

### Cups and Caps with Flags

**Evaluation** (cup):
```
∪ with right flag = κ_a × ∪ with left flag
```

**Coevaluation** (cap):
```
∩ with right flag = κ_a* × ∩ with left flag
```

Isotopy invariance requires pairing opposing flags.

## Braiding (R-Matrix)

For UMTC, **R-symbols** encode exchange:
```
R_c^{ab}: V_c^{ab} → V_c^{ba}
```

Graphically: Over-crossing (R) or under-crossing (R^{-1}).

**Properties**:
- Hexagon equations (consistency with F-symbols)
- Phase from double exchange: R² related to twist

## Anyon Chain Construction

### Chain Structure

Analogous to spin chains with spin-1/2 particles on sites and singlet/triplet states on bonds:

```
Site: anyon type a
Bond: fusion channel x_i (label on horizontal line)
```

Chain diagram:
```
       a_1   a_2   a_3        a_N
        |     |     |          |
x_0 ----+-----+-----+--- ... --+---- x_N
```

### Hilbert Space

For N-anyon chain with boundary conditions:
```
H = ⊕_{x_1,...,x_{N-1}} V_{a_{N+1}}^{x_{N-1},a_N} ⊗ ... ⊗ V_{x_2}^{x_1,a_2} ⊗ V_{x_1}^{a_1,x_0}
```

Dimension depends on fusion rules and boundary labels.

### Local Hamiltonian

Project onto energetically favorable fusion channels:
```
H = -Σ_i h_i,i+1
```

where h_{i,i+1} projects onto specific fusion channel (e.g., vacuum **1**).

Using completeness relation, local term:
```
h_{i,i+1} = √(d_c / d_a d_b) |c-channel⟩⟨c-channel|
```

### Tensor Network Representation

Chain states as **Matrix Product States (MPS)**:
- Efficient representation of ground state
- Can compute expectation values, correlations
- Variational optimization (DMRG-like methods)

## Fibonacci Anyon Chain (Golden Chain)

### Setup

Category: Fibonacci (Fib)
- Simple objects: {**1**, τ}
- Fusion: τ ⊗ τ = **1** + τ
- Quantum dimension: d_τ = φ = (1+√5)/2

### Hamiltonian

```
H = -Σ_i |τ τ → **1**⟩⟨τ τ → **1**|
```

Projects adjacent anyons onto vacuum channel.

### Results (Feiguin et al. 2007)

At critical point:
- **Central charge**: c = 7/10
- Corresponds to **tricritical Ising CFT**
- Verifies anyon chain → CFT correspondence

## Haagerup Chain

### Construction

Category: H₃ (trivalent Haagerup)
- 6 simple objects: {**1**, α, α*, ρ, _αρ, _{α*}ρ}
- Quantum dimension: d_ρ = (3+√13)/2

### Hamiltonian

Nearest-neighbor projections, e.g.:
```
H = -Σ_i |ρ ρ → **1**⟩⟨ρ ρ → **1**|
```

### Results

Using H₃ UFC directly (not UMTC):
- **No quantum phase transition observed**
- Finite correlation length
- No CFT extraction possible

**Conclusion**: Must construct UMTC (Drinfeld centre) to find phase transition and CFT connection.

## Numerical Methods

### Matrix Product States (MPS)

Ground state ansatz:
```
|ψ⟩ = Σ_{s_1,...,s_N} Tr(A^{s_1} A^{s_2} ... A^{s_N}) |s_1 s_2 ... s_N⟩
```

where A^{s_i} are D×D matrices (bond dimension D).

### DMRG Algorithm

1. Initialize MPS with random/simple tensors
2. Optimize tensors site-by-site
3. Sweep left-right, right-left
4. Converge to ground state

### Observables

- **Energy**: ⟨ψ|H|ψ⟩
- **Entanglement entropy**: S = -Tr(ρ_A log ρ_A)
- **Central charge extraction**: S = (c/3) log L + const
- **Correlation functions**: ⟨O_i O_j⟩

## Graph Database Metadata

```json
{
  "chapter": 5,
  "title": "Anyon Chains",
  "key_concepts": [
    "anyonic_statistics",
    "abelian_anyons",
    "non_abelian_anyons",
    "fusion_rules",
    "fusion_multiplicities",
    "quantum_dimension",
    "fusion_space",
    "splitting_space",
    "F_matrices",
    "R_matrices",
    "completeness_relation",
    "bigon_relation",
    "Frobenius_Schur_indicator",
    "anyon_chain",
    "golden_chain",
    "Haagerup_chain",
    "matrix_product_states",
    "DMRG"
  ],
  "key_equations": [
    "fusion_rules: a⊗b = Σ N_ab^c c",
    "quantum_dimension: d_a = |F_a^{aa*a}_{11}|^{-1}",
    "completeness_relation",
    "bigon_relation",
    "pentagon_equation",
    "hexagon_equations"
  ],
  "examples": [
    {
      "name": "Fibonacci",
      "objects": ["1", "τ"],
      "fusion": "τ⊗τ = 1+τ",
      "d_tau": "(1+√5)/2",
      "CFT": "tricritical_Ising",
      "central_charge": "7/10"
    },
    {
      "name": "Haagerup_H3",
      "objects": ["1", "α", "α*", "ρ", "_αρ", "_{α*}ρ"],
      "result": "no_phase_transition_without_UMTC"
    }
  ],
  "references": [
    "Kitaev2003",
    "feiguin_interacting_2007",
    "Finch2014",
    "Nayak2008",
    "kitaev_anyons_2006"
  ]
}
```
