---
title: Matrix Elements of 2-Local Operators in Hard-Core Sector
section: "§4.5"
refs-in:
  - operators.md
  - hilbert_space.md
  - fusion_category.md
refs-out:
  - hamiltonian_v0.md
  - hamiltonian_v1.md
---

# Matrix Elements of 2-Local Operators

**Planning ref:** §4.5  
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A4.5.1 | Fusion category $\mathcal{C}$ with unit $\mathbf{1}$ and simples $X_0=\mathbf{1}, X_1, \ldots, X_{d-1}$ | Input | assumed |
| A4.5.2 | Hard-core constraint: at most one anyon per site | Physical | assumed |
| A4.5.3 | Fusion tree basis fixed for $\mathcal{H}_N^{(c)}$ (per §4.2.5: Explicit Construction) | Technical | assumed |
| A4.5.4 | Multiplicity-free fusion rules (i.e., $N_{ab}^c \in \{0, 1\}$) | Technical | assumed |

---

## §4.5.1 Fusion Trees as Basis Data

**Definition 4.5.1** (Fusion tree). A *fusion tree* for a configuration $(\mathbf{x}, \mathbf{k})$ with total charge $c$ is a sequence of intermediate fusion outcomes specifying how the anyons at positions $x_1, \ldots, x_N$ combine to produce the total charge. Formally, it is a labelling of all internal nodes in a binary tree with fusion results from $\mathcal{C}$.

**Notation:** We write $\tau$ for a fusion tree and denote basis states as $|(\mathbf{x}, \mathbf{k}), \tau, c\rangle \in \mathcal{H}_N^{(c)}$, where:
- $(\mathbf{x}, \mathbf{k})$ is the configuration (positions and anyon types)
- $\tau$ encodes the fusion tree structure
- $c$ is the total charge (redundant if fusion tree is fully specified, but explicit for clarity)

**Remark.** The fusion tree is not canonical; different choices of parenthesisation yield different bases. For multiplicity-free categories, all choices span the same space, but individual basis vectors depend on the choice. This is why all definitions must be basis-independent; fusion tree bases are used only for computation.

**Remark.** When two basis states have different fusion trees $\tau \neq \tau'$ (even for the same configuration and charge), they are orthogonal basis vectors. The Gram matrix between them is determined by the F-symbols of the category.

---

## §4.5.2 Matrix Element Definitions

**Definition 4.5.2** (Matrix element for 2-local morphism). Given:
- Basis states $|\psi\rangle = |(\mathbf{x}, \mathbf{k}), \tau, c\rangle$ and $|\phi\rangle = |(\mathbf{x}', \mathbf{k}'), \tau', c\rangle$ in $\mathcal{H}_N^{(c)}$
- A morphism $f \in \mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$ acting on sites $j, j+1$

The matrix element is the complex number:
$$\langle \phi | f_{j,j+1} | \psi \rangle \in \mathbb{C}$$

Interpretation: $f_{j,j+1}$ acts as a morphism between the anyon types at sites $j, j+1$ in the source configuration and target configuration. The matrix element is computed by:
1. Extracting the relevant portion of the morphism space from $\tau$ and $\tau'$
2. Applying the morphism $f$
3. Evaluating the resulting composition

---

## §4.5.3 Type 1: Two-Particle Interaction

**Definition 4.5.3** (Two-particle interaction morphism). A morphism $f_{ab \to cd} \in \mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$ acts on two neighbouring sites with anyons of type $X_a, X_b$ and outputs $X_c, X_d$.

**Configuration support:** Non-zero matrix elements occur only when:
- Source configuration: $s_j = a, s_{j+1} = b$
- Target configuration: $s'_j = c, s'_{j+1} = d$
- All other sites identical: $s_i = s'_i$ for $i \notin \{j, j+1\}$
- Total charge preserved: $c_{\mathrm{total}}$ unchanged

In this case, the matrix element is:
$$\langle (\mathbf{x}', \mathbf{k}'), \tau' | f_{ab \to cd} | (\mathbf{x}, \mathbf{k}), \tau \rangle = \alpha_{ab \to cd}(\tau, \tau')$$

