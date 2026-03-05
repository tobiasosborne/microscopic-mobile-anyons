# Session Handoff — 2026-03-05

## What was done

### Project restructuring
- Archived entire v0 (Dec 2025 - Jan 2026) into `archive/v0/`
- Created clean v1 project: `src/MobileAnyons/`, `test/`, `tex/`, `literature/`
- Set up TensorCategories.jl directly (no wrappers), 1-based indexing everywhere
- Initialized beads (`ma-` prefix), installed hooks, adapted CLAUDE.md from Lyr.jl

### Literature review (comprehensive)
- Built tooling: `scripts/litreview.py` (arXiv/Semantic Scholar/PDF extraction/ref verification)
- Built tooling: `scripts/scholar_cite.js` (Google Scholar via Playwright)
- Downloaded 50 papers to `literature/pdfs/`
- 16 papers reviewed in depth via subagents
- 4 Google Scholar citation chases (Poilblanc 2012, Golden chain, Shi 2025, Garjani-Ardonne 2016)
- Full catalog in `literature/catalog.md`, consolidated review in `literature/review.md`

### Key findings from literature
- Mobile anyon problem partially solved for SU(2)_k by Poilblanc group (2011-2015)
- Garjani-Ardonne pair creation (2016) has almost zero follow-up — wide open
- 2025 burst of ~15 papers on doped FCIs, all field-theoretic, explicitly calling for microscopic models
- Shi-Zhang-Senthil 2025 does NOT preempt us (no lattice Hamiltonian, no Hilbert space)
- Hollands 2022 provides rigorous categorical framework but dense chains only
- Stottmeister 2201.11562 confirms fixed-N obstruction in braiding RG

### PRD v2: continuum limits via OAR
- Central insight: variable anyon number decouples lattice spacing from inter-particle spacing
- Dense chain is a Mott insulator (ℓ = a forever) — no continuum limit possible
- Variable N enables: lattice refinement with vacancies → OAR fine-graining isometries → inductive limit → continuum QFT
- Stottmeister's braiding RG blocked by fixed N; our Fock space ⊕_N H_N resolves the obstruction
- Garjani-Ardonne pair creation populates new sites during fine-graining

## What's next

### Immediate (code-first)
1. Get TensorCategories.jl working: extract numerical F-matrices from `associator()`
2. sVec matrix elements → free fermion hopping Hamiltonian (SC1)
3. Fibonacci Hilbert space dimensions (SC3)
4. Exact diag spectra for L=3..6 (SC4)

### Medium term
5. Generalize Garjani-Ardonne pair creation to arbitrary fusion categories
6. Dense limit → golden chain recovery (SC5)
7. Construct fine-graining isometries for anyonic Fock space (SC6)

### Long term
8. Continuum limit via OAR (SC7)
9. Identify resulting QFTs
10. Paper

## Key papers to build on
- Poilblanc 2012 (1210.5605): anyonic t-J model, F-symbol exchange matrices
- Garjani-Ardonne 2016 (1608.04927): nine-term Hamiltonian with pair creation
- Hollands 2022 (2205.15243): rigorous categorical framework (subfactors, MPOs)
- Osborne-Stottmeister OAR series: 1901.06124, 2002.01442, 2107.13834
- Stottmeister 2201.11562: braiding RG (blocked by fixed N — we unblock it)

## Open issues
```
bd stats → 1 issue (ma-zbn, closed)
```
No open issues. Create issues for the immediate code tasks when starting next session.
