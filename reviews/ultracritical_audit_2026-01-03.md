---
refs-in:
  - AGENTS.md
  - prd.md
  - tech_specs.md
refs-out: []
---

# Ultracritical Audit Report (2026-01-03)

Scope: `AGENTS.md`, `prd.md`, project docs in `docs/`, and LaTeX sources in `tex/`.

This is written as if I were refereeing a paper and reviewing a research repo that must survive hostile scrutiny: line-by-line convention consistency, proof safety, and process enforcement. The focus is on failure modes that cause later “proof collapse” (sign/normalisation drift, implicit assumptions, inconsistent indexing, and unreviewable sprawl).

## Executive Summary (What Will Break First)

1. **Conventions are internally inconsistent across docs/tex/code.** In particular: vacuum/non-vacuum indexing conventions and simple-object index ranges disagree in multiple core files. This will silently invalidate matrix elements, locality definitions, and any “reduction to sVec / fermions” story.
2. **The repo violates its own governance rules** (≤200 line docs, no inline TikZ, no second-quantised operators). Without enforcement gates, drift will continue and no later “formal proof protocol” will save it.
3. **Several foundational mathematical statements are currently unsafe** (orthogonality of fusion-tree bases, ordering/permutation identification vs “braiding required”, inner-product/† structure not globally fixed). These are the exact places where anyon projects die: wrong identifications packaged as “obvious”.

Bottom line: before adding more physics, you need a “stop-the-line” stabilization pass: single canonical conventions + mechanical alignment + enforcement scripts.

## Stop-The-Line: Critical Inconsistencies / Spec Violations

### STL-1 — Vacuum/indexing conventions contradict each other (docs vs code)

The project simultaneously uses at least three incompatible conventions for vacuum/non-vacuum labels.

Concrete examples:
- `docs/config_space.md:41` and `docs/config_space.md:50` use labels `k_j ∈ {2,…,d}`.
- `docs/config_space.md:43` says “Label 0 denotes vacuum; Labels 1..d-1 denote nontrivial simples”.
- The snippet in `docs/config_space.md:72` uses yet another convention (`kⱼ ∈ {1,…,d-1}, where 0 = vacuum`).
- Code uses **1 = vacuum**: `src/julia/MobileAnyons/config.jl:12` and `src/julia/MobileAnyons/config.jl:15` (“1 = unit (vacuum), nontrivial indexed 2..d”).
- Meanwhile, category/Hilbert docs assume **0 = vacuum**: e.g. `docs/hilbert_space.md:39` (“simples X_0 = 1, X_1,…,X_{d-1}”).

This cannot be patched locally: it affects every definition that touches configurations, locality, and “particle number”.

Immediate consequence: even checking “is particle conserving” can be wrong if “vacuum” is misidentified (see STL-4).

### STL-2 — Duplicate definition numbering breaks referential integrity

`docs/hilbert_space.md` contains two different “Definition 4.2.5” entries:
- `docs/hilbert_space.md:71` “Definition 4.2.5 (N-anyon space, indefinite charge)”
- `docs/hilbert_space.md:90` “Definition 4.2.5 (Fusion tree)”

This makes cross-references ambiguous/unreliable and is a red flag for later proof tooling.

### STL-3 — Second-quantised operator notation appears inside Theorems (forbidden)

You explicitly prohibit creation/annihilation operators, yet they appear in “Theorem”-labelled statements in both Markdown and LaTeX.

Examples:
- `docs/svec_verification.md:126` uses `c_j^\dagger c_i` and calls it a theorem statement.
- `docs/svec_verification.md:152` states anticommutation relations `\{c_i, c_j^\dagger\} = δ_{ij}` as a theorem claim.
- `tex/sections/hamiltonian_v0.tex:207` uses `b_j^\dagger b_{j+1}`.
- `tex/sections/hamiltonian_v0.tex:215` uses `c_j^\dagger c_{j+1}`.

If you want to *mention* second quantisation for reader intuition, it must be explicitly quarantined as “informal translation / not used” and kept out of formal statements.

### STL-4 — “Use Mor not Hom” notation policy is violated and inconsistent

Global project rule: use `\mathrm{Mor}(A,B)` for morphisms (AGENTS). Yet:
- `tex/main.tex:71` defines `\Hom`, and the TeX sections often mix `\Mor(A,B) := \Hom_\mathcal{C}(A,B)` (`tex/sections/morphism_spaces.tex:17`).
- `docs/module_categories.md:59` introduces internal Hom `\underline{\mathrm{Hom}}(M,N)` while using `Mor` elsewhere.