where $\alpha_{ab \to cd}(\tau, \tau')$ is a scalar determined by:
- The morphism $f_{ab \to cd}$
- The compatibility of fusion trees $\tau, \tau'$ at sites $j, j+1$

**In multiplicity-free case:** $N_{ab}^c \in \{0,1\}$ for all triples, so the morphism space $\mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$ is either $\{0\}$ or one-dimensional. If non-zero, the coefficient $\alpha_{ab \to cd}$ is a phase/scalar set by normalisation.

**Critical issue:** If $N_{ab}^c = 0$ (fusion forbidden), then $\mathrm{Mor}(X_a \otimes X_b, X_c) = \{0\}$, and the operator component is identically zero—it acts trivially on configurations where $a$ and $b$ are adjacent.

```julia
# file: src/julia/MobileAnyons/matrix_elements.jl

"""
    matrix_element_two_particle(
        C::FusionCategory,
        config_src::LabelledConfig,
        tree_src::Vector{Int},
        config_tgt::LabelledConfig,
        tree_tgt::Vector{Int},
        j::Int,                    # leftmost site of interaction
        f_label::Tuple             # (a, b, c, d, multiplicity_index)
    ) -> ComplexF64

Compute matrix element of 2-particle morphism f_{ab->cd} on sites j, j+1
between basis states |config_src, tree_src> and |config_tgt, tree_tgt>.

Returns zero if:
- Source does not have X_a at j, X_b at j+1
- Target does not have X_c at j, X_d at j+1
- Fusion category forbids a ⊗ b -> c ⊗ d
- Fusion trees incompatible

See: docs/matrix_elements_2local.md, Definition 4.5.3
"""
function matrix_element_two_particle(
    C::FusionCategory,
    config_src::LabelledConfig,
    tree_src::Vector{Int},
    config_tgt::LabelledConfig,
    tree_tgt::Vector{Int},
    j::Int,
    f_label::Tuple
)
    a, b, c, d = f_label[1:4]
    
    # Check source configuration
    if config_src.labels[j] != a || config_src.labels[j+1] != b
        return 0.0 + 0.0im
    end
    
    # Check target configuration
    if config_tgt.labels[j] != c || config_tgt.labels[j+1] != d
        return 0.0 + 0.0im
    end
    
    # Check all other sites unchanged
    for i in 1:length(config_src.labels)
        if i ∉ {j, j+1} && config_src.labels[i] != config_tgt.labels[i]
            return 0.0 + 0.0im
        end
    end
    
    # Check fusion allowed
    if !has_fusion(C, a, b, c ⊗ d)
        return 0.0 + 0.0im
    end
    
    # Compute morphism in fusion tree basis
    # [ADMITTED: detailed fusion tree reduction coefficients not yet implemented]
    return 1.0 + 0.0im  # placeholder; should extract from tree_src -> tree_tgt
end
```

**Claim 4.5.3.1** (Hermiticity). If $f_{ab \to cd}$ is a unitary morphism (or paired with its adjoint), the physical operator $\mathcal{O} = f_{j,j+1} + f_{j,j+1}^\dagger$ is Hermitian and preserves the sector $\mathcal{H}_N^{(c)}$.

---

## §4.5.4 Type 2: Right Hopping

**Definition 4.5.4** (Right-hopping morphism). A morphism $h_R \in \mathrm{Mor}(X_a \otimes \mathbf{1}, \mathbf{1} \otimes X_a)$ describes translating an anyon of type $X_a$ from site $j$ to site $j+1$.

**Hard-core configuration support:** In the hard-core sector:
- Source: anyon $X_a$ at site $j$, vacuum ($\mathbf{1}$) at site $j+1$
- Target: vacuum at site $j$, anyon $X_a$ at site $j+1$

Matrix element:
$$\langle (\mathbf{x}', \mathbf{k}'), \tau' | h_{R,j,j+1} | (\mathbf{x}, \mathbf{k}), \tau \rangle = \begin{cases}
\beta_a(\tau, \tau') & \text{if } s_j = a, s_{j+1} = 0 \text{ and } s'_j = 0, s'_{j+1} = a \\
& \text{and total charge } c \text{ preserved} \\
0 & \text{otherwise}
\end{cases}$$

where $\beta_a(\tau, \tau')$ is determined by the fusion tree evolution and normalisation convention.

**Physical interpretation:** The morphism $h_R$ encodes both the spatial translation and the anyon braiding/phase accumulated when crossing the other anyons.

```julia
# file: src/julia/MobileAnyons/matrix_elements.jl

"""
    matrix_element_hop_right(
        C::FusionCategory,
        config_src::LabelledConfig,
        tree_src::Vector{Int},
        config_tgt::LabelledConfig,
        tree_tgt::Vector{Int},
        j::Int,           # site of anyon
        a::Symbol         # anyon type
    ) -> ComplexF64

Compute matrix element of right-hopping operator h_R on sites j, j+1.
Moves anyon X_a from site j to site j+1 (which must be empty in HC).

See: docs/matrix_elements_2local.md, Definition 4.5.4
"""
function matrix_element_hop_right(
    C::FusionCategory,
    config_src::LabelledConfig,
    tree_src::Vector{Int},
    config_tgt::LabelledConfig,
    tree_tgt::Vector{Int},
    j::Int,
    a::Symbol
)
    # Check source: X_a at j, vacuum at j+1
    if config_src.labels[j] != a || config_src.labels[j+1] != 0
        return 0.0 + 0.0im
    end
    
    # Check target: vacuum at j, X_a at j+1
    if config_tgt.labels[j] != 0 || config_tgt.labels[j+1] != a
        return 0.0 + 0.0im
    end
    
    # Check other sites unchanged
    for i in 1:length(config_src.labels)
        if i ∉ {j, j+1} && config_src.labels[i] != config_tgt.labels[i]
            return 0.0 + 0.0im
        end
    end
    
    # Compute hopping amplitude from fusion tree evolution
    # [ADMITTED: fusion tree tracking and R-matrix application not yet implemented]
    
    return 1.0 + 0.0im  # placeholder
end
```

**Claim 4.5.4.1** (Locality of hopping). Right hopping is a 2-local operator: it couples only configurations differing by a single anyon displacement at neighbouring sites.

---

## §4.5.5 Type 3: Left Hopping

**Definition 4.5.5** (Left-hopping morphism). A morphism $h_L \in \mathrm{Mor}(\mathbf{1} \otimes X_a, X_a \otimes \mathbf{1})$ describes translating an anyon of type $X_a$ from site $j+1$ to site $j$.

**Hard-core configuration support:**
- Source: vacuum at site $j$, anyon $X_a$ at site $j+1$
- Target: anyon $X_a$ at site $j$, vacuum at site $j+1$

Matrix element:
$$\langle (\mathbf{x}', \mathbf{k}'), \tau' | h_{L,j,j+1} | (\mathbf{x}, \mathbf{k}), \tau \rangle = \begin{cases}
\beta_a(\tau, \tau') & \text{if } s_j = 0, s_{j+1} = a \text{ and } s'_j = a, s'_{j+1} = 0 \\
& \text{and total charge } c \text{ preserved} \\
0 & \text{otherwise}
\end{cases}$$

**Relation to right hopping:** By rigidity of the fusion category, $h_L$ and $h_R$ are related via duality. In particular, if both use consistent normalisation for $X_a \otimes \mathbf{1} \leftrightarrow \mathbf{1} \otimes X_a$, then $h_L = h_R^\dagger$ (up to phase).

```julia
# file: src/julia/MobileAnyons/matrix_elements.jl

"""
    matrix_element_hop_left(
        C::FusionCategory,
        config_src::LabelledConfig,
        tree_src::Vector{Int},
        config_tgt::LabelledConfig,
        tree_tgt::Vector{Int},
        j::Int,           # site where anyon moves to
        a::Symbol         # anyon type
    ) -> ComplexF64

Compute matrix element of left-hopping operator h_L on sites j, j+1.
Moves anyon X_a from site j+1 to site j (which must be empty in HC).

See: docs/matrix_elements_2local.md, Definition 4.5.5
"""
function matrix_element_hop_left(
    C::FusionCategory,
    config_src::LabelledConfig,
    tree_src::Vector{Int},
    config_tgt::LabelledConfig,
    tree_tgt::Vector{Int},
    j::Int,
    a::Symbol
)
    # Check source: vacuum at j, X_a at j+1
    if config_src.labels[j] != 0 || config_src.labels[j+1] != a
        return 0.0 + 0.0im
    end
    
    # Check target: X_a at j, vacuum at j+1
    if config_tgt.labels[j] != a || config_tgt.labels[j+1] != 0
        return 0.0 + 0.0im
    end
    
    # Check other sites unchanged
    for i in 1:length(config_src.labels)
        if i ∉ {j, j+1} && config_src.labels[i] != config_tgt.labels[i]
            return 0.0 + 0.0im
        end
    end
    
    # Compute hopping amplitude from fusion tree evolution
    # [ADMITTED: fusion tree tracking and R-matrix application not yet implemented]
    
    return 1.0 + 0.0im  # placeholder
end
```

---

## §4.5.6 Operator Matrix Representation

**Definition 4.5.6** (Full operator matrix in $\mathcal{H}_N^{(c)}$). Let $\{|\psi_i\rangle = |(\mathbf{x}_i, \mathbf{k}_i), \tau_i, c\rangle\}_{i=1}^{d_N^{(c)}}$ be an orthonormal basis of $\mathcal{H}_N^{(c)}$ (in a chosen fusion tree basis). The matrix representation of a 2-local operator $\mathcal{O}$ is:
$$[\mathcal{O}]_{ij} := \langle \psi_i | \mathcal{O} | \psi_j \rangle \in \mathbb{C}$$

**Remark.** This is basis-dependent; different fusion tree bases yield different matrix coordinates. However, the eigenvalues and trace (and all basis-independent properties) are invariant.

**Claim 4.5.6.1** (Sparsity of 2-local operators). For 2-local operators in the hard-core sector:
- Type 1 (two-particle interaction) couples configurations with anyons at the same pair of sites $(j, j+1)$; expect $O(n)$ nonzero entries per row.
- Type 2, 3 (hopping) couple configurations differing by a single displacement; expect $O(1)$ nonzero entries per row.

Total matrix sparsity: $O(n \cdot d_N^{(c)})$ nonzero entries, with $d_N^{(c)} \leq \binom{n}{N}$ (configurations) times (fusion tree choices).

```julia
# file: src/julia/MobileAnyons/matrix_elements.jl

"""
    build_operator_matrix(
        H::MobileAnyonHilbert,
        N::Int,
        c::Int,
        operator_type::String,  # "interaction", "hop_right", "hop_left"
        site::Int,              # j for 2-local operator on sites j, j+1
        params::Dict            # {a, b, c, d} or {a} depending on operator_type
    ) -> SparseMatrixCSC

Build sparse matrix representation of a 2-local operator on sector H_N^(c).
Uses fusion tree basis from H.sectors[(N, c)].

Iterates over all basis state pairs (i,j) and computes matrix elements.

See: docs/matrix_elements_2local.md, Definition 4.5.6
"""
function build_operator_matrix(
    H::MobileAnyonHilbert,
    N::Int,
    c::Int,
    operator_type::String,
    site::Int,
    params::Dict
)
    basis = H.sectors[(N, c)]
    d = length(basis)
    
    I = Int[]
    J = Int[]
    V = ComplexF64[]
    
    for (i, psi) in enumerate(basis)
        for (j, phi) in enumerate(basis)
            val = if operator_type == "interaction"
                matrix_element_two_particle(
                    H.fusion_cat,
                    psi.config, psi.fusion_tree,
                    phi.config, phi.fusion_tree,
                    site, (params[:a], params[:b], params[:c], params[:d], 1)
                )
            elseif operator_type == "hop_right"
                matrix_element_hop_right(
                    H.fusion_cat,
                    psi.config, psi.fusion_tree,
                    phi.config, phi.fusion_tree,
                    site, params[:a]
                )
            else  # "hop_left"
                matrix_element_hop_left(
                    H.fusion_cat,
                    psi.config, psi.fusion_tree,
                    phi.config, phi.fusion_tree,
                    site, params[:a]
                )
            end
            
            if val != 0
                push!(I, i)
                push!(J, j)
                push!(V, val)
            end
        end
    end
    
    return sparse(I, J, V, d, d)
end
```

---

## §4.5.7 Example: Two Fibonacci Anyons

**Example 4.5.1** (Fibonacci $\tau$ anyons, $N=2$ on 3 sites).

Fusion category: Fibonacci, $d=2$ (objects $\mathbf{1}, \tau$), $\tau \otimes \tau = \mathbf{1} \oplus \tau$ (multiplicity 1 each).

Hard-core configurations with 2 anyons on 3 sites: $\mathrm{Conf}_2^{\mathrm{HC}}(3) = \{(1,2), (1,3), (2,3)\}$ (pairs of occupied sites).

Basis states in $\mathcal{H}_2^{(\mathbf{1})}$ (two $\tau$ anyons fusing to $\mathbf{1}$):
- $|\psi_1\rangle = |(1,2), \tau, \mathbf{1}\rangle$ = anyons at sites 1, 2 fusing to $\mathbf{1}$
- $|\psi_2\rangle = |(1,3), \tau, \mathbf{1}\rangle$ = anyons at sites 1, 3 fusing to $\mathbf{1}$
- $|\psi_3\rangle = |(2,3), \tau, \mathbf{1}\rangle$ = anyons at sites 2, 3 fusing to $\mathbf{1}$

Right-hopping operator $h_{R,1,2}$ on sites 1, 2 (moves anyon from site 1 to site 2):
- Source: anyon at site 1, vacuum at site 2 → only $|\psi_2\rangle = |(1,3)\rangle$ qualifies
- Target: vacuum at site 1, anyon at site 2 → only $|\psi_3\rangle = |(2,3)\rangle$ qualifies
- Non-zero element: $\langle \psi_3 | h_{R,1,2} | \psi_2 \rangle$

Matrix of $h_{R,1,2}$ in basis $\{\psi_1, \psi_2, \psi_3\}$:
$$h_{R,1,2} = \begin{pmatrix} 0 & \beta & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}$$

where $\beta$ is the amplitude (normalisation-dependent).

---

## §4.5.8 Critical Observations and Open Questions

**Observation 1** (Fusion tree dependence). The matrix elements explicitly depend on the choice of fusion tree basis via $\tau, \tau'$. This choice is not canonical for multiplicity $N_{ab}^c > 1$. All published definitions must remain basis-independent; fusion trees are a computational tool only.

**Observation 2** (Missing fusion tree reduction). The Julia stubs are placeholders. Computing actual matrix elements requires:
1. Extracting the local fusion tree structure at sites $j, j+1$ from $\tau$
2. Composing with the morphism $f$ or $h$
3. Tracking how $\tau$ evolves to $\tau'$
4. Applying R-matrices if the operator causes anyon braiding

This requires implementation of fusion tree reduction coefficients and F-symbols.

**Question 4.5.1** (Hard-core + arbitrary charge). For $N$ anyons with definite charge $c$ in hard-core sector, is the dimension of $\mathcal{H}_N^{(c)}$ always $O(\binom{n}{N})$? What are the constraints on $c$?

**Question 4.5.2** (Multiplicity handling). How do matrix elements change if $N_{ab}^c > 1$? Each morphism space becomes multi-dimensional, introducing index-dependent amplitudes $\alpha^{(\mu)}_{ab \to cd}$.

**Question 4.5.3** (Normalisation convention). What is the standard normalisation for $h_R$ and $h_L$? Should they be unitary? Hermitian? How does this interact with R-matrices and the fusion category structure?
