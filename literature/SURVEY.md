# Literature Survey — Mobile Anyons from Fusion Categories

> Generated from `literature/db/papers.sqlite`. Edit the DB, not this file.

## Anchor seeds

| arXiv/DOI | Authors | Year | Title | Reason |
|-----------|---------|------|-------|--------|
| 1112.5950 | Poilblanc, Troyer, Ardonne, Bonderson | 2011 | Fractionalization of itinerant anyons in one dimensional chains | first demonstration of charge-anyon fractionalization for itinerant anyons |
| 1210.5605 | Poilblanc, Feiguin, Troyer, Ardonne, Bonderson | 2012 | One-dimensional itinerant interacting non-Abelian anyons | closest prior art on itinerant non-abelian anyons |
| 1608.04927 | Garjani, Ardonne | 2016 | Anyon chains with pairing terms | variable-N pair-creation anchor |
| 2205.15243 | S. Hollands | 2022 | Anyonic Chains, alpha-Induction, CFT, Defects, Subfactors | most rigorous categorical / subfactor formalisation of (dense) anyonic chains |
| 2201.11562 | Stottmeister | 2022 | Anyon braiding and the renormalization group | closest prior art on anyon-side of OAR continuum limit |
| — | Eck | 2025 | Quantum Lattice Models from Fusion Categories | directly named PhD thesis on lattice models from fusion categories; supervisor Fendley |
| 2508.14961 | Nakajima, Mehta, Goldman | 2025 | Thermodynamics of dilute anyon gases from fusion constraints | complementary thermodynamic / dilute approach to var-N anyon gas |
| 2505.02893 | Shi, Zhang, Senthil | 2025 | Doping lattice non-abelian quantum Hall states | anchor for the 2025 FCI/FQAH burst on mobile anyons; explicitly calls for microscopic models |

## Tier 1 — directly defines variable-N anyon Hilbert space from a fusion category

### [paper100] ? (1984) — Fractional Statistics and the Quantum Hall Effect

- **DOI**: 10.1103/physrevlett.53.722
- **PDF status**: stub

### [paper50] ? (1991) — Nonabelions in the fractional quantum hall effect

- **DOI**: 10.1016/0550-3213(91)90407-o
- **PDF status**: stub

### [paper56] ? (1999) — Beyond paired quantum Hall states: Parafermions and incompressible states in the first excited Landau level

- **arXiv**: cond-mat/9809384
- **DOI**: 10.1103/physrevb.59.8084
- **PDF status**: have_pdf (`literature/pdfs/cond-mat_9809384.pdf`)

### [paper94] ? (2000) — Paired states of fermions in two dimensions with breaking of parity and time-reversal symmetries and the fractional quantum Hall effect

- **arXiv**: cond-mat/9906453
- **DOI**: 10.1103/physrevb.61.10267
- **PDF status**: have_pdf (`literature/pdfs/cond-mat_9906453.pdf`)

### [PoilblancTroyerArdonneBonderson2012] Poilblanc, Troyer, Ardonne, Bonderson (2011) — Fractionalization of itinerant anyons in one dimensional chains 🔑

- **arXiv**: 1112.5950
- **DOI**: 10.1103/physrevlett.108.207201
- **Venue**: Phys. Rev. Lett. 108, 207201 (2012)
- **PDF status**: have_pdf (`literature/pdfs/1112.5950.pdf`)
- **Notes**: PRL letter, Ising anyons only. First demonstration of charge-anyon separation: E_{p,m} = E_charge(p,k_m) + E_anyon(m). ED on L=24 periodic chains, density rho=2/3. Charge sector = hard-core bosons. Anyon sector = squeezed dense chain (Ising CFT, c=1/2). Hilbert space: fusion-tree basis, hard-core, dim ~ C(L,N)*d_a^N. Preliminary version of the 2012 paper.

### [PoilblancFeiguinTroyerArdonneBonderson2013] Poilblanc, Feiguin, Troyer, Ardonne, Bonderson (2012) — One-dimensional itinerant interacting non-Abelian anyons 🔑

