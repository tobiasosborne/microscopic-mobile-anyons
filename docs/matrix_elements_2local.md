---
title: Matrix Elements of 2-Local Operators in Hard-Core Sector
section: "§11"
refs-in:
  - operators.md
  - hilbert_space.md
  - fusion_category.md
refs-out:
  - hamiltonian_v0.md
  - hamiltonian_v1.md
---

# Matrix Elements of 2-Local Operators

**Planning ref:** §11  
**Status:** Draft

---

## Assumptions

| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A11.1 | Fusion category $\mathcal{C}$ with unit $\mathbf{1}$ and simples $X_0=\mathbf{1}, X_1, \ldots, X_{d-1}$ | Input | assumed |
| A11.2 | Hard-core constraint: at most one anyon per site | Physical | assumed |
| A11.3 | Fusion tree basis fixed for $\mathcal{H}_N^{(c)}$ (Definition 4.2.5) | Technical | assumed |
| A11.4 | Multiplicity-free fusion rules (i.e., $N_{ab}^c \in \{0, 1\}$) | Technical | assumed |

---

## §11.1 Matrix Element Definitions

**Definition 11.1** (Matrix element for 2-local morphism). Given:
- Basis states $|\psi\rangle = |(\mathbf{x}, \mathbf{k}), \tau_1, c\rangle$ and $|\phi\rangle = |(\mathbf{x}', \mathbf{k}'), \tau_2, c\rangle$ in $\mathcal{H}_N^{(c)}$
- A morphism $f \in \mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$ acting on sites $j, j+1$

The matrix element is:
$$\langle \phi | f_{j,j+1} | \psi \rangle \in \mathbb{C}$$

This is computed by applying $f$ to the morphism space structure of the configuration and evaluating in the fusion tree basis.

---

## §11.2 Type 1: Two-Particle Interaction

**Definition 11.2** (Two-particle interaction morphism). A morphism $f_{ab \to cd} \in \mathrm{Mor}(X_a \otimes X_b, X_c \otimes X_d)$ acts on two neighbouring sites with anyons of type $X_a, X_b$ and outputs $X_c, X_d$.

**Matrix element structure:**
- Non-zero only if configurations match: $s_j = a, s_{j+1} = b$ in source and appropriate fusion tree compatibility
- In multiplicity-free case, acts as a $1 \times 1$ matrix (phase/scalar) on the morphism space

For configurations $(\mathbf{x}, \mathbf{k})$ and $(\mathbf{x}', \mathbf{k}')$ both with total charge $c$:

$$\langle (\mathbf{x}', \mathbf{k}'), \tau' | f_{j,j+1} | (\mathbf{x}, \mathbf{k}), \tau \rangle = \begin{cases}
\alpha_{ab \to cd} & \text{if } s_j = a, s_{j+1} = b, \text{ fusion trees compatible} \\
0 & \text{otherwise}
\end{cases}$$

where $\alpha_{ab \to cd}$ is the morphism coefficient determined by the fusion structure and normalisation convention.

**Remark.** With multiplicity ($N_{ab}^c > 1$), the matrix element is determined by reduction coefficients in the fusion tree basis.

**Claim 11.2.1** (Hermiticity of physical operators). If $f_{ab \to cd}$ and $f_{cd \to ab}$ are related by dagger (dual morphism), then the operator $f_{j,j+1} + f_{j,j+1}^\dagger$ is Hermitian.

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

See: docs/matrix_elements_2local.md, Definition 11.2
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
    
    # Check configuration support
    if config_src.labels[j] != a || config_src.labels[j+1] != b
        return 0.0 + 0.0im
    end
    
    # Check target configuration matches (for particle-conserving case)
    if config_tgt.labels[j] != c || config_tgt.labels[j+1] != d
        return 0.0 + 0.0im
    end
    
    # Compute morphism in fusion tree basis
    # [ADMITTED: detailed fusion tree reduction not yet implemented]
    return 1.0 + 0.0im  # placeholder
end
```

---

## §11.3 Type 2: Right Hopping

**Definition 11.3** (Right-hopping morphism). A morphism $h_R \in \mathrm{Mor}(X_a \otimes \mathbf{1}, \mathbf{1} \otimes X_a)$ moves an anyon of type $X_a$ from site $j$ to site $j+1$ (which must be empty in hard-core sector).

**Configuration constraint:** In hard-core sector, $s_j = a$ and $s_{j+1} = 0$ (vacuum).

**Matrix element structure:**
- Source: anyon $X_a$ at site $j$, vacuum at site $j+1$
- Target: vacuum at site $j$, anyon $X_a$ at site $j+1$
- Global charge $c$ must be preserved

$$\langle (\mathbf{x}', \mathbf{k}'), \tau' | h_{R,j,j+1} | (\mathbf{x}, \mathbf{k}), \tau \rangle = \begin{cases}
\beta_a & \text{if } (s_j = a, s_{j+1} = 0) \to (s'_j = 0, s'_{j+1} = a), \text{ charge preserved} \\
0 & \text{otherwise}
\end{cases}$$

where $\beta_a$ is the hopping amplitude (set by normalisation convention).

**Claim 11.3.1** (Hermiticity). The combination $h_{R,j,j+1} + h_{R,j,j+1}^\dagger = h_{R,j,j+1} + h_{L,j+1,j}$ is Hermitian.

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
Moves anyon X_a from site j to site j+1.

See: docs/matrix_elements_2local.md, Definition 11.3
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
        if i != j && i != j+1
            if config_src.labels[i] != config_tgt.labels[i]
                return 0.0 + 0.0im
            end
        end
    end
    
    # Check fusion trees compatible with configuration change
    # [ADMITTED: detailed fusion tree tracking not yet implemented]
    
    # Hopping amplitude (normalisation dependent)
    return 1.0 + 0.0im  # placeholder
end
```

