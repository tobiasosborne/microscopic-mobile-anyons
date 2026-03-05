---
title: Braiding Requirement for Particle Ordering Identification
section: "§3.5.7"
refs-in:
  - fusion_category.md
  - morphism_spaces.md
  - prd.md
refs-out:
  - hilbert_space.md
  - operators.md
  - hamiltonian_v1.md
---

# Braiding Requirement for Particle Ordering Identification

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A3.5.7.1 | Braided fusion category $(\mathcal{C}, \otimes, \mathbf{1}, c)$ or non-braided fusion category $\mathcal{C}$ (Definition 3.2, Definition 3.5) | Input | assumed |
| A3.5.7.2 | For $N$-particle systems, we consider morphism spaces $\mathrm{Mor}(\mathbf{1}, X_{i_1} \otimes \cdots \otimes X_{i_N})$ where $i_1, \ldots, i_N \in \{1, \ldots, d\}$ label anyon species | Input | assumed |

## Problem: Multiple Orderings, No Canonical Isomorphism

When constructing a Hilbert space for $N$ mobile anyons, we must assign one anyon to each of $N$ **distinct spatial positions** on the lattice. The anyons can be at different positions, and their ordering along the lattice is a fundamental part of the configuration.

**Key observation:** Given a fixed particle ordering, e.g., particle at position $x_1$, particle at position $x_2$ with $x_1 < x_2$, the quantum state space is naturally described by morphisms from the vacuum $\mathbf{1}$ to the tensor product of species in that order:
$$
\mathcal{H}_{\text{order}} := \mathrm{Mor}(\mathbf{1}, X_{i_1} \otimes X_{i_2} \otimes \cdots \otimes X_{i_N})
$$

