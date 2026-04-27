# Synthesis — Fock space for indeterminate-N anyons from a fusion category

> A narrative companion to the auto-generated `SURVEY.md` (the catalog) and
> `references.bib` (the BibTeX). Both are regenerated from
> `literature/db/papers.sqlite` via `python scripts/lit.py export all`.
> This file is hand-curated; update it as the DB grows.

The project's core contribution is a **definition**:
$$
  \mathcal{H}_L \;=\; \bigoplus_{N=0}^{L} \;\bigoplus_{c \in \operatorname{simp}(\mathcal{C})}
                 \;\bigoplus_{\text{configs}}
                 \operatorname{Mor}(X_c,\; X_{a_1}\otimes\cdots\otimes X_{a_N}),
$$
the Fock space of a fluctuating number of mobile anyons on a 1D lattice,
indexed by a hard-core position pattern, total charge $c$, and a
fusion-tree morphism, for an arbitrary unitary fusion category $\mathcal{C}$.
Pair creation/annihilation maps between the $N$ and $N{\pm}2$ sectors.

Below: which papers have addressed which piece of this construction, and
where the gaps lie. As of 2026-04-27 the SQLite-backed DB has **630 papers,
702 citation edges, 350+ local PDFs, 16 anchor seeds**.

---

## 1. The two living lineages

There are essentially two communities that have written down "Hilbert
spaces of multiple anyons" — they almost never cite each other.

### 1a. Categorical / dense-chain lineage
*Fixed N; non-abelian; built from F/R-symbols of a UFC/MTC.*

- **Feiguin–Trebst–Ludwig–Troyer–Kitaev–Wang–Freedman 2007** —
  `cond-mat/0612341` — the **golden chain**: $L$ Fibonacci anyons in a
  fusion-tree basis, dim $\sim \varphi^L$. Hamiltonian is
  $H = -\sum_i P_{\mathbf{1}}(i,i+1)$ via the F-matrix of $\tau$.
  Fixed N; PBC; multiplicity-free.
- **Trebst–Ardonne–Feiguin–Huse–Ludwig–Troyer 2008** — `0801.4602`,
  `0810.2277` — phase diagrams for $SU(2)_k$ chains; dilute and dense
  variants but always at fixed N.
- **Ardonne–Gukelberger–Ludwig–Trebst–Troyer 2010** — `1012.1080` —
  Yang–Lee anyons (Galois conjugate of Fibonacci); demonstrates the
  Galois conjugation framework for systematic generation of non-unitary
  anyon models.
- **Finch–Frahm–Lewerenz–Milsted–Osborne 2014** — `1404.2439` —
  $SU(2)_k$ chains with arbitrary fusion-rule couplings;
  Bethe-ansatz integrability and CFT identification.
- **Finch–Frahm–Gainutdinov–Korff 2014** — `1408.1282` — *Integrable anyon
  chains: from fusion rules to face models to C\*-algebras*. Closest
  algebraic precursor to the categorical Hilbert-space construction.
- **DeGottardi 2014** — `1403.3101` — topological insulating phases on
  non-abelian anyonic chains.
- **Finch–Flohr–Frahm 2017** — `1710.09620` — $\mathbb{Z}_n$ clock models
  and chains of $so(n)_2$ anyons; integrable points and CFT.
- **Buican–Gromov 2017** — `1701.02800` — anyonic chains for general MTCs,
  topological defects, CFT.
- **Hollands 2022** — `2205.15243` — **the most rigorous categorical
  formalisation to date**. Hilbert space = sequences of intertwiners in
  Jones tunnel = $\operatorname{Mor}(\mathbf{1}, X_1\otimes\cdots\otimes X_N)$.
  Handles multiplicities throughout. Hamiltonian is Jones projections
  satisfying TLJ algebra. MPO symmetry operators (Theorem 1), double
  triangle algebra (Theorem 2), sector decomposition matching CFT
  conformal blocks, defect algebra classification (Theorem 4),
  modular invariant $Z_{\mu,\nu} = \dim\operatorname{Hom}(\alpha^+_\mu,\alpha^-_\nu)$.
  **Limitation: dense chains only — no mobile anyons, no hopping, no vacancies.**
- **Stottmeister 2022** — `2201.11562` — *Anyon braiding and the RG*.
  Defines a real-space RG flow on anyonic chains via braiding;
  OAR (operator-algebraic renormalization) gives a quantum scaling limit.
  Worked example: Ising chain → vacuum of Ising CFT. Built on
  Osborne 2019 `1901.06124`, Stottmeister–Morinelli–Morsella–Tanimoto
  2020 `2002.01442`, Osborne–Stottmeister 2021 `2107.13834`. Dense only;
  no variable N.
