# Critical Review: Garjani & Ardonne (2017) — "Anyon chains with pairing terms"

**Paper:** J. Phys. A: Math. Theor. 50 (2017) 135201
**Authors:** B. Majidzadeh Garjani, E. Ardonne
**Reviewed for:** Mobile Anyons from Fusion Categories Project
**Date:** December 2025

---

## Executive Summary

This paper extends the dilute anyon chain model (from Poilblanc et al. 2012) by adding **pairing terms** that create and annihilate pairs of anyons, analogous to Cooper pair creation in BCS superconductivity. The model uses su(2)_k anyons and demonstrates exact ground states at special parameter values (for odd k), as well as integrable points with CFT descriptions.

**Relevance to our project:** This paper addresses anyon number fluctuation via pair creation/annihilation—directly relevant to our requirement R2 (variable anyon number). However, it still restricts to su(2)_k categories and multiplicity-free fusion rules.

---

## 1. Summary of What Has Been Done

### 1.1 Model Construction

**Hilbert space:**
- Chain of $l$ sites, each either empty (label 0) or occupied by a spin-1/2 anyon of su(2)_k
- Fusion chain basis: states $|x_0, x_1, \ldots, x_l\rangle$ where $x_i \in \{0, 1/2, \ldots, k/2\}$
- Site labels $y_i$ determined by adjacent $x$ labels: $y_i = 1/2$ if $|x_{i-1} - x_i| = 1/2$, else $y_i = 0$
- Both open and periodic boundary conditions considered

**Hamiltonian (Eq. 12-13):**
$$H = \sum_{i=1}^{\nu} h_i$$

Each local Hamiltonian $h_i$ contains **nine terms**:

| Term | Description | Action |
|------|-------------|--------|
| $h_{\mu_{00}}$ | Chemical potential (both empty) | Diagonal |
| $h_{\mu_{0\frac{1}{2}}}$ | Chemical potential (left empty, right occupied) | Diagonal |
| $h_{\mu_{\frac{1}{2}0}}$ | Chemical potential (left occupied, right empty) | Diagonal |
| $h_{\mu_{\frac{1}{2}\frac{1}{2}}}$ | Chemical potential (both occupied) | Diagonal |
| $h_J$ | Exchange interaction (favours vacuum fusion channel) | Off-diagonal |
| $h_t$ | Hopping right | Off-diagonal |
| $h'_t$ | Hopping left | Off-diagonal |
| $h_\Delta$ | **Pair creation** (new) | Off-diagonal |
| $h'_\Delta$ | **Pair annihilation** (new) | Off-diagonal |

**Pair creation term (Eq. 25):**
$$h_\Delta |x,x,x\rangle = \Delta \sum_u \sqrt{\frac{d_u}{d_x d_{1/2}}} |x,u,x\rangle$$

Creates two anyons on adjacent empty sites in the vacuum fusion channel, then F-moves to the working basis.

**Pair annihilation term (Eq. 26):**
$$h'_\Delta |x,y,x\rangle = \delta_{xz} \Delta \sqrt{\frac{d_y}{d_x d_{1/2}}} |x,x,x\rangle$$

Annihilates two adjacent anyons if their fusion channel is vacuum.

### 1.2 Exact Ground States (AKLT-like Point)

**Key result:** For parameters tuned to make $h_i$ projectors (Eq. 28):
$$\mu_{00} = \mu_{0\frac{1}{2}} = \mu_{\frac{1}{2}0} = t = J = \Delta = \frac{1}{2}, \quad \mu_{\frac{1}{2}\frac{1}{2}} = 0$$

**For odd k:**
- **Open chain** ($l \geq k$): $(k+1)(k+2)(k+3)/6$ zero-energy ground states
- **Closed chain** ($l \geq k+1$): $(k+1)/2$ zero-energy ground states

**Ground state structure (Eq. 38):**
Coefficients have explicit closed form involving quantum dimensions:
$$C_{\{x_i\}} = (-1)^m \prod_{i=n}^{(k+1)/2} [D(k,n,i)]^{\theta_i}$$