---

## §11.4 Type 3: Left Hopping

**Definition 11.4** (Left-hopping morphism). A morphism $h_L \in \mathrm{Mor}(\mathbf{1} \otimes X_a, X_a \otimes \mathbf{1})$ moves an anyon of type $X_a$ from site $j+1$ to site $j$ (which must be empty).

**Configuration constraint:** In hard-core sector, $s_j = 0$ (vacuum) and $s_{j+1} = a$.

**Matrix element structure:**
- Source: vacuum at site $j$, anyon $X_a$ at site $j+1$
- Target: anyon $X_a$ at site $j$, vacuum at site $j+1$
- Global charge $c$ must be preserved

$$\langle (\mathbf{x}', \mathbf{k}'), \tau' | h_{L,j,j+1} | (\mathbf{x}, \mathbf{k}), \tau \rangle = \begin{cases}
\beta_a & \text{if } (s_j = 0, s_{j+1} = a) \to (s'_j = a, s'_{j+1} = 0), \text{ charge preserved} \\
0 & \text{otherwise}
\end{cases}$$

**Remark.** By convention, $h_L = h_R^\dagger$ if both use the same normalisation for the morphism $X_a \otimes \mathbf{1} \leftrightarrow \mathbf{1} \otimes X_a$.

```julia
# file: src/julia/MobileAnyons/matrix_elements.jl

"""
    matrix_element_hop_left(
        C::FusionCategory,
        config_src::LabelledConfig,
        tree_src::Vector{Int},
        config_tgt::LabelledConfig,
        tree_tgt::Vector{Int},
        j::Int,           # site where anyon will move to
        a::Symbol         # anyon type
    ) -> ComplexF64

Compute matrix element of left-hopping operator h_L on sites j, j+1.
Moves anyon X_a from site j+1 to site j.

See: docs/matrix_elements_2local.md, Definition 11.4
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
        if i != j && i != j+1
            if config_src.labels[i] != config_tgt.labels[i]
                return 0.0 + 0.0im
            end
        end
    end
    
    # Check fusion trees compatible with configuration change
    # [ADMITTED: detailed fusion tree tracking not yet implemented]
    
    # Hopping amplitude
    return 1.0 + 0.0im  # placeholder
end
```

---

## §11.5 Operator Matrix Representation

**Definition 11.5** (Full operator matrix). Given basis states $\{|\psi_i\rangle\}_{i=1}^{d_N^{(c)}}$ of $\mathcal{H}_N^{(c)}$, the matrix representation of operator $\mathcal{O}$ is:
$$\mathcal{O} = \sum_{i,j} \langle \psi_i | \mathcal{O} | \psi_j \rangle |\psi_i\rangle\langle\psi_j|$$

**Claim 11.5.1** (Sparsity in hard-core sector). For 2-local operators:
- Type 1 (interaction) affects $O(n)$ matrix elements (all pairs with anyons at sites $j, j+1$)
- Type 2, 3 (hopping) affect $O(n)$ matrix elements (all configurations differing by one anyon displacement)

The matrix is sparse, with $O(n \cdot d_N^{(c)})$ nonzero entries.

```julia
# file: src/julia/MobileAnyons/matrix_elements.jl

"""
    build_operator_matrix(
        H::MobileAnyonHilbert,
        N::Int,
        c::Int,
        operator_type::String,  # "interaction", "hop_right", "hop_left"
        site::Int,              # j for Type 1,2,3
        params::Dict            # {a, b, c, d} or {a}
    ) -> SparseMatrixCSC

Build sparse matrix representation of a 2-local operator on sector H_N^(c).

See: docs/matrix_elements_2local.md, Definition 11.5
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

## §11.6 Example: Two Fibonacci Anyons

**Example 11.1** (Fibonacci $\tau$ anyons, $N=2$ on 3 sites).

Fusion category: Fibonacci ($\tau \otimes \tau = \mathbf{1} + \tau$).

Configuration space: $\mathrm{Conf}_2^{\mathrm{HC}}(3) = \{(1,2), (1,3), (2,3)\}$ (two of three sites occupied).

Basis of $\mathcal{H}_2^{(\mathbf{1})}$ (two $\tau$ anyons fusing to $\mathbf{1}$):
- $|\tau_1 \tau_2 \rangle$ = anyons at sites 1 and 2
- $|\tau_1 \tau_3 \rangle$ = anyons at sites 1 and 3
- $|\tau_2 \tau_3 \rangle$ = anyons at sites 2 and 3

For right-hopping operator $h_{R,1,2}$ (move anyon from site 1 to 2 if site 2 empty):
- Source: $|\tau_1 \tau_3\rangle$ (site 2 empty)
- Target: $|\tau_2 \tau_3\rangle$ (site 1 now empty)
- Non-zero matrix element: $\langle \tau_2 \tau_3 | h_{R,1,2} | \tau_1 \tau_3 \rangle \neq 0$

Matrix of $h_{R,1,2}$:
$$h_{R,1,2} = \begin{pmatrix} 0 & \beta & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}$$

where $\beta$ is the (amplitude chosen by normalisation convention.

---

## §11.7 Open Questions

**Question 11.1** (Fusion tree reduction). How to compute morphism coefficients for specific fusion categories when basis-independent definitions require fusion tree bases? Proposed: detailed reduction formula in `docs/diagrammatic_calculus.md`.

**Question 11.2** (Multiplicity). How do matrix elements change in non-multiplicity-free categories? Each morphism space becomes multi-dimensional, and basis dependence must be carefully tracked.

