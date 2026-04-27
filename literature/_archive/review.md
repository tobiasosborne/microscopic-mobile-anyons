# Literature Review: Mobile Anyons from Fusion Categories

## Executive Summary

The problem of mobile (itinerant) anyons on lattices has been studied by several groups,
primarily within the SU(2)_k family. Our review of 16 papers reveals:

**The field is small but active.** Only ~5 papers directly construct microscopic models
for mobile non-abelian anyons. Two very recent papers (2025) approach from complementary
angles (field theory and thermodynamics). The pair-creation direction (Garjani-Ardonne 2016)
has only 4 citations — it's largely unexplored.

**Our project fills real gaps.** No existing work handles general fusion categories,
multiplicities, explicit braiding in dynamics, or provides a rigorous morphism-space
construction. The sVec→fermion consistency check has never been done.

---

## Tier 1: Mobile/Itinerant Anyons (core prior art)

### Poilblanc, Troyer, Ardonne, Bonderson (2011) — 1112.5950
**"Fractionalization of itinerant anyons in one dimensional chains"**

PRL letter. Ising anyons only. First demonstration of charge-anyon separation:
E_{p,m} = E_charge(p, k_m) + E_anyon(m) (Eq. 4). ED on L=24 periodic chains,
density rho=2/3. Charge sector = hard-core bosons. Anyon sector = squeezed dense
chain (Ising CFT, c=1/2). Preliminary version of the 2012 paper.

### Poilblanc, Feiguin, Troyer, Ardonne, Bonderson (2012) — 1210.5605
**"One-dimensional itinerant interacting non-Abelian anyons"**

**The key prior work paper.** Full treatment for Ising and Fibonacci anyons.

*Hilbert space:* Fusion tree basis. Site labels alpha_i in {I, sigma/tau}, bond labels
x_i = cumulative fusion outcome. Hard-core. Dim ~ C(L,N) * d_a^N.

*Hamiltonian (anyonic t-J model):*
- Hopping -t: moves quasiparticle to adjacent vacancy. **No explicit matrix form given.**
- Exchange J: F-symbol transformation to project onto vacuum channel.
  - Ising (Eq.17): h = [[V-J/2, -J/2],[-J/2, V-J/2]] in {I,psi} basis
  - Fibonacci (Eq.20): h = [[V-J/phi^2, -J/phi^{3/2}],[-J/phi^{3/2}, V-J/phi]]
- F-symbols: Fibonacci F^tau_{tau,tau,tau} = [[phi^{-1}, phi^{-1/2}],[phi^{-1/2}, -phi^{-1}]]

*Results:* Charge-anyon fractionalization (Eq.27). CFT c_total = 1 + c_anyon.
DMRG on L=72 confirms c=1.7 for Fibonacci.

*Gaps:* SU(2)_k only, multiplicity-free, PBC, no braiding, hopping implicit, no sVec check.

### Garjani & Ardonne (2016) — 1608.04927
**"Anyon Chains with Pairing Terms"**

Adds pair creation/annihilation to anyonic chains, enabling variable particle number.

*Nine-term Hamiltonian (Eq.13):* 4 chemical potentials + exchange J + hopping t
+ pair creation Delta + pair annihilation Delta.

*Pair creation (Eq.25):* h_Delta|x,x,x> = Delta * sum_u sqrt(d_u/(d_x*d_{1/2})) |x,u,x>
*Pair annihilation (Eq.26):* hermitian conjugate, projects onto vacuum fusion channel.

*F-symbols (Eq.68):* F_x^{x,1/2,1/2} = (1/sqrt(d_{1/2}*d_x))
  [[sqrt(d_{x-1/2}), sqrt(d_{x+1/2})],[sqrt(d_{x+1/2}), -sqrt(d_{x-1/2})]]

*Exact ground states:* AKLT-like projector point (Eq.28). Exist for odd k only.
Open chain: (k+1)(k+2)(k+3)/6 states. Closed: (k+1)/2.

*Integrability:* Dilute Temperley-Lieb algebra. R-matrix (Eq.52). Four integrable
points with CFTs M_{k+2}, M_3 x M_{k+1}, M_{k+1}.

*Gaps:* SU(2)_k, multiplicity-free, spin-1/2 only, self-dual only, no braiding.
**Only 4 citations** — the pair-creation direction is largely unexplored.

### Shi, Zhang, Senthil (2025) — 2505.02893
**"Doping lattice non-abelian quantum Hall states"**

**Does NOT preempt our work.** Entirely field-theoretic (CSGL effective theory), no
microscopic Hamiltonian, no Hilbert space construction, no lattice model. 2+1D focus.

*Approach:* U(2) Chern-Simons-Ginzburg-Landau theory for doped Read-Rezayi states.
Mean-field analysis of Higgs patterns. No numerics.

