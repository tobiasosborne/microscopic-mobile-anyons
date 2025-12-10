# AGENTS.md — Instructions for AI Agents

This file contains instructions and context for AI agents (Claude, GPT-4, etc.) working on the Mobile Anyons project.

---

## Project Overview

This is a theoretical physics research project developing microscopic models for mobile/itinerant anyons arising from fusion categories. The goal is a publication-ready paper with rigorous mathematics and verified code.

**Key documents:**
- `prd.md` — Project requirements
- `tech_specs.md` — Technical infrastructure specifications
- `research_plan.md` — Full research plan with BEAD tracking

---

## Critical Constraints

### 1. First Quantisation Only

**DO NOT use creation/annihilation operators.** We work exclusively in first quantisation. Creation/annihilation operators are a red herring and will lead to incorrect formulations.

- Fock space is a direct sum of n-particle spaces
- Operators act on these spaces directly
- No second quantisation formalism

### 2. Normalisation Care

Extra care must be taken with normalisations of diagrams and morphisms. Inconsistent conventions are a major source of errors in fusion category calculations.

- Always state normalisation conventions explicitly
- When in doubt, ask for clarification
- Document all choices in `docs/diagrammatic_calculus.md`

### 3. Multiplicity Handling

All definitions must work for both:
- Multiplicity-free case: $N_{ab}^c \in \{0, 1\}$
- General case with multiplicity: $N_{ab}^c \geq 0$

Do not assume multiplicity-free unless explicitly stated.

### 4. Basis Independence

Work basis-independent where possible. Fusion tree bases may be introduced where computationally necessary, but the underlying definitions should not depend on basis choices.

---

## Document Standards

### File Structure

- Each document ≤ 200 lines (~2K tokens)
- One concept per document
- Offload code to `src/`; reference by path
- Use `_overview.md` files for directory navigation

### Required Elements

Every document must include:

1. **Front matter** with cross-references:
```yaml
---
refs-in:
  - dependency1.md
  - dependency2.md
refs-out:
  - dependent1.md
---
```

2. **Assumption table** (if applicable):
```markdown
| ID | Assumption | Type | Status |
|----|------------|------|--------|
| A1 | Description | Constraint/Technical/Physical | assumed/proved |
```

3. **Symbol references** from global `symbols.yaml`

### Definitions

Every definition must:
- Be mathematically rigorous
- Include a compilable Julia code snippet
- Cite sources with `[unverified]` tag until HITL verification

Example:
```markdown
**Definition 3.1** (Fusion multiplicity). For simple objects $a, b, c \in \mathcal{C}$, 
the fusion multiplicity $N_{ab}^c$ is the dimension of $\mathrm{Hom}(a \otimes b, c)$.
[Etingof, §2.3] `[unverified]`
```

```julia
# file: src/julia/FusionCategories/multiplicity.jl
fusion_multiplicity(C::FusionCategory, a, b, c) = get(C.N, (a, b, c), 0)
```

### Results Classification

| Label | Requirement |
|-------|-------------|
| **Claim** | Statement without proof; evidence may be numerical/heuristic |
| **Conjecture** | Statement believed true; no proof supplied |
| **Theorem** | Statement with complete proof |
| **Lemma/Proposition** | Supporting statement with complete proof |

**No exceptions:** Results without proof must be labelled `Claim` or `Conjecture`.

---

## Hierarchical Proof Protocol (Lamport Style)

All proofs **must** use Lamport-style hierarchical notation. No prose proofs. No skipping steps.

### Proof Document Structure

Every proof begins with a header block:

```
THEOREM: [Precise statement]
SYMBOLS:
  - x : Type [description]
  - ε : ℝ, ε > 0
ASSUMPTIONS:
  A1. [statement]
  A2. [statement]
DEFINITIONS:
  D1. [name] := [definition]
```

All symbols must be declared. No implicit quantifiers.

### Step Format

