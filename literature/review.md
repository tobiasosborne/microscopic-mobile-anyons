# Literature Review: Mobile Anyons from Fusion Categories

## Executive Summary

The problem of mobile (itinerant) anyons on lattices has been studied by several groups,
primarily within the SU(2)_k family. The key prior work is:

1. **Poilblanc-Feiguin-Troyer-Ardonne-Bonderson (2011-2012)**: Constructed anyonic t-J models
   for Ising and Fibonacci anyons on 1D chains. Demonstrated charge-anyon fractionalization.
   PBC only, no braiding in dynamics, multiplicity-free only.

2. **Garjani-Ardonne (2016)**: Extended dilute anyon chains with pair creation/annihilation
   terms. Found exact (AKLT-like) ground states for odd k. Identified integrable points
   via dilute Temperley-Lieb algebra. Still SU(2)_k, multiplicity-free, no braiding.

3. **Shi-Zhang-Senthil (2025)**: Doped lattice non-abelian QH states. Very recent, 2D focus.

4. **Nakajima-Mehta-Goldman (2025)**: Thermodynamics of dilute anyon gases from fusion
   constraints. Complementary (continuum, dilute limit). F-symbols not needed in their regime.

**What remains open for our project:**
- General fusion categories (not just SU(2)_k)
- Categories with multiplicities (N_{ab}^c > 1)
- Explicit braiding (R-matrices) in dynamics
- Open boundary conditions throughout
- sVec → fermion consistency check
- Rigorous morphism-space construction of Hilbert space
- Code-first implementation via TensorCategories.jl

---

## Tier 1: Directly Addresses Mobile/Itinerant Anyons

### Poilblanc et al. (2011) — 1112.5950
**"Fractionalization of itinerant anyons in one dimensional chains"**

PRL letter, precursor to the 2012 paper. Ising anyons only. Demonstrates charge-anyon
separation for the first time: E_{p,m} = E_charge(p, k_m) + E_anyon(m). ED on L=24
periodic chains at density rho=2/3. The charge sector behaves as hard-core bosons
(= spinless fermions via Jordan-Wigner); the anyon sector is described by the dense
chain CFT (c=1/2 for Ising).

### Poilblanc et al. (2012) — 1210.5605
**"One-dimensional itinerant interacting non-Abelian anyons"**

Full paper extending the 2011 letter. Treats Ising (k=2) and Fibonacci (k=3) anyons.

**Hilbert space:** Fusion tree basis with site labels alpha_i in {I, sigma/tau} and
bond labels x_i encoding cumulative fusion outcomes. Hard-core constraint. Dimension
scales as C(L,N) * (sqrt(2))^N (Ising) or C(L,N) * phi^N (Fibonacci).

**Hamiltonian (anyonic t-J model):**
- Hopping: amplitude -t, moves quasiparticle to adjacent vacancy. No explicit matrix
  form given — action on bond labels left implicit.
- Exchange: J * P_I projects neighboring anyons onto vacuum fusion channel. Uses F-symbol
  transformation. Explicit matrices given:
  - Ising Eq. 17: h_sigma = [[V-J/2, -J/2], [-J/2, V-J/2]] in {I, psi} basis
  - Fibonacci Eq. 20: h_tau = [[V-J/phi^2, -J/phi^{3/2}], [-J/phi^{3/2}, V-J/phi]]
- Coulomb repulsion V.

**Key results:**
- Charge-anyon fractionalization (Eq. 27): E_{p,m} = E_charge(p,k_m) + E_anyon(m)
- Wavefunction factorization (Eq. 30)
- CFT: c_total = 1 + c_anyon. Fibonacci AF: c=7/10, Fibonacci FM: c=4/5
- DMRG on L=72 confirms c=1.7 for Fibonacci at rho=2/3, J>0

**Limitations:** SU(2)_k only, multiplicity-free, PBC, no braiding in dynamics,
hopping operator not explicit, no sVec check, hard-core only.

### Garjani & Ardonne (2016) — 1608.04927
**"Anyon Chains with Pairing Terms"**

Extends dilute anyon chains with pair creation/annihilation, enabling variable particle number.

**Hilbert space:** Dilute fusion chain with site labels y_i in {0, 1/2} and bond labels
x_i in L_k. States are |x_0, ..., x_l>. Explicitly multiplicity-free (stated p.2).