- **arXiv**: 1210.5605
- **DOI**: 10.1103/physrevb.87.085106
- **Venue**: Phys. Rev. B 87, 085106 (2013)
- **PDF status**: have_pdf (`literature/pdfs/1210.5605.pdf`)
- **Notes**: Closest prior art on itinerant non-abelian anyons. Full treatment for Ising and Fibonacci. Hilbert space: fusion tree basis with site labels alpha_i in {I, sigma/tau} and bond labels x_i = cumulative fusion outcome; hard-core; dim ~ C(L,N)*d_a^N. Hamiltonian (anyonic t-J): hopping -t (no explicit matrix form given); exchange J via F-symbol projection onto vacuum channel (Eq.17 Ising, Eq.20 Fibonacci with phi^-1, phi^-1/2, phi^-3/2). Result: charge-anyon fractionalization (Eq.27); CFT c_total = 1 + c_anyon; DMRG on L=72 confirms c=1.7 for Fibonacci. Gaps: SU(2)_k only, multiplicity-free, PBC, no braiding in H, hopping implicit, no sVec check.

### [SoniTroyerPoilblanc2016] Soni, Troyer, Poilblanc (2015) — Effective models of doped quantum ladders of non-Abelian anyons

- **arXiv**: 1508.04160
- **DOI**: 10.1103/physrevb.93.035124
- **PDF status**: have_pdf (`literature/pdfs/1508.04160.pdf`)
- **Notes**: Extension to 2-leg and 3-leg ladders. Fibonacci anyons (k=3) only. Zig-zag fusion path requires braid conjugation for leg interactions. Six phases identified including novel "heavy/light tau" phase. Charge-anyon separation persists on ladders. Secondary relevance — confirms robustness of 1D framework on quasi-1D geometries.

### [GarjaniArdonne2017] Garjani, Ardonne (2016) — Anyon chains with pairing terms 🔑

- **arXiv**: 1608.04927
- **DOI**: 10.1088/1751-8121/aa5fba
- **Venue**: J. Phys. A: Math. Theor. 50 135201 (2017)
- **PDF status**: have_pdf (`literature/pdfs/1608.04927.pdf`)
- **Notes**: Adds pair creation/annihilation to anyonic chains for SU(2)_k. Nine-term H (Eq.13): 4 chemical potentials + exchange J + hopping t + pair creation Delta + pair annihilation Delta. Pair creation (Eq.25): h_Delta|x,x,x> = Delta sum_u sqrt(d_u/(d_x*d_{1/2})) |x,u,x>. AKLT-like exact ground states for odd k (Eq.28). Integrability: dilute Temperley-Lieb algebra (Eq.52). Four integrable points: M_{k+2}, M_3 x M_{k+1}, M_{k+1}. Gaps: SU(2)_k, multiplicity-free, spin-1/2 only, self-dual only, no braiding. Only 4 GS citations as of 2026 — pair-creation direction unexplored. Variable-N anchor for our project.

### [WildeboerPatraMannaNielsen2020] Wildeboer, Patra, Manna, Nielsen (2017) — Anyonic quasiparticles of hardcore anyons

- **arXiv**: 1711.00845
- **DOI**: 10.1103/physrevb.102.125117
- **PDF status**: have_pdf (`literature/pdfs/1711.00845.pdf`)

### [AnyonicFockSpace2019] Osborne et al. (2019) — Anyonic Fock space (note: filename misnamed; arXiv 1910.10619)

- **arXiv**: 1910.10619
- **PDF status**: have_pdf (`literature/pdfs/1910.10619.pdf`)
- **Notes**: Original review.md / overview.md tagged this as Anyonic Fock Space (1910.10619). Verify after marker conversion.

### [paper317] ? (2024) — Anyon Superconductivity from Topological Criticality in a Hofstadter-Hubbard Model

- **arXiv**: 2410.18175
- **DOI**: 10.48550/arxiv.2410.18175
- **PDF status**: have_pdf (`literature/pdfs/2410.18175.pdf`)
- **Notes**:  [2025 FCI burst]

### [paper319] ? (2025) — Anyon delocalization transitions out of a disordered FQAH insulator

- **arXiv**: 2506.02128
- **DOI**: 10.48550/arxiv.2506.02128
- **PDF status**: have_pdf (`literature/pdfs/2506.02128.pdf`)
- **Notes**:  [2025 FCI burst]

### [paper456] Clemens Kuhlenkamp, Stefan Divic, Michael P. Zaletel, Tomohiro Soejima, Ashvin Vishwanath (2025) — Robust superconductivity upon doping chiral spin liquid and Chern insulators in a Hubbard-Hofstadter model