```
<d>n. CLAIM: [What is established]
     USING: [refs: <d>n, A1, D1, THEOREM names]
     JUSTIFICATION: [Rule: modus ponens, definition expansion, ...]
     SCOPE: [if changed] ASSUME x | DISCHARGE x
     CHECK: [optional: Julia snippet, explicit computation]
```

Where `<d>` = depth (1,2,3,...), `n` = step number at that depth.

### Hierarchy Rules

- `<1>` steps prove the theorem directly
- `<d+1>` steps prove the enclosing `<d>` step
- Every non-leaf step ends with QED substep:

```
<d+1>k. QED <d>n
        BY: [sibling step refs]
        VIA: [composition rule]
```

- Leaf steps must be: axioms, assumptions, definitions, or marked `ADMITTED` (proof obligation)

### Scope Rules

For temporary assumptions (contradiction, induction, WLOG):

```
<2>1. CLAIM: Assume P for contradiction
     SCOPE: ASSUME ¬Q
     
<2>2. CLAIM: [derivation using <2>1]
     USING: <2>1, ...
     
<2>3. CLAIM: Contradiction: R ∧ ¬R
     USING: <2>2, ...
     
<2>4. QED <1>n (Q holds)
     BY: <2>1, <2>3
     VIA: proof by contradiction
     SCOPE: DISCHARGE ¬Q
```

Only reference assumptions currently in scope.

### Workflow

**Phase 1 — Skeleton:** Output only `<1>` level. STOP. Wait for approval.

```
PROOF SKELETON:
<1>1. CLAIM: ...
<1>2. CLAIM: ...
<1>3. QED THEOREM
      BY: <1>1, <1>2
      VIA: ...
```

**Phase 2 — Expansion:** When asked to expand `<1>n`, output its `<2>` substeps. STOP. Wait.

**Phase 3 — Verification:** On request:
- "State proof obligation for `<d>n`" → precise claim + available hypotheses
- "Verify `<d>n`" → check USING refs imply CLAIM
- "Criticize this proof" → find scope violations, unstated assumptions, type errors

### Anti-Patterns (NEVER DO THESE)

| ❌ Anti-pattern | ✅ Required |
|----------------|-------------|
| "for small enough ε" | ∃ε₀ > 0 such that ∀ε < ε₀ |
| "straightforward calculation" | State what is shown; mark ADMITTED if unexpanded |
| "by standard results" | Cite specific theorem with statement |
| Prose between steps | All reasoning in CLAIM/JUSTIFICATION fields |
| Deep expansion unprompted | Never go beyond one level without approval |
| Type drift (symbol reuse) | Proof INVALID if symbol changes type/meaning |

### Example

```
THEOREM: The Hilbert space H decomposes as ⊕_n H_n

SYMBOLS:
  - H : Hilbert space (total mobile anyon space)
  - H_n : Hilbert space (n-anyon sector)
  - N̂ : H → H (number operator)
  - H : H → H (Hamiltonian)

ASSUMPTIONS:
  A1. H is constructed per Definition 4.2.3
  A2. Local terms in H conserve particle number (Definition 5.1.1)

PROOF SKELETON:
<1>1. CLAIM: [N̂, H] = 0
     USING: A2, D5.1.1
     JUSTIFICATION: Each local term commutes with N̂ by construction

<1>2. CLAIM: H decomposes into eigenspaces of N̂
     USING: <1>1
     JUSTIFICATION: Spectral theorem for commuting self-adjoint operators

<1>3. CLAIM: Each eigenspace H_n is finite-dimensional
     USING: A1, finite sites, finite local dimensions
     JUSTIFICATION: Finite configurations × finite morphism spaces

<1>4. QED THEOREM
     BY: <1>2, <1>3
     VIA: Direct sum of finite-dimensional eigenspaces
```

---

## Beads Issue Tracking