**Hamiltonian — nine terms (Eq. 13):**
1-4. Chemical potentials (diagonal): mu_00, mu_{0,1/2}, mu_{1/2,0}, mu_{1/2,1/2}
5. Exchange interaction J (Eq. 21): projects onto vacuum fusion channel
6-7. Hopping right/left with amplitude t (Eqs. 22-23)
8. Pair creation Delta (Eq. 25): h_Delta creates anyon pair from two vacancies
9. Pair annihilation Delta (Eq. 26): hermitian conjugate

**F-symbols used (Eq. 68):**
F_x^{x,1/2,1/2} = (1/sqrt(d_{1/2} d_x)) [[sqrt(d_{x-1/2}), sqrt(d_{x+1/2})],
                                              [sqrt(d_{x+1/2}), -sqrt(d_{x-1/2})]]

**Exact ground states:** At projector point (Eq. 28: all couplings = 1/2 except
mu_{1/2,1/2} = 0), zero-energy ground states exist for odd k only.
Open chain count: (k+1)(k+2)(k+3)/6. Closed chain: (k+1)/2.

**Integrability:** Dilute Temperley-Lieb algebra with R-matrix (Eq. 52) satisfying
Yang-Baxter. Four integrable points with CFTs:
- +H_1: minimal model M_{k+2}, c = 1 - 6/((k+2)(k+3))
- -H_1: M_3 x M_{k+1}
- +H_2: M_{k+1} (k >= 2)
- -H_2: problematic (large finite-size effects)

**Limitations:** SU(2)_k only, multiplicity-free, spin-1/2 anyons only, self-dual only,
no braiding in dynamics, 1D only.

### Soni, Troyer, Poilblanc (2015) — 1508.04160
**"Effective models of doped quantum ladders of non-Abelian anyons"**

Extension of itinerant anyon t-J models to ladder geometries. [Review pending]

### Shi, Zhang, Senthil (2025) — 2505.02893
**"Doping lattice non-abelian quantum Hall states"**

Very recent, 17 citations. Doping in 2D context. [Review pending — critical to assess overlap]

### Nakajima, Mehta, Goldman (2025) — 2508.14961
**"Thermodynamics of dilute anyon gases from fusion constraints"**

**Approach:** Partition function for dilute anyon gas using fusion constraints only (no F/R-symbols).
Defines "occupation sequences" from iterated fusion of lightest anyon. Single-state partition
function z(epsilon) = sum_n d_{a_n} exp(-beta*n*(epsilon-mu)).

**Central result (Eq. 1.1/4.9):** General distribution function
n_ell(epsilon) = [sum_m m d_{a_m} y^m] / [sum_m d_{a_m} y^m], y = exp(-beta(epsilon-mu))

Recovers Fermi-Dirac (k=1) and Bose-Einstein (k->infinity) as limits. Computes Fibonacci
distribution explicitly (Eq. 5.15).

**Connection to us:** Strongly complementary. They provide the thermodynamic limit of
the dilute regime; we provide the microscopic lattice Hamiltonian. Their framework uses
only quantum dimensions, not F-symbols. At strong coupling / finite density, our lattice
approach is needed.

### Pfeifer (2015) — 1505.06928
**"Phase diagram for hard-core Z3 anyons on the ladder"**

[Review pending]

---

## Tier 2: Dense Anyonic Chains (Foundational)

### Feiguin et al. (2006) — cond-mat/0612341
**"Interacting anyons in topological quantum liquids: The golden chain"**

The foundational paper. Fully-packed chain of Fibonacci anyons.

**Construction:** L tau-anyons on a chain, every site occupied. Hilbert space from fusion
tree with link labels x_i in {1, tau}. Dimension = Fibonacci numbers ~ phi^L.

**Hamiltonian (Eq. 1):** H_i projects neighboring pair onto vacuum fusion channel via
F-matrix transformation. Explicit F-matrix (Eq. 2):
F^tau_{tau,tau,tau} = [[phi^{-1}, phi^{-1/2}], [phi^{-1/2}, -phi^{-1}]]
H_i = -[[phi^{-2}, phi^{-3/2}], [phi^{-3/2}, phi^{-1}]]

