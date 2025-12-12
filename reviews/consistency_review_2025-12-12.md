# Consistency Review: Documentation and Symbols

**Date:** 2025-12-12
**Reviewer:** Claude (automated)
**Scope:** All `docs/*.md` files and `symbols.yaml`

---

## Executive Summary

This review identified **9 inconsistency issues** across the project documentation. The most critical issues involve:
1. Conflicting indexing conventions for simple objects (0-indexed vs 1-indexed)
2. Symbol `d` used with different meanings in different contexts
3. Symbol `R` overloaded in `symbols.yaml`
4. Definition numbering collisions across documents

---

## Issue 1: Simple Object Indexing Convention (CRITICAL)

**Severity:** High
**Files affected:** `fusion_ring.md`, `fusion_category.md`, `hilbert_space.md`, `config_space.md`, `symbols.yaml`

### Problem

The project uses inconsistent conventions for indexing simple objects:

| Document | Convention | Unit Element |
|----------|------------|--------------|
| `fusion_ring.md` Def 3.1 | $X_0 = \mathbf{1}$, index set $I$ with $0 \in I$ | $X_0$ |
| `symbols.yaml` | "X_i where i ∈ I and X_0 = 𝟙" | $X_0$ |
| `hilbert_space.md` A4.2.1 | "$X_1=\mathbf{1}, X_2, \ldots, X_d$" | $X_1$ |
| `config_space.md` A4.1.1 | "simples $\{1, X_2, \ldots, X_d\}$" | Ambiguous |

### Specific Conflicts

1. **hilbert_space.md line 25:** States "$X_1=\mathbf{1}, X_2, \ldots, X_d$" — this contradicts the 0-indexed convention established in fusion_ring.md where $X_0 = \mathbf{1}$.

2. **config_space.md lines 41-43:** States labels "$k_j \in \{2, \ldots, d\}$" for anyon types, with "Label $1$ denotes vacuum". This implies 1-indexing but is inconsistent with $X_0 = \mathbf{1}$.

### Recommendation

Standardise on **0-indexed** convention throughout: $X_0 = \mathbf{1}$, nontrivial simples $X_1, \ldots, X_{d-1}$, with $d$ total simple objects (including unit).

---

## Issue 2: Symbol `d` Overloaded (CRITICAL)

**Severity:** High
**Files affected:** `fusion_ring.md`, `lattice.md`, `symbols.yaml`

### Problem

The symbol `d` has two different meanings:

| Context | Meaning | Files |
|---------|---------|-------|
| Fusion category | Number of simple objects (rank) | `fusion_ring.md`, `symbols.yaml` |
| Lattice | Local Hilbert space dimension | `lattice.md` Def 3.4.9, `qm_lattice.md` |

### Specific Conflicts

- `symbols.yaml` line 41-43: "d: Int, Number of simple objects (rank of the category/ring)"
- `lattice.md` line 193: "The local dimension is $d = \dim(\mathcal{H}_{\mathrm{loc}})$"

These are related but not identical — the local dimension depends on context (occupation, fusion outcomes).

### Recommendation

Use distinct symbols:
- $d_{\mathcal{C}}$ or $|\mathrm{Irr}(\mathcal{C})|$ for number of simple objects
- $d_{\mathrm{loc}}$ for local Hilbert space dimension
- Or clarify in each document which meaning applies

---

## Issue 3: Symbol `R` Duplicated in symbols.yaml (HIGH)

**Severity:** High
**File affected:** `symbols.yaml`

### Problem

`symbols.yaml` contains two entries for symbol `R`:

```yaml
# Line 4-7:
- sym: "R"
  type: FusionRing
  desc: Fusion ring (finitely generated free abelian group with ring structure)
  defined_in: docs/fusion_ring.md

# Line 64-67:
- sym: "R"
  type: Tensor
  desc: Braiding (R-symbols) including multiplicity indices
  defined_in: docs/fusion_category.md
```

### Recommendation

Rename fusion ring symbol to `\mathcal{R}` or use different notation. The R-symbols (braiding) are standard notation in the literature and should be preserved.

---

## Issue 4: Lattice Site Indexing Inconsistency (MEDIUM)

**Severity:** Medium
**Files affected:** `lattice.md`, `qm_lattice.md`

### Problem

- `lattice.md` (Def 3.4.1, line 31): Uses 0-indexed sites: $\Lambda = \{0, 1, \ldots, n-1\}$
- `qm_lattice.md` (Def 3.3.12, line 161): Uses 1-indexed: "$\bigotimes_{j=1}^{n}$"

### Recommendation