where $m$ counts half-integer labels, and $D(k,n,i)$ involves quantum dimensions.

**For even k:** No zero-energy ground states exist for large enough systems.

### 1.3 Integrability

The paper identifies integrable points using Yang-Baxter equations and Temperley-Lieb algebra.

**Dilute Temperley-Lieb generators (Fig. 6):**
Nine operators $\{e_0, e_l, e_r, e_{lr}, e_+, e_-, e_a, e_c, e\}$ corresponding to:
- Identity variants ($e_0, e_l, e_r, e_{lr}$)
- Hopping ($e_+, e_-$)
- Pair creation/annihilation ($e_c, e_a$)
- Interaction ($e$)

**R-matrix (Eq. 52):** Parametrised by $\lambda$ with constraint $-2\cos(4\lambda) = d_{1/2}$.

**Integrable parameter values:**
$$\lambda = \pm \frac{\pi(k+2 \pm 1)}{4(k+2)}$$

giving four integrable points: $\pm H_1$ and $\pm H_2$.

### 1.4 CFT Descriptions at Critical Points

| Hamiltonian | CFT Description | Central Charge |
|-------------|-----------------|----------------|
| $H_1$ | Minimal model $\mathcal{M}_{k+2}$ | $c = 1 - \frac{6}{(k+2)(k+3)}$ |
| $-H_1$ | $\mathcal{M}_3 \times \mathcal{M}_{k+1}$ | $c = \frac{1}{2} + 1 - \frac{6}{(k+1)(k+2)}$ |
| $H_2$ ($k \geq 2$) | Minimal model $\mathcal{M}_{k+1}$ | $c = 1 - \frac{6}{(k+1)(k+2)}$ |
| $-H_2$ | Compactified boson $u(1)_8$ for $k=1$ | $c = 1$ |

**Note:** $H_2$ for $k=1$ is gapless but not CFT-described (quadratic spin-wave dispersion).

---

## 2. Critical Analysis: Gaps and Unclear Points

### 2.1 Conceptual/Foundational Gaps

#### Gap 1: Still restricted to su(2)_k
**Issue:** Like Poilblanc et al., only su(2)_k anyons are considered.
**What's missing:** No framework for general fusion categories.

**Opportunity:** Generalise pairing terms to arbitrary fusion categories.

#### Gap 2: Only spin-1/2 anyons at sites
**Issue:** Sites can only hold spin-1/2 anyons or be empty.
**What's missing:** Higher spin anyons at sites, multiple anyons per site.

**Opportunity:** Soft-core models with general local Hilbert spaces.

#### Gap 3: Multiplicity-free assumption explicit
**Quote (p. 4):** "The anyon models we consider in this paper are *multiplicity-free* models, that is, they have the property that $N_{ab}^c$ is either zero or one."

**Opportunity:** Extend to categories with multiplicities ($N_{ab}^c > 1$).

#### Gap 4: No braiding in dynamics
**Issue:** Despite working with anyons, braiding (R-symbols) is not used in the Hamiltonian.
**Quote (p. 6):** "In this paper, we do not consider the braiding of anyons."

**Opportunity:** Our project can incorporate R-matrices for exchange processes.

#### Gap 5: Physical interpretation of pairing unclear
**Issue:** The pairing terms are mathematically defined but physical motivation is limited.
**Question:** What physical process corresponds to pair creation in fusion channel zero?

The paper mentions analogy to Cooper pairs (p. 25) but doesn't develop this further.

### 2.2 Technical Gaps

#### Gap 6: F-symbol gauge dependence
**Issue:** The paper uses a specific gauge for F-symbols (Appendix A) to make them positive.
**What's missing:** Discussion of how results depend on gauge choice.

**Note:** Our project should document normalisation/gauge conventions carefully.

