# Chapter 9: String-Net Models for Unitary Fusion Categories

## Overview

The Levin-Wen model is a 2D lattice model for studying topologically ordered systems. It provides a route to constructing the Drinfeld centre (quantum double) from a unitary fusion category through its excitations.

**Key result**: The quantum double of the input UFC arises naturally as the excitations of the Hamiltonian. This provides a constructive method for obtaining a UMTC from a UFC.

**Challenge**: The original Levin-Wen construction requires tetrahedral symmetry, which the Haagerup category H₃ does not satisfy. This chapter presents the generalized construction without tetrahedral symmetry.

## Tetrahedral Symmetry

### Definition

The **tetrahedral symmetry condition** constrains F-symbols based on symmetries of a tetrahedral diagram:

```
(F_i^{jkl})_{nm} = (F_{l*}^{kji*})_{n*m} = (F_{j*}^{i*lk})_{nm*} = √(d_m d_n / d_l d_j) (F_{i*}^{m*kn*})_{l*j*}
```

### Physical Motivation

- Diagrams on a sphere should be invariant under all 24 tetrahedral symmetries
- Required for topological and parity invariance in original formulation

### Haagerup Counterexample

The Haagerup category H₃ violates tetrahedral symmetry. For example:
```
(F_ρ^{1αα*ρ})_{ρα} = 1  (valid)
```
but
```
(F_{α*ρ}^{α1ρ})_{ρα}  (invalid: zero-dimensional vector space)
```

The vector space dimensions differ, so no gauge transformation can restore symmetry.

## Connection to Turaev-Viro

The Levin-Wen string-net space equals the state space of:
- **Turaev-Viro TQFT** for category C
- **Reshetikhin-Turaev theory** for Drinfeld double Z(C)

In both theories, tetrahedral symmetry plays no role, suggesting it's not essential.

## The Levin-Wen Model

### Input Data

1. **String types**: Simple objects {0, 1, 2, ..., N} of UFC
   - 0 = vacuum (unit object)
   - N+1 total string types

2. **Branching rules**: From fusion rules
   - Vertex (i, j, k) allowed if N_{jk}^{i*} > 0

3. **String orientations**: Dual type i* has opposite direction

### Hilbert Space

States = linear combinations of valid string-net configurations on honeycomb lattice.

### Ground State Constraints

Scale-invariance imposes local relations:

**1. Line equivalence**:
```
Φ(straight line) = Φ(line with kink)
```

**2. Loop value**:
```
Φ(isolated loop of type i) = d_i · Φ(no loop)
```

**3. Bigon relation**:
```
Φ(bigon with labels k,l on string i—j) = δ_{ij} · Φ(bigon on string i—i)
```

**4. G-move** (upward diagonal):
```
Φ(diagram G) = Σ_n (G_{ij}^{kl})_{nm} · Φ(rotated diagram)
```

**5. H-move** (downward diagonal):
```
Φ(diagram H) = Σ_n (H_{ij}^{kl})_{nm} · Φ(rotated diagram)
```

### G and H Operators

Derived from F-symbols:
```
(H_{ij}^{kl})_{nm} = √(d_m d_n / d_i d_l) (F_n^{kmj})_{li}

(G_{ij}^{kl})_{nm} = √(d_m d_n / d_j d_k) conj((F_n^{iml})_{kj})
```

**With tetrahedral symmetry**: G = H (can move vertices freely).

**Without tetrahedral symmetry**: G ≠ H in general.

## Hamiltonian Construction

### Vertex Operators (Electric Charge)

Q_v enforces branching rules at vertex v:
```
Q_v |i, j, k⟩ = δ_{ij}^{k*} |i, j, k⟩
```

Ensures only valid fusion configurations in ground state.

### Plaquette Operators (Magnetic Flux)

B_p imposes dynamics by inserting loops:
```
B_p = Σ_{s=0}^N a_s B_p^s
```

where a_s = d_s / D² (D² = total quantum dimension).

### Action of B_p^s

Insert type-s loop and fuse into internal edges:
```
B_p^s |g,h,i,j,k,l⟩ = Σ_{g',h',i',j',k',l'} (B_p^s)_{ghijkl}^{g'h'i'j'k'l'} |g',h',i',j',k',l'⟩
```

### Coefficients Without Tetrahedral Symmetry

The plaquette operator coefficients involve:
1. Apply completeness relation at each internal edge
2. Simplify each of six corners using F-moves
3. Combine results

**General formula** (from Hahn 2020):
```
(B_p^s)_{ghijkl}^{g'h'i'j'k'l'} = [product of 6 corner terms] × [normalisation factors]
```

