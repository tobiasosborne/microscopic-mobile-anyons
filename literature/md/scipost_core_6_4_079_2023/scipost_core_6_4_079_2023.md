### **Anyons in a tight wave-guide and the Tonks-Girardeau gas**

**Nicolas Rougerie1***<sup>⋆</sup>* **and Qiyun Yang2**†

**1** Ecole Normale Supérieure de Lyon & CNRS, UMPA (UMR 5669) **2** Ecole Normale Supérieure de Lyon, UMPA (UMR 5669)

*⋆* [nicolas.rougerie@ens-lyon.fr](mailto:nicolas.rougerie@ens-lyon.fr), † [qiyun.yang@ens-lyon.fr](mailto:qiyun.yang@ens-lyon.fr)

## **Abstract**

**We consider a many-body system of 2D anyons, free quantum particles with general statistics parameter** *α* **∈]0, 2[. In the magnetic gauge picture they are described as bosons attached to Aharonov-Bohm fluxes of intensity 2***πα***, generating long-range magnetic forces. A dimensional reduction to 1D is obtained by imposing a strongly anisotropic trapping potential. This freezes the motion in the direction of strong trapping, leading to 1D physics along the weak direction. The latter is governed to leading order by the Tonks-Girardeau model of impenetrable bosons, independently of** *α***.**

Copyright N. Rougerie and Q. Yang. This work is licensed under the Creative Commons [Attribution 4.0 International License.](http://creativecommons.org/licenses/by/4.0/) Published by the SciPost Foundation.

Received 21-03-2023 Accepted 04-10-2023 Published 15-11-2023

doi:10.21468/[SciPostPhysCore.6.4.079](https://doi.org/10.21468/SciPostPhysCore.6.4.079)

## **Contents**

| 1 | Models and main result                   | 2 |
|---|------------------------------------------|---|
| 2 | A case for the Calogero-Sutherland model | 4 |
| 3 | Argument for the main result             | 5 |
| 4 | Conclusions                              | 8 |
|   | References                               |   |

Quasi-particle excitations of many-body systems confined to reduced dimensionalities are not in principle constrained by the symmetry dichotomy which sorts all fundamental particles into bosons and fermions [[1](#page-7-2)[–3,](#page-7-3) [5](#page-8-0)]. In 2D, many-body quantum wave-functions may be classified by the phase picked upon exchanging/braiding two particles. It is of the form *e* <sup>i</sup>*πα* for *α* ∈ [0, 2[, the standard cases of bosons and fermions being recovered for *α* = 0, 1 respectively. Equivalently one may think of these so-called anyons in terms of standard bosons (or fermions), coupled to infinitely thin magnetic flux tubes of strength 2*πα* (or 2*π*(*α* − 1)). This point of view is referred to as the magnetic gauge picture [[4,](#page-7-4) [6](#page-8-1)[–11,](#page-8-2) [64](#page-11-0)]. In 1D there does not seem to be a unique agreed-upon model for anyonic exchange statistics. Depending on how one proceeds to quantization, they have historically been described [[1,](#page-7-2)[12–](#page-8-3)[14,](#page-8-4)[64](#page-11-0)] as ordinary

particles with either contact interactions (Lieb-Liniger model) or inverse-square interactions (Calogero-Sutherland model) but other formalisms exist [[15](#page-8-5)[–18](#page-8-6)]. In particular, the chiral BF/Kundu model [[19–](#page-8-7)[22](#page-9-0)] and the anyon-Hubbard model [[23](#page-9-1)[–25](#page-9-2)] have attracted attention recently. Our main purpose here is to ask which one, if any, of the different theoretically possible descriptions of 1D anyons, is singled out as the dimensional reduction of the 2D theory.

The main candidates for real-world implementation of 2D anyon statistics remain the charge carriers of fractional quantum Hall systems [[26–](#page-9-3)[29](#page-9-4)] or their counterparts e.g. in cold atom emulations [[30–](#page-9-5)[35](#page-9-6)]. See [[36](#page-9-7)[–39](#page-10-0)] for reviews and [[40,](#page-10-1) [41](#page-10-2)] for experimental evidence. Said charge carriers are 2D objects described in the bulk via the usual, aforementioned, anyon model [[28,](#page-9-8)[29](#page-9-4)]. Much of fractional quantum Hall physics is however probed via the transport of charge carriers along 1D edge channels, which connects to our main question.

In another direction, the coupling of cold atoms to optical fields can lead, in the adiabatic limit, to the effective implementation of density-dependent gauge fields [[30,](#page-9-5) [32,](#page-9-9) [42](#page-10-3)]. Key proposals in this direction have recently been experimentally realized [[31,](#page-9-10) [43,](#page-10-4) [44](#page-10-5)]. In particular, signatures of the chiral BF model, connected to 1D Kundu anyons, have been observed [[43,](#page-10-4) [45](#page-10-6)] by generating a magnetic-like *vector potential* proportional to matter density. On the other hand, the magnetic gauge picture of 2D anyons corresponds to a magnetic-like *field* proportional to matter density.

Indeed, in this note we explain (full mathematical details will be provided elsewhere) that the magnetic-gauge picture Hamiltonian for 2D anyons of statistical parameter *α* ∈]0, 2[ converges, in the limit of a tight confinement along one spatial dimension, to the impenetrable boson model of the Tonks-Girardeau gas, soluble by Bose-Fermi mapping [[46–](#page-10-7)[48](#page-10-8)]. Thus, at leading order, the physics does not depend on *α* and is given by an extreme case of the Lieb-Liniger [[49,](#page-10-9)[50](#page-10-10)] model. The behavior is always essentially fermionic [[51](#page-10-11)].

These results might be interpreted in light of the enhanced effect of interactions in reduced dimensionalities. However, it is remarkable that the long-range magnetic interactions of the original model result in a limiting purely local theory. This finding is consistent with [[52,](#page-10-12)[53](#page-10-13)] although our approach differs and seems more systematic. In particular it clarifies the vanishing of the long-range magnetic interaction. A particular, discontinuous, phase is acquired by the 2D wave-functions, gauging the interaction away when particles are aligned.

## <span id="page-1-0"></span>**1 Models and main result**

Consider a (multi-valued) wave function *Ψ* : R 2 *<sup>N</sup>* <sup>→</sup> <sup>C</sup> with anyonic exchange behavior, i.e.

$$\Psi(\mathbf{x}_1,\ldots,\mathbf{x}_j,\ldots,\mathbf{x}_k,\ldots,\mathbf{x}_N) = e^{\mathrm{i}\alpha\pi}\Psi(\mathbf{x}_1,\ldots,\mathbf{x}_k,\ldots,\mathbf{x}_j,\ldots,\mathbf{x}_N),\tag{1}$$

with *α* ∈ ]0, 1] (by periodicity and complex conjugation, considering this range is sufficient). It is convenient to perform a singular gauge transformation

$$\Psi(\mathbf{x}_1,\ldots,\mathbf{x}_N) = \prod_{j < k} e^{\mathrm{i}\alpha\phi_{jk}} \Phi(\mathbf{x}_1,\ldots,\mathbf{x}_N), \quad \text{with} \quad \phi_{jk} = \arg \frac{\mathbf{x}_j - \mathbf{x}_k}{|\mathbf{x}_j - \mathbf{x}_k|},$$

with *Φ* a bosonic wave function, symmetric under particle exchange. We have denoted arg(.) the angle of a planar vector with the horizontal axis. Applying this transformation, one finds

$$\langle \Psi | \left( -i \nabla_{\mathbf{x}_j} \right)^2 | \Psi \rangle = \langle \Phi | D_{\mathbf{x}_j}^2 | \Phi \rangle$$
,

where the momentum operator for particle *j* has changed as

<span id="page-1-1"></span>
$$-i\nabla_{\mathbf{x}_j} \leadsto D_{\mathbf{x}_j} := -i\nabla_{\mathbf{x}_j} + \alpha \mathbf{A}(\mathbf{x}_j), \qquad (2)$$

with, denoting  $(x, y)^{\perp} = (-y, x) \in \mathbb{R}^2$ ,

$$\mathbf{A}(\mathbf{x}_j) := \sum_{k \neq j} \frac{\left(\mathbf{x}_j - \mathbf{x}_k\right)^{\perp}}{|\mathbf{x}_j - \mathbf{x}_k|^2}.$$
 (3)

In this picture we have traded the non-trivial exchange symmetry of wave-functions for a density-dependent magnetic field. Particle j sees all the others as carrying an Aharonov-Bohm flux, leading to the magnetic field

$$B(\mathbf{x}_j) = \operatorname{curl}_{\mathbf{x}_j} \mathbf{A}(\mathbf{x}_j) = 2\pi\alpha \sum_{k \neq j} \delta_{\mathbf{x}_j = \mathbf{x}_k}.$$

We adopt this point of view throughout the note, using (the Friedrichs extension [54-59] of)

<span id="page-2-0"></span>
$$H_{\varepsilon}^{\text{2D}} := \sum_{i=1}^{N} \left( D_{\mathbf{x}_{i}}^{2} + V_{\varepsilon}(\mathbf{x}_{i}) \right), \tag{4}$$

acting on bosonic wave-functions as our starting point, where

$$V_{\varepsilon}(\mathbf{x}) = V_{\varepsilon}(x, y) = x^2 + \frac{y^2}{\varepsilon^2},$$
 (5)

is a convenient way of enforcing 1D behavior along the horizontal axis in the limit  $\varepsilon \to 0$ . This is arguably a crude description (but, perhaps, also an instructive toy model) if one has a fractional quantum Hall edge in mind. There is however no difficulty in imposing such a potential on emerging anyons in cold atoms systems. The choice of a harmonic trapping is only out of convenience. Our results remain true with different choices, but the harmonic trapping has the virtue of leading to exactly soluble limit models.

We denote

$$\lambda_k^{\text{2D}} = \min_{\substack{V_k \subset L^2(\mathbb{R}^{2N}) \\ \dim V_k = k}} \max_{\Psi \in V_k, \|\Psi\|_{L^2} = 1} \left\langle \Psi | H_{\varepsilon}^{\text{2D}} | \Psi \right\rangle, \tag{6}$$

the eigenvalues of (4), defined by standard Courrant-Fisher min-max formulae. Let  $\Psi_k$  be associated eigenfunctions, i.e.

$$H_{\varepsilon}^{\mathrm{2D}} \Psi_k = \lambda_k^{\mathrm{2D}} \Psi_k$$
.

There can be degeneracies, in which case we count eigenvalues with their multiplicities.

For small  $\varepsilon > 0$  one expects the motion in the two spatial directions to decouple (which is true only to some extent in this particular case, see below). The motion in the y direction will be frozen in the ground state of the harmonic oscillator

<span id="page-2-2"></span>
$$H_{\varepsilon}^{\text{HO}} := -\partial_{y}^{2} + \frac{y^{2}}{\varepsilon^{2}}.$$
 (7)

It turns out that the motion in the x direction reduces to the free Hamiltonian

<span id="page-2-1"></span>
$$H^{1D} := \sum_{i=1}^{N} -\partial_{x_{i}}^{2} + x_{j}^{2}, \tag{8}$$

but acting on the domain (of the Friedrichs extension)

<span id="page-2-3"></span>
$$\mathcal{D}^{1D} := \left\{ \psi \in H^2(\mathbb{R}^N), \psi(x_j = x_k) \equiv 0, \text{ for all } j \neq k \right\}. \tag{9}$$

This restriction is equivalent to the addition of a delta pair-potential of infinite strength to (8). It is well-known that this impenetrable boson model can be mapped to a free fermionic one [46–

48]. In turn, this leads to an exact solution in the particular case above. However, our approach does not rely on this exact solution, and we could in fact have added extra interactions to our model. For simplicity, we do not consider this explicitly.

Let  $e_{\varepsilon}$  and  $u_{\varepsilon}$  be respectively the lowest eigenvalue and eigenfunction of (7). Let  $(\lambda_k^{1D})_{k\in\mathbb{N}}$  be the eigenvalues of (8), with associated eigenfunctions  $\psi_k, k=1,2...$  In the model above,  $\lambda_k^{1D}$  is a sum of eigenvalues of the harmonic oscillator  $-\partial_x + x^2$  and

$$\psi_k = c_k \prod_{i < j} \operatorname{sgn}(x_i - x_j) \det_{i,j}(v_i(x_j)),$$

where  $v_i$  are the associated one-particle eigenfunctions and  $c_k$  is a normalization constant. We state our main finding as a theorem.

#### <span id="page-3-3"></span>Theorem 1 (Dimensional reduction for anyons).

For all  $k \in \mathbb{N}$ , in the limit  $\varepsilon \to 0$ ,

<span id="page-3-5"></span>
$$\lambda_k^{\text{2D}} = Ne_{\varepsilon} + \lambda_k^{\text{1D}} + o(1). \tag{10}$$

Moreover, one can choose the 2D and 1D eigenbases  $(\Psi_k)_k$  and  $(\psi_k)_k$  in such a way that

<span id="page-3-1"></span>
$$\int_{\mathbb{R}^{2N}} \left| \Psi_k - \psi_k(x_1, \dots, x_N) \prod_{j=1}^N u_{\varepsilon}(y_j) \right|^2 \underset{\varepsilon \to 0}{\longrightarrow} 0.$$
 (11)

Although it seems from (11) that a standard decoupling between the two space directions takes place, the actual ansatz for the eigenfunctions  $\Psi_k$  leading to the correct energy are more subtle. Essentially they are of the form

<span id="page-3-2"></span>
$$\psi_k(x_1, \dots, x_N) \prod_{j=1}^N u_{\varepsilon}(y_j) \prod_{j < k} e^{-i\alpha S(\mathbf{x}_j - \mathbf{x}_k)}, \tag{12}$$

where we denote

<span id="page-3-4"></span>
$$S(\mathbf{x}) = S(x, y) = \arctan\left(\frac{y}{x}\right).$$
 (13)

The above trial states have the correct bosonic symmetry because  $S(\mathbf{x}) = S(-\mathbf{x})$ , but they are not of the form "function of x times function of y" that is more common in dimensional reductions. Note that  $S(\mathbf{x})$  has a discontinuity along the line x = 0, so that it is crucial for (12) to be well-defined that  $\psi_k(x_1, \ldots, x_N)$  vanishes whenever  $x_j = x_k$ ,  $j \neq k$ .

The phase factors  $e^{-i\alpha S(\mathbf{x}_j - \mathbf{x}_k)}$  modify the energy dramatically, gauging away the original magnetic interaction (see below). For this effect it is crucial to take advantage of the finite, albeit small, extension of our wave-guide, as shown by the discussion below.

## <span id="page-3-0"></span>2 A case for the Calogero-Sutherland model

Before we sketch the proof of the above, it is instructive to examine an argument that would rather point in the direction of the Calogero model with inverse square interactions (which is also a proposed model for 1D anyons) as effective description. This will emphasize two things:

• That quantization and dimensional reduction do not commute in this particular case. Classical particles with the above magnetic interactions would experience Calogero-like interactions if confined on a line.

• The role of the phase factors *e* −i*αS*(**x***j*−**x***<sup>k</sup>* ) in the main result. Indeed, if one chooses a simpler ansatz of the form

$$\psi_k = \phi(x_1, \dots, x_N) \prod_{j=1}^N u_{\varepsilon}(y_j),$$

the 1D function *φ* indeed experiences a Calogero-type Hamiltonian.

The possible connections between 2D anyons and Calogero-like models have already been pointed out in a similar context [[60,](#page-11-2)[61](#page-11-3)]. It also arises for lowest Landau level anyons [[52,](#page-10-12)[62–](#page-11-4) [67](#page-11-5)] via very different mechanisms.

Consider *N* classical particles with magnetic interactions akin to those of [\(4\)](#page-2-0). We constrain them to move on the line *y* = 0, like pearls on a necklace. Expanding the square in [\(4\)](#page-2-0), the Hamilton function for this system is

$$H(\mathbf{x}_{1},...,\mathbf{x}_{N};\mathbf{p}_{1},...,\mathbf{p}_{N}) = \sum_{j=1}^{N} \left( |\mathbf{p}_{j}|^{2} + x_{j}^{2} \right)$$

$$+ 2\alpha \sum_{j \neq k} \mathbf{p}_{j} \cdot \frac{(\mathbf{x}_{j} - \mathbf{x}_{k})^{\perp}}{|\mathbf{x}_{j} - \mathbf{x}_{k}|^{2}}$$

$$+ \alpha^{2} \sum_{j \neq k \neq \ell} \frac{(\mathbf{x}_{j} - \mathbf{x}_{k})^{\perp}}{|\mathbf{x}_{j} - \mathbf{x}_{k}|^{2}} \cdot \frac{(\mathbf{x}_{j} - \mathbf{x}_{\ell})^{\perp}}{|\mathbf{x}_{j} - \mathbf{x}_{\ell}|^{2}}$$

$$+ \alpha^{2} \sum_{j \neq k} \frac{1}{|\mathbf{x}_{j} - \mathbf{x}_{k}|^{2}},$$

where **p***<sup>j</sup>* = (*p<sup>j</sup>* , 0) and **x***<sup>j</sup>* = (*x <sup>j</sup>* , 0) are momenta and positions, respectively. The cross-term on the second line is clearly null. The term on the third line is null as well, as follows from grouping terms as in [[68,](#page-11-6) Lemma 3.2]

$$\sum_{\text{cyclic in } 1,2,3} \frac{(\mathbf{x}_1 - \mathbf{x}_2)^{\perp}}{|\mathbf{x}_1 - \mathbf{x}_2|^2} \cdot \frac{(\mathbf{x}_1 - \mathbf{x}_3)^{\perp}}{|\mathbf{x}_1 - \mathbf{x}_3|^2} = \frac{1}{2\mathcal{R}(\mathbf{x}_1, \mathbf{x}_2, \mathbf{x}_3)^2},$$

with R(**x**<sup>1</sup> , **x**<sup>2</sup> , **x**<sup>3</sup> ) the circumradius of the triangle with summits **x**<sup>1</sup> , **x**<sup>2</sup> , **x**<sup>3</sup> . This is the radius of the circle on which the three points lie, which is infinite for aligned points. Hence the Hamilton function boils down to

$$\sum_{j=1}^{N} (p_j^2 + x_j^2) + \alpha^2 \sum_{j \neq k} \frac{1}{(x_j - x_k)^2},$$

which, once quantized, gives a Calogero Hamiltonian, albeit not with the expected *α*(*α* − 1) coefficient [[12,](#page-8-3) [13,](#page-8-8) [62](#page-11-4)] in front of the two-body term for particles of statistics parameter *α*. Note that this reduction could in any case not be correct for all *α* because the 2D anyon energy is periodic in *α*, but the Calogero energy is not [[62,](#page-11-4)[69](#page-11-7)[–71](#page-11-8)].

## <span id="page-4-0"></span>**3 Argument for the main result**

We turn to sketching the main insights of the proof of Theorem [1.](#page-3-3) Turning them into a rigorous mathematical proof is somewhat lengthy, and will be done elsewhere [[72](#page-11-9)].

The crucial observation is that for particles close to the line *y* = 0, the vector potential of the Aharonov-Bohm fluxes in [\(4\)](#page-2-0) can be gauged away. The vector potential

$$\mathbf{A}_0(\mathbf{x}) = \frac{\mathbf{x}^{\perp}}{|\mathbf{x}|^2} = \begin{pmatrix} -y \\ x \end{pmatrix} \frac{1}{x^2 + y^2},$$

for a unit Aharonov-Bohm flux at the origin has a non-zero curl and thus cannot be written as the gradient of a regular function globally. But, with S defined as in (13)

$$\nabla S(\mathbf{x}) = \mathbf{A}_0(\mathbf{x}) - \begin{pmatrix} \pi \delta_{x=0} \operatorname{sgn}(y) \\ 0 \end{pmatrix}.$$

Hence, for any continuous function  $\Psi(\mathbf{x})$  of finite kinetic energy vanishing on the line x=0

$$\int_{\mathbb{R}^2} \left| (-i\nabla_{\mathbf{x}} + \alpha \mathbf{A}_0(\mathbf{x})) (\Psi(\mathbf{x}) e^{-i\alpha S(\mathbf{x})}) \right|^2 d\mathbf{x} = \int_{\mathbb{R}^2} |\nabla \Psi|^2,$$

and this will be our model calculation (here performed in the relative coordinate of a particle pair).

The main point of our argument is the behavior

$$S(\mathbf{x}) \simeq_{|y| \ll |x|} \frac{y}{x}$$

Indeed if one sets instead

$$\widetilde{S}(\mathbf{x}) := \frac{y}{x}$$
,

one finds

$$\nabla \widetilde{S}(\mathbf{x}) = \begin{pmatrix} -y/x^2 \\ 1/x \end{pmatrix}_{|y| \ll |x|} \mathbf{A}_0(\mathbf{x}),$$

and more precisely

$$\left|\nabla \widetilde{S} - \mathbf{A}_0\right| \le C \frac{|y|}{r^2} \,. \tag{14}$$

The singularity around x=0 of the right-hand side would have to be tamed if we used  $\widetilde{S}$  instead of S in our trial state. Hence the latter choice is actually simpler, and we stick to it in the sequel.

Consider now a trial state  $\Psi$  for (4) and write it as

$$\Psi(\mathbf{x}_{1}, \dots, \mathbf{x}_{N}) = U_{\varepsilon} \prod_{j < k} e^{-\alpha i S(\mathbf{x}_{j} - \mathbf{x}_{k})} \Phi,$$

$$U_{\varepsilon}(\mathbf{x}_{1}, \dots, \mathbf{x}_{N}) = \prod_{j=1}^{N} u_{\varepsilon}(y_{j}),$$
(15)

with a new, continuous, unknown function  $\Phi$  vanishing whenever  $x_j = x_k, j \neq k$ . A direct calculation yields

<span id="page-5-0"></span>
$$\left\langle \Psi | H_{\varepsilon}^{\text{2D}} | \Psi \right\rangle = N e_{\varepsilon} + \sum_{j}^{N} \int_{\mathbb{R}^{2N}} U_{\varepsilon}^{2} x_{j}^{2} |\Phi|^{2} + \sum_{j}^{N} \int_{\mathbb{R}^{2N}} U_{\varepsilon}^{2} \left| \nabla_{\mathbf{x}_{j}} \Phi \right|^{2}, \tag{16}$$

and we now seek critical points of this functional of  $\Phi$ . For energy upper bounds it will clearly be favorable for  $\Phi$  not to depend on  $y_1, \ldots, y_N$  and we then recognize the energy functional corresponding to (8).

We then need to prove a lower bound of the correct form for the energy of a true eigenstate  $\Psi$  of the 2D model. We do not know a priori that the corresponding  $\Phi$  vanishes when  $x_j = x_k, j \neq k$ , but (16) can in this case be replaced by

$$\left\langle \Psi | H_{\varepsilon}^{\text{2D}} | \Psi \right\rangle \ge N e_{\varepsilon} + \sum_{j}^{N} \int_{\Lambda_{\eta}} U_{\varepsilon}^{2} x_{j}^{2} |\Phi|^{2} + \sum_{j}^{N} \int_{\Lambda_{\eta}} U_{\varepsilon}^{2} \left| \nabla_{\mathbf{x}_{j}} \Phi \right|^{2}, \tag{17}$$

where

$$\Lambda_n = \{ (\mathbf{x}_1, \dots, \mathbf{x}_N) \in \mathbb{R}^{2N}, |x_i - x_k| > \eta, \forall j \neq k \}.$$

Extracting the singular phase is unproblematic on the latter set, and we can then pass to the limit in the above,  $\varepsilon \to 0$  and  $\eta \to 0$ , obtaining an energy lower bound essentially of the desired form. More precisely, in [72, Proposition 4.3] we prove the following:

#### Lemma 2. Let

$$\phi(x_1, y_1, \dots, x_N, y_N) := \Phi(x_1, \sqrt{\varepsilon}y_1, \dots, x_N, \sqrt{\varepsilon}y_N). \tag{18}$$

After possibly extracting a subsequence,

$$\phi \to \psi_0$$

where the limit  $\psi_0$  has no dependence on the y-coordinates, and satisfies

$$\lim_{\varepsilon \to 0} \inf \left( \left\langle \Psi | H_{\varepsilon}^{2D} | \Psi \right\rangle - N e_{\varepsilon} \right) \ge \sum_{j=1}^{N} \left( \int_{\mathbb{R}^{N}} \left| \partial_{x_{j}} \psi_{0} \right|^{2} + \int_{\mathbb{R}^{N}} |x_{j}|^{2} |\psi_{0}|^{2} \right). \tag{19}$$

The main difficulty is now to ensure some form of vanishing around particle encounters for our limit model to indeed be set on (9), i.e. that the 1D function obtained by passing to the limit has finite kinetic energy over the whole space (including across diagonals). To this end we use the following Hardy-like inequality: For any  $\Psi$ , with the modified momentum as in (2)

<span id="page-6-0"></span>
$$\sum_{j=1}^{N} \left\langle \Psi | \left( D_{\mathbf{x}_{j}} \right)^{2} | \Psi \right\rangle \geq c_{\alpha,N} \int_{\mathbb{R}^{2N}} \sum_{j \leq k} \frac{1}{|\mathbf{x}_{j} - \mathbf{x}_{k}|^{2}} |\Psi(\mathbf{x}_{1}, \dots, \mathbf{x}_{N})|^{2}, \tag{20}$$

where the best possible constant  $c_{\alpha,N}$  depends only on  $\alpha$  and N. Such an inequality originates from [55,56,68,73] (see also [74] for review and generalizations) where it is proved in particular that

- $c_{\alpha,N} \ge cN^{-1}$  with a universal c > 0 if  $\alpha$  is an odd-numerator fraction.
- $c_{\alpha,2} > 0$  for any  $\alpha \neq 0$ .

We improve these bounds by proving that there exists a universal constant c' > 0 such that

$$c_{\alpha,N} \ge c' N^{-2}$$
, for any  $\alpha \ne 0$ ,

which leads to our main result by providing the desired vanishing in the whole parameter range. One can understand heuristically why by considering the contribution of the set where  $|x_j-x_k| \lesssim \sqrt{\varepsilon}$  and  $|y_\ell| \lesssim \sqrt{\varepsilon}$  for  $\ell=1\dots N$  to the right-hand side of (20). One has  $|\mathbf{x}_j-\mathbf{x}_k|^2 \lesssim \varepsilon$  on this set. If the limiting 1D function does not vanish for  $x_j \sim x_k$ , then  $|\Psi|^2 \propto U_\varepsilon^2 \propto \varepsilon^{-N/2}$ . The total contribution (volume times typical value of the integrand) would thus be of order  $\varepsilon^{-1/2}$ , much larger than the expected energies, of order unity after removal of the contribution of  $Ne_\varepsilon$  as in (10). More precisely this leads us to (see Lemma 4.8 in [72])

#### Lemma 3. Let

$$\psi(x_1, \dots, x_N) := \int_{\mathbb{D}^N} dy_1 \cdots dy_N |\phi(\mathbf{x}_1, \dots, \mathbf{x}_N)| U_1^2(y_1, \dots, y_N) \mathbb{1}_{|y_1| \le 1/4} \dots \mathbb{1}_{|y_N| \le 1/4}, \quad (21)$$

and K be a bounded open subset in  $\mathbb{R}^{N-1}$ . For a constant  $\gamma \geq 0$ , we define

$$K_{\gamma} := \{(x_2, x_3, \dots, x_N) \in K : |x_2 - x_j| > \sqrt{\gamma}/2, \ \forall j \ge 3\}.$$

*Then when γ* ≥ *ϵ, we have*

$$\int_{K_{\gamma}} |\psi(x_2, x_2, x_3, \dots, x_N)|^2 dx_2 \cdots dx_N \leq C_K \varepsilon^{\frac{s}{2}},$$

*for some constants C<sup>K</sup> >* 0 *and s* ∈ (0, 1) *both independent of ϵ.*

The above will, after passing to the limit, guarantee that *ψ*<sup>0</sup> vanishes when two arguments come close, the others being at least at a distance <sup>p</sup>*γ/*2. One can finally pass to the limit *γ* → 0 to deduce that *ψ*<sup>0</sup> (*x <sup>j</sup>* = *x<sup>k</sup>* ) ≡ 0 for any *k* ̸= *j*. Hence indeed the energy bounds force the limiting 1D function to vanish upon particle encounters, as desired.

## <span id="page-7-0"></span>**4 Conclusions**

We have studied 2D anyons of statistics parameter *α* in the magnetic gauge picture, i.e. seeing them as bosons in a varying magnetic field proportional to matter density. In a cold atoms context this corresponds to proposals made e.g. in [[32](#page-9-9)]. We imposed a dimensional reduction by ways of a strongly anisotropic trap, as in recent cold-atoms experiments probing densitydependent gauge theories [[31,](#page-9-10)[43,](#page-10-4)[44](#page-10-5)].

In the 1D limit we found that a suitable choice of gauge removes long-range magnetic interactions. Their only remnant is a hard-core condition upon particle encounters, leading to the Girardeau-Tonks model of 1D bosons for any *α* ̸= 0. Non-trivial dependence on *α* might survive at sub-leading order, in which case it could be determined by perturbation theory around Girardeau's solution of the impenetrable 1D Bose gas.

# **Acknowledgments**

We had interesting discussions with Douglas Lundholm, Michele Correggi, Per Moosavi and Nikolaj Thomas Zinner.

<span id="page-7-1"></span>**Funding information** Funding from the European Research Council (ERC) under the European Union's Horizon 2020 Research and Innovation Programme (Grant agreement COR-FRONMAT No 758620) is gratefully acknowledged.

### **References**

- <span id="page-7-2"></span>[1] J. M. Leinaas and J. Myrheim, *On the theory of identical particles*, Nuovo Cimento B **37**, 1 (1977), doi:10.1007/[BF02727953.](https://doi.org/10.1007/BF02727953)
- [2] G. A. Goldin, R. Menikoff and D. H. Sharp, *Representations of a local current algebra in nonsimply connected space and the Aharonov-Bohm effect*, J. Math. Phys. **22**, 1664 (1981), doi:10.1063/[1.525110.](https://doi.org/10.1063/1.525110)
- <span id="page-7-3"></span>[3] F. Wilczek, *Magnetic flux, angular momentum, and statistics*, Phys. Rev. Lett. **48**, 1144 (1982), doi:10.1103/[PhysRevLett.48.1144.](https://doi.org/10.1103/PhysRevLett.48.1144)
- <span id="page-7-4"></span>[4] F. Wilczek, *Fractional statistics and anyon superconductivity*, World Scientific, Singapore, ISBN 9789810200480 (1990), doi[:10.1142](https://doi.org/10.1142/0961)/0961.

- <span id="page-8-0"></span>[5] J. Myrheim, *Anyons*, in *Aspects topologiques de la physique en basse dimension. Topological aspects of low dimensional systems*, Springer, Berlin, Heidelberg, Germany, ISBN 9783540466376 (1999), doi:10.1007/[3-540-46637-1.](https://doi.org/10.1007/3-540-46637-1)
- <span id="page-8-1"></span>[6] J. Fröhlich, *Statistics of fields, the Yang-Baxter equation, and the theory of knots and links*, in *Nonperturbative quantum field theory*, Springer, Boston, USA, ISBN 9781461280538 (1988), doi:10.1007/[978-1-4613-0729-7\\_4.](https://doi.org/10.1007/978-1-4613-0729-7_4)
- [7] J. Fröhlich, *Quantum statistics and locality*, in *Proceedings of the Gibbs Symposium*, American Mathematical Society, Providence, USA, ISBN 9780821896716 (1990).
- [8] A. Lerda, *Anyons*, Springer, Berlin, Heidelberg, Germany, ISBN 9783540474661 (1992), doi:10.1007/[978-3-540-47466-1.](https://doi.org/10.1007/978-3-540-47466-1)
- [9] R. Iengo, *Anyon quantum mechanics and Chern-Simons theory*, Phys. Rep. **213**, 179 (1992), doi:10.1016/[0370-1573\(92\)90039-3.](https://doi.org/10.1016/0370-1573(92)90039-3)
- [10] S. Forte, *Quantum mechanics and field theory with fractional spin and statistics*, Rev. Mod. Phys. **64**, 193 (1992), doi:10.1103/[RevModPhys.64.193.](https://doi.org/10.1103/RevModPhys.64.193)
- <span id="page-8-2"></span>[11] A. Khare, *Fractional statistics and quantum theory*, World Scientific, Singapore, ISBN 9789812561602 (2005), doi[:10.1142](https://doi.org/10.1142/5752)/5752.
- <span id="page-8-3"></span>[12] J. M. Leinaas and J. Myrheim, *Intermediate statistics for vortices in superfluid films*, Phys. Rev. B **37**, 9286 (1988), doi:10.1103/[PhysRevB.37.9286.](https://doi.org/10.1103/PhysRevB.37.9286)
- <span id="page-8-8"></span>[13] A. P. Polychronakos, *Non-relativistic bosonization and fractional statistics*, Nucl. Phys. B **324**, 597 (1989), doi:10.1016/[0550-3213\(89\)90522-1.](https://doi.org/10.1016/0550-3213(89)90522-1)
- <span id="page-8-4"></span>[14] T. Posske, B. Trauzettel and M. Thorwart, *Second quantization of Leinaas-Myrheim anyons in one dimension and their relation to the Lieb-Liniger model*, Phys. Rev. B **96**, 195422 (2017), doi:10.1103/[PhysRevB.96.195422.](https://doi.org/10.1103/PhysRevB.96.195422)
- <span id="page-8-5"></span>[15] M. D. Girardeau, *Anyon-fermion mapping and applications to ultracold gases in tight waveguides*, Phys. Rev. Lett. **97**, 100402 (2006), doi:10.1103/[PhysRevLett.97.100402.](https://doi.org/10.1103/PhysRevLett.97.100402)
- [16] I. Andri´c, V. Bardek and L. Jonke, *Quantum fluctuations of the Chern-Simons theory and dynamical dimensional reduction*, Phys. Rev. D **59**, 107702 (1999), doi:10.1103/[PhysRevD.59.107702.](https://doi.org/10.1103/PhysRevD.59.107702)
- [17] L. Fresta and P. Moosavi, *Approaching off-diagonal long-range order for 1* + *1-dimensional relativistic anyons*, Phys. Rev. B **103**, 085140 (2021), doi:10.1103/[PhysRevB.103.085140.](https://doi.org/10.1103/PhysRevB.103.085140)
- <span id="page-8-6"></span>[18] P. Moosavi, *Exact Dirac-Bogoliubov-de Gennes dynamics for inhomogeneous quantum liquids*, Phys. Rev. Lett. **131**, 100401 (2023), doi:10.1103/[PhysRevLett.131.100401.](https://doi.org/10.1103/PhysRevLett.131.100401)
- <span id="page-8-7"></span>[19] S. J. Benetton Rabello, *1D generalized statistics gas: A gauge theory approach*, Phys. Rev. Lett. **76**, 4007 (1996), doi:10.1103/[PhysRevLett.76.4007.](https://doi.org/10.1103/PhysRevLett.76.4007)
- [20] U. Aglietti, L. Griguolo, R. Jackiw, S.-Y. Pi and D. Seminara, *Anyons and chiral solitons on a line*, Phys. Rev. Lett. **77**, 4406 (1996), doi:10.1103/[PhysRevLett.77.4406.](https://doi.org/10.1103/PhysRevLett.77.4406)
- [21] A. Kundu, *Exact solution of double δ function Bose gas through an interacting anyon gas*, Phys. Rev. Lett. **83**, 1275 (1999), doi:10.1103/[PhysRevLett.83.1275.](https://doi.org/10.1103/PhysRevLett.83.1275)

- <span id="page-9-0"></span>[22] M. T. Batchelor, X.-W. Guan and N. Oelkers, *One-dimensional interacting anyon gas: Lowenergy properties and haldane exclusion statistics*, Phys. Rev. Lett. **96**, 210402 (2006), doi:10.1103/[PhysRevLett.96.210402.](https://doi.org/10.1103/PhysRevLett.96.210402)
- <span id="page-9-1"></span>[23] S. Greschner and L. Santos, *Anyon Hubbard model in one-dimensional optical lattices*, Phys. Rev. Lett. **115**, 053002 (2015), doi:10.1103/[PhysRevLett.115.053002.](https://doi.org/10.1103/PhysRevLett.115.053002)
- [24] G. Tang, S. Eggert and A. Pelster, *Ground-state properties of anyons in a one-dimensional lattice*, New J. Phys. **17**, 123016 (2015), doi:10.1088/[1367-2630](https://doi.org/10.1088/1367-2630/17/12/123016)/17/12/123016.
- <span id="page-9-2"></span>[25] M. Bonkhoff, K. Jägering, S. Eggert, A. Pelster, M. Thorwart and T. Posske, *Bosonic continuum theory of one-dimensional lattice anyons*, Phys. Rev. Lett. **126**, 163201 (2021), doi:10.1103/[PhysRevLett.126.163201.](https://doi.org/10.1103/PhysRevLett.126.163201)
- <span id="page-9-3"></span>[26] B. I. Halperin, *Statistics of quasiparticles and the hierarchy of fractional quantized Hall states*, Phys. Rev. Lett. **52**, 1583 (1984), doi:10.1103/[PhysRevLett.52.1583.](https://doi.org/10.1103/PhysRevLett.52.1583)
- [27] D. Arovas, J. R. Schrieffer and F. Wilczek, *Fractional statistics and the quantum Hall effect*, Phys. Rev. Lett. **53**, 722 (1984), doi:10.1103/[PhysRevLett.53.722.](https://doi.org/10.1103/PhysRevLett.53.722)
- <span id="page-9-8"></span>[28] D. Lundholm and N. Rougerie, *Emergence of fractional statistics for tracer particles in a Laughlin liquid*, Phys. Rev. Lett. **116**, 170401 (2016), doi:10.1103/[PhysRevLett.116.170401.](https://doi.org/10.1103/PhysRevLett.116.170401)
- <span id="page-9-4"></span>[29] G. Lambert, D. Lundholm and N. Rougerie, *Quantum statistics transmutation via magnetic flux attachment*, (arXiv preprint) doi:10.48550/[arXiv.2201.03518.](https://doi.org/10.48550/arXiv.2201.03518)
- <span id="page-9-5"></span>[30] M. J. Edmonds, M. Valiente, G. Juzeliunas, L. Santos and P. Öhberg, ¯ *Simulating an interacting gauge theory with ultracold Bose gases*, Phys. Rev. Lett. **110**, 085301 (2013), doi:10.1103/[PhysRevLett.110.085301.](https://doi.org/10.1103/PhysRevLett.110.085301)
- <span id="page-9-10"></span>[31] L. W. Clark, B. M. Anderson, L. Feng, A. Gaj, K. Levin and C. Chin, *Observation of density-dependent gauge fields in a Bose-Einstein condensate based on micromotion control in a shaken two-dimensional lattice*, Phys. Rev. Lett. **121**, 030402 (2018), doi:10.1103/[PhysRevLett.121.030402.](https://doi.org/10.1103/PhysRevLett.121.030402)
- <span id="page-9-9"></span>[32] G. Valentí-Rojas, N. Westerberg and P. Öhberg, *Synthetic flux attachment*, Phys. Rev. Res. **2**, 033453 (2020), doi:10.1103/[PhysRevResearch.2.033453.](https://doi.org/10.1103/PhysRevResearch.2.033453)
- [33] E. Yakaboylu, A. Ghazaryan, D. Lundholm, N. Rougerie, M. Lemeshko and R. Seiringer, *Quantum impurity model for anyons*, Phys. Rev. B **102**, 144109 (2020), doi:10.1103/[PhysRevB.102.144109.](https://doi.org/10.1103/PhysRevB.102.144109)
- [34] E. Yakaboylu and M. Lemeshko, *Anyonic statistics of quantum impurities in two dimensions*, Phys. Rev. B **98**, 045402 (2018), doi:10.1103/[PhysRevB.98.045402.](https://doi.org/10.1103/PhysRevB.98.045402)
- <span id="page-9-6"></span>[35] M. Correggi, R. Duboscq, D. Lundholm and N. Rougerie, *Vortex patterns in the almost-bosonic anyon gas*, Europhys. Lett. **126**, 20005 (2019), doi[:10.1209](https://doi.org/10.1209/0295-5075/126/20005)/0295- 5075/126/[20005.](https://doi.org/10.1209/0295-5075/126/20005)
- <span id="page-9-7"></span>[36] M. O. Goerbig, *Quantum Hall effects*, in *Quantum Hall effects*, World Scientific, Singapore, ISBN 9789812700322, doi:10.1142/[9789812790903\\_0011.](https://doi.org/10.1142/9789812790903_0011)
- [37] R. B. Laughlin, *Nobel lecture: Fractional quantization*, Rev. Mod. Phys. **71**, 863 (1999), doi:10.1103/[RevModPhys.71.863.](https://doi.org/10.1103/RevModPhys.71.863)

- [38] J. K. Jain, *Composite fermions*, Cambridge University Press, Cambridge, UK, ISBN 9780521862325 (2007), doi:10.1017/[CBO9780511607561.](https://doi.org/10.1017/CBO9780511607561)
- <span id="page-10-0"></span>[39] N. Rougerie, *Some contributions to many-body quantum mathematics*, Habilitation thesis, Université Grenoble-Alpes & CNRS, Grenoble, France (2016), doi:10.48550/[arXiv.1607.03833.](https://doi.org/10.48550/arXiv.1607.03833)
- <span id="page-10-1"></span>[40] H. Bartolomei et al., *Fractional statistics in anyon collisions*, Science **368**, 173 (2020), doi:10.1126/[science.aaz5601.](https://doi.org/10.1126/science.aaz5601)
- <span id="page-10-2"></span>[41] J. Nakamura, S. Liang, G. C. Gardner and M. J. Manfra, *Direct observation of anyonic braiding statistics*, Nat. Phys. **16**, 931 (2020), doi:10.1038/[s41567-020-1019-1.](https://doi.org/10.1038/s41567-020-1019-1)
- <span id="page-10-3"></span>[42] L. Cardarelli, S. Greschner and L. Santos, *Engineering interactions and anyon statistics by multicolor lattice-depth modulations*, Phys. Rev. A **94**, 023615 (2016), doi:10.1103/[PhysRevA.94.023615.](https://doi.org/10.1103/PhysRevA.94.023615)
- <span id="page-10-4"></span>[43] A. Frölian, C. S. Chisholm, E. Neri, C. R. Cabrera, R. Ramos, A. Celi and L. Tarruell, *Realizing a 1D topological gauge theory in an optically dressed BEC*, Nature **608**, 293 (2022), doi:10.1038/[s41586-022-04943-3.](https://doi.org/10.1038/s41586-022-04943-3)
- <span id="page-10-5"></span>[44] K.-X. Yao, Z. Zhang and C. Chin, *Domain-wall dynamics in Bose-Einstein condensates with synthetic gauge fields*, Nature **602**, 68 (2022), doi:10.1038/[s41586-021-04250-3.](https://doi.org/10.1038/s41586-021-04250-3)
- <span id="page-10-6"></span>[45] C. S. Chisholm, A. Frölian, E. Neri, R. Ramos, L. Tarruell and A. Celi, *Encoding a onedimensional topological gauge theory in a Raman-coupled Bose-Einstein condensate*, Phys. Rev. Res. **4**, 043088 (2022), doi:10.1103/[PhysRevResearch.4.043088.](https://doi.org/10.1103/PhysRevResearch.4.043088)
- <span id="page-10-7"></span>[46] A. Minguzzi and P. Vignolo, *Strongly interacting trapped one-dimensional quantum gases: Exact solution*, AVS Quantum Sci. **4**, 027102 (2022), doi:10.1116/[5.0077423.](https://doi.org/10.1116/5.0077423)
- [47] M. Girardeau, *Relationship between systems of impenetrable bosons and fermions in one dimension*, J. Math. Phys. **1**, 516 (1960), doi:10.1063/[1.1703687.](https://doi.org/10.1063/1.1703687)
- <span id="page-10-8"></span>[48] S. I. Mistakidis, A. G. Volosniev, R. E. Barfknecht, T. Fogarty, T. Busch, A. Foerster, P. Schmelcher and N. T. Zinner, *Few-body Bose gases in low dimensions — A laboratory for quantum dynamics*, Phys. Rep. **1042**, 1 (2023), doi:10.1016/[j.physrep.2023.10.004.](https://doi.org/10.1016/j.physrep.2023.10.004)
- <span id="page-10-9"></span>[49] E. H. Lieb and W. Liniger, *Exact analysis of an interacting Bose gas. I. The general solution and the ground state*, Phys. Rev. **130**, 1605 (1963), doi:10.1103/[PhysRev.130.1605.](https://doi.org/10.1103/PhysRev.130.1605)
- <span id="page-10-10"></span>[50] E. H. Lieb, *Exact analysis of an interacting Bose gas. II. The excitation spectrum*, Phys. Rev. **130**, 1616 (1963), doi:10.1103/[PhysRev.130.1616.](https://doi.org/10.1103/PhysRev.130.1616)
- <span id="page-10-11"></span>[51] S. Ouvry and A. P. Polychronakos, *The Lieb-Liniger model in the infinite coupling constant limit*, J. Phys. A: Math. Theor. **42**, 275302 (2009), doi[:10.1088](https://doi.org/10.1088/1751-8113/42/27/275302)/1751- 8113/42/27/[275302.](https://doi.org/10.1088/1751-8113/42/27/275302)
- <span id="page-10-12"></span>[52] T. H. Hansson, J. M. Leinaas and J. Myrheim, *Dimensional reduction in anyon systems*, Nucl. Phys. B **384**, 559 (1992), doi:10.1016/[0550-3213\(92\)90581-U.](https://doi.org/10.1016/0550-3213(92)90581-U)
- <span id="page-10-13"></span>[53] D. Sen, *Dimensional reduction of two-dimensional anyons to a one-dimensional interacting Bose gas*, (arXiv preprint) doi:10.48550/[arXiv.cond-mat](https://doi.org/10.48550/arXiv.cond-mat/9412013)/9412013.
- <span id="page-10-14"></span>[54] R. Adami and A. Teta, *On the Aharonov-Bohm Hamiltonian*, Lett. Math. Phys. **43**, 43 (1998), doi:10.1023/[A:1007330512611.](https://doi.org/10.1023/A:1007330512611)

- <span id="page-11-10"></span>[55] D. Lundholm and J. P. Solovej, *Hardy and Lieb-Thirring inequalities for anyons*, Commun. Math. Phys. **322**, 883 (2013), doi:10.1007/[s00220-013-1748-4.](https://doi.org/10.1007/s00220-013-1748-4)
- <span id="page-11-11"></span>[56] D. Lundholm and J. P. Solovej, *Local exclusion principle for identical particles obeying intermediate and fractional statistics*, Phys. Rev. A **88**, 062106 (2013), doi:10.1103/[PhysRevA.88.062106.](https://doi.org/10.1103/PhysRevA.88.062106)
- [57] D. Lundholm and J. P. Solovej, *Local exclusion and Lieb-Thirring inequalities for intermediate and fractional statistics*, Ann. Henri Poincaré **15**, 1061 (2013), doi[:10.1007](https://doi.org/10.1007/s00023-013-0273-5)/s00023- [013-0273-5.](https://doi.org/10.1007/s00023-013-0273-5)
- [58] M. Correggi and L. Oddis, *Hamiltonians for two-anyon systems*, Rend. Mat. Appl. **39**, 277 (2018).
- <span id="page-11-1"></span>[59] M. Correggi and D. Fermi, *Magnetic perturbations of anyonic and Aharonov-Bohm Schrödinger operators*, J. Math. Phys. **62**, 032101 (2021), doi:10.1063/[5.0018933.](https://doi.org/10.1063/5.0018933)
- <span id="page-11-2"></span>[60] S. Li and R. K. Bhaduri, *Mapping of the Sutherland Hamiltonian to anyons on a ring authors*, (arXiv preprint) doi:10.48550/[arXiv.cond-mat](https://doi.org/10.48550/arXiv.cond-mat/9404068)/9404068.
- <span id="page-11-3"></span>[61] R. Vathsan, *Reduction of anyons to one dimension and Calogero-Sutherland-type models*, Int. J. Mod. Phys. A **13**, 4123 (1998), doi:10.1142/[S0217751X98001931.](https://doi.org/10.1142/S0217751X98001931)
- <span id="page-11-4"></span>[62] L. Brink, T. H. Hansson and M. A. Vasiliev, *Explicit solution to the N-body Calogero problem*, Phys. Lett. B **286**, 109 (1992), doi:10.1016/[0370-2693\(92\)90166-2.](https://doi.org/10.1016/0370-2693(92)90166-2)
- [63] S. Ouvry, *On the relation between the anyon and Calogero models*, Phys. Lett. B **510**, 335 (2001), doi:10.1016/[S0370-2693\(01\)00601-3.](https://doi.org/10.1016/S0370-2693(01)00601-3)
- <span id="page-11-0"></span>[64] S. Ouvry, *Anyons and lowest Landau level anyons*, Sémin. Poincaré **11**, 77 (2007).
- [65] S. Ouvry and A. P. Polychronakos, *Mapping the Calogero model on the anyon model*, Nucl. Phys. B **936**, 189 (2018), doi:10.1016/[j.nuclphysb.2018.09.011.](https://doi.org/10.1016/j.nuclphysb.2018.09.011)
- [66] A. Dasnières de Veigy and S. Ouvry, *Equation of state of an anyon gas in a strong magnetic field*, Phys. Rev. Lett. **72**, 600 (1994), doi:10.1103/[PhysRevLett.72.600.](https://doi.org/10.1103/PhysRevLett.72.600)
- <span id="page-11-5"></span>[67] A. Dasnières De Veigy and S. Ouvry, *One-dimensional statistical mechanics for identical particles: The Calogero and anyon cases*, Mod. Phys. Lett. A **10**, 1 (1995), doi:10.1142/[S0217732395000028.](https://doi.org/10.1142/S0217732395000028)
- <span id="page-11-6"></span>[68] M. Hoffmann-Ostenhof, T. Hoffmann-Ostenhof, A. Laptev and J. Tidblom, *Many-particle Hardy inequalities*, J. Lond. Math. Soc. **77**, 99 (2007), doi[:10.1112](https://doi.org/10.1112/jlms/jdm091)/jlms/jdm091.
- <span id="page-11-7"></span>[69] F. Calogero, *Solution of the one-dimensional N-body problems with quadratic and/or inversely quadratic pair potentials*, J. Math. Phys. **12**, 419 (1971), doi:10.1063/[1.1665604.](https://doi.org/10.1063/1.1665604)
- [70] B. Sutherland, *Quantum many-body problem in one dimension: Ground state*, J. Math. Phys. **12**, 246 (1971), doi:10.1063/[1.1665584.](https://doi.org/10.1063/1.1665584)
- <span id="page-11-8"></span>[71] B. Sutherland, *Quantum many-body problem in one dimension: Thermodynamics*, J. Math. Phys. **12**, 251 (1971), doi:10.1063/[1.1665585.](https://doi.org/10.1063/1.1665585)
- <span id="page-11-9"></span>[72] N. Rougerie and Q. Yang, *Dimensional reduction for a system of 2D anyons*, (arXiv preprint) doi:10.48550/[arXiv.2305.06670.](https://doi.org/10.48550/arXiv.2305.06670)

- <span id="page-12-0"></span>[73] S. Larson and D. Lundholm, *Exclusion bounds for extended anyons*, Arch. Rational Mech. Anal. **227**, 309 (2017), doi:10.1007/[s00205-017-1161-9.](https://doi.org/10.1007/s00205-017-1161-9)
- <span id="page-12-1"></span>[74] D. Lundholm and V. Qvarfordt, *Exchange and exclusion in the non-Abelian anyon gas*, (arXiv preprint) doi:10.48550/[arXiv.2009.12709.](https://doi.org/10.48550/arXiv.2009.12709)