# Session Handoff — 2026-04-27

## Pivot: deep literature review on the project's central definition

Project pivoted away from fine-graining experiments and toward a deep
literature crawl on the core contribution:

> Fock space $\mathcal{H} = \bigoplus_N \mathcal{H}_N$ for an indeterminate
> number of anyons from an arbitrary fusion category, with morphism-space
> N-particle sectors and pair creation/annihilation between sectors.

All 23 `Lit-*` beads issues planned, executed, closed in one session.

## Headline findings

1. **Garjani–Ardonne 2016 (`1608.04927`) is essentially uncited** (4 GS, 2
   OpenAlex). The variable-N direction has been a wide-open hole for 9
   years.
2. **The 2025 FCI/FQAH burst is loud and demand-driven.** Shi–Zhang–Senthil
   2025 spawned 9+ follow-ups in 12 months; all field-theoretic CSGL; all
   explicitly call for microscopic models. Nakajima–Mehta–Goldman 2025
   does the dilute-limit thermodynamics.
3. **Two siloed communities.** Categorical/dense-chain (Hollands 2022,
   Stottmeister 2022, Feiguin et al, Eck 2025) ↛ FQH/quasihole
   (Moore–Read, Shi–Senthil) — almost no cross-cite. The project sits in
   the seam.
4. **Hollands 2022 is the rigorous template, dense-only.** Intertwiner
   construction with multiplicities; everything we need except mobility.
   Reframe: "Hollands extended to mobile/variable-N" beats "generalising
   Garjani–Ardonne."
5. **Stottmeister 2022 anyon-RG is the OAR continuum-limit precedent —
   only worked Ising.** Our isometries plug straight in.
6. **Eck PhD thesis 2025 (Oxford, Fendley)** is on adjacent territory
   (dense, Fendley-tradition) — confirmed by user as not-prior-art.
7. **Pre-2013 lineage auto-validated** via OpenAlex cite-chase: Wilczek
   1982, Halperin 1984, Witten 1989, Fredenhagen–Rehren–Schroer 1989,
   Moore–Read 1991, Frohlich–Marchetti 1990, Read–Rezayi 1999, Bonderson
   2008, Etingof–Nikshych–Ostrik 2005.

The full strategic write-up is in `literature/SYNTHESIS.md`.

## Final state

| | |
|---|---|
| Papers in DB | **630** |
| Citation edges | **702** |
| Local PDFs | **347** (every arXiv stub pulled) |
| Marker md outputs | **122** |
| Marker timeouts (need retry) | **23** (large theses + book-length) |
| Anchor seeds | **10** (with Eck demoted) |
| Tier 1 / 2 / 3 / 4 / 5 / untiered | 22 / 11 / 20 / 8 / 19 / 550 |

Marker coverage by tier (with-md / pdf-no-md / no-pdf):

| Tier | with md | pdf-no-md | no-pdf | total |
|------|---------|-----------|--------|-------|
| T1   |   12    |    8      |   2    |  22   |
| T2   |   6     |    3      |   2    |  11   |
| T3   |   7     |    9      |   4    |  20   |
| T4   |   6     |    1      |   1    |   8   |
| T5   |   13    |    1      |   5    |  19   |

## Infrastructure built (`scripts/lit.py`, stdlib only)

```
lit init                    # create literature/db/papers.sqlite
lit status                  # quick stats
lit seed                    # JSON-blob upsert (used by H4)
lit add <arxiv|doi>         # S2 → OpenAlex → arXiv enrichment, idempotent
lit fetch-cites <ident>     # bidirectional via OpenAlex (DOI-first)
lit pdf <ident> | --all-arxiv   # arXiv direct + OpenAlex pdf_url
lit md <ident> | --all      # marker via archivum venv
lit export bib|survey|all   # regenerate references.bib + SURVEY.md
lit gaps                    # papers without PDFs / unreviewed
```

`scripts/lit_fetch_pdf.mjs` — headed-Playwright fallback for paywalled
PDFs on TIB VPN (FQHE pattern). Wired but not yet exercised
end-to-end; needs `npm install playwright` if invoked.

`scripts/lit_ingest_existing.py` — one-shot rename + dedup + ingest
manifest (`literature/db/seed_existing_pdfs.json`). Already run; kept for
provenance.

## Outputs

- `literature/SURVEY.md` — auto-generated paper catalog (Bennett.jl
  reporting standard, grouped by tier; **edit the DB, not this file**).
- `literature/SYNTHESIS.md` — hand-written narrative review: two-lineages
  map, pre-2013 forerunners, 2025 FCI burst, gap diagram, strategic
  positioning. **This is the readable answer to the user's question.**
- `literature/references.bib` — 630 BibTeX entries, generated.
- `literature/_archive/{catalog,overview,review}.md` — superseded
  pre-pivot drafts, kept for provenance.

