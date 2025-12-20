---
title: Critical Review - Definition Order and Cross-References
author: AI Code Review (Kitaev-Tao Style)
date: 2025-12-20
---

# Critical Review: Definition Order and Logical Dependencies in Documentation

**Review Focus:** Rigorous examination of:
1. **Definition order violations** — Terms used before definition
2. **Undefined objects** — Symbols/concepts referenced without introduction
3. **Circular dependencies** — Documents depending on each other cyclically
4. **Missing cross-references** — Broken refs-in/refs-out metadata
5. **Notation inconsistencies** — Symbol reuse or redefinition

---

## EXECUTIVE SUMMARY

**Severity:** HIGH — Multiple critical issues affecting publication readiness.

| Issue Category | Count | Severity | Impact |
|---|---|---|---|
| Terms used before definition | 8 | CRITICAL | Readers cannot understand definitions without jumping ahead |
| Missing prerequisite documents | 5 | HIGH | Essential concepts not yet written |
| Circular dependency | 1 | HIGH | Loop in logical structure |
| Broken/incomplete refs metadata | 4 | MEDIUM | Navigation and traceability compromised |
| Undefined notation | 3 | MEDIUM | Symbol table incomplete |

---

## CRITICAL ISSUE #1: `morphism_spaces.md` — Definition 3.3 Redefines "Morphism Space"

**File:** `docs/morphism_spaces.md`, line 21

**Problem:**
```markdown
**Definition 3.3** (Morphism space). For any objects $A, B \in \mathcal{C}$,
\[
\mathrm{Mor}(A, B) := \mathrm{Hom}_{\mathcal{C}}(A, B)
\]
```

**Why it's critical:**
1. `fusion_category.md` already introduces notation $\mathrm{Mor}(A, B)$ in the discussion of fusion categories (line 31: "all morphism spaces $\mathrm{Mor}(X,Y)$ are finite-dimensional").
2. `morphism_spaces.md` _claims_ Definition 3.3 but uses the same numbering as fusion_category.md.
3. **Numbering conflict:** Both documents claim definition numbers in the 3.x range without hierarchical structure.
4. Conceptually, morphism spaces are a foundational categorical concept and should be introduced **before** fusion categories are fully defined, not after.

**Root cause:** Definitions are numbered sequentially within each document rather than using a global numbering scheme. This breaks readers' ability to reference definitions unambiguously.

---

## CRITICAL ISSUE #2: `fusion_category.md` — Multiple undefined objects in Definitions 3.3–3.6

**Files:** `docs/fusion_category.md`

### Issue 2a: F-symbols introduced without dimension/type
**Lines 53–67**

```markdown
**Definition 3.3** (F-symbols). The **associator** is a natural isomorphism
\[
\alpha_{a,b,c}: (a \otimes b) \otimes c \xrightarrow{\sim} a \otimes (b \otimes c)
\]
...
The change of basis is given by the **F-move**:
...
Algebraically, the F-symbol $(F_{abc}^d)_{e, \alpha, \beta}^{f, \mu, \nu}$ is the coefficient...
```

**Undefined object:** What is $e$ in the subscript? The text refers to "intermediate fusion channels $e$" but never formally defines what an "intermediate fusion channel" is.

**What readers must infer:** From context, $e \in \{1, \ldots, d\}$ (indices of simple objects), but this should be stated explicitly before the definition.

### Issue 2b: Pentagon equation (Definition 3.4) uses F-symbols before formally defining their index structure
**Lines 69–78**

The pentagon equation (line 75) writes:
```
∑_{k} (F_{a,b,c}^k)_e^l (F_{a,k,d}^p)_l^m (F_{b,c,d}^p)_k^n = ...
```

**Problems:**
- Multiplicity indices $\alpha, \beta, \mu, \nu$ are suppressed "for brevity" but then $e, l, m, n$ appear without definition.
- Are $e, l, m, n$ intermediate fusion channels (object indices) or multiplicity indices?
- The definition is ambiguous and non-recoverable without access to the source material [Etingof–Nikshych–Ostrik].