*Results:* Phase diagram for doped RR_k (Fig.2): superconductivity (even k) or CDW-FL
(odd k, ferromagnetic). Paramagnetic case always gives c_=-1/2 topological SC.

*Key gap:* They explicitly call for microscopic models and numerical studies (p.34-35).
Our framework provides exactly that. The approaches are complementary (their top-down
field theory vs our bottom-up lattice construction).

*Note:* Does not cite Poilblanc or any microscopic anyonic chain literature.

### Nakajima, Mehta, Goldman (2025) — 2508.14961
**"Thermodynamics of dilute anyon gases from fusion constraints"**

Complementary to our work. Continuum, dilute limit. F-symbols NOT needed.

*Central result (Eq.1.1):* Distribution function n_ell(epsilon) = [sum_m m*d_{a_m}*y^m]
/ [sum_m d_{a_m}*y^m], where d_{a_m} = quantum dimensions along occupation sequence.

*Categories:* General UMTCs. Treats Laughlin, Fibonacci, SU(N)_k. Uses only quantum
dimensions and fusion rules — no F-symbols or R-symbols in dilute regime.

*Connection:* Their dilute-gas thermodynamics could emerge from our lattice models
at low density. At finite density / strong coupling, our approach is needed.

### Soni, Troyer, Poilblanc (2015) — 1508.04160
**"Effective models of doped quantum ladders of non-Abelian anyons"**

Extension to 2-leg and 3-leg ladders. Fibonacci anyons (k=3) only. Zig-zag fusion
path requires braid conjugation for leg interactions. Six phases identified including
novel "heavy/light tau" phase. Charge-anyon separation persists on ladders.
Secondary relevance — confirms robustness of 1D framework.

### Pfeifer (2015) — 1505.06928
**"Phase diagram for hard-core Z3 anyons on the ladder"**

Abelian Z3 anyons on a ladder (minimal geometry for braiding to matter). iDMRG.
Finds novel "hole crystal" phase with no fermionic/bosonic analog — purely
statistics-driven. Moderate relevance: demonstrates that even abelian anyonic
statistics produce new itinerant phases.

---

## Tier 2: Dense Anyonic Chains (foundational, no mobility)

### Feiguin et al. (2006) — cond-mat/0612341
**"The golden chain"**

Foundational paper. Fully-packed Fibonacci chain.

*Construction:* L tau-anyons, fusion tree basis. Dim = Fibonacci numbers ~ phi^L.
Hamiltonian projects neighboring pair onto vacuum via F-matrix (Eq.1-2).
F^tau_{tau,tau,tau} = [[phi^{-1}, phi^{-1/2}],[phi^{-1/2}, -phi^{-1}]].

*Results:* AF critical at c=7/10 (tricritical Ising). FM at c=4/5 (3-state Potts).
Topological symmetry Y protects criticality. Maps to RSOS/Temperley-Lieb.
General SU(2)_k: c = 1 - 6/((k+1)(k+2)).

*Relevance:* Dense limit our models must recover. F-matrix mechanism is identical.

### Trebst et al. (2008) — 0801.4602
**"Collective states of interacting Fibonacci anyons"**

Phase diagram for Fibonacci chain with general couplings. Extends golden chain.

### Gils et al. (2008) — 0810.2277
**"Collective states of interacting anyons, edge states, nucleation"**

General SU(2)_k anyonic chains with edge states. Systematic study.

### Ardonne et al. (2010) — 1012.1080
**"Microscopic models of interacting Yang-Lee anyons"**

Non-unitary counterpart of Fibonacci (Galois conjugate, q=e^{4pi i/5}).
Same fusion rules tau x tau = 1 + tau but non-unitary F-symbols (contain i).
Non-Hermitian Hamiltonian with real spectrum. CFTs: M(3,5) c=-3/5 (AF),
M(2,5) c=-22/5 (FM). Dense chain only. Demonstrates Galois conjugation
framework for systematic generation of non-unitary anyon models.

### Finch, Flohr, Frahm (2017) — 1710.09620
**"Z_n clock models and chains of so(n)_2 anyons"**

Beyond SU(2)_k: uses so(n)_2 fusion categories. Integrability and CFT.

---

## Tier 3: Mathematical/Categorical Framework

### Hollands (2022) — 2205.15243
**"Anyonic Chains — alpha-Induction — CFT — Defects — Subfactors"**

**The most mathematically rigorous treatment.** Formalizes anyonic chains via subfactor
theory (type III von Neumann factors).

*Hilbert space:* Sequences of intertwiners in Jones tunnel = Mor(1, X_1 ⊗ ... ⊗ X_N).
Handles multiplicities throughout. No creation/annihilation operators.