- **arXiv**: 2509.02675
- **PDF status**: metadata_only
- **Notes**:  [2025 FCI burst]

### [EckThesis2025] Eck (2025) — Quantum Lattice Models from Fusion Categories 🔑

- **Venue**: PhD thesis, University of Oxford (Balliol)
- **PDF status**: have_pdf (`literature/pdfs/eck_phd_thesis_oxford_2025.pdf`)
- **Notes**: Newly discovered. Directly relevant. Need to extract her papers (per acknowledgements: 2 papers with Fendley + 1 in 2+1d).

### [paper452] Fabian Pichler, Clemens Kuhlenkamp, Michael Knap, Ashvin Vishwanath (2025) — Microscopic Mechanism of Anyon Superconductivity Emerging from Fractional Chern Insulators

- **arXiv**: 2506.08000
- **PDF status**: metadata_only
- **Notes**:  [2025 FCI burst]

### [KirchnerMoessnerPollmannGammonSmith2025] Kirchner, Moessner, Pollmann, Gammon-Smith (2025) — Phases of Interacting Fibonacci Anyons on a Ladder at Half-Filling

- **arXiv**: 2507.22115
- **PDF status**: have_pdf (`literature/pdfs/2507.22115.pdf`)

### [paper454] Mina-Lou Schleith, Tomohiro Soejima, Eslam Khalaf (2025) — Anyon dispersion from non-uniform magnetic field on the sphere

- **arXiv**: 2506.11211
- **PDF status**: metadata_only
- **Notes**:  [2025 FCI burst]

### [NakajimaMehtaGoldman2025] Nakajima, Mehta, Goldman (2025) — Thermodynamics of dilute anyon gases from fusion constraints 🔑

- **arXiv**: 2508.14961
- **PDF status**: have_pdf (`literature/pdfs/2508.14961.pdf`)
- **Notes**: Complementary continuum/dilute approach. Distribution function (Eq.1.1): n_ell(epsilon) = [sum_m m*d_{a_m}*y^m] / [sum_m d_{a_m}*y^m] where d_{a_m} = quantum dimensions along occupation sequence. General UMTCs; Laughlin, Fibonacci, SU(N)_k. Uses ONLY quantum dimensions and fusion rules — no F-symbols, no R-symbols. Their dilute-gas thermodynamics could emerge from our lattice models at low density. At finite density / strong coupling, our lattice approach is needed.

### [ShiZhangSenthil2025] Shi, Zhang, Senthil (2025) — Doping lattice non-abelian quantum Hall states 🔑

- **arXiv**: 2505.02893
- **PDF status**: have_pdf (`literature/pdfs/2505.02893.pdf`)
- **Notes**: Field-theoretic (CSGL effective theory) for doped Read-Rezayi states; no microscopic Hamiltonian, no Hilbert space construction, no lattice model. 2+1D focus. Approach: U(2) Chern-Simons-Ginzburg-Landau, mean-field analysis of Higgs patterns, no numerics. Phase diagram for doped RR_k (Fig.2): superconductivity (even k) or CDW-FL (odd k, ferromagnetic). Paramagnetic case always gives c=-1/2 topological SC. Explicitly calls for microscopic models (p.34-35) — our framework provides exactly that. Anchor for the 2025 FCI burst.

### [paper457] Ya-Hui Zhang (2025) — Holon metal, charge-density-wave and chiral superconductor from doping fractional Chern insulator and SU(3)$_1$ chiral spin liquid

- **arXiv**: 2506.00110
- **PDF status**: metadata_only
- **Notes**:  [2025 FCI burst]

### [paper453] Zhaoyu Han, Taige Wang, Zhihuan Dong, Michael P. Zaletel, Ashvin Vishwanath (2025) — Anyon superfluidity of excitons in quantum Hall bilayers

- **arXiv**: 2508.14894
- **PDF status**: metadata_only
- **Notes**:  [2025 FCI burst]

### [paper455] Zhengyan Darius Shi, T. Senthil (2025) — Non-Abelian topological superconductivity from melting Abelian fractional Chern insulators

- **arXiv**: 2512.17996
- **PDF status**: metadata_only
- **Notes**:  [2025 FCI burst]