- **Eck PhD thesis 2025** — Oxford (Balliol), supervisor Fendley. Explicitly
  "Quantum Lattice Models from Fusion Categories." Newly identified;
  marker conversion pending. Acknowledgements mention two papers with
  Fendley + one in 2+1d.

### 1b. Itinerant-anyon / FQH-quasihole lineage
*Variable N possible (usually fixed in numerics); often abelian or a
fragment of $SU(2)_k$.*

- **Moore–Read 1991** — Nucl. Phys. B 360, 362 — *Nonabelions in the
  fractional quantum Hall effect*. Constructs an anyon-Hilbert-space *in
  the bulk QH context* via Pfaffian wavefunctions; anyon number is the
  number of quasiholes, varies with sample.
- **Read–Rezayi 1996, 1999** — `cond-mat/9609079`, `cond-mat/9809384` —
  parafermion / $\mathbb{Z}_k$ paired states; multi-quasihole counting.
- **Read–Green 2000** — `cond-mat/9906453` — paired states, broken
  $P,T$, and FQHE.
- **Halperin 1984** — PRL 52, 1583 — *Statistics of quasiparticles and the
  hierarchy of FQH states.* Primordial argument for fractional statistics
  in mobile FQH quasiholes.
- **Bonderson–Kitaev–Shtengel 2008** — `0707.4206` — interferometry of
  non-abelian anyons; uses (essentially) $\operatorname{Mor}$-spaces of
  fusion outcomes for indeterminate-position anyons.
- **Poilblanc–Troyer–Ardonne–Bonderson 2011, 2012** — `1112.5950`,
  `1210.5605` — **the closest prior art on itinerant non-abelian
  anyons**. Fusion-tree basis on a 1D chain, hard-core, fixed N (chemical
  potential), Ising and Fibonacci; charge-anyon fractionalization
  $E_{p,m} = E_{\text{charge}}(p,k_m) + E_{\text{anyon}}(m)$. Hopping
  matrix elements are *implicit* (defined by F-symbol projection).
  **Gaps**: $SU(2)_k$ only, multiplicity-free, PBC, no braiding in $H$,
  no sVec consistency check.
- **Soni–Troyer–Poilblanc 2015** — `1508.04160` — extension of the same
  framework to 2- and 3-leg ladders for Fibonacci.
- **Pfeifer 2015** — `1505.06928` — abelian $\mathbb{Z}_3$ ladder; iDMRG;
  novel "hole crystal" phase.
- **Garjani–Ardonne 2016** — `1608.04927` — **the variable-N anchor**.
  Adds pair creation/annihilation to $SU(2)_k$ chains:
  $h_\Delta\,|x,x,x\rangle = \Delta\sum_u\sqrt{d_u/(d_x d_{1/2})}\,|x,u,x\rangle$.
  Nine-term Hamiltonian, dilute Temperley–Lieb integrability, AKLT-like
  exact ground states for odd $k$. **Only 4 GS citations as of 2026 —
  the pair-creation direction is essentially unexplored.**
- **Wildeboer–Patra–Manna–Nielsen 2020** — `1711.00845` — *Anyonic
  quasiparticles of hardcore anyons* (lattice Moore-Read).
- **Ayeni–Pfeifer–Brennen 2018** — `1712.04179` — phase transitions on a
  ladder of braided non-abelian anyons.
- **Kirchner–Moessner–Pollmann–Gammon-Smith 2025** — `2507.22115` —
  Fibonacci anyon Hubbard model on a two-leg ladder at half-filling;
  metallic + CDW phases; effective model from sixth-order perturbation
  theory. **States hopping operators "cannot be expressed in terms of
  simple creation and annihilation operators."** Number-conserving (mass
  $m \gg t,V$); pair processes acknowledged but not modelled.

### 1c. The 2025 FCI / FQAH burst
- **Shi–Zhang–Senthil 2025** — `2505.02893` — Chern–Simons–Ginzburg–Landau
  for doped Read–Rezayi states. **Field-theoretic, no microscopic
  Hamiltonian, no Hilbert space construction.** Explicitly calls for
  microscopic models (p. 34–35) — our framework provides exactly that.
- **Shi–Senthil 2025** — `2506.02128` — anyon delocalization out of a
  disordered FQAH insulator (CSGL).
- **Shi–Senthil 2025** — `2512.17996` — non-abelian topological SC from
  melting abelian FCIs.
- **Pichler–Kuhlenkamp–Knap–Vishwanath 2025** — `2506.08000` — microscopic
  mechanism of anyon SC from FCIs. (Forward-chase yields 9 follow-ups.)