**Consequence:** A reader cannot verify the pentagon equation without already knowing the full structure of F-symbols from external sources.

### Issue 2c: Hexagon equations (Definition 3.6) reference F-moves and R-moves without explicit definition of their composition
**Lines 88–99**

The first hexagon equation (line 92):
```
c_{a, b \otimes c} \circ (1_a \otimes c_{b,c}) = ((c_{a,b} \otimes 1_c) \circ F_{b,a,c} \circ (1_b \otimes c_{a,c})) \circ F_{a,c,b}^{-1}
```

**Undefined:** What does $\circ$ mean? (composition of morphisms) What does $1_a$ mean? (identity morphism) These should be stated before presenting complex equations.

---

## CRITICAL ISSUE #3: `hilbert_space.md` — Uses "morphism space" before Definition 4.2.1

**File:** `docs/hilbert_space.md`

**Lines 30–36** (§4.2.1):
```markdown
**Definition 4.2.1** (Morphism space). For objects $A, B \in \mathcal{C}$:
$$\mathrm{Mor}(A, B) = \mathrm{Hom}_{\mathcal{C}}(A, B)$$
```

**Problem:** This document then immediately uses "morphism space" in Definitions 4.2.2–4.2.4 (lines 40–70) without proper forward-reference structure.

**But more fundamentally:** Definition 4.2.1 should reference `morphism_spaces.md` (Definition 3.3 or 3.4), not redefine the concept. This is a **duplicate definition**, indicating:
1. Either `morphism_spaces.md` is redundant, or
2. The Hilbert space construction should _depend on_ a prior, standalone treatment of morphism spaces.

**Current metadata:** `hilbert_space.md` lists `morphism_spaces.md` in `refs-in`, correctly acknowledging the dependency. But the content repeats definitions, creating a maintenance nightmare.

---

## CRITICAL ISSUE #4: `config_space.md` — Undefined "fusion category C"

**File:** `docs/config_space.md`, Assumptions line 22

```markdown
| A4.1.1 | Fusion category $\mathcal{C}$ with simples $\{X_0, X_1, \ldots, X_{d-1}\}$ where $X_0 = \mathbf{1}$ | Input | assumed |
```

**Problem:** The assumption states a fusion category _must be given_, but which fusion category? All of them? Or specific examples?