### [paper458] Donghae Seo, Taegon Lee, Gil Young Cho (2026) — A Unified Categorical Description of Quantum Hall Hierarchy and Anyon Superconductivity

- **arXiv**: 2602.03848
- **PDF status**: metadata_only
- **Notes**:  [2025 FCI burst]

## Tier 2 — dense anyonic chain ancestry

### [FeiguinTrebstLudwigTroyerKitaevWangFreedman2007] Feiguin, Trebst, Ludwig, Troyer, Kitaev, Wang, Freedman (2006) — Interacting anyons in topological quantum liquids: The golden chain

- **arXiv**: cond-mat/0612341
- **DOI**: 10.1103/physrevlett.98.160409
- **PDF status**: have_pdf (`literature/pdfs/cond-mat_0612341.pdf`)
- **Notes**: Dense Fibonacci chain. Fusion tree basis, dim ~ phi^L. Hamiltonian projects neighboring pair onto vacuum via F-matrix (Eq.1-2). F^tau_{tau,tau,tau} = [[phi^-1, phi^-1/2],[phi^-1/2, -phi^-1]]. AF critical at c=7/10 (tricritical Ising). FM at c=4/5 (3-state Potts). Topological Y-symmetry protects criticality. Maps to RSOS/Temperley-Lieb. General SU(2)_k: c = 1 - 6/((k+1)(k+2)). Dense limit our models must recover. F-matrix mechanism is identical.

### [Trebst2008] Trebst, Ardonne, Feiguin, Huse, Ludwig, Troyer (2008) — Collective states of interacting Fibonacci anyons

- **arXiv**: 0801.4602
- **DOI**: 10.1103/physrevlett.101.050401
- **PDF status**: have_pdf (`literature/pdfs/0801.4602.pdf`)

### [DeGottardi2014] DeGottardi (2014) — Topological Insulating Phases of Non-Abelian Anyonic Chains

- **arXiv**: 1403.3101
- **DOI**: 10.1103/physrevb.90.075129
- **PDF status**: have_pdf (`literature/pdfs/1403.3101.pdf`)

### [FinchFrahmGainutdinovKorff2014] Finch, Frahm, Gainutdinov, Korff (2014) — Integrable anyon chains: From fusion rules to face models to C*-algebras

- **arXiv**: 1408.1282
- **DOI**: 10.1016/j.nuclphysb.2014.10.017
- **PDF status**: have_pdf (`literature/pdfs/1408.1282.pdf`)

### [FinchFrahmLewerenzMilstedOsborne2014] Finch, Frahm, Lewerenz, Milsted, Osborne (2014) — Quantum phases of a chain of strongly interacting anyons

- **arXiv**: 1404.2439
- **DOI**: 10.1103/physrevb.90.081111
- **PDF status**: have_pdf (`literature/pdfs/1404.2439.pdf`)

### [SoniThesis2016] Soni (2016) — Etude d'etats exotiques correles de la matiere en basse dimension

- **Venue**: PhD thesis, Universite Paul Sabatier - Toulouse III; HAL tel-01760790
- **PDF status**: have_pdf (`literature/pdfs/soni_phd_thesis_toulouse_2016.pdf`)
- **Notes**: Likely contains the Soni-Troyer-Poilblanc 2015 ladder work.

### [AyeniPfeiferBrennen2018] Ayeni, Pfeifer, Brennen (2017) — Phase transitions on a ladder of braided non-Abelian anyons

- **arXiv**: 1712.04179
- **DOI**: 10.1103/physrevb.98.045432
- **Venue**: Phys. Rev. B 98, 045432 (2018)
- **PDF status**: have_pdf (`literature/pdfs/1712.04179.pdf`)

## Tier 3 — categorical / mathematical foundations

### [LeinaasMyrheim1977] Leinaas, Myrheim (1977) — On the theory of identical particles

- **DOI**: 10.1007/bf02727953
- **Venue**: Nuovo Cimento B 37, 1-23
- **PDF status**: have_pdf (`literature/pdfs/leinaas_myrheim_nuovo_cimento_1977.pdf`)
- **Notes**: Foundational identical-particle / anyon configuration-space formalism.

### [paper177] ? (1982) — Quantum Mechanics of Fractional-Spin Particles

- **DOI**: 10.1103/physrevlett.49.957
- **PDF status**: stub

### [paper103] ? (1989) — Superselection sectors with braid group statistics and exchange algebras