- **Han–Wang–Dong–Zaletel–Vishwanath 2025** — `2508.14894` — anyon
  superfluidity of excitons in QH bilayers.
- **Schleith–Soejima–Khalaf 2025** — `2506.11211` — anyon dispersion from
  non-uniform B on the sphere.
- **Kuhlenkamp–Divic–Zaletel–Soejima–Vishwanath 2025** — `2509.02675` —
  robust SC upon doping chiral spin liquid and Chern insulators.
- **Zhang 2025** — `2506.00110` — holon metal, CDW, chiral SC from doping
  FCI and $SU(3)_1$ CSL.
- **Seo–Lee–Cho 2026** — `2602.03848` — unified categorical description of
  QH hierarchy and anyon SC.
- **Divic et al 2024** — `2410.18175` — anyon SC from topological
  criticality in Hofstadter–Hubbard (mobile semions).
- **Nakajima–Mehta–Goldman 2025** — `2508.14961` — *Thermodynamics of
  dilute anyon gases from fusion constraints*. **Complementary continuum
  approach using only quantum dimensions and fusion rules — no F-symbols,
  no R-symbols.** Distribution function
  $n_\ell(\epsilon) = \tfrac{\sum_m m\,d_{a_m} y^m}{\sum_m d_{a_m}\,y^m}$.

---

## 2. Pre-2013 forerunners — the cite-chase haul

Cite chase via OpenAlex pulled in essentially the whole pre-2013 lineage.
None of these are categorical-anyon-on-chain papers, but each contributes
a piece of the multi-anyon Hilbert-space picture.

| arXiv / DOI | Authors | Year | Why it matters |
|---|---|---|---|
| (no arxiv) | Leinaas–Myrheim | 1977 | Identical-particle configuration-space formalism — origin of anyons |
| `10.1103/PhysRevLett.49.957` | Wilczek | 1982 | *Quantum mechanics of fractional-spin particles* |
| `10.1103/PhysRevLett.53.722` | Halperin | 1984 | Fractional statistics in FQHE |
| `10.1007/BF01217906` | Fredenhagen–Rehren–Schroer | 1989 | *Superselection sectors with braid statistics* — categorical anyons (algebraic QFT branch) |
| `10.1007/BF01217730` | Witten | 1989 | QFT and the Jones polynomial — modular tensor data from CS |
| (NPB) | Moore–Read | 1991 | Nonabelions in FQHE |
| `10.1007/s002200050019` | Fröhlich–Marchetti | 1990 | *Braid statistics in local quantum theory* |
| `cond-mat/9809384` | Read–Rezayi | 1999 | Parafermion paired states |
| `0902.3275` | Trebst–Troyer–Wang–Lukin | 2008 | *A short introduction to Fibonacci anyon models* |
| `0707.4206` | Bonderson–Kitaev–Shtengel | 2008 | *Interferometry of non-abelian anyons* |
| `cond-mat/0506438` | Kitaev | 2006 | *Anyons in an exactly solved model and beyond* |
| `math/0203060` | Etingof–Nikshych–Ostrik | 2005 | *On fusion categories* |

Manual seeds still wanted (no arxiv): **Bonderson PhD thesis (Caltech 2007)**,
Pachos *Introduction to Topological Quantum Computation* (Cambridge 2012),
Wen *Quantum Field Theory of Many-Body Systems* (OUP 2004).

---

## 3. Adjacent traditions — abelian / numerical / off-topic but cited

- **Abelian anyon-Hubbard**: Keilmann–Lanzmich–McCulloch–Roncaglia 2011
  (`1009.2036`), Bonkhoff et al 2024 (`2410.00089`), 2021 (`2008.00003`).
  Uses occupation-dependent hopping in optical lattices; no fusion
  category beyond $\mathbb{Z}_n$.
- **Anyonic MPS / MERA / numerical methods**: Singh–Pfeifer–Vidal–Brennen
  2013 (`1311.0967`), Pfeifer–Corboz et al 2010 (`1006.3532`),
  Ayeni–Singh–Pfeifer–Brennen 2016 (`1509.00903`),
  Kirchner–Millar et al 2022 (`2206.14730`).
- **Lieb–Liniger anyons / Tonks–Girardeau**: Yang 2023
  (`scipost_core_6_4_079`), Girardeau 1960, Girardeau 2006. Abelian;
  statistical-transmutation perspective.
- **QH Majorana wires**: Kitaev 2001 (`cond-mat/0010440`), Lutchyn et al
  2010, Mourik et al 2012 — Tier 5 (lineage but not categorical-anyon).
- **PRSO / RSOS defects**: Belletête et al 2020 (`2003.11293`).