Now consider a **different spatial ordering**: what if $x_1 > x_2$ (particle 2 to the left of particle 1)? The state space for this ordering is:
$$
\mathcal{H}_{\text{order}'} := \mathrm{Mor}(\mathbf{1}, X_{i_2} \otimes X_{i_1} \otimes \cdots \otimes X_{i_N})
$$

The fundamental question: **Are these two state spaces canonically isomorphic?**

### In Non-Braided Categories: **NO Canonical Isomorphism**

In a general (non-braided) fusion category, there is **no** canonical linear isomorphism between $\mathrm{Mor}(\mathbf{1}, X_{i_1} \otimes X_{i_2} \otimes \cdots)$ and $\mathrm{Mor}(\mathbf{1}, X_{i_2} \otimes X_{i_1} \otimes \cdots)$.

**Why?** The only canonical morphisms available in a fusion category are:
- Identity maps
- Tensor products of morphisms
- Composition of morphisms
- F-moves (reassociation)

None of these relate different **particle orderings**. The F-move $F_{abc}^d$ transforms between different **associativity patterns** (parenthesisations), not between different **orderings** of the same objects.

**Consequence:** In a non-braided model, morphism spaces for different orderings are separate mathematical objects. There is no physical process that takes a state in $\mathcal{H}_{\text{order}}$ to a state in $\mathcal{H}_{\text{order}'}$ as a unitary transformation.

### In Braided Categories: **YES, R-Moves Provide Canonical Isomorphism**

In a **braided** fusion category, we have the braiding isomorphism (R-move):
$$
c_{X_{i_1}, X_{i_2}}: X_{i_1} \otimes X_{i_2} \xrightarrow{\sim} X_{i_2} \otimes X_{i_1}
$$

This induces, for every state $|\psi\rangle \in \mathrm{Mor}(\mathbf{1}, X_{i_1} \otimes X_{i_2} \otimes \cdots)$, a canonically defined state in $\mathrm{Mor}(\mathbf{1}, X_{i_2} \otimes X_{i_1} \otimes \cdots)$ via tensor product:
$$
(1_{\text{rest}} \otimes c_{X_{i_1}, X_{i_2}}) (|\psi\rangle) \in \mathrm{Mor}(\mathbf{1}, X_{i_2} \otimes X_{i_1} \otimes \cdots)
$$

This isomorphism is:
- **Unitary:** R-symbols are unitary matrices
- **Canonical:** Defined by the braiding structure of the category itself
- **Natural:** It is functorial in the category-theoretic sense

**Consequence:** In a braided model, different particle orderings are **unitarily equivalent** via the braiding. The Hilbert space can be **quotient by this equivalence**, reducing to a canonical "basis-invariant" description of $N$ indistinguishable particles.

## Mathematical Formulation

**Definition 4.1** (Anyon configuration space). For $N$ particles with species $(i_1, \ldots, i_N) \in \{1, \ldots, d\}^N$, define the **ordered state space**:
$$
\mathcal{H}_{i_1 \cdots i_N}^{\text{ord}} := \mathrm{Mor}\left(\mathbf{1}, X_{i_1} \otimes \cdots \otimes X_{i_N}\right)
$$

In a **non-braided** fusion category, different orderings are disjoint:
$$
\mathcal{H}_{i_1 i_2 \cdots}^{\text{ord}} \cap \mathcal{H}_{i_2 i_1 \cdots}^{\text{ord}} = \{0\} \quad \text{(no overlap)}
$$

The total space is a direct sum:
$$
\mathcal{H}_N^{\text{non-braided}} = \bigoplus_{\text{orderings}} \mathcal{H}_{i_1 \cdots i_N}^{\text{ord}}
$$

In a **braided** fusion category, different orderings are unitarily equivalent. Define the equivalence class:
$$
[\mathcal{H}_{i_1 \cdots i_N}^{\text{ord}}] := \{\mathrm{Mor}(\mathbf{1}, X_{\sigma(i_1)} \otimes \cdots \otimes X_{\sigma(i_N)}) \mid \sigma \in S_N\}
$$
(where $S_N$ is the symmetric group). The braiding induces unitary isomorphisms between all elements of this equivalence class.

The total space can be written as:
$$
\mathcal{H}_N^{\text{braided}} = \bigoplus_{\text{unordered species}} \bigoplus_{\text{charge}} \mathrm{Mor}(\mathbf{1}, X_{i_1} \otimes \cdots \otimes X_{i_N})_{\text{sym}}
$$
where the subscript "sym" denotes the symmetrized/braided version (details depend on statistics).

## Physical Interpretation

**In braided models:** The R-symbols encode the **exchange statistics** of the anyons. When two particles exchange positions, the quantum state acquires a non-trivial phase (for abelian anyons) or mixes with other states (for non-abelian anyons). The braiding encodes this physical phenomenon directly into the categorical structure.

**In non-braided models:** There is no mechanism for exchange. Instead, two particles can undergo a **collision process**:
1. They fuse to an intermediate composite state (via fusion morphisms in $\mathrm{Mor}(X_{i_1} \otimes X_{i_2}, Z)$)
2. They dissociate back to a different order (via fusion morphisms in $\mathrm{Mor}(Z, X_{i_2} \otimes X_{i_1})$)

This collision process is **not unitary**—it represents a Hamiltonian interaction where the two particles scatter off each other, changing their relative configuration.

**Summary:**
- **Braided model → particle exchange (unitary, kinematic phenomenon)**
- **Non-braided model → particle collision (non-unitary, dynamical phenomenon)**

## Implications for Model Construction

**Consequence 1: Hilbert Space Structure**

For a braided category, the Hilbert space naturally separates into sectors by particle number and total charge:
$$
\mathcal{H} = \bigoplus_{N=0}^{n_{\max}} \bigoplus_{c \in \mathrm{Irr}(\mathcal{C})} \mathcal{H}_N^{(c)}
$$
with each $\mathcal{H}_N^{(c)}$ built from symmetrized morphism spaces.

For a non-braided category, different orderings must be kept separate, leading to a more complicated sector structure. The Hilbert space naturally includes an additional "ordering" quantum number.

**Consequence 2: Hamiltonian Terms**

For braided models:
- **Hopping terms** (moving a particle past another) are naturally described by R-moves.
- **Interaction terms** (two particles meeting and fusing) are described by F-moves and fusion morphisms.

For non-braided models:
- **Hopping terms** do not exist (particles cannot pass).
- **Interaction terms** (collision and scattering) are the only local processes that change particle ordering.

**Consequence 3: Exchange Statistics**

In braided models, the R-symbols directly encode exchange statistics:
- **Abelian:** $c_{X,X}^2 = 1_X$ (bosons) or $c_{X,X}^2 = -1_X$ (fermions)
- **Non-abelian:** $c_{X,X}$ can act non-trivially on the multiplicity space $\mathrm{Mor}(\mathbf{1}, X \otimes X)$

In non-braided models, exchange is not defined. Observable statistics can only arise through collision/scattering dynamics.

## Code Implementation

```julia
# file: src/julia/FusionCategories/particle_ordering.jl
# Planning ref: §3.5.7

"""
    orderings_equivalent_via_braiding(C::FusionCategory, ordering1::Vector, ordering2::Vector) -> Bool

Check if two particle orderings can be connected by a sequence of adjacent R-moves (braidings).
Only returns true if C is braided.

Orderings are vectors of anyon species indices.

See: docs/braiding_particle_ordering.md, Definition 4.1
"""
function orderings_equivalent_via_braiding(C::FusionCategory, ordering1::Vector, ordering2::Vector)
    if !is_braided(C)
        # Non-braided: no canonical isomorphism between different orderings
        return ordering1 == ordering2
    end
    
    # Braided: any ordering is reachable from any other permutation via R-moves
    # (This is always true by transitivity of the symmetric group)
    if length(ordering1) != length(ordering2)
        return false
    end
    
    # Check if ordering2 is a permutation of ordering1 (respecting species)
    return sort(ordering1) == sort(ordering2)
end

"""
    morphism_space_for_ordering(C::FusionCategory, charge::Symbol, ordering::Vector{Symbol})
        -> MorphismSpace

Construct the morphism space Mor(1, X_{i_1} ⊗ ⋯ ⊗ X_{i_N}) for a specific ordering.

In a braided category, this is canonically isomorphic to any permutation of the ordering.
In a non-braided category, different orderings are disjoint.

See: docs/braiding_particle_ordering.md, Definition 4.1
"""
function morphism_space_for_ordering(C::FusionCategory, charge::Symbol, ordering::Vector{Symbol})
    # Compute the tensor product X_{i_1} ⊗ ⋯ ⊗ X_{i_N}
    if isempty(ordering)
        tensor_product = identity_object(C)  # vacuum
    else
        tensor_product = ordering[1]
        for i in 2:length(ordering)
            tensor_product = tensor_product ⊗ ordering[i]
        end
    end
    
    # The morphism space is Mor(1, tensor_product) with definite charge
    # Implementation depends on how MorphismSpace tracks charge
    return MorphismSpace(C, identity_object(C), tensor_product, charge)
end

"""
    braiding_isomorphism_between_orderings(C::FusionCategory, ordering1::Vector, ordering2::Vector)
        -> Matrix

Return the unitary matrix implementing the braiding isomorphism between two orderings via R-moves.
Raises error if orderings are not equivalent via braiding (i.e., not permutations of each other,
or if C is not braided).

See: docs/braiding_particle_ordering.md
"""
function braiding_isomorphism_between_orderings(C::FusionCategory, ordering1::Vector, ordering2::Vector)
    if !is_braided(C)
        error("braiding_isomorphism_between_orderings requires a braided category")
    end
    
    if !orderings_equivalent_via_braiding(C, ordering1, ordering2)
        error("Orderings are not equivalent: $(ordering1) vs $(ordering2)")
    end
    
    # Compute the composition of R-moves to transform ordering1 → ordering2
    # This is a sequence of adjacent transpositions (bubble sort-like algorithm)
    
    # TODO: Implement actual R-move composition
    # For now, return identity (placeholder)
    n = length(ordering1)
    return Matrix(I, dimension(morphism_space_for_ordering(C, identity_object(C), ordering1)), 
                       dimension(morphism_space_for_ordering(C, identity_object(C), ordering2)))
end
```

## Examples

**Example 1: Fibonacci Anyons (Braided)**

The Fibonacci fusion category is braided (modular). The simple objects are $\{\mathbf{1}, \tau\}$ with fusion rule $\tau \otimes \tau = \mathbf{1} \oplus \tau$.

For two Fibonacci anyons:
- Ordering 1: $\mathrm{Mor}(\mathbf{1}, \tau \otimes \tau)$ has dimension 2.
- Ordering 2: $\mathrm{Mor}(\mathbf{1}, \tau \otimes \tau)$ is the same (non-abelian case, but still isomorphic).

The R-symbol $R_{\tau\tau}^{\tau \oplus \mathbf{1}}$ mixes the fusion channels, encoding non-abelian statistics.

**Consequence:** In a braided Fibonacci model, the two orderings are unitary equivalent, and quantum states can be delocalized across different orderings via the braiding.

**Example 2: sVec (Fermionic, Braided)**

The category of super-vector spaces is braided, with R-symbols encoding fermionic exchange:
$$
R_{f, f}^{\text{even}} = -1 \quad \text{(Fermi statistics)}
$$

For two fermions:
- $\mathrm{Mor}(\mathbf{1}, f \otimes f)$ with total charge "even" corresponds to the sector where two fermions pair up.
- The braiding permutes the two fermions with a minus sign, consistent with fermionic anticommutation relations.

**Consequence:** Braided sVec correctly encodes fermionic exchange statistics.

**Example 3: Bosonic Ising Anyons (Braided)**

The Ising fusion category (three simple objects $\{\mathbf{1}, \sigma, \psi\}$) is braided. For two anyons:
- Two $\sigma$: $\mathrm{Mor}(\mathbf{1}, \sigma \otimes \sigma) = \mathrm{Mor}(\mathbf{1}, \mathbf{1} \oplus \psi)$ has dimension 2.
- The braiding swaps $\mathbf{1}$ and $\psi$ channels with phases $R_{\sigma\sigma}^{\mathbf{1}}$ and $R_{\sigma\sigma}^{\psi}$.

**Consequence:** Non-abelian braiding statistics are manifest in the mixing of fusion channels under exchange.

## Remarks

1. **Rigidity and Duals:** The above assumes the category is rigid (all objects have duals). This is automatic for fusion categories by definition.

2. **Basis Choices:** The concrete form of R-symbols depends on the choice of fusion tree basis. Different basis choices lead to different matrix representations of R-moves, but the isomorphism between orderings remains invariant (it is natural in the categorical sense).

3. **Reversibility:** Braiding is unitary and reversible. In contrast, collision processes in non-braided models are typically non-unitary scattering processes.

4. **Observables:** In braided models, the non-trivial phases/mixes from R-moves can affect measurable quantities (correlation functions, scattering cross-sections). In non-braided models, exchange is not defined, so such observables do not apply.
