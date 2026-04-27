RESEARCH ARTICLE | NOVEMBER 01 1960

# Relationship between Systems of Impenetrable Bosons and Fermions in One Dimension $\odot$

M. Girardeau

J. Math. Phys. 1, 516–523 (1960) https://doi.org/10.1063/1.1703687

### **Articles You May Be Interested In**

One-Dimensional Impenetrable Bosons in Thermal Equilibrium

J. Math. Phys. (July 1966)

One particle reduced density matrix of impenetrable bosons in one dimension at zero temperature

J. Math. Phys. (November 1979)

Note on the One-Dimensional Gas of Impenetrable Point-Particle Bosons

J. Math. Phys. (May 1963)

## Relationship between Systems of Impenetrable Bosons and Fermions in One Dimension\*†

M. GIRARDEAU‡
Brandeis University, Waltham, Massachusetts
(Received March 3, 1960)

A rigorous one-one correspondence is established between one-dimensional systems of bosons and of spinless fermions. This correspondence holds irrespective of the nature of the interparticle interactions, subject only to the restriction that the interaction have an impenetrable core. It is shown that the Bose and Fermi eigenfunctions are related by  $\psi^B = \psi^F A$ , where  $A(x_1 \cdots x_n)$  is +1 or -1 according as the order  $pq \cdots r$ , when the particle coordinates  $x_i$  are arranged in the order  $x_p < x_q < \cdots < x_r$ , is an even or an odd permutation of  $1 \cdots n$ . The energy spectra of the two systems are identical, as are all configurational probability distributions, but the momentum distributions are quite different. The general theory is illustrated by application to the special case of impenetrable point particles; the one-one correspondence between bosons with this particular interaction and completely noninteracting fermions leads to a rigorous solution of this many-boson problem.

#### 1. INTRODUCTION

In the following section a very simple and general relationship will be established between one-dimensional systems of impenetrable bosons and fermions. We shall find that the restrictions both to one dimension and to interactions with a completely impenetrable core are essential. Nevertheless, there are at least two motivations for studying such a relationship. First, one is enabled to obtain a rigorous solution of the many-boson problem for the case of impenetrable point particles in a one-dimensional periodic box, and this solution may serve as a useful testing ground for various approximation methods. Second, the relationship for the case of more general interactions may permit comparison of approximation methods designed for Fermi systems with those designed for Bose systems.

The general theory of the Bose-Fermi correspondence is developed in Sec. 2, and is illustrated in Sec. 3 by application to impenetrable point particles in a periodic box, for which the correspondence permits one to obtain a rigorous solution of the many-boson problem by relating it to the trivial problem of a one-dimensional free Fermi gas.

#### 2. PROOF OF THE CORRESPONDENCE

The condition that the interparticle interaction have an "impenetrable core" is most conveniently represented by the following subsidiary condition on the allowable wave functions  $\psi$ :

$$\psi(x_1 \cdots x_n) = 0 \text{ if } |x_i - x_l| \le a, \quad 1 \le j < l \le n, \quad (1)$$

where  $x_1 \cdots x_n$  are the coordinates of the *n* particles comprising the system, and *a* is the hard-core diameter. Then the Schrödinger equation is

$$(T+V)\psi = E\psi, \tag{2}$$

where V includes all interactions except the hard cores' and is otherwise completely unrestricted. Consider first any Fermi wave function  $\psi^F$  satisfying (2);  $\psi^F$  is antisymmetric in the particle coordinates. We define a "unit antisymmetric function" A as follows:

$$A(x_1 \cdots n_n) = \prod_{i>l} \operatorname{sgn}(x_i - x_l), \tag{3}$$

where  $\operatorname{sgn}(x)$  is the algebraic sign of x; an equivalent definition is that A is +1 or -1 according as the order  $pq \cdots r$ , when the  $x_j$  are arranged in the order  $x_p < x_q < \cdots < x_r$ , is an even or an odd permutation of  $1 \cdots n$ . Then the product

$$\psi^B = \psi^F A \tag{4}$$

is symmetric in the particle coordinates, and hence describes a Bose system provided that the necessary regularity conditions are satisfied. To see that they are, we note that A has discontinuities only at the surfaces  $x_i = x_i$ , where two particles come together. But  $\psi^B$  is continuous even at these surfaces, since  $\psi^F$  vanishes there as a result of the Fermi statistics; indeed, it vanishes throughout the region of the hard cores as a result of the subsidiary condition (1). The surfaces  $x_i = x_i$  divide the *n*-dimensional configuration space into n! disjoint regions, in each of which A is constant, equal to either +1 or -1. As a result,  $\psi^B$  satisfies the Schrödinger equation (2) throughout the allowed portion of configuration space  $\lceil \text{all } |x_i - x_l| > a(j \neq l) \rceil$ , by virtue of the fact that  $\psi^F$  does; for the same reason,  $\psi^B \to 0$  as  $|x_i - x_i| \to a$  from above. In the remainder of configuration space (where hard cores overlap),  $\psi^F$  and  $\psi^B$  are defined by (1). Finally,  $\psi^B$  will satisfy boundary conditions of enclosure in a box if  $\psi^F$  does, and in the case of odd<sup>1</sup> total number of particles

<sup>\*</sup>Supported in part by U. S. Air Force Office of Scientific

<sup>†</sup> An abbreviated account of this work was given by M. Girardeau, Bull. Am. Phys. Soc. Ser. II 5, 8 (1960).

<sup>†</sup> Now at Boeing Scientific Research Laboratories, Seattle, Washington.

<sup>&</sup>lt;sup>1</sup> For the case of odd n, the function  $A(x_1 \cdots x_n)$  defined by (3) remains well defined if the  $x_j$  are interpreted modulo L, in which case A satisfies periodic boundary conditions with periodicity length L. On the other hand, for the case of even n the substitution  $x_j \rightarrow x_j \pm L$  changes the sign of A. Hence our general theorem on the one-one correspondence is only valid for a system with periodic boundary conditions if n is odd. There are no restrictions on n for boundary conditions of enclosure in a box.