---

## 4. Gap diagram — what each axis demands, who hits it

| Paper | Arbitrary FC | Variable N | Multiplicities $N_{ab}^c > 1$ | OBC | Braid-in-H | Isometric fine-grain | Continuum limit |
|---|---|---|---|---|---|---|---|
| Feiguin et al (golden chain) | ✗ ($SU(2)_3$) | ✗ | ✗ | ✗ (PBC) | ✗ | ✗ | implicit (CFT) |
| Poilblanc 2011/2012 | ✗ ($SU(2)_k$) | ✗ (fixed by $\mu$) | ✗ | ✗ (PBC) | ✗ | ✗ | implicit |
| Garjani–Ardonne 2016 | ✗ ($SU(2)_k$) | ✓ (pair create/annihilate) | ✗ | ✗ (PBC) | ✗ | ✗ | ✗ |
| Hollands 2022 | ✓ (any UMTC) | ✗ (intertwiner length fixed) | ✓ | ✓ | ✗ | ✗ | implicit (CFT) |
| Stottmeister 2022 anyon-RG | partial | ✗ | ? | ? | ✓ (RG step) | ✓ | ✓ (Ising worked) |
| Shi–Zhang–Senthil 2025 | n/a (field theory) | ✓ (in CSGL) | ✗ | n/a | n/a | n/a | ✓ |
| Nakajima 2025 | ✓ (any UMTC, dilute) | ✓ (grand canonical) | ✓ (in $d_a$) | n/a | n/a | n/a | dilute only |
| Eck PhD 2025 | ? | ? | ? | ? | ? | ? | ? (review pending) |
| **Our project** | ✓ (any UFC via TensorCategories.jl) | ✓ (pair creation; sectors $N{\pm}2$) | ✓ from start | ✓ | ✓ (R-matrices in hopping) | ✓ (normalised product map; number-changing isometry) | ✓ (OAR) |

Cells filled with `✗` indicate a gap that our project closes for the
first time, modulo an arbitrary unitary fusion category background.

---

## 5. What our project uniquely provides

1. **Any UFC**, not just $SU(2)_k$. Implementation via `TensorCategories.jl`
   means F/R-symbols are exact (Oscar.jl-backed) for any category one
   chooses to write down, including non-multiplicity-free.
2. **Variable N as a structural feature**, not a perturbative add-on.
   Pair creation $\operatorname{Mor}(X_a\otimes X_b, \mathbf{1})$ wired
   into the Hilbert space from the start; $N$ and $N{\pm}2$ sectors
   coexist.
3. **Explicit hopping matrix elements** via F-symbol contraction (no
   prior work writes these out for the categorical setting).
4. **Multiplicities $N_{ab}^c > 1$** handled from definition; most prior
   work assumes multiplicity-free.
5. **Open boundary conditions throughout** — none of the categorical
   prior art uses OBC systematically.
6. **sVec consistency check** — that the construction reproduces free
   fermions and Jordan–Wigner signs is a baseline none of the prior art
   has actually done.
7. **Isometric fine-graining** — two distinct constructions validated:
   the *normalised product map* (universal, category-independent) and
   the *number-changing isometry* using pair creation. Both achieve
   $V^\dagger V = I$ to machine precision for Fibonacci/Ising at L=3,4
   under D4 wavelets.
8. **Continuum limit via OAR** — bridging Stottmeister 2022's anyon-RG
   construction (dense) into the variable-N regime.

---

## 6. Strategic positioning of the paper

The eventual write-up should:

- Cite **Poilblanc 2012** prominently as the closest prior art and show
  reproduction of their results for $SU(2)_k$ as a special case.
- Cite **Garjani–Ardonne 2016** as the variable-N seed, and present our
  framework as the natural generalisation to arbitrary fusion category +
  multiplicities + braiding-in-Hamiltonian.
- Reference **Hollands 2022** for rigorous categorical foundations, then
  state our extension to mobile / variable-N is the new contribution.
- Cite **Stottmeister 2022** + **Osborne–Stottmeister 2021** for the
  continuum-limit / OAR machinery; our isometries plug into that
  framework.
- Cite **Shi–Zhang–Senthil 2025** as the field-theoretic top-down
  approach explicitly calling for microscopic models. Our framework is
  the bottom-up complement.
- Cite **Nakajima–Mehta–Goldman 2025** as the complementary thermodynamic
  approach. Our lattice models provide the microscopic foundation from
  which their dilute distribution function should emerge.
- Validate against **sVec → free fermions** — something no prior work
  has done.
- Demonstrate for **Fibonacci** and compare with **Poilblanc's** results
  as cross-check.
