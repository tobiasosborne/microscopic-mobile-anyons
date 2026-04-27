# Session Handoff — 2026-04-27

## Literature crawl: Phase H started

Pivoting from the fine-graining work to a deep literature review on the project's
core contribution: **Fock space H = ⊕_N H_N for an indeterminate number of anyons
from an arbitrary fusion category**, with morphism-space N-particle sectors and
pair creation/annihilation between sectors.

Beads issues created (`Lit-H/T/C/S` prefix, ma-* IDs). DAG wired: H1 → {H3, T*},
H3 → H4 → {H5, T6}; T1..T4 → all C*; C1..C8 → C9 → S1 → S2; H5 + T6 → S3.

### Phase H — harmonise existing state
- **H1 (ma-c3a) DONE**: `literature/db/schema.sql` + `scripts/lit.py` CLI skeleton.
  SQLite at `literature/db/papers.sqlite` (gitignored). Subcommands `init`,
  `status`, `seed` work; `add`/`fetch-cites`/`pdf`/`md`/`gscholar`/`export`/`gaps`
  stubbed and pointing at their owning beads task IDs.
- **H2 (ma-vig) DONE**: moved `literature/tex/` (rwolfthesis source) →
  `literature/md/rwolfthesis/tex/`. Stray jpegs were already in their proper
  subfolder; just untracked.

### Phase H — harmonise (cont.)
- **H3 (ma-xbi) DONE** + **H4 (ma-3kx) DONE**: built
  `literature/db/seed_existing_pdfs.json` manifest mapping each of the 40 PDFs
  to a canonical slug + arxiv/doi/title/year/tier/bib_key. Ran
  `scripts/lit_ingest_existing.py`: renamed 36 files to `{arxiv_id_or_slug}.pdf`,
  deleted 4 duplicates, recorded full file_provenance (sha256), and inserted
  all 36 into the DB at status=have_pdf.
- **H5 (ma-qv6) DONE**: extended `lit.py` with `export bib`, `export survey`,
  `gaps`. Generated `literature/SURVEY.md` (39 papers grouped by tier 1–5,
  Bennett.jl-style entries) and `literature/references.bib` (39 entries).
  Moved the old `catalog.md`, `overview.md`, `review.md` into
  `literature/_archive/` with a README explaining the supersession.

### Anchor seeds (8)
1. `1112.5950` Poilblanc-Troyer-Ardonne-Bonderson 2011
2. `1210.5605` Poilblanc-Feiguin-Troyer-Ardonne-Bonderson 2012
3. `1608.04927` Garjani-Ardonne 2016 (variable-N pair creation; only 4 GS cites)
4. `2205.15243` Hollands 2022 (categorical / subfactor) — stub, no PDF yet
5. `2201.11562` Stottmeister 2022 anyon-RG — stub, no PDF yet
6. `2505.02893` Shi-Zhang-Senthil 2025 — stub, no PDF yet
7. `2508.14961` Nakajima-Mehta-Goldman 2025
8. Eck PhD thesis Oxford 2025 — newly discovered T1 candidate

### Phase T — tooling
- **T1 (ma-957) DONE**: `lit add <arxiv|doi>` implemented (stdlib only —
  urllib + xml.etree, no third-party deps). S2 → OpenAlex → arXiv API
  with idempotent upsert. Authors normalised. arXiv title is authoritative
  for arXiv-id papers (S2 leaks LaTeX into titles). Stub seeds Hollands /
  Stottmeister / Shi-Senthil enriched; Huston-Burnell-Jones-Penneys 2022
  added (arxiv 2208.14018). 40 papers in DB.
- **S2 rate-limit caveat**: unauthenticated S2 returns 429 immediately on
  bursts. arXiv API + OpenAlex DOI lookup is the reliable path; S2 is
  best-effort enrichment. For T2 (cite chase) we may need an S2 API key,
  or pure OpenAlex.

- **T2 (ma-vwq) DONE**: `lit fetch-cites <id>` via OpenAlex (DOI-first
  resolution; arXiv-search and title-search fallbacks). Backward via
  `referenced_works` (bulk-fetched, 50/call); forward via `cites` filter,
  cursor-paginated. Idempotent. Ran on the 8 seeds: **502 citation edges,
  411 new stub papers** created. DB now 451 papers.
- Caveat: OpenAlex returns 0 backward refs for some recent arXiv-only
  preprints (Stottmeister 2201.11562 shows 0/0). Need S2 or PDF parsing
  to fill those gaps.