n, it will satisfy periodic boundary conditions if  $\psi^F$  does. Upon putting together all the pieces of this rather lengthy verbal proof, we conclude that  $\psi^B$  is a solution of the Schrödinger equation (1) satisfying Bose statistics and belonging to the same energy as  $\psi^F$ , and satisfying the same boundary and regularity conditions; for the case of periodic boundary conditions, we must add the proviso that the total number of particles be odd. The above proof cannot be generalized to systems of particles moving in three dimensions (or any number of dimensions greater than one) because there does not exist any generalization of the unit antisymmetric function A [Eq. (3)] to the case where the particle coordinates  $x_i$  are vectors rather than scalars; this is because the "surfaces"  $x_i = x_l$  then fail to divide the configuration space into disjoint regions (they are "lines" rather than "surfaces"); in two or more dimensions one can hold all particles but one fixed and move the remaining particle about throughout the box containing the system without encountering any of the fixed particles, but in one dimension the motion of one particle is blocked by the others. Even for onedimensional systems, our proof is limited to systems for which the interparticle interaction has a completely impenetrable core, since only then does the Bose wave function defined by (4) have a continuous gradient at the surfaces  $x_i = x_l$  [both the wave function and its gradient vanish there because of (1). In the degenerate case where the impenetrable core has shrunk to a point (a=0),  $\psi^B$  has discontinuous gradient at the surfaces  $x_i = x_i$ , but this is merely a reflection of the singular point interaction; such a discontinuous gradient at  $x_i = x_i$  is permitted only if there is an impenetrable point core.

The relationship (4) establishes a one-one correspondence between all the Fermi and all the Bose energy eigenfunctions; since  $A^2=1$ , this correspondence preserves all scalar products. Not only are the energy spectra of the Bose and Fermi systems identical,2 but also all configurational probability distributions, since these involve only the square of the wave function. On the other hand, the momentum distributions will in general be quite different, since they involve the momentum wave function, and the result of taking the Fourier transform depends on the relative sign of the wave function in various regions of configuration space. One expects the single-particle momentum distribution of the Bose system to reflect a tendency toward Bose-Einstein condensation, while that of the Fermi system should be dominated by the effects of the exclusion principle. We shall find that this is indeed the case for the simple example discussed in Sec. 2.

We conclude our discussion of the general correspondence by noting that the relationship (4) simplifies for the case of the ground state. We note first that for

a one-dimensional system the Fermi ground state  $\psi_0^F$  vanishes only for those configurations  $x_1 \cdots x_n$  where the hard cores overlap [Eq. (1)]; this follows from (4) and the well-known fact that the Bose ground state  $\psi_0^B$  is positive (aside from an arbitrary constant phase factor) except where it is required to vanish by boundary conditions or infinite repulsive interactions.<sup>3</sup> It follows that  $\psi_0^F$  has constant sign<sup>4</sup> throughout each of the n! regions into which the configuration space is divided by the surfaces  $x_j = x_i$ . Thus, since  $\psi_0^F$  is antisymmetric, it has the same sign (aside from a constant phase factor) as the unit antisymmetric function  $A(x_1 \cdots x_n)$  throughout the whole configuration space. As a result, the product  $\psi_0^F A$  reduces merely to the absolute value of  $\psi_0^F$ , and (4) reduces to

$$\psi_0{}^B = |\psi_0{}^F|. \tag{5}$$

#### 3. IMPENETRABLE POINT PARTICLES<sup>5A</sup>

We consider in this section the simplest possible interaction with an impenetrable core, namely the case when the core has shrunk to a point, and there is no other interaction. Then the subsidiary condition (1) reduces to

$$\psi(x_1 \cdots x_n) = 0 \quad \text{if } x_i = x_l, \quad 1 \leqslant j < l \leqslant n. \tag{6}$$

We seek the Bose eigenfunctions  $\psi^B$  and energy eigenvalues E of the Schrödinger equation

$$H\psi^{B} = T\psi^{B} = \sum_{j=1}^{n} -\frac{\hbar^{2}}{2m} \frac{\partial^{2}\psi^{B}}{\partial x_{j}^{2}} = E\psi^{B}$$
 (7)

subject to the subsidiary condition  $(6)^{5b}$  and to periodic boundary conditions with period L.

It is well known that for a system of spinless fermions, point interactions are equivalent to no interaction at all, since the Fermi wave functions automatically vanish when two particles come together. Thus the Fermi energy eigenfunctions  $\psi^F$  satisfying the subsidiary condition (6) are just the eigenfunctions of a *free* Fermi gas; the Bose eigenfunctions  $\psi^B$  satisfying (6) and (7) are then given in terms of the free Fermi gas eigenfunctions  $\psi^F$  by our general theorem (4).

The ground state  $\psi_0^F$  of the free Fermi gas is a Slater determinant of n free-particle states  $e^{ikx}$ ; the allowed values of k determined by the periodic boundary conditions are  $k_p = 2\pi p/L$  with p any integer. We shall assume that n, the total number of particles, is odd; then the ground state is nondegenerate and is obtained by choosing the values of p lying within the

<sup>&</sup>lt;sup>2</sup> It is an obvious corollary that also all equilibrium thermodynamic properties of the two systems are identical.

<sup>&</sup>lt;sup>3</sup> For a proof see O. Penrose and L. Onsager, Phys. Rev. 104, 576 (1956), Sec. 5.

 $<sup>^4</sup>$  We assume that the ground state is nondegenerate, so that  $\psi_0^F$  can be chosen to be real.

<sup>§ (</sup>a) Note added in proof. This model was treated some time ago in an unpublished work by J. K. Percus and G. J. Yevick (private communication from Professor Yevick); (b)  $\psi^B$  is not required to satisfy the Schrödinger equation on the surfaces  $x_i = x_l$ , where it vanishes and suffers discontinuities in gradient (but not in value) as a result of the infinite repulsive forces.

Fermi "sphere"  $-\frac{1}{2}(n-1) \leqslant p \leqslant \frac{1}{2}(n-1)$ . By factoring  $e^{-i(n-1)\pi x_i/L}$  out of the jth row of the Slater determinant, one can write this ground state in the form

$$\psi_0^F(x_1\cdots x_n)$$

$$= C \exp\left[-i(n-1)\pi L^{-1} \sum_{j} x_{j}\right] \begin{vmatrix} 1 z_{1} z_{1}^{2} \cdots z_{1}^{n-1} \\ \vdots & \vdots \\ 1 z_{n} z_{n}^{2} \cdots z_{n}^{n-1} \end{vmatrix}, \quad (8)$$

where

$$z_i = \exp i2\pi L^{-1}x_i \tag{9}$$

and the normalization factor C is

$$C = (n!)^{-\frac{1}{2}} L^{-\frac{1}{2}n} i^{\frac{1}{2}(n-1)}.$$
 (10)

The phase factor in (10) is chosen to make  $\psi_0^F$  real. The determinant in (8) is of a type familiar to mathematicians; its value<sup>6</sup> is just the product of the  $\frac{1}{2}n(n-1)$ differences  $(z_i-z_l)$ , i>l. Thus

$$\psi_0^F = C \exp[-i(n-1)\pi L^{-1} \sum_j x_j]$$

$$\times \prod_{i>l} \left[ \exp(i2\pi L^{-1} x_i) - \exp(i2\pi L^{-1} x_l) \right]. \quad (11)$$

According to (5), the ground state  $\psi_0^B$  of the system of impenetrable point bosons is given in terms of the Fermi ground state (11) by

$$\psi_{0}^{B} = |\psi_{0}^{F}| = (n!)^{-\frac{1}{2}} L^{-\frac{1}{2}n}$$

$$\times \prod_{j>l} |\exp(i2\pi L^{-1}x_{j}) - \exp(i2\pi L^{-1}x_{l})|$$

$$= (n!)^{-\frac{1}{2}} L^{-\frac{1}{2}n} 2^{\frac{1}{2}n(n-1)} \prod_{j>l} |\sin[\pi L^{-1}(x_{j} - x_{l})]|.$$
 (12)

The structure of this wave function is very simple. If we vary the position of one particle, keeping all the others fixed, then the wave function is positive and smoothly varying everywhere except at the position of each of the other particles, where it vanishes and has a cusp as a result of the singular repulsive interaction. According to our general results in Sec. 2, the ground state energy is the same as that of  $\psi_0^F$ , i.e., that of the free Fermi gas

$$E_0 = \frac{\hbar^2}{m} \sum_{p=1}^{\frac{1}{6}(n-1)} \left(\frac{2\pi p}{L}\right)^2 = \frac{1}{6}(n-n^{-1}) \frac{(\pi \hbar \rho)^2}{m}, \quad (13)$$

where  $\rho = n/L$ , the particle number density.<sup>7a</sup> The ex-

$$E_0 = \frac{1}{6} (n - n^{-1}) m^{-1} ((\pi \hbar \rho) / (1 - \rho a))^2,$$

differs only by a "surface" term from a result obtained previously for a Boltzmann system of one-dimensional hard spheres enclosed in a box [see R. J. Rubin, J. Chem. Phys. 23, 1183 (1955) for other references]. This agreement is to be expected, since the ground state of a Boltzmann system is identical with that of the

pressions (12) and (13) are exact for all odd values of  $n \ge 3$ , but are not valid for even  $n^{1,7b}$ ; however, one expects all extensive properties of the system to be independent of whether n is odd or even in the limit

According to Sec. 2, all configurational probability distributions of our system of impenetrable point bosons are the same as those of the free Fermi gas,8 which are well known. In particular, the pair correlation function,

$$D(x) = L^2 \int_0^L \cdots \int_0^L dx_3 \cdots dx_n |\psi_0|^B (0, x, x_3 \cdots x_n)|^2,$$
(14)

is given by

$$D(x) = 1 - \left[ \frac{\sin(\pi \rho x)}{n \sin(\pi L^{-1} x)} \right]^{2}; \tag{15}$$

for particle separation  $x \ll L$  one can use the asymptotic expression

$$D(x) \approx 1 - \left[\frac{\sin(\pi \rho x)}{\pi \rho x}\right]^2, \quad x \ll L. \tag{16}$$

D(x) rises from zero for zero particle separation to unity for particle separation much larger than  $\rho^{-1}$ . What is more interesting is the single-particle momentum distribution, which is quite different from that of the Fermi gas and should show how the Bose-Einstein condensation is affected by the "impenetrable point" interparticle interaction. However, we have not succeeded in calculating the exact momentum distribution: the difficulties one encounters in such an evaluation are similar to those encountered in the evaluation of the configurational integral in the classical statistical mechanics of interacting particles. An approximate expression for the momentum distribution, obtained by considering only the part of  $\psi_0^B$  representing excitation of pairs of particles to equal and opposite nonzero momenta, leads to the conclusion that the interaction "smears" the condensation; the number condensed at the origin of k space is not proportional to n, but rather to  $n/\ln n$ , and a large number of other allowed momentum sites near the origin have an occupation of the same order of magnitude. The derivation and details are given in the Appendix; it is hoped that this approximate result is at least qualitatively correct.

In conclusion, we consider the low-lying excited states of our Bose system. For simplicity, we limit ourselves

<sup>&</sup>lt;sup>6</sup> A. C. Aitken, *Determinants and Matrices* (Oliver and Boyd, Ltd., Edinburgh, 1951), 7th ed., p. 112.

<sup>7</sup> (a) *Note added in proof.* It is possible, by a simple change of variables, to extend the results for the ground state of the impenetrable point Bose gas so as to obtain the exact solution for the ground state of a gas of hard-sphere bosons with diameter a>0 enclosed in a one-dimensional periodic box. The resultant expression for the ground-state energy,

corresponding Bose system. (b) Our previous statement [Bull. Am. Phys. Soc. Ser. II, 5, 8 (1960)] that the ground state is "slightly more complicated" for even n was somewhat overoptimistic; the fact of the matter is that we have not been able to find it at all for the case of even n.

<sup>&</sup>lt;sup>8</sup> It is amusing that there exists a soluble one-dimensional problem in the *classical* statistical mechanics of interacting particles in which all configurational probability distributions are the same as those of the free Fermi gas, hence the same as those of our interacting Bose system; the interparticle interaction in this classical problem is, of course, different from our point interaction. See C. W. Ufford and E. P. Wigner, Phys. Rev. 61, 524 (1942).

to the one-phonon states, i.e., the states related by (4) to those states of the free Fermi gas in which only one particle is excited above the Fermi sea. The allowed momenta of these states are  $\hbar k_j = 2\pi \hbar j L^{-1}$ , where j is any integer except zero. We shall restrict ourselves to those states  $\psi_{i}^{B}$  with j>0, since those with j<0 can be obtained from the relationship  $\psi_{-i}{}^{B} = (\psi_{i}{}^{B})^{*}$ . It is easily shown with the aid of (4) and the well-known expressions for the eigenstates of the free Fermi gas that

$$\psi_{j}^{B} = CA (x_{1} \cdots x_{n}) \exp \left[-i(n-1)\pi L^{-1} \sum_{j} x_{j}\right] \times \begin{vmatrix} 1 z_{1} z_{1}^{2} \cdots z_{1}^{n-2} z_{1}^{n-1+j} \\ \vdots \\ 1 z_{n} z_{n}^{2} \cdots z_{n}^{n-2} z_{n}^{n-1+j} \end{vmatrix}, \quad (17)$$

where C and the  $z_i$  are given by (9) and (10). The preceding determinant differs from the determinant in (8) only by the factor<sup>10</sup>  $h_j$  defined as the sum of the

$$\binom{n+j-1}{j}$$

products of the  $z_i$  taken j at a time and with repetition permitted, i.e.,

$$h_{j} = \sum_{\substack{s_{1} \cdots s_{j} = 1 \\ (s_{1} \leqslant s_{2} \leqslant \cdots \leqslant s_{j})}}^{n} z_{s_{1}} \cdots z_{s_{j}}. \tag{18}$$

On taking account of (4) and (8), one finds

$$\psi_i{}^B = \psi_0{}^B h_i. \tag{19}$$

For the smallest possible phonon momentum, namely,  $k_1 = 2\pi/L$ , this reduces to the Feynman form

$$\psi_1{}^B = \psi_0{}^B h_1 = \psi_0{}^B \sum_i e^{ik_1x_i}, \tag{20}$$

but the excited states of higher momentum have a more complicated structure.

The energy of the state  $\psi_k^B$  is 11 clearly  $E_0 + \epsilon_k$ , where  $E_0$  is the ground-state energy (13) and

$$\epsilon_k = (\hbar^2/2m) \lceil (k+k_F)^2 - k_F^2 \rceil = (\hbar^2/m) k (k_F + \frac{1}{2}k);$$
 (21)

 $\hbar k_F$  is the Fermi momentum, so  $k_F = (n-1)\pi L^{-1}$ . Hence, apart from a term of order  $n^{-1}$ ,

$$\epsilon_k = (\hbar^2/m)k(\pi \rho + \frac{1}{2}k). \tag{22}$$

$$P\psi^B = (P\psi^F)A + \psi^F PA.$$

But it follows from the definition of A [Eq. (3) ff.] that the function PA vanishes except on the planes  $x_i = x_l$ , where  $\psi^F$  vanishes. Hence if  $P\psi^F = \hbar k \psi^F$ , then

$$P\psi^B = (P\psi^F)A = \hbar k\psi^F A = \hbar k\psi^B,$$

This spectrum has a phonon character at low k,

$$\epsilon_k \approx \hbar c k, \quad k \ll 2\pi \rho$$
 (23)

with

$$c = \pi \hbar o / m : \tag{24}$$

the one-dimensional Fermi gas is anomalous in having such a phonon spectrum, rather than an effective-mass type spectrum as is the case in two or three dimensions. The physical interpretation of this phonon spectrum is, however, quite different in the Bose and Fermi cases. The phonon character of the one-dimensional Fermi-gas spectrum results solely from statistics, whereas that of the Bose gas arises from the repulsive interparticle interactions. The interpretation of the low excitations as phonons is verified by the fact that the sound velocity (24) obtained from the low-k behavior of the excitation spectrum agrees with that obtained on thermodynamic grounds from the expression for the compressibility of the ground state. The pressure p when the system is in the ground state is

$$p = -\left(\frac{\partial E_0}{\partial L}\right) = \left(\frac{\rho^2}{n}\right)\left(\frac{\partial E_0}{\partial \rho}\right). \tag{25}$$

On substituting from (13), one finds

$$\phi = \pi^2 \hbar^2 \rho^3 / 3m \tag{26}$$

aside from a term of order  $n^{-1}$ . Then, since mo is the mass density, the sound velocity c is given by

$$c = (m^{-1}\partial \phi/\partial \rho)^{\frac{1}{2}} = \pi \hbar \rho/m. \tag{27}$$

which agrees with (24).

#### 4. DISCUSSION

It has been shown that for one-dimensional systems of interacting particles for which the interaction has an impenetrable core, there exists a very simple and hitherto unsuspected one-one correspondence between the energy eigenfunctions satisfying Bose-Einstein statistics and those satisfying Fermi-Dirac statistics. The form of this correspondence is such that not only are the energy spectra of the Bose and Fermi systems identical, but also all configurational probability distributions; the salient differences between the Bose and Fermi systems are revealed in their qualitatively different momentum distributions. The one-one Bose-Fermi correspondence was used to obtain a rigorous solution of the many-boson problem of impenetrable point particles in a one-dimensional periodic box; aside from its intrinsic interest in view of the rarity of exact solutions of many-body problems, this solution may also be useful as a testing ground for approximation methods in many-body theory.

#### APPENDIX: PAIR APPROXIMATION TO THE MOMENTUM DISTRIBUTION

We are interested in calculating the single-particle momentum distribution function  $n_k$  of the ground state  $\psi_0^B$  [Eq. (12)] of the system of impenetrable point

<sup>&</sup>lt;sup>9</sup> It follows from (4) that, for the case of periodic boundary conditions, the momentum of the state  $\psi^B$  is the same as that of  $\psi^F$ . Since  $P \equiv \sum_i (\hbar/i) \partial/\partial x_i$  is the total linear momentum operator, one has

<sup>&</sup>lt;sup>10</sup> A. C. Aitken, footnote reference 6, p. 116, prob. 2.

<sup>11</sup> Here we are labeling the state by its phonon wave number k rather than by the integer j, which is related to k by  $k=2\pi j/L$ .

bosons.  $n_k$  is defined as the mean number of particles with momentum  $\hbar k$  and is therefore given by

$$n_k = n \sum_{k_2 \cdots k_n} |\phi_0^B(kk_2 \cdots k_n)|^2, \tag{A1}$$

where  $\phi_0^B$  is the momentum wave function and  $k_2 \cdots k_n$  are summed over all wave numbers consistent with the periodic boundary conditions.  $\phi_0^B$  is the Fourier transform of  $\psi_0^B$ :

$$\phi_0^B(k_1\cdots k_n)$$

$$=L^{-\frac{1}{2}n}\int_0^L\cdots\int_0^Ldx_1\cdots dx_n\psi_0^B(x_1\cdots x_n)$$

$$\times e^{-ik_1x_1} \cdots e^{-ik_nx_n}$$
. (A2)

All attempts at a direct evaluation of  $n_k$  with the aid of (12), (A1), and (A2) have failed. Using (4) and the faltung theorem for Fourier transforms, one can relate  $\phi_0^B$  to the momentum wave function of the free Fermi gas and the Fourier transform of  $A(x_1 \cdots x_n)$ , but this approach does not appear to be fruitful.

Since it is well known that many calculations in many-body theory are more simply and elegantly performed if one works in terms of a quantized-field representation rather than the Schrödinger representation, it is suggested that we employ such a representation in calculating the momentum distribution function  $n_k$ . If  $a_k$  and  $a_k^{\dagger}$  are, respectively, the annihilation and creation operators for Bose particles in the single-particle momentum eigenstate  $L^{-\frac{1}{2}e^{ikx}}$ , then  $N_k = a_k^{\dagger}a_k$  is the occupation-number operator for this single-particle state, and  $n_k$  is just the expectation value

$$n_k = \langle \psi_0{}^B | N_k | \psi_0{}^B \rangle, \tag{A3}$$

where  $|\psi_0^B\rangle$  is the state vector whose Schrödinger wave function is  $\psi_0^B(x_1\cdots x_n)^{12}$  In order to obtain an expression for the ground state vector  $|\psi_0^B\rangle$  in terms of some operator (a function of the  $a_k$  and  $a_k$ ) acting on

$$\psi(x)\psi(x') = \psi^{\dagger}(x)\psi^{\dagger}(x') = 0, \quad |x-x'| \le a,$$

where  $\psi(x)$  and  $\psi^{\dagger}(x)$ , respectively, annihilate and create a boson at point x. If this equation were a necessary property of the Bose field operators for particles with hard cores of diameter a, then the objection would be justified. However, Siegert's Eq. (A4) is a sufficient, but not a necessary, condition for the vanishing of the Schrödinger wave function when hard cores overlap. All that is necessary is the much weaker condition

$$\psi(x)\psi(x')|\rangle=0, |x-x'|\leqslant a,$$

where  $| \rangle$  is any state vector describing particles with impenetrable cores of diameter a (for the case discussed in this Appendix, a=0). It is more convenient for our purposes to retain field operators  $\psi(x)$ ,  $\psi^{\dagger}(x)$  satisfying the usual Bose commutation rules, and hence to interpret the above equation as a subsidiary condition on allowable state vectors  $| \rangle$ ; this subsidiary condition is merely a transcription of (1) into the language of quantized fields.

the unperturbed ground state vector,<sup>13</sup> we first rewrite  $\psi_0^B \lceil \text{Eq. (12)} \rceil$  in an exponential form:

$$\psi_0^B(x_1 \cdots x_n)$$

$$= C' \prod_{j>l} \left| \sin[\pi L^{-1}(x_j - x_l)] \right|$$

$$= C' \exp\left\{ \frac{1}{2} \sum_{ij} \ln|\sin[\pi L^{-1}(x_i - x_j)] \right\}. \quad (A4)$$

where C' is a normalization constant and  $\sum_{jl}$  is a sum with  $j \neq l$ , rather than with j > l. On introducing the Fourier decomposition

$$\frac{1}{2}\ln\left|\sin\left(\pi L^{-1}(x_j-x_l)\right)\right| = -\sum_k \lambda_k e^{ik(x_j-x_l)}, \quad (A5)$$

where

$$\lambda_k = -\frac{1}{2}L^{-1}\int_0^L \ln \sin(\pi L^{-1}x)e^{-ikx}dx,$$
 (A6)

one finds

$$\psi_0^B(x_1\cdots x_n) = C' \exp\left[-\sum_{jl'}\sum_k \lambda_k e^{ik(x_j-x_l)}\right]. \quad (A7)$$