#### Gap 7: Hopping operator not fully explicit
**Issue:** Hopping is defined by $h_t|x,y,y\rangle = t|x,x,y\rangle$ but action on internal degrees of freedom is implicit.
**Question:** How does hopping interact with the fusion tree structure beyond simple label swapping?

#### Gap 8: k=1 special case dominates analysis
**Issue:** Much of the integrability analysis (Sec. 5, Appendix B) focuses on k=1, which maps to spin-1/2 chains.
**What's missing:** Detailed analysis for k ≥ 2 at the problematic $-H_2$ point.

#### Gap 9: Finite-size effects poorly controlled
**Issue:** For $-H_2$, large finite-size effects prevent CFT identification.
**Quote (p. 23):** "large finite-size effects were the cause that exact diagonalization of small system sizes does not yield enough information."

**Workaround used:** Adding next-nearest-neighbour terms (only done for k=1).

### 2.3 Mathematical Gaps

#### Gap 10: Hilbert space not connected to morphism spaces
**Issue:** The Hilbert space is defined via fusion trees but not via $\mathrm{Mor}(\mathbf{1}, X_1 \otimes \cdots \otimes X_N)$.
**What's missing:** Categorical interpretation connecting to our morphism-based framework.

#### Gap 11: Pentagon equations mentioned but not verified
**Issue:** F-symbols are stated to satisfy pentagon equations but verification is referenced to other works.
**What's missing:** Self-contained verification using TensorCategories.jl or similar.

#### Gap 12: Boundary conditions treatment incomplete
**Issue:** Open and closed chains are both considered, but the relationship between them is only partially explored.

For closed chains, the Hilbert space splits into sectors (Eq. B.3):
$$|\psi_j^{\pm}\rangle = \frac{1}{\sqrt{2}}(|\psi_{j,x_0=0}\rangle \pm |\psi_{j,x_0=1/2}\rangle)$$

This sector structure is not fully analysed for general k.

---

## 3. Comparison with Our Project Requirements

| Our Requirement | Garjani & Ardonne Status | Gap/Opportunity |
|-----------------|--------------------------|-----------------|
| **R1:** Open BCs | ✅ Both open and closed | Can adopt |
| **R2:** Variable anyon number | ✅ Via pairing terms | Key contribution |
| **R3:** With/without braiding | ⚠️ No braiding used | Need to add |
| **R4:** Reduce to standard models | ⚠️ k=1 → spin-1/2 shown | Need sVec → fermions |
| **C3:** Fusion non-unitary | ✅ Implicit in pairing | Can formalise |
| **SC4:** sVec check | ❌ Not addressed | Critical gap |

### 3.1 Key Contribution for Our Project

The **pairing terms** provide a concrete mechanism for:
- Particle number fluctuation (R2)
- Pair creation/annihilation as non-unitary processes (C3)

**Formula to adopt (modified for general categories):**
$$h_\Delta: \mathbf{1} \otimes \mathbf{1} \to X \otimes \bar{X}$$

where $\bar{X}$ is the dual of $X$, creating a pair in the vacuum fusion channel.

### 3.2 What We Should Do Differently

1. **General categories:** Not just su(2)_k
2. **With multiplicities:** Handle $N_{ab}^c > 1$
3. **Include braiding:** R-matrices in dynamics
4. **sVec verification:** Confirm reduction to fermions
5. **Morphism space framework:** Rigorous categorical construction

---

## 4. Technical Details Worth Noting

### 4.1 Quantum Dimensions for su(2)_k (Eq. 8)
$$d_j(k) = \frac{\sin\left(\frac{2j+1}{k+2}\pi\right)}{\sin\left(\frac{1}{k+2}\pi\right)}$$

### 4.2 F-symbols Used (Appendix A, Eq. A.9)
$$F_x^{x \frac{1}{2} \frac{1}{2}} = \frac{1}{\sqrt{d_{1/2} d_x}} \begin{pmatrix} \sqrt{d_{x-1/2}} & \sqrt{d_{x+1/2}} \\ \sqrt{d_{x+1/2}} & -\sqrt{d_{x-1/2}} \end{pmatrix}$$