- **DOI**: 10.1007/bf01217906
- **PDF status**: stub

### [paper128] ? (1989) — Quantum field theory and the Jones polynomial

- **DOI**: 10.1007/bf01217730
- **PDF status**: stub

### [EtingofNikshychOstrik2005] Etingof, Nikshych, Ostrik (2005) — On fusion categories

- **arXiv**: math/0203060
- **Venue**: Annals of Math. 162 (2005)
- **PDF status**: have_pdf (`literature/pdfs/math_0203060.pdf`)

### [Kitaev2006] Kitaev (2005) — Anyons in an exactly solved model and beyond

- **arXiv**: cond-mat/0506438
- **DOI**: 10.1016/j.aop.2005.10.005
- **PDF status**: have_pdf (`literature/pdfs/cond-mat_0506438.pdf`)

### [paper66] ? (2008) — A Short Introduction to Fibonacci Anyon Models

- **arXiv**: 0902.3275
- **DOI**: 10.1143/ptps.176.384
- **PDF status**: have_pdf (`literature/pdfs/0902.3275.pdf`)

### [paper114] ? (2008) — Interferometry of non-Abelian anyons

- **arXiv**: 0707.4206
- **DOI**: 10.1016/j.aop.2008.01.012
- **PDF status**: have_pdf (`literature/pdfs/0707.4206.pdf`)

### [EtingofLectures2009] Etingof (2009) — Tensor Categories (Lecture Notes)

- **PDF status**: have_pdf (`literature/pdfs/etingof_tensor_categories_lectures_2009.pdf`)

### [paper59] ? (2010) — Topological Quantum Computation

- **DOI**: 10.1090/cbms/112
- **PDF status**: stub

### [EGNO2015] Etingof, Gelaki, Nikshych, Ostrik (2015) — Tensor Categories

- **Venue**: AMS Mathematical Surveys and Monographs vol. 205
- **PDF status**: have_pdf (`literature/pdfs/etingof_tensor_categories_book_2015.pdf`)
- **Notes**: Standard reference book.

### [PenneysNotes] Penneys (2020) — Unitary fusion categories (Math 8800 lecture notes)

- **Venue**: OSU Math 8800 lecture notes
- **PDF status**: have_pdf (`literature/pdfs/penneys_math8800_unitary_fusion_categories.pdf`)
- **Notes**: Course material reference.

### [paper40] Peter Huston, Fiona Burnell, Corey Jones, David Penneys (2022) — Composing topological domain walls and anyon mobility

- **arXiv**: 2208.14018
- **PDF status**: have_pdf (`literature/pdfs/2208.14018.pdf`)

### [Hollands2022] S. Hollands (2022) — Anyonic Chains, alpha-Induction, CFT, Defects, Subfactors 🔑

- **arXiv**: 2205.15243
- **DOI**: 10.1007/s00220-022-04581-w
- **Venue**: Communications in Mathematical Physics
- **PDF status**: have_pdf (`literature/pdfs/2205.15243.pdf`)
- **Notes**: Most rigorous categorical / subfactor formalisation of (DENSE) anyonic chains. Hilbert space: sequences of intertwiners in Jones tunnel = Mor(1, X_1 tensor ... tensor X_N). Handles multiplicities throughout. NO creation/annihilation — fixed N. Hamiltonian: Jones projections satisfying TLJ algebra (Eq.3): e_i e_{i±1} e_i = d^-1 e_i. Explicit matrix elements via 6j-symbols (Eq.144-145). Key structures: MPO symmetries (Theorem 1), double triangle algebra (Theorem 2), sector decomposition matching CFT conformal blocks, defect algebra classification (Theorem 4), modular invariant Z_{mu,nu} = dim Hom(alpha^+_mu, alpha^-_nu). Generality: any unitary modular tensor category, full multiplicities. Provides the categorical formalization we need; the intertwiner path construction can be extracted from subfactor language. Limitation: dense chains only — no mobile anyons, no hopping, no vacancies.

### [Stottmeister2022Anyon] Stottmeister (2022) — Anyon braiding and the renormalization group 🔑

