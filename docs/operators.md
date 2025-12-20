---
title: Operators as Morphisms
section: "§4.3"
refs-in:
  - fusion_category.md
  - morphism_spaces.md
refs-out:
  - hilbert_space.md
  - hamiltonian_v0.md
  - hamiltonian_v1.md
---

# Operators as Morphisms

**Planning ref:** §4.3  
**Status:** Draft

**Dependency note:** This document is logically prior to hilbert_space.md. We define operators as abstract categorical morphisms first, then show in hilbert_space.md how they act on the concrete Hilbert space.

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A4.3.1 | We work with finite tensor products of simple objects | Technical | assumed |
| A4.3.2 | The fusion category $\mathcal{C}$ has finitely many simple objects | Technical | assumed |

---

## §4.3.1 Abstract Operator Definition (Category-Level)

**Definition 4.3.1** (Morphism space operator). An *operator* is an element of a morphism space:
$$\mathcal{O} \in \mathrm{Mor}(A, B)$$
where $A, B$ are tensor products of simple objects from $\mathcal{C}$.

**Remark:** This is a purely categorical definition, independent of any representation or Hilbert space. Morphisms are abstract; they follow categorical axioms (composition, associativity, identities).

**Definition 4.3.2** (Operator as morphism sum). The space of all operators in this categorical sense is:
$$\mathfrak{Op}_{\mathrm{cat}} = \bigoplus_{n_A, n_B \in \mathbb{Z}_{\ge 0}} \bigoplus_{(a_1, \ldots, a_{n_A}) \in \{1,\ldots,d-1\}^{n_A}} \bigoplus_{(b_1, \ldots, b_{n_B}) \in \{1,\ldots,d-1\}^{n_B}} \mathrm{Mor}(X_{a_1} \otimes \cdots \otimes X_{a_{n_A}}, X_{b_1} \otimes \cdots \otimes X_{b_{n_B}})$$

where the nested direct sums run over:
- $n_A, n_B \in \mathbb{Z}_{\ge 0}$ — number of non-vacuum factors (per assumption A4.3.1, this is finite)
- Labels $a_i, b_j \in \{1, \ldots, d-1\}$ — indices of simple objects (excluding vacuum $X_0 = \mathbf{1}$)
- By semisimplicity, $\mathrm{Mor}(A, B)$ is a finite-dimensional vector space for each choice of $A, B$

**Remark:** Objects with $n_A = 0$ are identified with $\mathbf{1}$ (tensor unit), so $X_\emptyset = \mathbf{1}$. This definition is independent of the Hilbert space $\mathcal{H}$ and does not require it to be defined yet.

---

## §4.3.2 Action on Hilbert Space (Concrete Representation)

Once the Hilbert space $\mathcal{H}$ is defined (Definition 4.2.6 in hilbert_space.md), morphism operators are promoted to linear maps via a representation:

**Definition 4.3.3** (Representation of operators on $\mathcal{H}$). A *representation* of the morphism space $\mathrm{Mor}(A, B)$ on the Hilbert space $\mathcal{H}$ is a linear embedding:
$$\rho: \mathrm{Mor}(A, B) \to \mathrm{Lin}(\mathcal{H}_A \to \mathcal{H}_B)$$
where $\mathcal{H}_A$ denotes the sector of $\mathcal{H}$ corresponding to object $A$, and $\mathrm{Lin}$ denotes linear maps.

The full operator algebra on $\mathcal{H}$ is:
$$\mathrm{End}(\mathcal{H}) = \bigoplus_{A,B} \mathrm{Lin}(\mathcal{H}_A \to \mathcal{H}_B) \cong \bigoplus_{A,B} \rho(\mathrm{Mor}(A, B)) \otimes \mathrm{Lin}(\mathcal{H}_A \otimes \mathcal{H}_B \to \mathcal{H}_A \otimes \mathcal{H}_B)$$

**Remark:** See hilbert_space.md for the full definition of $\mathcal{H}_A$.

---

## §4.3.3 Particle-Number Conservation (at Category Level)

**Definition 4.3.4** (Particle-number of object). For an object $A = X_{a_1} \otimes \cdots \otimes X_{a_n}$, define:
$$\mathrm{N}(A) = n$$
(the number of nontrivial factors, excluding vacuum $\mathbf{1}$).

**Definition 4.3.5** (Particle-conserving morphism). A morphism $\phi \in \mathrm{Mor}(A, B)$ is *particle-conserving* if:
$$\mathrm{N}(A) = \mathrm{N}(B)$$

**Definition 4.3.6** (Particle-changing morphism). A morphism $\phi \in \mathrm{Mor}(A, B)$ is *particle-changing* if:
$$\mathrm{N}(A) \neq \mathrm{N}(B)$$

**Example.** 
- $\mathrm{Mor}(X_a \otimes X_b, X_c)$ is particle-annihilating: $\mathrm{N}(A) = 2$, $\mathrm{N}(B) = 1$.
- $\mathrm{Mor}(X_a, X_b \otimes X_c)$ is particle-creating: $\mathrm{N}(A) = 1$, $\mathrm{N}(B) = 2$.

---

## §4.3.4 Locality

**Definition 4.3.7** (Support of object). For an object $A = X_{a_1} \otimes \cdots \otimes X_{a_n}$, define:
$$\mathrm{supp}(A) = \{j : a_j \neq 1\}$$
(the set of factor positions that are nontrivial).

**Definition 4.3.8** (k-local morphism). A morphism $\phi \in \mathrm{Mor}(A, B)$ is *k-local* if:
$$|\mathrm{supp}(A) \cup \mathrm{supp}(B)| \leq k$$

**Example.** 
- $\mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$ is 2-local: only factors 0 and 1 are involved.
- $\mathrm{Mor}(X_a, X_a)$ is 1-local: only factor 0 is involved.
- $\mathrm{Mor}(X_a \otimes \mathbf{1}, \mathbf{1} \otimes X_a)$ is 2-local: acts on positions 0 and 1.

**Remark:** In the context of lattice systems, locality also specifies which lattice sites the morphism acts on. This is covered when embedding into the lattice in hamiltonian_v0.md.

```julia
# file: src/julia/MobileAnyons/operators.jl

abstract type AnyonOperator end

struct MorphismTerm
    source::Vector{Int}    # object A as list of simple labels
    target::Vector{Int}    # object B as list of simple labels  
    matrix::Matrix{ComplexF64}
end

struct CategoricalOperator <: AnyonOperator
    components::Vector{MorphismTerm}    # Mor(A,B) terms
end

# Helper: compute particle number of object
function particle_number(labels::Vector{Int})
    return count(≠(0), labels)  # count non-vacuum factors
end

# Helper: check if morphism conserves particle number
is_particle_conserving(morph::MorphismTerm) = 
    particle_number(morph.source) == particle_number(morph.target)
```