(in gauge with positive F-symbols for Hamiltonian terms)

### 4.3 Number of Ground States (Eq. 41)
For open chain with boundary labels $(i,j)$:
$$m_{ij} = \frac{1}{2}\left[k + 2 - \max\{|k-4i|, |k-4j|\}\right]$$

Total: $(k+1)(k+2)(k+3)/6$ for $l \geq k$ (odd k only).

### 4.4 Dilute Temperley-Lieb Identifications (Eq. 51)
$$h_J = J d_{1/2}^{-1} e, \quad h_\Delta = \Delta d_{1/2}^{-1/2} e_c, \quad h'_\Delta = \Delta d_{1/2}^{-1/2} e_a$$

These allow construction of R-matrices satisfying Yang-Baxter.

---

## 5. Relationship to Poilblanc et al. (2013)

| Aspect | Poilblanc et al. | Garjani & Ardonne |
|--------|------------------|-------------------|
| Anyon types | Ising, Fibonacci | su(2)_k general |
| Number fluctuation | Fixed density | Pairing terms |
| Main result | Charge-anyon separation | Exact ground states, integrability |
| Methods | ED, DMRG | ED, Yang-Baxter |
| Boundary conditions | Periodic only | Both open and closed |
| Physics motivation | Quantum Hall edges | BCS-like pairing |

**Key advance:** Garjani & Ardonne allow genuine particle number fluctuation through pair creation, whereas Poilblanc et al. had fixed anyon number with only position fluctuation.

---

## 6. Recommendations for Our Project

### 6.1 Adopt from This Paper
- Pairing term structure: $h_\Delta$ and $h'_\Delta$
- AKLT-like projector approach for finding exact ground states
- Temperley-Lieb structure for integrability analysis
- Treatment of both open and closed boundary conditions

### 6.2 Extend Beyond This Paper
- General fusion categories (not just su(2)_k)
- Fusion multiplicities ($N_{ab}^c > 1$)
- Braiding dynamics via R-matrices
- Morphism space framework
- sVec → fermion reduction

### 6.3 Open Questions Raised

1. What is the CFT for $-H_2$ with general k?
2. Does the even k case (no zero-energy ground states) have a gap?
3. Can the pairing mechanism be generalised to non-multiplicity-free categories?
4. What is the physical interpretation of the exact ground states?

---

## 7. Verdict

**Quality:** Solid mathematical work with explicit constructions and verifiable claims.

**Relevance:** Directly relevant for particle number fluctuation mechanisms.

**Gaps:** Like Poilblanc et al., restricted to su(2)_k and no braiding in dynamics.

**Impact on our project:**
- Provides template for pair creation/annihilation terms
- Shows integrability structure via dilute Temperley-Lieb
- Demonstrates AKLT-like approach for exact ground states
- Reinforces need for our generalisation to arbitrary categories

---

## Appendix: Key Equations Reference

**Pairing creation:**
$$h_\Delta |x,x,x\rangle = \Delta \sum_u \sqrt{\frac{d_u}{d_x d_{1/2}}} |x,u,x\rangle$$

**Pairing annihilation:**
$$h'_\Delta |x,y,z\rangle = \delta_{xz} \Delta \sqrt{\frac{d_y}{d_x d_{1/2}}} |x,x,x\rangle$$

**Projector point parameters:**
$$\mu_{00} = \mu_{0\frac{1}{2}} = \mu_{\frac{1}{2}0} = t = J = \Delta = \frac{1}{2}, \quad \mu_{\frac{1}{2}\frac{1}{2}} = 0$$

**Ground state count (open, odd k):**
$$\frac{(k+1)(k+2)(k+3)}{6}$$

**Integrable $\lambda$ values:**
$$\lambda = \pm \frac{\pi(k+2 \pm 1)}{4(k+2)}$$

---

*Review completed December 2025*