Standardise on 0-indexed throughout to match `lattice.md` convention. Change `qm_lattice.md` to use $\bigotimes_{j=0}^{n-1}$.

---

## Issue 5: Definition Numbering Collisions (MEDIUM)

**Severity:** Medium
**Files affected:** `morphism_spaces.md`, `fusion_category.md`

### Problem

Both files use Definitions 3.3 and 3.4:

- `fusion_category.md`: Definition 3.3 (F-symbols), Definition 3.4 (Pentagon)
- `morphism_spaces.md`: Definition 3.3 (Morphism space), Definition 3.4 (Fusion multiplicity space)

### Recommendation

Use hierarchical numbering tied to section:
- Section 3.1.2 definitions: 3.1.2.1, 3.1.2.2, etc. (fusion_category.md)
- Section 3.1.3 definitions: 3.1.3.1, 3.1.3.2, etc. (morphism_spaces.md)

---

## Issue 6: Garbled Notation in fock_space.md (MEDIUM)

**Severity:** Medium
**File affected:** `fock_space.md`

### Problem

Line 56 contains garbled LaTeX:
```
|ucketsymbol{\phi}\rangle \otimes |ucketsymbol{\phi}\rangle
```

Should be:
```
|\phi\rangle \otimes |\chi\rangle
```

### Recommendation

Fix the garbled ket notation. This appears to be a rendering/encoding issue.

---

## Issue 7: Fock Space Truncation Ambiguity (LOW)

**Severity:** Low
**Files affected:** `fock_space.md`, `hilbert_space.md`

### Problem

- `fock_space.md` Def 3.2.1: $\mathcal{F} = \bigoplus_{N=0}^{\infty} \mathcal{H}_N$ (infinite direct sum)
- `hilbert_space.md` Def 4.2.5: $\mathcal{H} = \bigoplus_{N=0}^{n} \mathcal{H}_N$ (finite, truncated at $n$ sites)

The relationship between $\mathcal{F}$ and $\mathcal{H}$ is not explicitly stated.

### Recommendation

Add a remark in `hilbert_space.md` explaining that $\mathcal{H}$ is the lattice-truncated version of $\mathcal{F}$, with $N \leq n$ due to hard-core constraint or finite lattice.

---

## Issue 8: Missing Symbols in symbols.yaml (LOW)

**Severity:** Low
**Files affected:** `symbols.yaml`, `lattice.md`, `config_space.md`

### Problem

Several symbols used in documentation are not defined in `symbols.yaml`:

| Symbol | Used in | Meaning |
|--------|---------|---------|
| $\epsilon$ | `lattice.md` | Lattice spacing |
| $L$ | `lattice.md` | Physical length |
| $\mathbf{x}$ | `config_space.md` | Position vector |
| $\mathbf{k}$ | `config_space.md` | Label vector |
| $x_j$ | `lattice.md` | Physical position of site $j$ |

### Recommendation

Add these symbols to `symbols.yaml` for completeness.

---

## Issue 9: Inconsistent Object Notation in config_space.md (LOW)

**Severity:** Low
**File affected:** `config_space.md`

### Problem

Line 22 (A4.1.1): "simples $\{1, X_2, \ldots, X_d\}$"

The notation `1` should be `\mathbf{1}` or `X_0` or `X_1` for consistency with the rest of the project.

### Recommendation

Change to "$\{\mathbf{1}, X_1, \ldots, X_{d-1}\}$" (using 0-indexed convention) or "$\{X_0, X_1, \ldots, X_{d-1}\}$".

---

## Summary Table

| Issue | Severity | Type | Action Required |
|-------|----------|------|-----------------|
| 1. Simple object indexing | High | Convention | Standardise to 0-indexed |
| 2. Symbol `d` overloaded | High | Naming | Use distinct symbols |
| 3. Symbol `R` duplicated | High | symbols.yaml | Rename fusion ring |
| 4. Site indexing | Medium | Convention | Standardise to 0-indexed |
| 5. Definition numbering | Medium | Documentation | Use hierarchical numbers |
| 6. Garbled notation | Medium | Bug | Fix LaTeX in fock_space.md |
| 7. Fock truncation | Low | Clarity | Add explanatory remark |
| 8. Missing symbols | Low | Completeness | Add to symbols.yaml |
| 9. Object notation | Low | Consistency | Fix notation in config_space.md |

---

## Recommended Priority

1. **Immediate:** Issues 1, 2, 3 (foundational convention issues)
2. **Soon:** Issues 4, 5, 6 (documentation quality)
3. **Later:** Issues 7, 8, 9 (polish and completeness)