Each corner term is a combination of F-symbols and quantum dimensions.

### Full Hamiltonian

```
H = -Σ_v Q_v - Σ_p B_p
```

Ground states satisfy Q_v = B_p = 1 for all vertices and plaquettes.

## Properties of the Hamiltonian

### Theorem: B_p is Hermitian

For all plaquettes p, B_p† = B_p.

**Proof**: Uses spherical structure of UFC and hermiticity of F-matrices.

### Theorem: H is a Projector

The full Hamiltonian is a projector onto the ground state subspace.

### Theorem: Reduces to Original

When tetrahedral symmetry holds, the general construction reduces to Levin-Wen's original form:
```
(B_p^s)_{ghijkl}^{g'h'i'j'k'l'} = (F_{s*}^{la*g'*})_{l'*g} (F_{s*}^{gb*h'*})_{g'*h} ... (6 factors)
```

## Excitations

### Physical Picture

- Excited states violate Q_v = 1 or B_p = 1 locally
- Excitations created in pairs via string operators
- Anyons correspond to closed string operators

### Closed String Operators

W^s(P) creates type-s string along closed path P:
- Commutes with Hamiltonian
- Encodes topologically non-trivial quasiparticles

### Matrix Elements

```
W_{i_1...i_N}^{s,i'_1...i'_N}(e_1...e_N) = (∏_k F_k^s) (∏_k ω_k)
```

where F_k^s depends on vertex geometry (6 cases, same as plaquette corners).

### Challenge Without Tetrahedral Symmetry

The phases ω_k are difficult to determine:
- Original approach exploits symmetries absent in general case
- Alternative: tensor network methods

## Tensor Network Representation

### Motivation

Tensor networks provide:
- Efficient ground state representation
- Methods for computing excitations
- Connection to MPO formalism

### Construction

Ground state as tensor network on honeycomb lattice:
- Two sublattice tensors (even/odd vertices)
- Virtual bonds contracted between plaquettes
- Physical indices on edges

### Without Tetrahedral Symmetry

Generalizing tensor network approach requires:
1. Constructing MPOs without symmetry assumptions
2. Adapting excitation extraction methods
3. Handle non-symmetric vertex tensors

### Excitations via Tensor Networks

Once ground state tensor network constructed:
- Excitations = anyons forming Drinfeld centre
- Can extract full UMTC data

## Generalisations

### Multiplicities

For categories with N_{ab}^c > 1:
- Additional indices on vertices
- F-symbols become higher-dimensional tensors
- More complex plaquette operators

**Note**: Drinfeld centre of Haagerup categories has multiplicities.

### Non-Unitary Categories

Relaxing unitarity leads to:
- Non-Hermitian Hamiltonian
- Complex quantum dimensions
- Unphysical models

## Application to Haagerup

### Strategy

1. Construct Levin-Wen Hamiltonian for H₃ using general (non-tetrahedral) method
2. Build tensor network representation
3. Extract excitations = simple objects of Z(H₃)
4. Z(H₃) is the UMTC for anyon chain studies

### Current Status

- Hamiltonian construction complete
- Tensor network generalization in progress
- Excitation extraction remains challenging

## Graph Database Metadata

```json
{
  "chapter": 9,
  "title": "String-Net Models for Unitary Fusion Categories",
  "key_concepts": [
    "Levin-Wen_model",
    "string-net",
    "tetrahedral_symmetry",
    "Turaev-Viro",
    "vertex_operator",
    "plaquette_operator",
    "electric_charge_operator",
    "magnetic_flux_operator",
    "excitations",
    "anyons",
    "closed_string_operator",
    "tensor_network",
    "honeycomb_lattice",
    "TQFT"
  ],
  "key_formulas": [
    "tetrahedral_symmetry_condition",
    "G_operator: √(d_m d_n / d_j d_k) conj(F)",
    "H_operator: √(d_m d_n / d_i d_l) F",
    "plaquette_coefficients",
    "string_operator_matrix_elements",
    "Hamiltonian: H = -Σ Q_v - Σ B_p"
  ],
  "key_results": [
    "general_construction_without_tetrahedral_symmetry",
    "B_p_hermitian",
    "H_projector",
    "reduces_to_original_with_symmetry",
    "excitations_form_Drinfeld_centre"
  ],
  "applications": [
    "Haagerup_Drinfeld_centre_construction",
    "UMTC_from_UFC",
    "topological_quantum_computation"
  ],
  "references": [
    "Levin2005",
    "Hong2009",
    "Buerschaper2009",
    "Kirillov2011",
    "Hahn2020",
    "Bultinck2017",
    "Williamson2017"
  ]
}
```