In the Schrödinger representation, the particle density operator  $\rho(x)$  is given by

$$\rho(x) = \sum_{i} \delta(x - x_i), \tag{A8}$$

where  $\delta$  is a periodic Dirac delta function, i.e., its arguments are to be interpreted modulo L. The Fourier components of the density are

$$\rho_k = \int_0^L \rho(x) e^{-ikx} dx = \sum_j e^{-ikx_j}.$$
 (A9)

Equation (A7) can be rewritten in terms of the  $\rho_k$ :

$$\psi_0{}^B(x_1\cdots x_n) = C'e^{n\sum_k \lambda_k}e^{-\sum_k \lambda_k \rho k\rho - k}. \tag{A10}$$

To transform (A10) to the quantized-field representation, we first rewrite it in the form

$$\psi_0{}^B(x_1\cdots x_n) = C^{\prime\prime}e^{-\sum_k \lambda_k \rho_k \rho - k}L^{-\frac{1}{2}n}, \tag{A11}$$

where  $C'' = C' \exp(n \sum_k \lambda_k) L^{\frac{1}{2}n}$  and the  $\rho_k$  are to be interpreted as operators which reduce merely to multiplicative functions in the Schrödinger representation. The factor  $L^{-\frac{1}{2}n}$  inserted on the right side of (A11) is the Schrödinger wave function of the unperturbed system, i.e., the system in which the bosons are completely free so that the subsidiary condition (6) is not imposed. Upon transforming to the quantized-field representation, one therefore finds