You must decide whether `Hom` is allowed as a derived alias (internal Hom is standard terminology) or whether you rename consistently (e.g. `\underline{\mathrm{Mor}}` with a clear note). Right now, it is neither consistent nor justified.

### STL-5 — TikZ macro policy is violated in paper sections

You forbid inline TikZ “from scratch”, requiring macros from `tex/tikz_styles.tex`, but multiple main sections use raw `\begin{tikzpicture}` and manual drawing:
- `tex/sections/diagrammatic_calculus.tex:32` (and many other instances)
- `tex/sections/hamiltonian_v0.tex:180`

This is precisely how diagrammatic conventions drift and normalisations get encoded inconsistently.

### STL-6 — Broken asset paths: docs reference figures that do not exist

`docs/fusion_category.md` links to `docs/figures/out/*.svg`:
- `docs/fusion_category.md:65` `figures/out/f_move.svg`
- `docs/fusion_category.md:84` `figures/out/pentagon.svg`
- `docs/fusion_category.md:104` `figures/out/r_move.svg`
- `docs/fusion_category.md:123` `figures/out/hexagon.svg`

But `docs/figures/` contains only `docs/figures/README.md`. This breaks the doc build/reading experience and signals “two competing figure pipelines” (docs vs tex).

### STL-7 — Doc modularity rule (≤200 lines) is violated in many core files

Examples (line counts):
- `docs/matrix_elements_2local.md` (427)
- `docs/fusion_category_examples.md` (298)
- `docs/braiding_particle_ordering.md` (275)
- `docs/lattice.md` (275)
- `docs/diagrammatic_calculus.md` (256)
- `tech_specs.md` (318)

Oversized files are not just style issues: they become unreviewable and make cross-references stale.

### STL-8 — Known mathematical inaccuracies / misleading claims exist in foundations

Examples:
- `docs/fusion_category_examples.md:60` says “Fibonacci category is non-braided (bosonic). If braiding is added: …” (this is at best misleading in context; it will confuse readers and agents).
- `docs/temperley_lieb.md:93` gives a central charge formula that appears incorrect as stated.

If these are wrong, everything that cites them becomes garbage.

### STL-9 — Locality/support definition uses wrong vacuum test

`docs/operators.md:83` defines
`supp(A) = { j : a_j ≠ 1 }`
but elsewhere vacuum is `0` (docs) or `1` (code). This definition is currently not meaningful as a project-wide invariant.

## High-Risk Mathematical Failure Modes (Even If You “Fix Style”)

### HR-1 — Inner product / dagger / unitarity structure is not globally fixed

Statements like “Hermitian”, “unitary F-symbols”, “R-symbols unitary”, and “h.c.” require an explicit inner product on the relevant morphism/Hilbert spaces. Right now, the repo gestures at † but does not globally specify:
- what the Hilbert inner product on each `Mor(…, …)` is,
- how it matches TensorCategories’ conventions,
- how basis normalisations are fixed and recorded.

Without this, hermiticity/unitarity statements are not well-formed.

### HR-2 — Unjustified orthogonality of fusion-tree bases

`docs/hilbert_space.md:99` and `docs/matrix_elements_2local.md:44` state “different fusion trees are orthogonal basis vectors”.

This is generally not basis-independent and is often false unless you *define* an inner product that makes a specific fusion-tree basis orthonormal. If you want orthonormality, it must be a convention plus a construction, not a claim.

### HR-3 — Ordering/permutation identification is inconsistent with “braiding required”

`docs/config_space.md:30` says permutations represent the same physical configuration, while `docs/braiding_particle_ordering.md` explains orderings are not canonically identified without braiding. These are not automatically compatible: you need an explicit quotienting/sectoring story and must keep “configuration space” vs “Hilbert space identification” separate.

### HR-4 — “TensorCategories required” is violated by examples and snippets

AGENTS says all fusion category code must use TensorCategories.jl, but:
- `docs/fusion_ring.md` embeds a custom `FusionRing` struct and operations.
- `docs/fusion_category_examples.md` defines `FusionCategory(…)` examples.
- `docs/svec_verification.md` contains a `FusionCategory(2,N)` constructor snippet.