This project uses [Beads](https://github.com/steveyegge/beads) for issue tracking.

### BEAD Format

```markdown
<!-- BEAD: id=0042 status=open priority=high
     title="Define hopping operator for Fibonacci anyons"
     description="Construct the hopping operator H_hop that moves Fibonacci anyons 
     between adjacent sites while respecting fusion constraints. Must reduce to 
     standard tight-binding hopping in the bosonic limit. Acceptance criteria:
     (1) Well-defined on Hilbert space from §4.2, (2) Hermitian, (3) Local (acts on 
     adjacent sites only), (4) Passes unit tests in test_hopping.jl"
     refs="hilbert_space.md, hamiltonian.md"
     depends="BEAD-0100, BEAD-0110"
-->
```

### Mandatory Fields

- `id`: Globally unique (format: BEAD-XXXX, BEAD-PXXX for pre-flight, BEAD-FXXX for post-flight)
- `status`: `open`, `in-progress`, `blocked`, `done`
- `title`: Brief descriptive title
- `description`: **Required.** Detailed scope, acceptance criteria, context.

### Working with BEADs

1. Before starting any task, check if there's an associated BEAD
2. Update BEAD status when starting work: `status=in-progress`
3. Reference BEAD IDs in commit messages: `Add F-symbol computation [BEAD-0014]`
4. Mark `status=done` only when all acceptance criteria met

---

## Code Standards

### Julia

- All definitions must have accompanying Julia code
- Code must be compilable (syntax-correct, imports resolved)
- Place in `src/julia/` with clear module structure
- Include docstrings with references back to definitions

```julia
"""
    fusion_multiplicity(C::FusionCategory, a, b, c) -> Int

Compute the fusion multiplicity N_{ab}^c for the fusion category C.

See: docs/fusion_category.md, Definition 3.1
"""
function fusion_multiplicity(C::FusionCategory, a, b, c)
    get(C.N, (a, b, c), 0)
end
```

### Clojure

- Used for symbolic/algebraic tooling and agents
- Place in `src/clojure/`
- Follow standard Clojure conventions

---

## Notation Conventions

Use $\mathrm{Mor}(A, B)$ for morphisms from object $A$ to object $B$ (not $\mathrm{Hom}$).

Key symbols (see `symbols.yaml` for full list):
- $\mathcal{C}$ — Fusion category
- $\mathbf{1}$ — Tensor unit (vacuum)
- $X_1, \ldots, X_d$ — Simple objects
- $N_{ab}^c$ — Fusion multiplicities
- $F$ — F-symbols (associator)
- $R$ — R-symbols (braiding)
- $\mathcal{H}$ — Hilbert space
- $\mathcal{H}_N^{(c)}$ — N-anyon sector with total charge c

---

## Workflow

1. **Check BEAD** — Find the relevant BEAD for your task
2. **Read dependencies** — Check `refs-in` documents
3. **Follow standards** — Use templates above
4. **Write code** — Accompany all definitions with Julia
5. **Cite sources** — Mark as `[unverified]` initially
6. **Update BEAD** — Mark progress and completion

---

## Common Pitfalls to Avoid

1. ❌ Using creation/annihilation operators
2. ❌ Assuming multiplicity-free without stating it
3. ❌ Inconsistent diagram normalisations
4. ❌ Basis-dependent definitions where avoidable
5. ❌ Results without `Claim`/`Conjecture`/`Theorem` labels
6. ❌ Proofs not in Lamport notation
7. ❌ BEADs without descriptions
8. ❌ Documents exceeding 200 lines
9. ❌ Missing cross-references
10. ❌ Uncompilable code snippets

---

## Getting Help

- Check `docs/_overview.md` for document navigation
- Check `literature/overview.md` for paper summaries
- Reference `symbols.yaml` for notation
- Reference `citations.yaml` for source verification status

---

BEFORE ANYTHING ELSE: run 'bd onboard' and follow the instructions