**Key results:**
- Antiferromagnetic case: critical, c=7/10 (tricritical Ising CFT)
- Ferromagnetic case: c=4/5 (3-state Potts CFT)
- General SU(2)_k: c = 1 - 6/((k+1)(k+2))
- Topological symmetry Y protects criticality
- Temperley-Lieb algebra: X_i^2 = d*X_i with d=phi
- Maps to RSOS model at k=3

**Relevance:** This is the dense limit that mobile anyon models must recover when all
sites are occupied. The F-matrix transformation for interactions is the same mechanism
used in the mobile case.

### Trebst et al. (2008) — 0801.4602
**"Collective states of interacting Fibonacci anyons"**

Phase diagram for Fibonacci chain with general couplings. [Review pending]

### Gils et al. (2008) — 0810.2277
**"Collective states of interacting anyons, edge states, nucleation"**

General SU(2)_k anyonic chains, edge states. [Review pending]

### Ardonne et al. (2010) — 1012.1080
**"Microscopic models of interacting Yang-Lee anyons"**

Non-unitary anyon models. [Review pending]

### Finch, Flohr, Frahm (2017) — 1710.09620
**"Z_n clock models and chains of so(n)_2 non-Abelian anyons"**

Beyond SU(2)_k family. [Review pending]

---

## Tier 3: Mathematical/Categorical Framework

### Hollands (2022) — 2205.15243
**"Anyonic Chains — alpha-Induction — CFT — Defects — Subfactors"**

Mathematical framework for anyonic chains using category theory. [Review pending —
potentially the most rigorous treatment relevant to our categorical approach]

### Huston, Burnell, Jones, Penneys (2022) — 2208.14018
**"Composing topological domain walls and anyon mobility"**

**NOT about mobile anyons on a 1D chain.** "Anyon mobility" here means which anyons
can tunnel through a topological domain wall in 2+1D. Uses enriched fusion categories,
3-categorical machinery, Walker-Wang models. The framework is much more elaborate than
what we need.

**One useful insight:** Their tunneling operators (cross a wall) are the domain-wall
analog of our hopping operators. Tunneling channels decompose as partial isometries
factoring through wall excitations — structurally parallel to how hopping factors through
fusion channels. But no direct tools for 1D Hamiltonians.

---

## Tier 4: Related Physics

### Gamayun et al. (2023) — 2301.02164
**"Emergence of anyonic correlations from spin and charge dynamics in 1D"**

[Review pending — assess whether this is about abelian statistical transmutation
or genuinely related to non-abelian fusion category anyons]

---

## Gap Analysis vs. PRD

| Requirement | Prior art status | Our contribution |
|-------------|-----------------|------------------|
| General fusion categories | SU(2)_k only | Any modular FC via TensorCategories.jl |
| Multiplicities N_{ab}^c > 1 | Not treated anywhere | Must handle from start |
| Braiding in dynamics | Not used in any Hamiltonian | R-matrices in hopping terms |
| Open BCs | PBC in ED, OBC only for DMRG EE | OBC throughout |
| sVec → fermions | Not checked by anyone | Critical validation |
| Morphism-space construction | All papers use fusion trees informally | Formal Mor(1, X_1⊗...⊗X_N) |
| Code implementation | No public code | TensorCategories.jl + exact diag |
| Variable particle number | Garjani-Ardonne 2016 (pairing) | Adopt and generalize |
| Thermodynamics | Nakajima 2025 (dilute, no F-symbols) | Complementary (lattice, exact) |

## Papers Still Needing Review

- Shi-Zhang-Senthil 2025 (2505.02893) — CRITICAL, may preempt 2D aspects
- Hollands 2022 (2205.15243) — categorical framework
- Trebst 2008, Gils 2008, Ardonne 2010, Finch 2017 — dense chain details
- Gamayun 2023 — relevance TBD
- Soni 2015, Pfeifer 2015 — ladder/Z3 extensions

## Citation Chase Status

Google Scholar citation searches launched for:
- Poilblanc 2012 (who cites the itinerant anyon paper?)
- Golden chain 2006 (filter for mobile/doped descendants)
- Shi-Zhang-Senthil 2025 (catch newest work)
- Garjani-Ardonne 2016 (pairing term followers)

Results pending.