- **arXiv**: 2201.11562
- **PDF status**: have_pdf (`literature/pdfs/2201.11562.pdf`)
- **Notes**: Closest prior art on the OAR continuum-limit side. Braiding operation defines a real-space RG step on anyonic chains; OAR (operator-algebraic renormalization) defines a quantum scaling limit via the resulting RG flow. Worked example: Ising chain (transverse-field Ising) -> vacuum state of Ising CFT. Distinguishing braiding vs inverse -> chiral sectors of Ising CFT. Direct implications for simulating CFTs on topological quantum computers. Builds on Osborne-Stottmeister 2107.13834, Stottmeister-Morinelli-Morsella-Tanimoto 2002.01442, Osborne 1901.06124. Dense chain only; no variable-N.

## Tier 4 — numerical methods for anyonic systems

### [SinghPfeiferVidalBrennen2014] Singh, Pfeifer, Vidal, Brennen (2013) — Matrix product states for anyonic systems

- **arXiv**: 1311.0967
- **DOI**: 10.1103/physrevb.89.075112
- **PDF status**: have_pdf (`literature/pdfs/1311.0967.pdf`)

### [AyeniSinghPfeiferBrennen2016] Ayeni, Singh, Pfeifer, Brennen (2015) — Simulation of braiding anyons using matrix product states

- **arXiv**: 1509.00903
- **DOI**: 10.1103/physrevb.93.165128
- **PDF status**: have_pdf (`literature/pdfs/1509.00903.pdf`)

### [AyeniThesis2017] Ayeni (2017) — Studies of braided non-Abelian anyons using anyonic tensor networks

- **Venue**: PhD thesis, Macquarie University
- **PDF status**: have_pdf (`literature/pdfs/ayeni_phd_thesis_macquarie_2017.pdf`)
- **Notes**: PhD thesis. MPS / anyonic tensor networks for variable-N braiding.

### [Mila2019] Mila group (2019) — DMRG investigation of constrained models

- **arXiv**: 1809.00746
- **DOI**: 10.21468/scipostphys.6.3.033
- **PDF status**: have_pdf (`literature/pdfs/1809.00746.pdf`)
- **Notes**: Defer arxiv lookup.

### [Ware2021] Ware et al. (2021) — Perturbative instability of nonergodic phases in non-Abelian quantum chains

- **arXiv**: 2010.10550
- **DOI**: 10.1103/physrevb.103.094203
- **PDF status**: have_pdf (`literature/pdfs/2010.10550.pdf`)
- **Notes**: Defer arxiv lookup.

### [Kirchner2022] Kirchner, Millar, Ayeni, Smith, Slingerland, Pollmann (2022) — Numerical simulation of non-Abelian anyons

- **arXiv**: 2206.14730
- **DOI**: 10.1103/physrevb.107.195129
- **PDF status**: have_pdf (`literature/pdfs/2206.14730.pdf`)

## Tier 5 — adjacent / abelian / triage

### [Girardeau1960] Girardeau (1960) — Relationship between Systems of Impenetrable Bosons and Fermions in One Dimension

- **DOI**: 10.1063/1.1703687
- **Venue**: J. Math. Phys. 1, 516
- **PDF status**: have_pdf (`literature/pdfs/girardeau_jmp_1_516_1960.pdf`)
- **Notes**: Foundational hard-core boson paper. Pre-anyon.

### [paper44] ? (1982) — Two-Dimensional Magnetotransport in the Extreme Quantum Limit

- **DOI**: 10.1103/physrevlett.48.1559
- **PDF status**: stub

### [paper42] ? (1983) — Anomalous Quantum Hall Effect: An Incompressible Quantum Fluid with Fractionally Charged Excitations

- **DOI**: 10.1103/physrevlett.50.1395
- **PDF status**: stub

### [paper135] ? (1987) — Observation of an even-denominator quantum number in the fractional quantum Hall effect

- **DOI**: 10.1103/physrevlett.59.1776
- **PDF status**: stub

### [paper45] ? (2001) — Unpaired Majorana fermions in quantum wires

- **arXiv**: cond-mat/0010440
- **DOI**: 10.1070/1063-7869/44/10s/s29
- **PDF status**: have_pdf (`literature/pdfs/cond-mat_0010440.pdf`)

### [Girardeau2006] Girardeau (2006) — Anyon-Fermion Mapping and Applications to Ultracold Gases in Tight Waveguides

- **DOI**: 10.1103/physrevlett.97.100402
- **PDF status**: have_pdf (`literature/pdfs/girardeau_prl_97_100402_2006.pdf`)
- **Notes**: Abelian Girardeau-style anyons.