---

## Worklog for the next agent

### Priority 1 — finish marker conversions (the easy wins)

23 papers timed out at 5 min. These include the project's most strategic
content. Retry with longer timeout:

```bash
# All papers with PDF but no md:
python3 scripts/lit.py md --all --timeout 1800
```

For the very large items (Eck thesis, Etingof book, Soni thesis), if even
30 min is not enough, chunk via `marker_single ... --page_range 0-50`
applied per chunk and concatenated.

The most strategically valuable PDFs without md right now:

| arXiv | Why it matters |
|---|---|
| `2506.08000` | Pichler-Vishwanath 2025: microscopic mechanism of anyon SC from FCIs |
| `2508.14894` | Han-Vishwanath 2025: anyon superfluidity in QH bilayers |
| `2410.18175` | Divic et al: anyon SC from topological criticality |
| `2205.15243` | **Hollands 2022 — the closest categorical precursor** |
| `2208.14018` | Huston-Burnell-Jones-Penneys 2022 — top in-cite node (20) |
| `2107.13834` | Osborne-Stottmeister 2021 — OAR + lattice fermions |
| `2002.01442` | Stottmeister 2020 — OAR + wavelets |
| `1901.06124` | Osborne 2019 — continuum limits foundation |
| `cond-mat/0506438` | Kitaev 2006 — anyons in exactly solved model |

(Plus the non-arXiv: Eck thesis, Etingof book, Etingof lecture notes.)

### Priority 2 — manual seeds without arXiv

- **Bonderson PhD thesis** (Caltech 2007). Likely on iqim.caltech.edu.
- **Pachos** *Introduction to Topological Quantum Computation* (Cambridge 2012).
- **Wen** *Quantum Field Theory of Many-Body Systems* (OUP 2004).

For each: download manually, place in `literature/pdfs/{slug}.pdf`,
ingest with:

```bash
echo '{"bib_key":"BondersonThesis2007","title":"...","year":2007,
       "authors_str":"Bonderson","tier":3,"status":"have_pdf",
       "pdf_path":"literature/pdfs/bonderson_thesis_caltech_2007.pdf"}' \
  | python3 scripts/lit.py seed
```

### Priority 3 — fill OpenAlex backward-ref gaps via PDF parsing

Several recent preprints have 0 backward refs on OpenAlex (Stottmeister
2201.11562, Nakajima 2508.14961, the burst papers). The marker md output
has them as `arXiv: XXXX.XXXXX` strings. A `lit citations-from-md`
subcommand would parse these and insert citation edges. Sketch:

```python
# Inside scripts/lit.py
def cmd_citations_from_md(args):
    # 1. read papers.md_path
    # 2. regex-extract arxiv ids: (?:arXiv:|arxiv\.org/abs/)([\w\-/.]+)
    # 3. for each: lit-add (or stub-create), then add citation edge
    pass
```

I checked Stottmeister 2201.11562 manually: 11 arxiv refs in the bib,
8 already in DB. Worth adding the subcommand.

### Priority 4 — paper writeup integration

`tex/main.tex` still has its inline `\bibitem` block. Replace with
biblatex against `literature/references.bib`. Citations in
`tex/sections/finegraining.tex` already use `\cite{...}` keys that match
the bib_key column (e.g. `PoilblancFeiguinTroyerArdonneBonderson2013`,
`GarjaniArdonne2017`).

### Priority 5 — open infrastructure questions

- **S2 rate limit**: every cite chase ran on OpenAlex because
  unauthenticated S2 returned 429 immediately. If a paper-level S2 chase
  is wanted later, get an API key (free at semanticscholar.org/product/api).
- **Author normalisation**: 29 authors in `authors` table — only the
  manually-added or S2-enriched ones. Most cite-chase stubs left
  `authors_str` populated but no `paper_authors` rows. If we want
  per-author co-authorship analysis, need to backfill.

### Background processes that were running (now stopped)

- `nohup python3 scripts/lit.py md --all --timeout 300 > /tmp/bulk_marker.log`
  — killed on windup at 122/270.
- `nohup python3 scripts/lit.py pdf --all-arxiv > /tmp/bulk_arxiv_pdfs2.log`
  — finished cleanly (72/72).

To resume marker:

```bash
nohup python3 scripts/lit.py md --all --timeout 1800 \
  > /tmp/bulk_marker_resume.log 2>&1 &
```

Already-converted papers will be skipped automatically (md_path check).

### Quick-reference commands

```bash
# Where are we?
python3 scripts/lit.py status
python3 scripts/lit.py gaps

# Browse the DB
sqlite3 literature/db/papers.sqlite "SELECT id, arxiv_id, title, tier FROM papers WHERE tier = 1 ORDER BY year DESC;"

# Regenerate views after edits
python3 scripts/lit.py export all
```

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