- **T3 (ma-o7h) DONE**: `lit pdf <id>` arxiv-direct works (no auth, no
  rate limit). `--all-arxiv` bulk-pulls every arxiv stub. 4 stub seeds
  + bulk pull running in background (`nohup ... > /tmp/bulk_arxiv_pdfs.log`).
  `scripts/lit_fetch_pdf.mjs` is the headed-Playwright fallback for
  paywalled (TIB VPN); pattern adapted from `FQHE/scripts/fetch_aps_papers.mjs`,
  not yet exercised end-to-end.

### What's next
- T4 (ma-ah9): `lit md` — wrap marker for PDF→md. Uses
  `/home/tobiasosborne/Projects/archivum/.venv/bin/marker_single`.
- T6 (ma-6st): expand `lit export` (already v0); add `gaps` polish, S2
  cite-chase fallback for papers with empty OpenAlex backward refs.
- The C* tasks (cite chase) can technically start now that T1+T2+T3 work,
  but for the seeds we already chased (8 of 8) the citations are in DB.
  Phase C is mostly enrichment + triage in C9 now.

---

# Session Handoff — 2026-03-10

## What was done this session

### Number-changing fine-graining isometry experiment
- **Goal**: test whether pair-creation h† can fill the deficit D = I - V₀†V₀ of the raw product map physically (without artificial normalization)
- **Phase 1 (Deficit Analysis)**: confirmed G = V₀†V₀ is diagonal, deficit depends only on positions, zero for N≤1. Deficit grows with N: ~0.029 (N=2), ~0.057 (N=3), ~0.083 (N=4)
- **Phase 2 (Composition h†V₀)**: naive composition fails because V₀†(h†V₀) ≠ 0 — cross-sector overlap where V₀ maps coarse (N+2) states to the same fine sector as h†V₀ maps coarse N states
- **Three-step fix** gives V†V = I exactly:
  1. Project: V₂_orth = (I - Π_{V₀}) h†V₀ → eliminates V₀†V₂
  2. Löwdin: V₂_J · G₂^{-1/2} → orthogonalizes V₂ columns against each other
  3. Scale: · D_J^{1/2} → fills deficit exactly
- **Result**: V†V = I to machine precision for Fibonacci and Ising, L=3,4 with D4 wavelet
- **Intertwining**: number-changing isometry gives ~3% better residual than normalized product (0.378 vs 0.393 at L=4 Fibonacci)
- New test file: `test/test_number_changing_finegraining.jl`
- Helper function `build_number_changing_isometry()` in test file (not yet in src/)
- LaTeX writeup: new Section 1.8 in `tex/sections/finegraining.tex` with proof, deficit table, numerical results, physical interpretation, updated hierarchy table

## Current state

### Completed
- M1-M5: All lattice operators (hopping, interaction, braiding, pair creation)
- M6: Pair creation/annihilation (622 tests)
- Phase 1 (OAR): sVec fine-graining, Haar + D4 wavelets
- Phase 2-3 (OAR): Universal normalized product map for any category/wavelet
- Phase 4 (OAR): Convergence tests, multi-step composition, spectral convergence
- **NEW**: Number-changing isometry V = V₀ + V₂ proven to work

### Two isometry approaches now validated
1. **Normalized product** (number-preserving): V = V_prod / ||col||. Simple, universal, no category data needed beyond basis.
2. **Number-changing**: V = V₀ + (I-Π_{V₀})h†V₀ · G₂^{-1/2}D^{1/2}. Uses pair creation, slightly better intertwining, physically motivated (pairs fill vacancies).

## What's next

### Immediate
- Decide whether to promote `build_number_changing_isometry` to `src/MobileAnyons/finegraining.jl` (currently only in test)
- Investigate whether the intertwining improvement scales with L (is 3% at L=4 growing or shrinking?)
- Consider multi-step composition with number-changing isometry (V_{2L→4L} ∘ V_{L→2L})

### Medium term
- Compare continuum limit convergence rates: normalized product vs number-changing
- Explore whether higher-order pair terms (N→N+4) further improve things

### Long term
- Full OAR continuum limit construction
- Identify resulting QFTs
- Paper

## Key files
- `test/test_number_changing_finegraining.jl` — this session's experiment (Phases 1-5)
- `test/test_convergence.jl` — Phase 4 convergence tests
- `src/MobileAnyons/finegraining.jl` — product map, normalized product, categorical determinant
- `src/MobileAnyons/paircreation.jl` — pair creation operator h†
- `src/MobileAnyons/wavelets.jl` — Daubechies filters, one-particle scaling maps
- `tex/sections/finegraining.tex` — LaTeX writeup (7 pages, includes number-changing isometry)