### [BatchelorQISM2008] Batchelor et al. (2008) — The quantum inverse scattering method with anyonic grading

- **Venue**: J. Phys. A: Math. Theor. 41 465201
- **PDF status**: have_pdf (`literature/pdfs/jphysa_41_465201_2008.pdf`)
- **Notes**: Abelian anyonic grading in QISM.

### [paper48] ? (2010) — Majorana Fermions and a Topological Phase Transition in Semiconductor-Superconductor Heterostructures

- **arXiv**: 1002.4033
- **DOI**: 10.1103/physrevlett.105.077001
- **PDF status**: have_pdf (`literature/pdfs/1002.4033.pdf`)

### [paper49] ? (2010) — Helical Liquids and Majorana Bound States in Quantum Wires

- **arXiv**: 1003.1145
- **DOI**: 10.1103/physrevlett.105.177002
- **PDF status**: have_pdf (`literature/pdfs/1003.1145.pdf`)

### [paper47] ? (2012) — Signatures of Majorana Fermions in Hybrid Superconductor-Semiconductor Nanowire Devices

- **arXiv**: 1204.2792
- **DOI**: 10.1126/science.1222360
- **PDF status**: have_pdf (`literature/pdfs/1204.2792.pdf`)

### [paper52] ? (2012) — Zero-bias peaks and splitting in an Al–InAs nanowire topological superconductor as a signature of Majorana fermions

- **arXiv**: 1205.7073
- **DOI**: 10.1038/nphys2479
- **PDF status**: have_pdf (`literature/pdfs/1205.7073.pdf`)

### [paper54] ? (2012) — Anomalous Zero-Bias Conductance Peak in a Nb–InSb Nanowire–Nb Hybrid Device

- **arXiv**: 1204.4130
- **DOI**: 10.1021/nl303758w
- **PDF status**: have_pdf (`literature/pdfs/1204.4130.pdf`)

### [SciPost5_5_052_2018] (SciPost; defer) (2018) — Analysis of the buildup of spatiotemporal correlations after a quantum quench

- **DOI**: 10.21468/scipostphys.5.5.052
- **PDF status**: have_pdf (`literature/pdfs/scipost_5_5_052_2018.pdf`)
- **Notes**: Possibly misfiled — quench dynamics, not anyon Hilbert space. Triage in C9.

### [CarmeloSacramento2018] Carmelo, Sacramento (2018) — Pseudoparticle approach to 1D integrable quantum models

- **DOI**: 10.1016/j.physrep.2018.06.002
- **Venue**: Phys. Rep. 749, 1-90 (2018)
- **PDF status**: have_pdf (`literature/pdfs/carmelo_sacramento_physrep_749_2018.pdf`)
- **Notes**: Abelian/integrable. Likely not categorical-anyon relevant; triage in C9.

### [Manna2018] Manna et al. (2018) — Non-Abelian Quasiholes in Lattice Moore-Read States

- **arXiv**: 1807.11222
- **DOI**: 10.1103/physrevb.98.165147
- **PDF status**: have_pdf (`literature/pdfs/1807.11222.pdf`)
- **Notes**: Defer arxiv lookup; likely fixed-N quasihole construction.

### [Bonkhoff2021] Bonkhoff et al. (2020) — Bosonic Continuum Theory of One-Dimensional Lattice Anyons

- **arXiv**: 2008.00003
- **DOI**: 10.1103/physrevlett.126.163201
- **Venue**: Phys. Rev. Lett. 126, 163201 (2021)
- **PDF status**: have_pdf (`literature/pdfs/2008.00003.pdf`)
- **Notes**: Abelian (anyon-Hubbard) continuum theory; triage in C9.

### [Yang2023] Yang et al. (2023) — Anyons in a tight wave-guide and the Tonks-Girardeau gas

- **DOI**: 10.21468/scipostphyscore.6.4.079
- **PDF status**: have_pdf (`literature/pdfs/scipost_core_6_4_079_2023.pdf`)
- **Notes**: Abelian Tonks-Girardeau anyons, not categorical.


---

Reporting standard borrowed from `Bennett.jl/docs/literature/SURVEY.md` and `Sturm.jl/docs/literature/REPORTING_STANDARD.md`. Tier definitions are in this file's section headers.