$$|\psi_0^B\rangle = C''e^{-\Sigma_k\lambda_k\rho_k\rho-k}|n\rangle,$$
 (A12)

where  $|n\rangle$  is the state vector representing the unperturbed ground state

$$|n\rangle = (n!)^{-\frac{1}{2}} (a_0^{\dagger})^n |0\rangle \tag{A13}$$

with  $|0\rangle$  the vacuum state. In the quantized-field repre-

<sup>&</sup>lt;sup>12</sup> Those familiar with Siegert's work on field operators for bosons with impenetrable cores [A. J. F. Siegert, Phys. Rev. 116, 1057 (1959)] may raise the objection that the free-particle annihilation and creation operators  $a_k$  and  $a_k$ † cannot be used in treating particles with hard cores. Such an objection is based on a misinterpretation of the significance of Eq. (A4) of Siegert's paper:

<sup>&</sup>lt;sup>13</sup> I am indebted to Professor E. P. Gross for suggesting the following method of finding the ground state vector  $|\psi_0^B\rangle$ .

sentation, the operators  $\rho_k$  are given by

$$\rho_{k} = \sum_{k'k''} a_{k'}^{\dagger} a_{k''} \int_{0}^{L} (L^{-\frac{1}{2}} e^{-ik'x}) e^{-ikx} (L^{-\frac{1}{2}} e^{ik''x}) dx$$

$$= \sum_{k'} a_{k'}^{\dagger} a_{k'+k}. \tag{A14}$$

Equations (A3) and (A12)-(A14) furnish an expression for  $n_k$  which is alternative to (A1), but, unfortunately, no more amenable to exact evaluation; the difficulty can be traced to the fact that the argument of the exponential operator in (A12) is quartic in the  $a_k$  and  $a_k$ , whereas one only knows how to evaluate expectation values in states of the form  $e^S|n\rangle$  if S is quadratic (corresponding to a *linear* canonical transformation of the annihilation and creation operators). We are therefore forced to an approximate evaluation of (A3) based on an approximation which renders S quadratic.

In his pioneering work on the many-boson problem, <sup>14</sup> Bogolubov linearized the Heisenberg equations of motion by treating  $a_0$  and  $a_0^{\dagger}$  as c numbers. The basic physical reasoning involved is that the expectation value of  $N_0 = a_0^{\dagger} a_0$  will be very large if any tendency to Bose-Einstein condensation survives the effects of the interparticle interaction; on the other hand,  $[a_0,a_0^{\dagger}]=1$ . Hence the commutator of  $a_0$  and  $a_0^{\dagger}$  is much smaller than their product, so that their replacement by c numbers seems heuristically justified. Bogolubov made the additional approximation of dropping those cubic and quartic terms that remained in the Hamiltonian after replacement of  $a_0$  and  $a_0^{\dagger}$  by c numbers. We shall employ similar approximations in evaluating (A3).

It follows from (A14) that

$$\rho_0 = \sum_k a_k^{\dagger} a_k \equiv \sum_k N_k \equiv N. \tag{A15}$$

But the  $\rho_k$  all commute (as can be proved from the Bose commutation relations for the  $a_k$ ,  $a_k^{\dagger}$ ) and  $|n\rangle$  is an eigenstate of N belonging to eigenvalue n (the total number of particles). Upon separating out the term with k=0 in (A12), one accordingly finds

$$|\psi_0{}^B\rangle = C^{\prime\prime\prime}e^S|n\rangle, \tag{A16}$$

where C''' is a normalization constant and

$$S = -\sum_{k \neq 0} \sum_{k'k''} \lambda_k a_{k'+k} ^{\dagger} a_{k''-k} ^{\dagger} a_{k'} a_{k''}; \quad (A17)$$

in obtaining (A16) and (A17) use has also been made of the Bose commutation relations in order to throw the product of annihilation and creation operators into normal order  $a^{\dagger}a^{\dagger}aa$ . Replacing  $a_0$  and  $a_0^{\dagger}$  in (A17) by the c number  $n_0^{\dagger}$  and dropping terms cubic and quartic in the  $a_k$ ,  $a_k^{\dagger}$  with  $k \neq 0$ , one obtains the approximate expression

$$S_{p} = -n_{0} \sum_{k \neq 0} \lambda_{k} (a_{k} a_{-k} + a_{k}^{\dagger} a_{-k}^{\dagger} + 2N_{k}), \quad (A18)$$

where the subscript "p" implies "pair approximation." The c number  $n_0$  is to be interpreted as the mean number of particles with momentum zero. To be consistent, we must also make the replacement  $a_0^{\dagger} \rightarrow n_0^{\dagger}$  in the unperturbed state  $|n\rangle$  [Eq. (A13)]; the pair approximation to the ground state vector (A16) is therefore

$$|\psi_0{}^B{}_p\rangle = De^{S_p}|0\rangle, \tag{A19}$$

where D is a normalization constant and  $|0\rangle$  is the vacuum state. Because of the replacements  $a_0 \to n_0^{\frac{1}{2}}$ ,  $a_0^{\dagger} \to n_0^{\frac{1}{2}}$ , the total number of particles is no longer conserved  $[|\psi_0^B_p\rangle$  is not an eigenstate of N, Eq. (A15)], but we can impose the requirement that the *mean* total number of particles be n:

$$n_0 + \sum_{k \neq 0} \langle \psi_0^B_p | N_k | \psi_0^B_p \rangle = n. \tag{A20}$$

The state (A19) is not yet in a form in which expectation values can be readily evaluated, since the operator  $e^{S_p}$  is not unitary; indeed, it is hermitian. We shall therefore find an equivalent unitary operator by investigating the relationship between  $a_k|\psi_0^B{}_p\rangle$  and  $a_{-k}^{\dagger}|\psi_0^B{}_p\rangle$  (it is obvious from the pair structure of  $|\psi_0^B{}_p\rangle$  that these two states are closely related). Since  $S_p$  is hermitian, the operator  $e^{-S_p}$  is well-defined, and so

$$a_k e^{S_p} |0\rangle = e^{S_p} (e^{-S_p} a_k e^{S_p}) |0\rangle,$$

$$a_{-k} \dagger e^{S_p} |0\rangle = e^{S_p} (e^{-S_p} a_{-k} \dagger e^{S_p}) |0\rangle.$$
(A21)

We define the similarity (not unitary) transforms<sup>15</sup>

$$a_k(\epsilon) \equiv e^{-\epsilon S_p} a_k e^{\epsilon S_p}, \quad a_{-k}^{\dagger}(\epsilon) \equiv e^{-\epsilon S_p} a_{-k}^{\dagger} e^{\epsilon S_p}.$$
 (A22)

These can be evaluated by a differential-equation technique. The "Heisenberg equations of motion" are

$$\begin{aligned} da_{k}(\epsilon)/d\epsilon &= \left[a_{k}(\epsilon), S_{p}\right] = -2n_{0}\lambda_{k}\left[a_{k}(\epsilon) + a_{-k}^{\dagger}(\epsilon)\right], \\ da_{-k}^{\dagger}(\epsilon)/d\epsilon &= \left[a_{-k}^{\dagger}(\epsilon), S_{p}\right] \\ &= 2n_{0}\lambda_{k}\left[a_{k}(\epsilon) + a_{-k}^{\dagger}(\epsilon)\right]. \end{aligned} \tag{A23}$$

Adding these two equations, one finds that the derivative of  $[a_k(\epsilon)+a_{-k}^{\dagger}(\epsilon)]$  vanishes, and hence that

$$a_k(\epsilon) + a_{-k}^{\dagger}(\epsilon) = a_k + a_{-k}^{\dagger}$$
 (A24)

since  $a_k(0) = a_k$  and  $a_{-k}^{\dagger}(0) = a_{-k}^{\dagger}$ . Differentiating the first Eq. (A23) once more and using (A24), one finds

$$d^2a_k(\epsilon)/d\epsilon^2 = 0, \tag{A25}$$

and hence

$$a_k(\epsilon) = A_k + B_k \epsilon. \tag{A26}$$

The coefficients  $A_k$  and  $B_k$  can be evaluated from the initial conditions

$$a_k(0) = A_k = a_k,$$
  
 $(da_k/d\epsilon)_{\epsilon=0} = B_k = -2n_0\lambda_k(a_k + a_{-k}^{\dagger});$  (A27)

the second Eq. (A23) has been used in obtaining the second Eq. (A27). It follows from (A22), (A26), and

<sup>&</sup>lt;sup>14</sup> N. N. Bogolubov, J. Phys. (U.S.S.R.) 11, 23 (1947).

<sup>15</sup> Note that  $a_{-k}\dagger(\epsilon) \neq [a_{-k}(\epsilon)]^{\dagger}$ .

(A27) that

$$e^{-S_p}a_ke^{S_p}=a_k(1)=(1-2n_0\lambda_k)a_k-2n_0\lambda_ka_{-k}^{\dagger},$$
 (A28)

and then from (A24) that

$$e^{-S_p}a_{-k}^{\dagger}e^{S_p} = a_{-k}^{\dagger}(1) = 2n_0\lambda_k a_k + (1 + 2n_0\lambda_k)a_{-k}^{\dagger}.$$
 (A29)

By (A21), (A28), and (A29) one then finds, using the fact that *akIO)=O,* 

$$a_k e^{S_p} |0\rangle = -2n_0 \lambda_k e^{S_p} a_{-k}^{\dagger} |0\rangle,$$
  

$$a_{-k}^{\dagger} e^{S_p} |0\rangle = (1 + 2n_0 \lambda_k) e^{S_p} a_{-k}^{\dagger} |0\rangle.$$
(A30)

Let us define

$$\xi_k \equiv (1 - \phi_k^2)^{-\frac{1}{2}} (a_k + \phi_k a_{k-}^{\dagger}),$$
 (A31)

where

$$\phi_k \equiv 2n_0 \lambda_k / (1 + 2n_0 \lambda_k). \tag{A32}$$

Then it follows from (A19) and (A30) that

$$\xi_k |\psi_0^B{}_p\rangle = 0. \tag{A33}$$

Furthermore, it follows from (A31) and the Bose commutation relations for the *ak* and *ak* t that

$$\left[ \xi_k, \xi_{k'}^{\dagger} \right] = \delta_{kk'}, \quad \left[ \xi_k, \xi_{k'} \right] = 0,$$
 (A34)

i.e., that the operators ~" and ~"t are also Bose annihilation and creation operators for certain "elementary excitations" which can be thought of as phonons; (A33) states that the ground state is the state of no phonons. The canonical transformation (A31) is of the Bogolubov14 type, although the function *epk* is of quite a different form from his.

We can now use (A31) and (A33) to find a *unitary*  operator U such that

$$|\psi_0{}^B{}_p\rangle = U|0\rangle. \tag{A35}$$

Indeed, since the transformation (A31) is canonical, one can define a unitary operator *U* by the requirement

$$\xi_k = U a_k U^{-1} = (1 - \phi_k^2)^{-\frac{1}{2}} (a_k + \phi_k a_{-k}^{\dagger}).$$
 (A36)

Then by (A3S) and (A36),

$$\xi_k |\psi_0^B{}_p\rangle = (Ua_k U^{-1})U|0\rangle = Ua_k|0\rangle = 0, \quad (A37)$$

so that (A33) is satisfied. Since 1 *1foB p)* is uniquely determined up to normalization by the requirement (A33) for all k(~O), and the state (A3S) is normalized, we conclude that the expression (A3S), with *U* determined by (A36), is indeed correct. The explicit form of *U* is not difficult to determinel6 ; it is given by

$$U = \exp\left[\frac{1}{2} \sum_{k \neq 0} (a_k a_{-k} - a_k^{\dagger} a_{-k}^{\dagger}) \tanh^{-1} \phi_k\right]. \quad (A38)$$

It is now straightforward to evaluate the approximate momentum distribution function

$$n_{k} \approx \langle \psi_{0}^{B}{}_{p} | N_{k} | \psi_{0}^{B}{}_{p} \rangle$$
  
 
$$\approx \langle 0 | U^{-1} N_{k} U | 0 \rangle, \quad k \neq 0.$$
 (A39)

One sees from (A38) that *U-I* can be obtained from *U*  by replacing *epk* by *-epk;* hence by (A36)

$$U^{-1}a_kU = (1 - \phi_k^2)^{-\frac{1}{2}}(a_k - \phi_k a_{-k}^{\dagger}).$$
 (A40)

Thus

$$U^{-1}N_{k}U = (U^{-1}a_{k}^{\dagger}U)(U^{-1}a_{k}U)$$

$$= (1 - \phi_{k}^{2})^{-1}(\phi_{k}^{2} + N_{k} + \phi_{k}^{2}N_{-k} - \phi_{k}a_{k}a_{-k} - \phi_{k}a_{k}^{\dagger}a_{-k}^{\dagger}), \quad (A41)$$

and by (A39) and (A32)

$$n_k \approx \phi_k^2/(1-\phi_k^2) = 4n_0^2 \lambda_k^2/(1+2n_0\lambda_k), \quad k \neq 0.$$
 (A42)

The integrals (A6) for the Ak are readily evaluated by contour integration when one takes into account the fact that *k* is an integral multiple of 27r / *L;* the result is

$$\lambda_0 = \frac{1}{2} \ln 2; \quad \lambda_k = \pi/2L |k|, \quad k \neq 0.$$
 (A43)

Thus

$$n_k \approx \pi^2 n_0^2 / L |k| (L|k| + \pi n_0), \quad k \neq 0.$$
 (A44)

To determine no, the number of particles condensed at the origin of momentum space, we use (A20):

$$n_0 + \sum_{k \neq 0} n_k = n. \tag{A45}$$

Since we are only interested in results valid asymptotically as *n* ---+ 00, we can replace the summation by an integration

$$\sum_{k \neq 0} \longrightarrow \frac{L}{2\pi} \left( \int_{2\pi/L}^{\infty} dk + \int_{-\infty}^{-2\pi/L} dk \right), \quad (A46)$$

the interval (- 27r/ L, 27r/ L) being excluded because the smallest allowed value of 1 *k* 1 ~O is 211/ *L.* Thus, since *n\_k=n",* (A4S) becomes

$$n_0 + \frac{L}{\pi} \int_{2\pi/L}^{\infty} n_k dk \approx n. \tag{A47}$$

On inserting (A44) and performing the resultant elemen tray integration, one finds

$$n_0[1+\ln(1+\frac{1}{2}n_0)]\approx n.$$
 (A48)

For large no, this reduces to

$$n_0 \approx n/\ln n_0. \tag{A49}$$

This transcendental equation can be solved for no by iteration. The first approximation, obtained by replacing no by *n* on the right-hand side of (A49), is

$$n_0 \approx n/\ln n. \tag{A50}$$

A better approximation, obtained by inserting (ASO) in the right side of (A49), is

$$n_0 \approx n/(\ln n - \ln \ln n). \tag{A51}$$

Equation (AS1) shows that (ASO) is adequate for very large n; thus (A44) becomes

$$n_k \approx (\pi \rho / \ln n)^2 [|k| (|k| + \pi \rho / \ln n)]^{-1}, \quad k \neq 0 \quad (A52)$$

where *p=n/L.* 

<sup>16</sup> M. Girardeau and R. Arnowitt, Phys. Rev. 113, 755 (1959) Appendix A. '

11 December 2025 20:43:3

The expressions (A50) and (A51) show that the interparticle interaction "smears" the Bose-Einstein condensation<sup>17</sup>: the number of particles condensed at k=0 is not proportional to n, but rather to  $n/\ln n$ , and a large number of other allowed momentum sites near the origin have occupations of the same order of magnitude, since for small k (A52) reduces to

$$n_k \approx n/(2|j|\ln n), \quad 0 < |k| \equiv (2\pi |j|/L) \ll \pi \rho/\ln n, \text{ (A53)}$$

where  $j=\pm 1, \pm 2, \cdots$ . In spite of this "smearing" effect of the interaction, the condensation is still complete in a certain generalized sense. We can define the condensed fraction f as the fraction of the total number of particles having momenta which are infinitesimal compared to any macroscopic momentum:

$$f \equiv \lim_{\epsilon \to 0} \lim_{n \to \infty} (n^{-1} \sum_{|k| < \epsilon \rho} n_k); \tag{A54}$$

in cases where the condensation takes place only into

k=0, this reduces to the usual definition

$$f=\lim_{n\to\infty}(n_0/n).$$

Then by (A52)

$$f = (\pi \rho)^{2} \lim_{\epsilon \to 0} \lim_{n \to \infty} \left[ \frac{1}{n(\ln n)^{2}} \sum_{|k| < \epsilon \rho} \frac{1}{|k| (|k| + \pi \rho / \ln n)} \right]$$

$$= \pi \rho \lim_{\epsilon \to 0} \lim_{n \to \infty} \left[ \frac{1}{(\ln n)^{2}} \int_{2\pi/L}^{\epsilon \rho} \frac{dk}{k(k + \pi \rho / \ln n)} \right]$$

$$= \lim_{\epsilon \to 0} \lim_{n \to \infty} \left\{ \frac{1}{\ln n} \left[ \ln \left( \frac{\epsilon n}{2\pi} \right) - \ln \left( \frac{\epsilon n}{2\pi} + \frac{n}{2 \ln n} \right) + \ln \left( 1 + \frac{n}{2 \ln n} \right) \right] \right\} = \lim_{\epsilon \to 0} 1 = 1. \quad (A55)$$

Thus the Bose-Einstein condensation is *complete* in the generalized sense (A54). This is because  $n_k$  [Eq. (A52)] falls off quite rapidly with increasing k, being  $\sim (\pi/\epsilon \ln n)^2$  for  $|k| \sim \epsilon \rho$ ;  $n_k$  falls essentially to zero in a distance of order  $\rho/\ln n$ . This behavior is in marked contrast to that of the momentum distribution function of the free Fermi gas, which is equal to unity for  $|k| < \pi \rho$  and vanishes for  $|k| > \pi \rho$ .

<sup>&</sup>lt;sup>17</sup> The fact that  $n_0$  is not proportional to n is connected with the fact that the ground-state wave function (12) possesses long-range order in view of the very slow rate of change of the factors  $\sin[\pi L^{-1}(x_i-x_i)]$ ; see O. Penrose and L. Onsager, footnote reference 3. This long-range order does not show up in the pair correlation function (15), or indeed those of any finite order; one has to go to the many-body correlation functions to see it.