These snippets are not only likely uncompilable here, they are incompatible with the stated infrastructure constraints.

## Process/Repo Hygiene Risks

### PR-1 — Two sources of truth (docs vs tex) already drift

Markdown and LaTeX are “counterparts”, but are already inconsistent in terminology and embedded snippets. Without an automated generation workflow, this guarantees future inconsistency.

### PR-2 — Generated LaTeX build artifacts are tracked

The repo contains `tex/main.aux`, `tex/main.log`, etc. Even if ignored, tracked artifacts create noisy diffs and merge conflicts.

### PR-3 — `tech_specs.md` references a non-existent parent doc

`tech_specs.md:4` says `Parent: mobile_anyons_prd.md` but the PRD file is `prd.md`.

## Recommended Stabilisation Sequence (Minimal, High-Leverage)

1. **Declare one canonical indexing convention** (vacuum label, simple-object indices, site indexing) and apply it mechanically across `docs/`, `tex/`, and `src/julia/`.
2. **Rewrite sVec verification and limiting-case sections** strictly in first quantisation. Allow second-quantised notation only in quarantined remarks, never in theorem statements.
3. **Decide the source of truth for prose**: either Markdown generates LaTeX, or LaTeX generates Markdown. Eliminate manual mirroring.
4. **Enforce the TikZ macro rule** by replacing inline TikZ in `tex/sections/*` with macros, adding macros to `tex/tikz_styles.tex` as needed.
5. **Add repo quality gates**: line limits, forbidden patterns, reference/link validation, and “no duplicate definition numbers”.
6. **Fix the foundational math errors** (TL central charge, Fibonacci braidedness wording, orthogonality claims) before deeper Hamiltonian work.

## Beads Issue Register

This review identifies concrete work items that must be tracked in Beads. The corresponding issues are:

- Epic: `microscopic-mobile-anyons-l6jp` — Audit 2026-01-03: Stabilize conventions & enforcement
- `microscopic-mobile-anyons-l6jp.2` — STL-1 Unify vacuum/simple-object indexing conventions (docs/tex/julia)
- `microscopic-mobile-anyons-l6jp.3` — STL-2 Fix duplicate definition numbering in docs/hilbert_space.md
- `microscopic-mobile-anyons-l6jp.4` — STL-3 Remove second-quantised operators from formal statements (rewrite sVec + limits in 1st quantisation)
- `microscopic-mobile-anyons-l6jp.5` — STL-4 Decide/enforce Mor vs Hom notation (including internal Hom)
- `microscopic-mobile-anyons-l6jp.6` — STL-5 Eliminate inline TikZ in tex/sections (use tikz_styles macros only)
- `microscopic-mobile-anyons-l6jp.7` — STL-6 Fix broken docs figure asset links (docs/figures/out/*)
- `microscopic-mobile-anyons-l6jp.8` — STL-7 Enforce ≤200-line doc modularity (split oversized docs + add gate)
- `microscopic-mobile-anyons-l6jp.9` — STL-8 Fix foundational math inaccuracies (Fibonacci braidedness wording; TL central charge formula)
- `microscopic-mobile-anyons-l6jp.10` — STL-9 Fix locality/support vacuum test (docs/operators.md) and align with canonical vacuum index
- `microscopic-mobile-anyons-l6jp.11` — HR-1 Specify inner product / dagger / unitarity conventions for Mor/Hilbert spaces
- `microscopic-mobile-anyons-l6jp.12` — HR-2 Fix/justify fusion-tree orthogonality claims (basis/inner product dependent)
- `microscopic-mobile-anyons-l6jp.13` — HR-3 Reconcile configuration permutation claims vs braiding-required ordering identification
- `microscopic-mobile-anyons-l6jp.14` — HR-4 Make docs/code snippets TensorCategories-only (remove custom FusionRing/FusionCategory examples)
- `microscopic-mobile-anyons-l6jp.15` — PR-1 Choose single source of truth for prose (docs vs tex) and eliminate manual drift
- `microscopic-mobile-anyons-l6jp.16` — PR-2 Remove tracked LaTeX build artifacts (tex/*.aux, *.log, etc) and prevent re-add
- `microscopic-mobile-anyons-l6jp.17` — PR-3 Fix tech_specs.md Parent link (mobile_anyons_prd.md -> prd.md)