*Hamiltonian:* Jones projections satisfying TLJ algebra (Eq.3): e_i e_{i±1} e_i = d^{-1} e_i.
Explicit matrix elements via 6j-symbols (Eq.144-145).

*Key structures:*
- MPO symmetry operators O^L_A satisfying fusion algebra (Theorem 1)
- Double triangle algebra and its representation (Theorem 2)
- Sector decomposition V^L = ⊕ V^L_{lambda,mu} matching CFT conformal blocks
- Defect algebra classification (Theorem 4)
- Modular invariant Z_{mu,nu} = dim Hom(alpha^+_mu, alpha^-_nu)

*Generality:* Any unitary modular tensor category. Full multiplicities.

*Relevance:* Provides the categorical formalization we need. The intertwiner path
construction, 6j-symbol conventions, and MPO framework can be extracted from the
subfactor language and rephrased categorically. This is the paper to follow for
mathematical rigor.

*Limitation:* Dense chains only — no mobile anyons, no hopping, no vacancies.

### Huston, Burnell, Jones, Penneys (2022) — 2208.14018
**"Composing topological domain walls and anyon mobility"**

**NOT about our kind of mobility.** "Anyon mobility" = which anyons tunnel through
a 2+1D domain wall. Uses enriched fusion categories, 3-categorical machinery,
Walker-Wang models. No 1D Hamiltonians.

One useful insight: tunneling operators are the domain-wall analog of hopping
operators, and decompose via partial isometries through wall excitations — a
structural parallel to hopping through fusion channels.

---

## Tier 4: Related but Low Relevance

### Gamayun et al. (2023) — 2301.02164
**"Emergence of anyonic correlations from spin and charge dynamics in 1D"**

**Not relevant.** Uses "anyon" in the abelian 1D statistical-transmutation sense
(Girardeau mapping). No fusion categories, no non-abelian anyons, no topological
structure. Different tradition entirely (integrable models, Bethe ansatz).

### Belletête et al. (2020) — 2003.11293
**"Topological defects in periodic RSOS models and anyonic chains"**

Defects in dense RSOS/anyonic chains. Related to Hollands' framework.

---

## Citation Chase Results (Google Scholar via Playwright)

### Who cites Garjani-Ardonne 2016? — 4 citations total
Only 2 independent citations (Shen et al. 2020, 2021 on intermediate statistics)
plus the first author's PhD thesis. **No one has extended the pair-creation framework.**
This is a wide-open direction.

### Other citation chases
Results for Poilblanc 2012, Golden chain, and Shi 2025 pending final compilation.
Preliminary indication: the mobile anyon subfield has <20 papers total.

---

## Gap Analysis: What Our Project Uniquely Provides

| Aspect | Best existing work | Gap | Our contribution |
|--------|-------------------|-----|-----------------|
| **Categories** | SU(2)_k only | No general framework | Any modular FC via TensorCategories.jl |
| **Multiplicities** | All papers assume N_{ab}^c ∈ {0,1} | N_{ab}^c > 1 untreated | Must handle from start |
| **Braiding in H** | Never used in any Hamiltonian | No exchange dynamics | R-matrices in hopping terms |
| **Boundary conditions** | PBC for ED, OBC only for EE | No systematic OBC | OBC throughout |
| **sVec → fermions** | Never checked | Critical validation missing | First priority |
| **Hilbert space** | Fusion trees used informally | No Mor(1, X₁⊗...⊗Xₙ) | Formal categorical construction |
| **Hopping operator** | Left implicit (Poilblanc) | No explicit matrix form | Must derive via F-symbols |
| **Pair creation** | Garjani-Ardonne (SU(2)_k) | Not generalized | Generalize to any FC |
| **Code** | No public implementations | No reproducibility | TensorCategories.jl + exact diag |
| **Thermodynamics** | Nakajima 2025 (dilute, no F) | Lattice thermo unknown | Complementary exact results |
| **Mathematical rigor** | Hollands 2022 (subfactors) | Dense chains only | Extend to mobile setting |

## Strategic Positioning

Our paper should:

1. **Cite Poilblanc 2012 prominently** as the closest prior art and show we reproduce
   their results for SU(2)_k as a special case.
2. **Extend Garjani-Ardonne's pairing terms** to general fusion categories.
3. **Reference Hollands 2022** for the rigorous categorical framework and note we extend
   it to the mobile (dilute) setting.
4. **Cite Nakajima 2025** as the complementary thermodynamic approach and note our
   lattice models provide the microscopic foundation their dilute limit emerges from.
5. **Note Shi-Zhang-Senthil 2025** as the field-theoretic approach that explicitly
   calls for the kind of microscopic models we construct.
6. **Validate against sVec** — something no prior work has done.
7. **Demonstrate for Fibonacci** and compare with Poilblanc's results to confirm consistency.
