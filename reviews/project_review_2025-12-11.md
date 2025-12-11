# Critical Review — Mobile Anyons Project (closed BEAD scope)

Ordered by severity; each item lists finding and mitigation.

1) **Inconsistent simple-object indexing (critical)**  
   - `docs/fusion_ring.md` assumes simples indexed `i=1..d` but also sets `X_0 = 𝟙`; other docs (`docs/config_space.md`, `docs/hilbert_space.md`) use `X_1 = 𝟙`. This drifts from `symbols.yaml` (X_i with 0 ∈ I) and risks off-by-one errors in code and proofs.  
   - *Mitigation:* Pick one convention (prefer `X_0 = 𝟙`, indices in `I` with 0) and refactor all assumptions, definitions, and code snippets to match. Update `symbols.yaml`, config/hilbert docs, and Julia constructors accordingly.

2) **Rigidity check too weak (high)**  
   - `src/julia/FusionCategories/fusion_category.jl` defines `is_rigid` as `N_{X,X*}^{𝟙} > 0`, permitting multiplicity >1 contrary to rigidity axioms and project assumption `N_{X,X*}^{𝟙} = 1`.  
   - *Mitigation:* Strengthen to equality (`== 1`) and document multiplicity handling separately if needed; add tests.

3) **Grothendieck ring mismatch (high)**  
   - `docs/fusion_category.md` exports/describes `grothendieck_ring` but the implementation in `src/julia/FusionCategories/fusion_category.jl` is absent/commented and not exported. Architecture couples `fusion_ring.jl` and `fusion_category.jl` via `include`, so the promised decategorification API is missing.  
   - *Mitigation:* Implement and export `grothendieck_ring(C)::FusionRing` (reuse `dual` and `N`), or trim the doc until code exists. Decouple module includes to avoid accidental double definitions.

4) **Fock vs lattice Hilbert space scope (medium)**  
   - `docs/fock_space.md` defines a direct sum over `N = 0..∞`, while lattice-based hilbert spaces in `docs/hilbert_space.md` restrict `N ≤ n` (sites). The relationship is unstated, risking ambiguity about allowed particle numbers.  
   - *Mitigation:* Explicitly state that the physical Hilbert space truncates the Fock sum at `N = n` (or hard/soft-core limits), and adjust definitions/remarks accordingly.

5) **Corrupted notation in Fock-space doc (medium)**  
   - `docs/fock_space.md` contains garbled ket notation (`|ucketsymbol{\\phi}\\rangle`), likely from a placeholder, reducing clarity.  
   - *Mitigation:* Fix to clean LaTeX (e.g., `|\phi\rangle`, `|\chi\rangle`) and proofread for similar artifacts.

6) **Morphism-space normalisation tracking (medium)**  
   - `docs/morphism_spaces.md` notes basis dependence and defers normalisations to `docs/diagrammatic_calculus.md`, but that file is not yet populated with the required choices. Closed BEADs relying on multiplicity handling lack the concrete normalisation conventions mandated in AGENTS.md.  
   - *Mitigation:* Populate `docs/diagrammatic_calculus.md` with the chosen evaluation/coevaluation and fusion-tree normalisations before using basis-dependent computations.

7) **Code/doc cross-reference drift (medium)**  
   - Several docs embed Julia snippets (e.g., morphism/basis helpers) that duplicate or diverge from actual code (e.g., new exports `morphism_dim`, `multiplicity_basis_labels`). Without synchronization, snippet verification may pass while modules differ.  
   - *Mitigation:* Move executable definitions exclusively to `src/` and keep docs referencing paths; re-run snippet validation after syncing exports/imports.

8) **Lattice position units ambiguity (open bug acknowledged, low)**  
   - `docs/config_space.md` mixes site indices (`Λ = {0,…,n-1}`) with physical positions (`x_j = ε j` appears elsewhere). A Beads bug remains open, but closed tasks built on this foundation inherit the ambiguity.  
   - *Mitigation:* Resolve the open bug by separating index set vs physical positions and propagate the clarified convention into Hilbert/operator sections.

9) **Module coupling and includes (low)**  
   - `src/julia/FusionCategories/fusion_ring.jl` includes `fusion_category.jl` inside the `FusionCategories` module, and `FusionCategories.jl` re-exports the module via `include`. This tight coupling risks accidental symbol leakage and complicates testing per-component.  
   - *Mitigation:* Split modules cleanly (each in its own `module ... end`), and have `FusionCategories.jl` import them explicitly.