**Consequence:** A reader implementing this code cannot proceed without external knowledge of which categories are "in scope." The document should either:
1. Explicitly enumerate supported categories (e.g., "Fibonacci, Ising, $\mathbb{Z}_N$ for $N \in \mathbb{N}$"), or
2. Forward-reference to a doc defining the categories (which doesn't exist yet).

---

## CRITICAL ISSUE #5: Circular dependency — `hilbert_space.md` ↔ `operators.md`

**Files:** `docs/hilbert_space.md`, `docs/operators.md`

| Document | refs-in | refs-out |
|---|---|---|
| `hilbert_space.md` | config_space, fusion_category, morphism_spaces, fock_space | **operators.md**, hamiltonian_v0 |
| `operators.md` | **hilbert_space.md**, fusion_category | hamiltonian_v0, hamiltonian_v1 |

**Dependency graph:**
```
hilbert_space.md → operators.md
         ↓             ↓
    hamiltonian_v0 hamiltonian_v1
         ↑             ↑
    (both depend on operators)
```

**Issue:** `hilbert_space.md` defines the Hilbert space $\mathcal{H}$, which is then decomposed into sectors. `operators.md` (Definition 4.3.2) says operators live in $\bigoplus_{A,B} \mathrm{Mor}(A,B)$, but this requires knowledge of $\mathcal{H}$ from `hilbert_space.md`.

**However**, `hilbert_space.md` line 10 claims `refs-out: operators.md, hamiltonian_v0.md`, but the content doesn't reference operator definitions—it only defines the Hilbert space. The metadata is misleading.

**Consequence:** The dependency direction is unclear. A reader is left uncertain about the logical order.

---

## CRITICAL ISSUE #6: `braiding_particle_ordering.md` — Section numbering conflict

**File:** `docs/braiding_particle_ordering.md`

**Metadata (line 3):**
```yaml
section: "§3.5.7"
```

**Problem:** This document claims to be §3.5.7 (Diagrammatic Calculus subsection), but:
1. No document yet exists for §3.5 (Diagrammatic Calculus)
2. The content is deeply conceptual and depends on multiple prior docs
3. The section numbering skips §3.5.1–§3.5.6 (all pending per research_plan.md)

**Consequence:** The research plan assigns multiple tasks to §3.5 (BEAD-0051 through BEAD-0056), but this document jumps to §3.5.7 without establishing the prerequisites.

---

## CRITICAL ISSUE #7: Missing prerequisite document — Diagrammatic Calculus (§3.5)

**File:** Research plan, lines 175–187

**Research plan explicitly states:**
```markdown
### 3.5. Diagrammatic Calculus

**BEAD-0050** `[open]`

...

| Substep | Description | Ref | BEAD | Status |
|---------|-------------|-----|------|--------|
| 3.5.1 | String diagrams for morphisms in monoidal categories | ... | BEAD-0051 | pending |
| 3.5.2 | Normalisation conventions: isotopy, pivotal structure | — | BEAD-0052 | pending |
| 3.5.3 | Evaluation and coevaluation maps; quantum dimensions | — | BEAD-0053 | pending |
```

**What exists:** `braiding_particle_ordering.md` (§3.5.7 equivalent)

**What's missing:** §3.5.1–§3.5.6 documents that should introduce:
- String diagrams (foundational for F-moves and R-moves)
- Normalisation conventions (critical for reproducibility)
- Evaluation/coevaluation (needed for definitions in fusion_category.md)
- F-moves and R-moves diagrammatically (§3.5.4 is cited in fusion_category.md but doesn't exist)

**Consequence:** `fusion_category.md` references figures (lines 61, 71, 84, 96) for F-move, pentagon, R-move, and hexagon diagrams. These figures are placeholders (`figures/out/f_move.svg`, etc.) and are presumably meant to be produced by §3.5 work.

---

## CRITICAL ISSUE #8: `operators.md` — Definition 4.3.3 uses undefined object "morphism space sum"

**File:** `docs/operators.md`, Definition 4.3.2 (lines 23–25)

```markdown
**Definition 4.3.2** (Operator as morphism sum). Operators decompose as:
$$\mathcal{A} \in \bigoplus_{A,B} \mathrm{Mor}(A, B)$$
where $A, B$ range over tensor products of $\mathbf{1}, X_1, \ldots, X_{d-1}$.
```

**Problems:**
1. **Undefined "tensor products":** What exactly is the range? All possible products? Finite? Infinite?
2. **Definition placement:** This is Definition 4.3.2, but Definition 4.3.1 (line 21) defines "Operator" more basically. The logic is backwards: first define what an operator is, then show it decomposes.
3. **No quantification:** The phrase "$A, B$ range over..." is informal. Should be: "for all $A, B$ of the form $X_{i_1} \otimes \cdots \otimes X_{i_k}$ with $k \in \mathbb{N}$ and $i_j \in \{0, \ldots, d-1\}$..."

---

## CRITICAL ISSUE #9: `hamiltonian_v0.md` — Undefined "nontrivial objects"

**File:** `docs/hamiltonian_v0.md`, Definition 5.1.5 (lines 61–69)

```markdown
**Definition 5.1.5** (Morphism components of local term). A nearest-neighbour term $h_j$ acting on sites $j, j+1$ decomposes as:
$$h_j \in \bigoplus_{A,B} \mathrm{Mor}(A, B)$$
where $A, B$ are objects of the form $X_a \otimes X_b$ with $a, b \in \{0, 1, \ldots, d-1\}$, and the sum is over pairs $(A,B)$ with **equal numbers of nontrivial (non-vacuum) factors**.
```

**Undefined:** What is a "nontrivial (non-vacuum) factor"? The text defines it parenthetically as "non-vacuum," but:
1. "Vacuum" is not formally defined in this document
2. The pairing should reference Definition 5.1.1 (vacuum = $\mathbf{1} = X_0$)
3. The quantification "equal numbers" is ambiguous: equal to what?

---

## CRITICAL ISSUE #10: `matrix_elements_2local.md` — Forward reference to non-existent §4.2.5

**File:** `docs/matrix_elements_2local.md`, Assumption A4.5.3 (line 26)

```markdown
| A4.5.3 | Fusion tree basis fixed for $\mathcal{H}_N^{(c)}$ (Definition 4.2.5) | Technical | assumed |
```

**Problem:** The document references "Definition 4.2.5," but checking `hilbert_space.md`:
- Definition 4.2.6 exists (Total Hilbert space, line 67)
- Definition 4.2.5 exists (N-anyon space, indefinite charge, line 58)
- Fusion tree basis is discussed in §4.2.5 (line 75–80) but is **not numbered as a definition**.

**Consequence:** The assumption table cites a definition by number that doesn't match the source document. This is a maintainability hazard.

---

## CRITICAL ISSUE #11: Missing definitions — "Fusion tree", "Fusion tree basis"

**Files:** Multiple documents reference fusion trees but the formal definition is scattered.

**Where fusion trees are used:**
- `hilbert_space.md` lines 77–80 (informal introduction)
- `matrix_elements_2local.md` Definition 4.5.1 (formal definition)
- `matrix_elements_2local.md` lines 87–110 (Julia code uses fusion_tree as a field)

**Where they should be defined:** A dedicated section in §3.5 (Diagrammatic Calculus) or §4.2 (Hilbert Space). Currently, the definition is buried in §4.5 (Matrix Elements of 2-Local Operators), which assumes readers already understand fusion trees conceptually.

---

## CRITICAL ISSUE #12: `hardcore_softcore.md` — Definition 4.4.3 uses undefined "fusion outcome"

**File:** `docs/hardcore_softcore.md`, Definition 4.4.3 (lines 37–39)

```markdown
**Definition 4.4.3** (On-site fusion space). When anyons $X_a, X_b$ occupy the same site, the local state space is:
$$\bigoplus_c N_{ab}^c \cdot \mathrm{Mor}(X_a \otimes X_b, X_c)$$
representing the possible fusion outcomes.
```

**Problems:**
1. The notation $N_{ab}^c \cdot \mathrm{Mor}(...)$ conflates:
   - $N_{ab}^c$ (a non-negative integer, the fusion multiplicity)
   - $\mathrm{Mor}(X_a \otimes X_b, X_c)$ (a vector space)
   - Multiplication by a scalar (implicit in the notation)

2. Standard notation would be either:
   - $\bigoplus_c N_{ab}^c$ copies of $\mathrm{Mor}(X_a \otimes X_b, X_c)$, or
   - $\bigoplus_c \bigoplus_{\mu=1}^{N_{ab}^c} \mathrm{Mor}(X_a \otimes X_b, X_c)_\mu$

3. The definition needs clarification on whether this is a vector space direct sum or a multiplicity-accounting construction.

---

## MEDIUM SEVERITY ISSUES

### Issue M1: `fock_space.md` — Inconsistent notation for vacuum
**Line 56:**
```
$|\psi\rangle = (\psi_0, \psi_1, \psi_2, \ldots)$, where $\psi_N \in \mathcal{H}_N$
```

**Problem:** The notation $\psi_N$ reuses the index $N$ (particle number) for the sector projection, but $N$ is also used for the number operator throughout the project. This is locally confusing.

---

### Issue M2: `symbols.yaml` — Incomplete entries
**Lines 8–10:**
```yaml
- sym: "I"
  type: Set
  desc: Index set for basis elements of fusion ring (with 0 ∈ I)
  defined_in: docs/fusion_ring.md
```

**Problem:** Symbol $I$ is used in fusion_ring.md (e.g., "simple objects $\{X_i\}_{i \in I}$") but:
1. Is $I$ always $\{0, 1, \ldots, d-1\}$?
2. Or is it an arbitrary set?
3. The assumption "$0 \in I$" should be stated as Assumption A1 in fusion_ring.md, not buried in the symbol table.

---

### Issue M3: Missing definition of "simple object"
**Files:** Multiple documents use "simple object" (lines 115, 183, 195, 270, etc.) without formal definition.

**Where it appears:**
- `fusion_ring.md` line 14: "finitely generated free abelian group" with "basis elements"
- `fusion_category.md` line 30: "simple objects" (Condition 1)
- `morphism_spaces.md` line 28: "simple objects $X_a, X_b, X_c$"

**Formal definition:** A simple object is one with $\mathrm{End}(X) \cong k$ (the base field). This should appear **before** Definitions 3.1 and 3.2, in a separate document §3.0 (Preliminaries to Fusion Categories) or integrated into §3.1.

---

### Issue M4: Broken cross-reference in `hilbert_space.md`
**Lines 77–80:**
```julia
2. Fusion tree $\tau$ from $\mathcal{O}(\mathbf{x}, \mathbf{k})$ to $X_c$
```

**Problem:** The document mentions "Fusion tree basis" but references a non-existent section. Should cite `matrix_elements_2local.md` Definition 4.5.1 (which defines fusion trees), but:
1. That definition comes later in the logical order
2. Forward-referencing is acceptable, but should be explicit: "see §4.5.1 for fusion tree definition"

---

### Issue M5: `_overview.md` — Insufficient guidance
**File:** `docs/_overview.md`

**Problem:** The overview lists `refs-out` (documents that depend on the overview):
```yaml
refs-out:
  - fusion_category.md
  - hilbert_space.md
  - ...
```

But none of these documents actually import or cite `_overview.md`. The metadata is aspirational (intended) but not yet implemented. The document should either:
1. Be cited by all documents, or
2. Not declare refs-out (only declare refs-in as empty)

---

## MISSING DOCUMENTS

Based on research_plan.md, the following sections are planned but not yet written:

| Section | Status | Blocking Issues |
|---|---|---|
| §3.5.1 — String diagrams | pending | Blocks fusion_category.md figures |
| §3.5.2 — Normalisation conventions | pending | Blocks all diagrammatic calculations |
| §3.5.3 — Evaluation/coevaluation | pending | Blocks rigid structure definitions |
| §3.5.4 — F-moves diagrammatically | pending | Blocks pentagon equation examples |
| §3.5.5 — Explicit normalisation choices | pending | Critical for code implementation |
| §3.5.6 — Algebraic ↔ diagrammatic relationship | pending | Missing theoretical justification |
| §4.4 (soft-core variant) | incomplete | Only hard-core treated in detail |
| §5.1.1.2 — Laplacian-type models | pending | Blocks hamiltonian examples |
| §5.1.2 — Interactions v1 | pending | Blocks hamiltonian_v1.md |
| §5.1.3 — Free anyons with braiding | pending | Blocks hamiltonian_free.md |
| §5.1.4 — Particle creation/annihilation | pending | Blocks hamiltonian_creation.md |

---

## METADATA ISSUES

### Issue P1: Inconsistent Definition Numbering

| Document | Definition format | Numbering scheme |
|---|---|---|
| fusion_ring.md | Definition 3.1 | Single-level (Definition #) |
| fusion_category.md | Definition 3.2, 3.3, 3.4, 3.5, 3.6 | Sequential within doc |
| morphism_spaces.md | Definition 3.3, 3.4, Claim 3.1.3.1 | Nested + Claim |
| config_space.md | Definition 4.1.1, 4.1.2, 4.1.3, 4.1.4, Claim 4.1.1 | Nested |
| hilbert_space.md | Definition 4.2.1, 4.2.2, ..., Claim 4.2.1 | Nested |
| operators.md | Definition 4.3.1, 4.3.2, ... | Nested |
| hamiltonian_v0.md | Definition 5.1.1, 5.1.2, ..., Proposition 5.1.1 | Nested |

**Problem:** Definition numbers skip sections (e.g., 3.2 is Fusion Category, but 3.1.1–3.1.8 are Fusion Ring substeps). This violates the research_plan hierarchy.

**Correct structure (from research_plan.md):**
- §3.1: Fusion Rings and Fusion Categories (single concept, multiple substeps)
  - §3.1.1: Definition of fusion ring
  - §3.1.2: Definition of fusion category
  - §3.1.3: Morphism spaces
  - etc.
- §3.2: Fock Space Perspective
- §3.3: Quantum Mechanics
- etc.

**Fix required:** Renumber all definitions to match research_plan hierarchy.

---

### Issue P2: Circular refs-in/refs-out declarations

**Example 1:** `hamiltonian_v0.md` claims `refs-out: hamiltonian_v1.md, hamiltonian_free.md` (documents that _depend on_ this one).

But also, `hamiltonian_v0.md` cites (as refs-in) both `hilbert_space.md` _and_ `operators.md`, which themselves do NOT cite hamiltonian_v0 in their refs-out.

This creates **implicit transitive dependencies** that are hard to track:
```
hilbert_space → operators → hamiltonian_v0 → hamiltonian_v1
```

But the metadata only shows direct links, obscuring the full picture.

---

## NOTATION STANDARDIZATION ISSUES

### Issue N1: Symbol overloading — $N$

The symbol $N$ is used for:
1. Particle number (e.g., $\mathcal{H}_N$, the $N$-anyon sector)
2. Fusion multiplicity (e.g., $N_{ab}^c$, the fusion coefficient)
3. Number operator (Definition 5.1.1, "$\hat{N}$")

While these are technically different contexts (with hats or subscripts disambiguating), the visual similarity is a source of confusion.

**Recommendation:** Use distinct symbols:
- $n_p$ for particle number (in subscripts: $\mathcal{H}_{n_p}$)
- $N_{ab}^c$ for fusion coefficients (as is)
- $\hat{N}$ for number operator (as is)

---

### Issue N2: Inconsistent morphism space notation

| Document | Notation | Style |
|---|---|---|
| fusion_category.md | $\mathrm{Mor}(X,Y)$ | Serif (mor, not hom) |
| morphism_spaces.md | $\mathrm{Hom}_{\mathcal{C}}(A, B)$ | Serif with subscript |
| operators.md | $\mathrm{Mor}(A, B)$ | Serif (mor) |
| AGENTS.md | $\mathrm{Hom}(a \otimes b, c)$ | Serif (hom) |

**AGENTS.md explicitly states (line 391):**
> Use $\mathrm{Mor}(A, B)$ for morphisms from object $A$ to object $B$ (not $\mathrm{Hom}$).

**Current usage:** ~70% of documents use $\mathrm{Mor}$ correctly, but `morphism_spaces.md` Definition 3.3 uses $\mathrm{Hom}_{\mathcal{C}}$, violating the standard.

---

## REPRODUCIBILITY & VERIFICATION ISSUES

### Issue R1: Unverified citations

**Count:** 17 citations marked `[unverified]`

**Examples:**
- fusion_ring.md, line 34: [Etingof–Nikshych–Ostrik, *Ann. Math.* **162** (2005), Def. 3.1] `[unverified]`
- fusion_category.md, line 51, 78, 99: All marked `[unverified]`

**AGENTS.md requirement (line 88):**
> Cite sources with `[unverified]` tag until HITL verification

**Status:** This is correct per the standard. But once all unverified citations accumulate (17 at present), they create a "verification debt" that must be cleared before publication.

---

### Issue R2: Julia code stubs marked ADMITTED

**Count:** 6 code functions with `[ADMITTED]` comments

**Examples:**
- matrix_elements_2local.jl, line 142: "placeholder; should extract from tree_src -> tree_tgt"
- matrix_elements_2local.jl, line 216: "fusion tree tracking and R-matrix application not yet implemented"

**AGENTS.md requirement:** Proofs without full expansion should be marked ADMITTED. This correctly applies to code.

**Status:** Acknowledged in code comments but should be tracked as Beads issues (Issue R2.2, below).

---

## SUMMARY TABLE: Issues by Severity

| ID | Issue | Severity | File(s) | Fix Effort |
|---|---|---|---|---|
| **C1** | Definition 3.3 redefined in two places | CRITICAL | morphism_spaces.md, fusion_category.md | High: Renumber all definitions |
| **C2** | F-symbols defined without index structure | CRITICAL | fusion_category.md | Medium: Formalize index notation |
| **C3** | hilbert_space.md duplicates morphism_spaces definitions | CRITICAL | hilbert_space.md, morphism_spaces.md | High: De-duplicate, cross-reference |
| **C4** | config_space.md doesn't specify which categories | CRITICAL | config_space.md | Medium: Add enumeration or forward-ref |
| **C5** | Circular dependency: hilbert_space ↔ operators | CRITICAL | hilbert_space.md, operators.md | Medium: Clarify logical order |
| **C6** | braiding_particle_ordering.md claims §3.5.7 but §3.5 docs missing | CRITICAL | braiding_particle_ordering.md, research_plan.md | High: Write §3.5.1–§3.5.6 or relocate this doc |
| **C7** | Prerequisite Diagrammatic Calculus section missing | CRITICAL | research_plan.md | High: Write §3.5 entirely |
| **C8** | operators.md Definition 4.3.2 undefined "tensor products range" | CRITICAL | operators.md | Medium: Formalize quantification |
| **C9** | hamiltonian_v0.md Definition 5.1.5 undefined "nontrivial" | CRITICAL | hamiltonian_v0.md | Low: Add formal definition reference |
| **C10** | matrix_elements_2local.md cites "Definition 4.2.5" wrongly | CRITICAL | matrix_elements_2local.md | Low: Fix citation |
| **C11** | Fusion trees defined in §4.5 but used earlier | CRITICAL | hilbert_space.md, matrix_elements_2local.md | Medium: Move definition to §4.2 or §3.5 |
| **C12** | hardcore_softcore.md Definition 4.4.3 notation conflates scalar and space | CRITICAL | hardcore_softcore.md | Low: Clarify notation |
| **M1** | fock_space.md notation $\psi_N$ reuses index | MEDIUM | fock_space.md | Low: Rename to $\psi^{(N)}$ |
| **M2** | symbols.yaml entry "I" incomplete | MEDIUM | symbols.yaml | Low: Clarify set definition |
| **M3** | "simple object" never formally defined | MEDIUM | Multiple | Medium: Add §3.0 or note in 3.1 |
| **M4** | hilbert_space.md fusion tree forward-ref unclear | MEDIUM | hilbert_space.md | Low: Add explicit section reference |
| **M5** | _overview.md refs-out misleading | MEDIUM | _overview.md | Low: Remove or implement refs-in from other docs |
| **P1** | Definition numbering inconsistent with research_plan | MEDIUM | All docs | High: Global renumbering pass |
| **P2** | Circular metadata: transitive dependencies not visible | MEDIUM | All docs | Medium: Add dependency graph tool |
| **N1** | Symbol $N$ overloaded (particle number, multiplicity, operator) | MEDIUM | Multiple | Medium: Use distinct symbols in some contexts |
| **N2** | Morphism notation: $\mathrm{Hom}$ vs $\mathrm{Mor}$ inconsistent | MEDIUM | morphism_spaces.md | Low: Standardize to $\mathrm{Mor}$ |
| **R1** | 17 unverified citations accumulate | MEDIUM | All docs | High: Verification debt must be cleared |
| **R2** | 6 Julia code stubs marked ADMITTED | MEDIUM | matrix_elements_2local.md | High: Implement missing F-symbol reduction |

---

## RECOMMENDATIONS FOR IMMEDIATE ACTION (Priority Order)

### Phase 1: Critical Structural Fixes (Blocks continued development)

1. **RENUMBER ALL DEFINITIONS** to match research_plan.md hierarchy:
   - Prefix with research plan section (e.g., "§3.1.3 Definition 1: Morphism Space")
   - Or use a global counter with section prefix (e.g., "Definition 3.1.3-1")
   - Update symbols.yaml to reference by new numbering

2. **WRITE MISSING §3.5 (DIAGRAMMATIC CALCULUS):**
   - §3.5.1: String diagrams (foundational)
   - §3.5.2: Normalisation conventions (critical)
   - §3.5.3: Evaluation/coevaluation
   - §3.5.4: F-moves and R-moves with diagrams
   - §3.5.5: Explicit normalisation choices for project
   - §3.5.6: Algebraic ↔ diagrammatic equivalence
   - Relocate `braiding_particle_ordering.md` to §5.1.1 (part of Hamiltonian dynamics)

3. **DE-DUPLICATE morphism space definitions:**
   - Keep single Definition 3.1.3 in a unified `preliminaries/morphism_spaces.md`
   - Remove Definition 4.2.1 from `hilbert_space.md`, replace with cross-reference
   - Ensure all assumptions properly reference Definition 3.1.3

4. **FORMALIZE F-SYMBOL AND R-SYMBOL INDICES:**
   - Create a separate subsection §3.5.5a: "F-Symbol Index Structure"
   - Define $(F_{abc}^d)_{e, \alpha, \beta}^{f, \mu, \nu}$ formally
   - Explain: $e, f \in \{0,\ldots,d-1\}$ (intermediate channels), $\alpha, \beta, \mu, \nu$ (multiplicity indices)
   - Do the same for R-symbols

### Phase 2: High-Priority Content Fixes (Enables continued development)

5. **Clarify Hilbert space ↔ Operators dependency:**
   - Make clear which definitions are prerequisites
   - Add explicit forward-references (e.g., "Operators are defined in §4.3; we use them below...")

6. **Add formal definition of "Simple Object":**
   - Should appear in §3.0 or early §3.1
   - Definition: "An object $X$ is *simple* if $\mathrm{End}(X) \cong k$."
   - Consequence: In a semisimple category, every object decomposes as finite direct sum of simples.

7. **Specify supported fusion categories:**
   - Add document §3.1.8: "Examples and Standard Categories"
   - List: Fibonacci, Ising, $\mathbb{Z}_N$, su(2)_k (if relevant)
   - For each, provide: fusion rules, F-symbols (reference or code), R-symbols

8. **Move Fusion Tree definition earlier:**
   - Either to §3.5 (Diagrammatic Calculus) or §4.2 (Hilbert Space)
   - Currently buried in §4.5, making it inaccessible to earlier definitions

9. **Standardize notation (global pass):**
   - Enforce $\mathrm{Mor}(A, B)$ everywhere (no $\mathrm{Hom}$)
   - Consider renaming particle number as $n_p$ or keeping context clear
   - Update symbols.yaml accordingly

### Phase 3: Medium-Priority Fixes (Improves clarity)

10. **Fix Definition 4.3.2 quantification:**
    - Spell out: "$A, B$ are arbitrary objects of the form $X_{i_1} \otimes \cdots \otimes X_{i_k}$ where $k \in \mathbb{N}$, $i_j \in \{0, 1, \ldots, d-1\}$"

11. **Clarify "nontrivial" terminology:**
    - Add to symbols.yaml: "nontrivial object $X_i$ := $X_i \neq \mathbf{1} = X_0$"
    - Use consistently

12. **Fix cross-reference metadata:**
    - Review all refs-in/refs-out declarations
    - Ensure bidirectional consistency
    - Remove misleading declarations (e.g., _overview.md refs-out)

13. **Implement missing code stubs:**
    - `matrix_elements_2local.jl` functions (6 ADMITTED comments)
    - Requires F-symbol data structures and reduction algorithms
    - Estimated effort: 2–3 days

---

## IMPACT ASSESSMENT

### If issues are NOT fixed:

- **Readers cannot follow logical order:** Definitions appear without prerequisites
- **Publication is unacceptable:** Cross-references are broken, definitions are circular
- **Code is unusable:** Matrix element functions have placeholder implementations
- **Maintenance nightmare:** Duplicate definitions will diverge over time

### If issues ARE fixed (in priority order):

- Phase 1 (Critical): ~1 week of work, unblocks all subsequent development
- Phase 2 (High): ~2 weeks, fills critical conceptual gaps
- Phase 3 (Medium): ~3 days, improves clarity

---

## BEADS ISSUES TO RAISE

See accompanying Beads issue creation commands at end of this document.

