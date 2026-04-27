# **On the Theory of Identical Particles.**

*Department of Physics, University of Oslo - Oslo* 

J.M. ImI~AAS and J. MY~m~II~t

(rieevuto il 16 Agosto 1976)

Summary. -- The classical configuration space of a system of identical particles is examined. Due to the identification of points which are related'by permutations of particle indices, it is essentially different, globally, from the Cartesian product of the one-particle spaces. This fact is explicitly taken into account in a quantization of the theory. As a consequence, no symmetry constraints on the wave functions and the observables need to be postulated. The two possibilities, corresponding to symmetric and antisymmetric wave functions, appear in a natural way in the formalism. But this is only the ease in which the particles move in three- or higher-dimensional space. In one and two dimensions a continuum of possible intermediate cases connects the boson and fermion cases. The effect of particle spin in the present formalism is discussed.

#### **]. -- Introduction.**

In the quantum description of a system of identical particles, the indistinguishability of the particles has consequences which deeply affect the physical nature of the system. Usually, the indistinguishability is expressed in the theory by imposing symmetry constraints on the state functions and on the observables. Thus, the state functions can be either symmetric or antisymmetric with respect to the interchange of two particle co-ordinates, and all the observables must be invariant under such an operation. The physical consequences of this postulate seem to be in good agreement with the experimental facts. However, the theoretical justification of the postulate, as found, for example, in standard textbooks (1.a), of~n seems unclear, and several authors have attempted

<sup>(~)</sup> A. MESSIAH: *Quamtum Mechanics,* Chap. XIV (Amsterdam, 1962).

<sup>(</sup>o) L. I. SCHI~'F: *Quantum Mechanics,* Chap. 10 (New York, N.Y., 1968).

<sup>(</sup>s) E. MERZBACH~R: *Quantum Mechanics,* Chap. 18 (New York, N.Y., 1961).

more careful analysis (4-8). It seems to us, however, that no completely satisfactory discussion on the consequences of indistinguishability, in the context of nonrelativistic quantum mechanics, has emerged so far.

The problems start with the introduction of particle indices. This step brings elements of nonobservable character into the theory and tends, therefore, to make the discussion more obscure. Thus, the meaning of the particles being identical is often explained by saying that the physical situation is unchanged if the particles are interchanged. This is expressed by the equation

$$|\psi(p(x_1,...,x_N))|^2 = |\psi(x_1,...,x_N)|^2$$
,

where p is any permutation of the 2V particle co-ordinates. The above statement has correctly been criticized (6) by pointing out that the word (~ interchange ~ here has no physical meaning. The two quantities in the equation have no separate meaning, and the equation, therefore, at most reflects the redundancy in the notation, *i.e.* that the same particle configuration can be described in different ways. in the present work we want to present a formulation, which seems to be conceptually more simple, in which this redundancy in notation is eliminated in a very natural way.

First we discuss, in sect. 2, the classical description of a system of identical particles, starting with the consequences of indistinguishability in classical statistica.1 mechanics. We go on and study in detail the classical configuration space. Our point is that the configuration space of a ~V-particle system is not the Cartesian product of the single particle spaces, but rather an identification space which has, in fact, a different global topological structure, although it is locally isometric to the product space.

The quantum description is discussed in sect. 3. It is introduced in terms of quadratically integrable functions defined on the classical configuration space of the system. Since the indistinguishability of the particles is t,~ken into account in the definition of the configuration space, no additional restriction, corresponding to the symmetrization postulate, is put on the state functions.

The quantization is studied in detail for a two-particle system in one-, two- and three- or higher-dimensional Euclidean space, with an emphasis on the physical effect of the global curvature of the configuration space. It is shown how a translation can be made to the traditional description in terms of complex wave functions on Euclidean space. The restriction on wave functions, to be either symmetric or antisymmetric, then appears in a natural way from the formalism, without having to be introduced as an additional cvnstra~nt. This is, however, only the case provided space is at least three-dimen-

**<sup>(4)</sup> A.** M. L. MESSIA~ and O. W. GREEN:BERG: *Phys. Rev.,* 136, B 248 (1964).

<sup>(5)</sup> M.D. GIttARDEAU: *Phys. Rev.,* 139, B 500 (1965).

**<sup>(6)</sup> R. Mm~:** \_-Vuovo *Cim~to,* 18B, 110 (1973).

sional. In one and two dimensions it is shown that also intermediate cases between boson and fermion systems are possible.

In sect. 4 we discuss how to modify the formalism in order to take particle spin into account, and which further restriction is implied by the spin-statistics relation. Finally~ we give in sect. 5 a brief outline of how our discussion on the two-particle case can be generalized to a system of N particles.

# 2. - Identical particles in classical **mechanics.**

As a preparation for the next section~ on quantization, we will discuss, in this section~ how the classical description of a many-particle system is affected by the indistinguishability of the particles. We want to argue that the proper classical description of a system of identical particles must be the basis for its quantization.

2"1. *Gibbs' paradox. -* The ~ principle of indistinguishability of identical particles ,, together with its effects, is usually considered to be one of the characteristics of quantum mechanics as opposed to classical mechanics. However, the principle is older than quantum mechanics. It was recognized by G~BS and it is, in fact, the root of his entropy paradox in classical statistical mechanics (7). In order to correctly calculate the zero-entropy change in a process of miYing of two identical fluids or gases (at the same temperature etc.), GIBBS postulated that states differing only by permutations of identical particles should not be counted as distinct. LA~D~ has argued that this postulate is not only sufficient, but also necessary to explain the zero-entropy change (8).

We would like to illustrate this point by a simple example, and refer to the literature for more general treatments (7-~o). Consider a system of h T particles of mass m confined to the volume V and with a total energy E. Its entropy S is

$$S(N, E, V) = k \ln \left( \frac{\dot{w}}{w_0} \right),$$

where k is Boltzmann~s constant~ w is the available volume in phase space and wo is an (arbitrary) scale factor.

By now we ignore the identical-paxticle effects. As fax as the interactions between the particles do not limit the phase space volume, this is a product *w = uv* of the co-ordinate space volume v = V N and the momentum space

<sup>(7)</sup> J. W. GxBBS: *Elementary Principles in Statistical ~eehanics,* Chap. XV (New York, N.Y., 1960).

<sup>(</sup>s) A. L~D~: *New Foundations o] Quantum Mechomics* (Cambridge, 1965), p. 68.

**<sup>(9)</sup> D. HEST~.S:** *Amer. Journ. Phys., 38,* 840 (1970).

**<sup>(</sup>lo) T. H. BOYER:** *Miner. Journ. Phys., 38,* 849 (1970).

volume u, which is the <~ area, of the surface of a sphere of radius ~ in a 3N-dimensional space r

(2) 
$$u = A_{3N}(2mE)^{(3N-1)/2}.$$

The constant A. is determined by the recursion relations

(3) 
$$A_{n+2} = (2\pi/n) A_n, A_1 = 2, A_2 = 2\pi,$$

so that 9 when n is large, we have approximately

(4) 
$$\ln A_n \approx (n/2) \ln \pi - \sum_{i=1}^{n/2} \ln i \approx (n/2) \left(-\ln (n/2) + \ln \pi + 1\right).$$

Thus we find

(5) 
$$S(N, E, V) = k \ln (w/w_0) \approx Nk \ln (CV(E/N)^{\frac{1}{2}})$$

with C as a constant independent of N, ~ and V.

However, this formula is wrong because it implies an entropy increase of

(6) 
$$S(2N, 2E, 2V) - 2S(N, E, V) \approx 2Nk \ln 2$$

when two such systems are allowed to mix. The way of correcting it is to note that, if all particles are identical, each microstate of the N-particle system is counted N! times in the above calculation of the phase-space volume. The correct volume is, therefore, *w'= w/(N !),* giving the entropy

(7) 
$$S'(N, E, V) = k \ln (w'/w'_0) \approx Nk \ln (C'(V/N)(E/N)^{\frac{1}{2}})$$

and, thereby,

(8) 
$$S'(2N, 2E, 2V) - 2S'(N, E, V) \approx 0$$
.

The above discussion concerns the macroscopic description of a system of identical particles, but it should be kept in mind when turning to the microscopic description.

*2"2. The configuration space o] a system o/ identical particles.* - In what follows we denote by X the co-ordinate space of a one-particle system, and we assume N identical particles to be moving in this space. The possible configurations of the N-particle system are usually described as the points in X~

which is the 0artesian product of the one-particle spa~es. However, since the particles are identical, no physical distinction can be made between points in X ~ that differ only in the ordering of the particle co-ordinates. Thus, the two points in X ~

(9) 
$$\begin{cases} x = (x_1, ..., x_N) & (x_i \in X \text{ for } i = 1, ..., N), \\ x' = p(x) = (x_{p^{-1}(1)}, ..., x_{p^{-1}(N)}), \end{cases}$$

where p is a permutation of the particle indices, both describe the same physical eonfi~ration of the system. Therefore the true configuration space of the hr-particle system is not the Cartesian product X ~, but the space obtained by identifying points in X ~ representing the same physical configuration. The physical significance of such an identification of points is illustrated by Gibbs' paradox, as discussed above. We denote the identification space by *X~/S~,*  since it is obtained from X ~ by ~ dividing out, the action of the symmetric group S~. Since SN is a discrete, indeed finite, transformation group in X N, the space *X~/S~* is locally isomorphic to X ~, except at its singular points. The difference between the spaces lies in their global properties, more precisely in the singularity structure of *X:v[S~.* Whereas X ~ has only regular points when X is regular, those points which correspond to a coincidence of the positions of two or more particles are singular points in *X~/S~.* 

The fact that the configuration space of the ~V-particle system is *XN/SN,*  and not X N, has usually been overlooked, either unconsciously or deliberately. As far as the microscopic description of a classical many-particle system is concerned, the reason is easy to understand. The dynamics of a classical system involves only the local properties of the configuration space, so that the choice between *X~/SN* and X N is largely a matter of convenience. To be more precise, the time evolution of the classical Y-particle system is a continuous curve in *X~/S,,~* iwith time t as a parameter. The one curve in *X~/SN* corresponds to h r ! curves in X ~. But if X is many-dimensional, the N i curves in X ~ will not normally cross, thus one is free to pick one single continuous curve in X N at random and call it the time evolution of the system. If two or more curves in X ~ cross at a given time, that is if two or more point particles collide, then it might still be possible to define a unique curve through the collision point by requiring continuous derivatives. Thus, one is norn~lly able to lift the identification of points in X ~ by following the continuous time evolution. What makes this lifting possible is that S~ is a discrete transformation group, while the time e~-olution is continuous.

The quantum case is quite different, as the global properties of the configuration space then become essential. We discuss this point in the next section, assuming X to be Euclidean, and show there that the usual symmetry constraints on wave functions defined on X ~ can be derived as consequences of the topological difference between *XN/S~* and X ~.

l~ow we want to study in more detail the configuration space *XN/S~* for various one-particle spaces X. Assuming X to be the n-dimensional Euclidean sp~ce d~,, we can introduce the centre-of-mass (c.m.) co-ordinate

(10) 
$$X = N^{-1} \sum_{i=1}^{N} x_i \in \mathscr{E}_n,$$

where x~,...,x~Ed'~ are the co-ordinates of the N particles. The c.m. coordinate is invariant under S~ and, obviously, the /V-particle space is a Cartesian product,

(11) 
$$\mathscr{E}_n^N/S_N = \mathscr{E}_n \times r(n, N),$$

of the c.m. space d ~. and some <( relative, space *r(n, 2V)* representing the n~ -- n degrees of freedom o2 the relative motion of the particles. The space *r(n,/V)*  is obtained from the Euclidean space #.~\_. by identifying points connected through an element from S~.

Let us limit our discussion to the case of a two-particle system, h r = 2. The relative space *r(n,* 2) is the result of an identification of the points x = x, -- x2 and- x = x2--x~ in @,. The identification space has one singular point x = 0, corresponding to a coincidence of position of the two particles. When its singular point is included, r(n, 2) is simply connected. If we instead exclude the singular point 0, we are left with a Cartesian product,

$$(12) r(n,2) - \{0\} = \langle 0, \infty \rangle \times \mathscr{P}_{n-1},$$

of the positive real line <0, 0r giving the length ]x I of a vector x in ~, and the (n--1)-dimensional (real) projective space ~,-1 for the direction 4-x/Ix *I*  of x. ~o is a point, ~1 is a circle which is infinitely connected, whereas ~-1 for n>3 is doubly connected.

Since r(3, 2) without its singular point is doubly connected, one might be led to suspect ~ relation between the topology of the configuration space and the familiar symmetry or antisymmetry conditions on wave functions. We take up this point in the next section. Note here the essential difference among the one-, two- and three- or higher-dimensional Euclidean spaces. We will look more closely at these three cases.

The very simplest case is when the two particles move on a line, that is ~u = 2 and X = 81, In some respect this is a special case as compared to a higher-dimensional space, since one-dimensional particles cannot interchange positions without passing through each other. The configuration space is obtained by identifying pairwise the points (x~, x,) and (x,, Xl) in g~----g2. Thus, it is the half-plane with, say, *x~>x,,* as illustrated in fig. 1. The identification is singular along the line xl----x,.

Consider the free-particle motion. A coincidence of position of the two particles is described as a reflection from the , wall, of the half-plane. Apparently, the momentum is not a constant of motion. However, this is a matter

Fig. 1.- *8~/8~* is the configuration space of two identical particles on a line, illustrated here by the nonshaded half-plane. We also illustrate how a tangent vector v= (v 1, v~) at some point x= (xl, x2) is parallelly transported along a curve reflecting from the boundary Zl= xs.

of definition, since we can choose to define parallel transport of a tangent vector v along a curve in the half-plane by the rule that the vector component normal to the edge xl----x~ is inverted every time the curve reflects from the edge. Thus, the parallel transport of a tangent vector around a closed curve may give a vector different from the original one, if the curve is reflected from the edge. This kind of definition may seem artificial here, but becomes much less artificial when we go to the higher-dimensional one-particle spaces.

The configuration space of two particles moving in ~'2 is

(13) 
$$\mathscr{E}_{\mathbf{3}}^{2}/S_{\mathbf{3}} = \mathscr{E}_{\mathbf{2}} \times r(2,2).$$

The relative space *r(2,* 2) is the plane \$'z with points x and -- x identified. This space is seen, from fig. 2, to be a circular cone of half-angle 30 ~ A cone is globally curved, although it is locally flat everywhere except at the singular vertex. This somewhat peculiar property manifest itself in the parallel ~ransport of tangent vectors. To see how a tangent vector v is parallelly displaced along curves on the cone, we may map b~ck into the plane. The mapping is isometric (by definition), and parallel transport on the cone becomes the familiary parallel transport in the plane. See fig. 3. Note that a tangent vector v at the point

-- x e gs is identified with the vector -- v at x. Therefore the parallel transport around a closed curve on the cone r(2~ 2) changes v into (--1)~v, *m* being the number of revolutions of the curve around the vertex.

Fig. 2. - The relative space r(2, 2) of two two-dimensional identical particles is the plane with pairs of opposite points x and --x identified. The identification may be effected by cutting the plane along a line l from the origin 0 and then folding it into a circular cone of half-angle 30 ~ A circle C in the plane centred at 0 then. revolves twice around the cone.

The above argument for n-~ 2~ illustrated in fig. 3~ is seen to be more general. Thus~ for X = ~,, n = 1~ 2~ 3~ ..., there are two classes of equivalent closed curves with respect to the parallel transport of a tangent vector v in the relative space *r(n~* 2). One class does not change v, while the other class changes v into -- v. A closed curve of the first class connects a point (xl ~ x2) e continuously with itself~ while a closed curve of the second class connects (xl, x~) continuoysly with (xg~ x~), in \$~.

Fig. 3. - The parallel transport of a tangent vector v around two'-different closed curves G1 and C~ on the cone of fig. 2. When the cone is mapped isometrically into the plane, C 1 becomes a closed curve in the plane and, therefore, leaves v invariant. C z is a curve from the point x in the plane to --x. The vector **v at --x** is, however, the same vector as --v at x, through the identification. Hence the parallel transport around (72 changes v into --v.

The physically most interesting case is of course X----\$'8. To illustrate r(3, 2) we note that ~, the projective plane~ is the surface of a 3-dimensional sphere with diametrically opposite points identified. Equivalently~ ~ is the northern hemisphere with opposite points on the equator identifled~ fig. 4.

Fig. 4. - ~2, the projective plane, pictured as the northern hemisphere with opposite equator points identified. It is doubly connected. C~, C 2 and C8 are closed curves. C~ can be continuously deformed into a point, C~ cannot be so deformed, but C~2 can. C~ is the closed curve C2 passed twice. C~ may be one intermediate stage in the continuous deformation **of C~ into a** point.

In r(3, 2) ~ (0, oo) • ~a, a tangent vector v is changed into -- v by the parallel transport around a closed curve which is a closed curve in ~l connecting opposite points on the sphere. Such a curve encircles the singular point x----0 once. Notice that a clot ed curve encircling the singularity twice can always be continuously contracted to a point without having to pass through the singular point. This is in contrast to the two-dimensional case, where curves revolving a different number of times around the vertex of the cone cannot be deformed into each other without passing through that point. In other words, the relative space minus its singular point is doubly connected in the three-dimensional case, but is infinitely connected in the two-dimensional case.

The Euclidean case is rather exceptional in that the centre-of-mass coordinate splits off in a trivial way. Let us consider two particles moving on ,~ circle C ~s a final example of the difference between the spaces X ~ and *X~/S~.*  If the particles are not identic~l, the two-particle space is the torus C z. If the particles are identical, the two-particle space is instead a MSbius band! To see this, we introduce the centre-of-mass angle r and the relative angle W, fig. 5. The rectangle in the (r W)-plane defined by 0<~<x and 0<W<2~ includes all possible configurations. And all the points in the rectangle represent different configtu'ations, except for the left and right edges where (0, W) and (~, 2~-- W) both represent the same configuration. Because of this identification, the rectangle becomes a M~bius band, as can be seen from fig. 5.

Fig. 5. - Two identical particles on a circle G. By inspection, one sees that the rectangle [0, ~] • [0, 2~] in the (~, ~)-plane covers all possible configuration, and that the boundary points (0, ~) and (~, 2~--~) both represent the same configuration. Hence the rectangle is twisted into a MSbius band. The MSbius band has one edge, ~ ~ 0 or ~ ~ 2~, **representing the** coinciden~ of the two particles.

#### **3. - Quantization.**

In the previous section we have studied the character of the configuration space of a system of identical particles. Now we want to examine the quantum description of the system as based upon this understanding of the classicalcase.

Let us first stress the fact that we have no need for a symmetrization postulate in this formulation, since the redundancy in notation does no longer exist. Conceptually this would seem desirable. We automatically avoid spurious problems connected with the unphysical elements of the theory. To take an example, it has been argued (e) that it is unreasonable to impose a particular symmetry on the wave function of two electrons, say, that are separated by a large distance (why should electrons in different galaxies be correlated in this wayT). Such a problem does not appear in our formulation, as we have no symmetrization postulate. Furthermore, the configuration space of the two identical particles is locally isometric to that of two nonidentical particles, except at the singularity. And the difference in global topology of the two spaces does not show up, unless we study a situation where the particles may physically interchange positions in the course of time evolution. This means that, for two particles being located far apart, it is of no importance to the physical situation whether they are identical or not.

On the other hand, there is no obvious way to quantize a theory with a curved configuration space, which even has singularities. We will show here what seems to be the simplest way, trying not to impose unnecessary restrictions on the theory. We follow the SchrSdinger quantization scheme and assume that the state of the system is given by a quadratically integr,~ble function defined on the configuration space. The problem is then to define the fleeparticle Hamiltonian, by taking properly care of the physical effects of the singular points. An interaction between the particles is to be described in the usual way, by adding a potential to the free Hamiltonian. To exhibit the special nature of three-dimensional, physical space in this context, we want to examine the three cases of two identical particles moving in either one, two or three dimensions. We consider here only Euclidean one-particle spaces.

3"1. *Two identical partivles moving on a line. -* In one dimension, the nature of the singularity is somewhat different from what is the case in two or three dimensions. The two-particle configuration space is the flat half-plane, fig. 1, and its singularity is just a boundary. It is, therefore, natural to assume a freeparticle Hamiltonian of the usual form and to describe the effect of the singularity by some boundary condition. In terms of a c.m. co-ordinate *x = (xl ~- xs)/2* and of a relative co-ordinate z = Ix1-- x21 ~ 0, the Hamiltonian is

(14) 
$$H = -\frac{\hbar^2}{2m} \left( \frac{\partial^2}{\partial x_1^2} + \frac{\partial^2}{\partial x_2^2} \right) = -\frac{\hbar^2}{4m} \frac{\partial^2}{\partial x^2} - \frac{\hbar^2}{m} \frac{\partial^2}{\partial x^2},$$

where m is the particle mass.

Usually, when a particle is constrained to move within a limited volume, one requires all wave functions to vanish on the boundary of the volume. Clearly this is a too strong requirement in the present context. If the wave functions all vanish for z----0, the interpretation must be that the particles form a fermion system. The wave functions of a boson system, on the other hand, are characterized by vanishing normal derivatives at the boundary z ---- 0. These two special cases can, however, be considered as reflecting the more general requirement of local conservation of probability on the boundary of the configuration space. Local probability conservation implies that the normal component of the probability current must vanish, at any given boundary point, that is

(15) 
$$\psi^*(x,0)\frac{\partial\psi}{\partial x}(x,0)-\frac{\partial\psi^*}{\partial x}(x,0)\psi(x,0)=0$$

for any x and any wave function ~(x~ z). This constraint on the wave functions is sufficient to ensure global conservation of probability and, hence, to make the Hamiltonian of eq. (14) Hermitian. Physically, it means that the system is totally reflected against the boundary of the configuration space.

The general solution of eq. (15) is the boundary condition

(16) 
$$\frac{\partial \psi}{\partial z}(x,0) = \eta \psi(x,0)$$

with ~ as a real parameter. As a consequence of the superposition principle, must be independent of the wave function 9, thus it is a characteristic property of the system. From translational symmetry it also follows that ~ cannot depend on x. The value of ~ describes the many-body nature of the system. **A** boson system has ~----0, while ,]-~= 0 corresponds to a fermion system. There seems to exist, however, a continuous range of possible intermediate values of 71, corresponding to particles that are neither bosons nor fermions. Note that there is a superselection rule separating systems with different values of '1.

The eigenfunctions of the Hamiltonian (14) may be defined as

(17) 
$$\psi_{\kappa,k}(x,z) = \exp[i\kappa x] \left(\cos kz + \frac{\eta}{k}\sin kz\right)$$

with k > 0. A real wave function describes the relative motion and it is a standing wave because of reflection against the boundary z ---- 0. The parameter has a physical significance through a time shift of the reflected wave. A (~ stationary phase ~ argument (11) gives, for the time shift of a wave packet peaked at the relative momentum k,

(18) 
$$\tau = \frac{m\eta}{\hbar k(\eta^2 + k^2)}.$$

The time shift vanishes if and only if ~ : 0 or ~-'= 0.

In addition to the eigenfunctions (17) there exists another one if ~ < 0,

(19) 
$$\psi_{\kappa}^{(\eta)}(x,z) = \exp\left[i\kappa x\right] \frac{1}{2|\eta|} \exp\left[\eta z\right],$$

describing a bound state of the two-particle system. There is only one bound state like this for a given 7. As the eigenfunction shows, the effect of the boundary condition here corresponds to a zero-range attractive force between the particles.

3"2. *The two- and three-dimensional cases. -* When we go beyond the onedimensional ease, the configuration space is no longer fiat, even if all the singular points are simply excluded. The presence of singularities is revealed through a global curvature, which has been studied in sect. 2 in terms of the parallel transport of t~ngent vectors around closed curves. In a similar way, in order to discuss the significance of the singularities for the quantum description, we introduce the concept of parallel displacement of state vectors.

**<sup>(11)</sup> C. ECKART: Rev.** *Mod. Phys.,* **20, 399 (1948).** 

First~ we introduce for each point x in the configuration space a corresponding one-dimensional complex Hilbert space h~. (In modern mathematical terminology h. is a (~ fiber ,.) And we assume the state of the system to be described by a continuum of vectors W(x)e h~ (a ~( cross-section of the fiber bundle ,). That is~ tlg is assumed to be a single-valued function over the configuration space, whose function value tIx(x) at the point x is a vector in h~. If a normed basis vector Z~ is introduced in each space h~, then the complexvalued wave function ~(x) is just the co-ordinate of the vector W(x) relative to that basis:

$$\Psi(\mathbf{x}) = \psi(\mathbf{x}) \chi_{\mathbf{x}}.$$

Thus, the function v/(x ) will depend on the set of basis vectors~ or gauge {Z~}~ and a change in this set causes a gauge transformation of the second kind:

(21) 
$$\psi(\mathbf{x}) \to \psi'(\mathbf{x}) = \exp\left[i\varphi(\mathbf{x})\right] \psi(\mathbf{x}).$$

The concept of parallel displacement of vectors from h~ is needed in order to define a gauge-invariant differentiation of the functions ~(x). Let us denote by P(x', x) : h~ -~ h=, the linear operator which transports parallelly the vectors of h, into h~, along some continuous curve joining x to x'. Parallel displacement in general may depend upon the curve from x to x', but we assume that the infinitesimal parallel displacement P(x + dx, x) from x to x § dx is uniquely defined. *P(x', x)* is assumed to be always a unitary operator. Finally~ we assume that it is possible, at least locally, to choose the gauge {Z~} in such a w'~y theft the rule of infinitesimal parallel displacement is of the form

(22) 
$$P(\mathbf{x} + d\mathbf{x}, \mathbf{x}) \chi_{\mathbf{x}} = (1 + i d\mathbf{x}^{k} b_{k}(\mathbf{x})) \chi_{\mathbf{x}+d\mathbf{x}}.$$

In this gauge, the gauge-invariant differentiation operator becomes

(23) 
$$D_{k} = \frac{\partial}{\partial x^{k}} - ib_{k}(x).$$

The functions bk are determined partly by the dynamics of the system ~md partly by the choice of gauge (~f~}. They must be real so as to make P(x + dx, x) unitary. The gauge-independent quantity

$$f_{kl} = i[D_k, D_l] = \frac{\partial b_l}{\partial x^k} - \frac{\partial b_k}{\partial x^l},$$

measuring the noncommutativity of the components of the gauge-invariant differentiation, corresponds to the curvature tensor in the case of parallel transport of tangent vectors. The form (23) of the differentiation operator is even more well known from the similar formulation, introduced by WEYL (~2), of the quantum theory of a charged particle in a magnetic field. ~q~at corresponds there to the antisymmetric tensor/~z(x) is the force field, whose vector potential corresponds to *bk(x).* 

In the present case, we do not want the (( vector potential ~ *b~(x)* to describe a force field. Therefore we assume that/kz(x) = 0 for all x, except for the singular points of the configuration space where/kz is undefined. As a consequence, a vector W E h. will be unchanged by parallel transport around any closed curve which does not encircle the singularity. However, if the vector tit is parallelly transported m times around the singularity, it will be transformed into P~W, where P= is a linear, unitary operator acting in h.. Since this Hilbert space is one-dimensional, P~ is just a phase factor

$$(25) P_x = \exp\left[i\xi\right],$$

where t is real. Because

(26) 
$$P_{x'} = P(x', x) P_x P(x', x)^{-1} = \exp[i\xi],$$

the parameter t must be independent of the point x, thus its value is characteristic of the given two-particle system.

The field *bk(x)* has a dynamical effect through the gauge-invariant differentiation operator D~. However, in the case we are considering, b~ can be transformed into zero by choosing the basis vectors ;G in a particular way. Let the basis vector X~ at some arbitrary point x be given, and define the basis vectors at all other points by parallel displacements of this Z~. When /,z vanishes, this procedure defines a gauge where b~ vanishes. On the other hand, when exp [it] ~ 1, the complex wave function v2(x ) will be multivalued in this gauge, since all the basis vectors X~, exp [q-it] Z~, exp [-{-i2t]X=, etc. at x will be generated by parallel transport of ~ around different closed curves. In this way the dynamical effect of the singularities of the two-particle space may be transferred from the differentiation operator, and therefore from the Hamiltonian, to the multivalue character of the wave function y(x).

We will elaborate the two-dimensional case in some more detail to illustrate the two different approaches. We neglect the c.m. co-ordinates. In the relative space we use polar co-ordinates r and ~o, with ~ e [0, 2~). The free-particle Itamiltonian is given by

(27) 
$$H = -\frac{\hbar^2}{m} \left( \frac{\partial^2}{\partial r^2} + \frac{1}{r} \frac{\partial}{\partial r} + \frac{4}{r^2} \frac{\partial^2}{\partial \varphi^2} \right),$$

**<sup>(</sup>zz) H. WErL: Z~/~. Phys., 56, 330 (1929).** 

when the wave functions satisfy the condition

(28) 
$$\psi(\mathbf{r}, \varphi + 2\pi) = \exp\left[i\xi\right] \psi(\mathbf{r}, \varphi).$$

The parameter ~ tells the many-body nature of the system. For a boson system we have ~ -: 0, and for a fermion system ~ ---- re. There is, however, no obvious reason to restrict the allowed values of ~ to these two. And, therefore, as for particles moving in one dimension, a continuum of intermediate cases connects fermion and boson cases.

In the other approach we define the single-valued wave functions

(29) 
$$\psi'(r,\varphi) = \exp\left[-i\frac{\xi}{2\pi}\varphi\right]\psi(r,\varphi),$$

and the corresponding transformed Hamiltonian is

$$(30) \quad H' = \exp\left[-i\frac{\xi}{2\pi}\varphi\right]H\exp\left[i\frac{\xi}{2\pi}\varphi\right] = -\frac{\hbar^2}{m}\left(\frac{\partial^2}{\partial r^2} + \frac{1}{r}\frac{\partial}{\partial r} + \frac{4}{r^2}\left(\frac{\partial}{\partial \varphi} + i\frac{\xi}{2\pi}\right)^2\right).$$

To see the physical effect of the parameter ~: more directly, we may let the particles interact through a harmonic-oscillator potential

$$V(r) = \frac{1}{4} m\omega^2 r^2.$$

The eigenfunctions of the Hamiltonian H'+ V may be chosen as

(32) 
$$\psi'(r,\varphi) = \exp[il\varphi] R(r), \qquad l = 0, \pm 1, \pm 2, ...,$$

then the radial function *R(r)* is determined by the equation

(33) 
$$\left( \frac{\mathrm{d}^2}{\mathrm{d}r^2} + \frac{1}{r} \frac{\mathrm{d}}{\mathrm{d}r} - \frac{1}{r^2} \left( l + \frac{\xi}{2\pi} \right)^2 - \frac{1}{4} \frac{m^2 \omega^2}{\hbar^2} r^2 + \frac{mE}{\hbar^2} \right) R = 0.$$

This is, apart from the values of l + ~/2n, the ordinary radial equation of the harmonic oscillator in two dimensions. If the eigenfunctions are to be quadratically integrable and nonsingular at the origin, the allowed energies are found to be

(34) 
$$E=2\hbar\omega\left(n+\left|l+\frac{\xi}{2\pi}\right|+\frac{1}{2}\right), \qquad n=0,1,2,\ldots.$$

The value of ~ is seen to influence the energy spectrum of the system. In fig. 6 the spectrum is shown for three different values of ~:, the boson case ~ = O, the fermion case ~----~ and an intermediate ease ~----]z. As one can Bee, the intermediate values of ~ give a continuous connection between the boson and the fermion spectrum.

Fig. 6. - The energy spectrum of a two-particle system, in two dimensions, with a harmonic-oscillator interaction, is shown here for three particular values of the parameter ~. The value ~ 0 corresponds to the boson ease and ~ ~ to the fermion ease. The degeneracy of each energy level is given in the figure. Note the continuous transition from **the bosch** to the fermion **spectrum.** 

l~ow we will turn to the three-dimensional, physical ease. As pointed out in sect. 2, a closed ctu've encircling the singularity twice in this ease can be continuously contracted to a point without passing through the singularity. This implies for the operator/)x the additional condition

(35) 
$$P_x^2 = 1$$
,

so that P~----- =L i and only the two values ~ ~ 0 or ~ ~ ~ are possible. The basis set {~f~} defined by parallel displacement, and therefore also the wave function y(x), will be single valued when ~ ---- 0 and double valued when ~ = ~.

The final step necessary to arrive at the traditional formalism with complex wave functions defined on ~ is a straightforward exercise. Take an arbitrary point *xe~/S~* together with a basis vector Zx e h~. Two points (xl, x2) and (x~, xl) in d'~ correspond to x, but let us locate the basis vector ~x arbitrarily at (xl, x~). Since a curve in \$'~ defines a unique curve in *~/S~* along which parallel displacement is well defined, we can immediately parallelly transport

the basis vector Z, from (x~, x,) along different curves to all other points of d~. We see then that the basis vector P~ Z,, which is located at the same point *x e #~/S~,* becomes located at the point (x~, x~)e d'~, which is quite distinct from (Xl, x~). Thus, the local basis vectors defined by parallel displacements become uniquely defined in d~ as opposed to *d'~a/S 2.* Consequently, the complex wave functions on d~ will always be single valued.

The complex, single-valued wave functions on d~a defined in this manner will satisfy the symmetry condition

(36) 
$$\psi(x_2, x_1) = \exp[i\xi] \psi(x_1, x_2) = \pm \psi(x_1, x_2).$$

If ~ -= O, the particles are bosons, if ~ = re, they are fermions. Within the formulation we have given above, these two possibilities are singled out in a natural way and not as the consequence of any symmetrization postulate. This is the case, however, only when the particles move in three (or more) dimensions. As shown by the discussion, in one or two dimensions one could magine systems intermediate between boson and fermion systems.

## **4. - Identical particles with spin.**

Three-dimensional particles, like electrons, are known to possess so-called internal degrees of freedom, like intrinsic spin, and this calls for generalizations of the formalism discussed so far. We will show one way of including spin which implies only minor modifications to the formalism. Our point of view is that the position variables alone determine the configuration space. Therefore the configuration space of N identical particles moving in \$'8 is *8~/S M*  regardless of the spin of the particles. The spin observables are supposed to act as operators in the local Hilbert space h., which we will, therefore, call spinor space, associated with each point *x ~ ~]S~.* The generalization involved is that h~, in general, will no longer be one-dimensional.

Consider first a single particle with spin. Besides the position x E oza, also the spin S, which is a three-component object, is observable. Strictly speaking, a given component of the spin S corresponds to a given direction in the threedimensional tangent space at the point x e d~3. But ozs is a fiat space where the concept of direction has an absolute meaning, and so, when we talk about the spin S, it is unnecessary to specify the point x to which S belongs.

Observable in the hr-particle case are N pairs x~, S ~t) of position and spin. Here the index i----1,..., ~V, used to couple position and spin of the same particle, has no other significance. The N spin operators S (1), ..., S (m all act in the same Hilbert space h~. Because they are independent observables, h~ must have the structure of a tensor product of hr identical single-particle spinor

spaces:

$$\mathbf{h}_{\mathbf{x}} = \mathbf{h}^{(1)} \otimes \mathbf{h}^{(2)} \otimes \ldots \otimes \mathbf{h}^{(N)}$$

with S ~'~ acting only in h (~. If each particle has spin s, each *h "~* has dimension 2s + 1 and h. has dimension r = (2s + 1) ~.

A state of this system is given by a spinor field W, which has a unique value W(x)ehx for each *x e#~/S~v.* The corresponding wave function has r components vA(x), ..., v2.(x) that are the co-ordinates of the spinor W(x) relative to some basis Z.~,-.., Z~ in h,. That is,

(38) 
$$\Psi(\mathbf{x}) = \sum_{k=1}^{r} \psi_k(\mathbf{x}) \chi_{\mathbf{x}k}.$$

A natural way to define such a basis for each point in *#~]S~* is again to define a basis at one arbitrary point and to parallelly transport that basis to every other point. The crucial question is whether this procedure is unique, or whether parallel transport along different curves can give different results, or, equivalently, whether the parallel transport around a closed curve may differ from the identity transformation I in spinor space.

To discuss this point, we again specialize to the case \_,V-----2. Consider the spinor space h~ at some given point x = (Xl, *x2) e~28]Ss.* It is a tensor product h~- hm Q h(2~ of two single-particle spinor spaces h m and h (2) associated with x~ and x2, in that order. And it has two mutually commuting spin operators, S (~) operating in h{', So,) operating in h (~).

Let P: h~-~h~ be a linear operator defined by the parallel transport of spinors around a closed curve starting and ending at x. As we have seen, there are two classes of such closed curves. A closed curve either connects xx continuously with xx and x2 with x~, or else it connects xl with x~ and x2 with xx. Because the spin operators S ~1) and S (2) are associated with the positions x~ and x2, respectively, the first class of curves must give

(39) 
$$PS^{(1)}P^{-1} = S^{(1)}, PS^{(2)}P^{-1} = S^{(2)},$$

and the second class must give

(40) 
$$PS^{(1)}P^{-1} = S^{(2)}, PS^{(2)}P^{-1} = S^{(1)}.$$

The spinor space h x is irreducible under the action of the two spin operators S m and S (~). Therefore, by Schur's lemma (13), p is uniquely determined, ex-

<sup>(13)</sup> H. BOERN:ER: *Representations o] Groups* (Amsterdam, 1963).

cept for an overall phase factor, by either of the two relations above. first case, In the

$$(41) P = P_1 = \exp\left[i\xi_1\right]I$$

and, in the second case,

$$(42) P = P_2 = \exp\left[i\xi_2\right]T,$$

when T denotes the transposition operator in h x ----h (n @ ht\*~, that is

$$(43) T(\mathbf{\Psi} \otimes \mathbf{\chi}) = \mathbf{\chi} \otimes \mathbf{\Psi}.$$

Since parallel transport in spinor space can at most introduce arbitrary phase factors, the presence of spin does not essentially change our discussion on the spin-zero case in subsect. 3"2. Thus, with zero (( magnetic, field we must have, like before,

(44) 
$$\begin{cases} P_1 = I & \text{and} \quad \xi_1 = 0, \\ P_2 = \pm T & \text{and} \quad \xi_2 = 0 \text{ or } \pi. \end{cases}$$

As in the spinless case, there are exactly two possible types of wave functions, corresponding to the two allowed values of ~.

To be more specific, we may introduce a basis of parallel vectors

$$\chi_{m_1m_2}=\chi_{m_1}\otimes\chi_{m_2},$$

where each Z~. is an eigenvector of the z-component S~ of the spin S. By the parallel transport around a closed curve of the second class, this basis is changed into another basis

(46) 
$$P_{2} \chi_{m_{1}m_{2}} = \exp \left[i\xi_{2}\right] \chi_{m_{2}m_{1}} = \pm \chi_{m_{2}m_{1}}.$$

We are, therefore, in the dilemma of having to choose between two alternative definitions of the wave functions. We may define

(47) 
$$\Psi(\mathbf{x}) = \begin{cases} \sum_{m_1, m_2} \psi_{m_1 m_2}(\mathbf{x}) \chi_{m_1 m_2}, \\ \sum_{m_1, m_2} \psi'_{m_1 m_2}(\mathbf{x}) P_2 \chi_{m_1 m_2} = \sum_{m_1, m_2} \psi'_{m_1 m_2}(\mathbf{x}) \exp\left[i\xi_2\right] \chi_{m_2 m_1}, \end{cases}$$

and the relation between these two co-ordinatizations of the spinor tP(x) is seen to be such that

(48) 
$$\psi_{m_1m_2}(\mathbf{x}) = \exp\left[i\xi_2\right] \psi'_{m_1m_1}(\mathbf{x}) = \pm \psi'_{m_2m_1}(\mathbf{x}).$$

In the same natural way as in subseet. 3"2, we can proceed to define wave functions on the Euclidean space ~, Repeat simply tim same construction, pick one point x = (x~, *x~)ES[/S2,* locate the basis X .... of h~ arbitrarily at (x~, x2) e ~ and parallelly transport it to every other point of 8~. The alternative basis P2 X .... of h, will then be located at (x2, x~) ~ g~, far from (xl, x2). Thus the basis of each local spinor space in g~ is unique, and the wave function ~ defined on 8~ becomes single valued. We get

$$\begin{cases} \psi_{m_1m_1}(x_1, x_2) = \psi_{m_1m_1}(x), \\ \psi_{m_1m_2}(x_2, x_1) = \psi'_{m_1m_2}(x), \end{cases}$$

and eq. (48) is the well-known symmetry condition

(50) 
$$\psi_{m,m_2}(\mathbf{x}_1, \mathbf{x}_2) = \exp\left[i\xi_2\right] \psi_{m,m_1}(\mathbf{x}_2, \mathbf{x}_1) = \pm \psi_{m,m_2}(\mathbf{x}_2, \mathbf{x}_1).$$

This shows that ~----0 corresponds to the boson ease with totally symmetric wave functions, and ~----~ to the fermion case with totally antisymmetric functions. We stress again the fact that these two possibilities emerge in a natural way from the formalism, without any reference to a symmetrization postulate.

The formalism seems to give no restriction on which of the two values of ~2 is allowed for a given two-particle system. However, the spin-statistics theorem relates the sign in eq. (50) to the one-particle spin s through the equation

(51) 
$$\exp[i\xi_2] = (-1)^{2s}.$$

Note that the merit of the spin-statistics theorem here is to reduce the number of possibilities from two to one.

A di~erent formulation of the spin-statistics theorem might be illuminating. A two-particle spinor of total spin S has a symmetry of (--1) s-~' under the interchange of the two spin variables only. Therefore, what the spin-statistics theorem tells us is that the symmetry of the wave function under the interchange of space co-ordinates alone is (--1} a, irrespective of the one-particle spin s. Hence the S = 0, scalar part of the two-particle spinor is always symmetric in the space co-ordinates, whereas the S ---- 1, vector part is always antisymmetric.

The last observation might suggest a geometrical basis for the spin-statistics theorem. Within our formalism the two-particle form of this theorem, expressed by eq. (51), is equivalent to the statement that the S----0 component of the wave function behaves like a zero-rank tensor field. That is, it is unchanged by parallel transport around any closed curve. And, as a consequence, the S ---- 1 component behaves exactly like a tangent vector in relative space. The geometry of the , fiber bundle ~ of spinor spaces thus corresponds in a natural way to the geometry of the configuration space and to its associated tensor algebra.

# **5. - Generalization to N particles.**

"~Ve have pointed out in this work that the configuration space of an identicalparticle system is, in some respects, essentially different from the Cartesian product of the one-particle spaces. And we have shown by examples how a quantization can be carried out, taking this difference explicitly into account. For the sake of convenience, we have mainly restricted our discussion to the two-particle system. As a conclusion, let us try to sketch in general terms how to quantize a system of N identical particles moving in the n-dimensional Euclidean space ~,.

It is not quite evident how to define wave functions or specify the action of the Hamiltonian at the singular points of the configuration space *\$'~/,Yt~.*  Moreover, it might be argued that the set of all singular points has zero volume and, therefore, does not contribute to volume integrals defining expectation values. For these reasons we exclude the singular points and restrict our attention to the sp~c.e consisting of all the regular points of *~/S N.* 

Again with each regular point *x ~ J'~/S N* we associate a local Hilbert space h~. For simplicity let h~ be one-dimensional, and let Z~ be a basis vector of h~. The parallel displacement of these basis vectors is to be defined, like in eq. (22), through a field bk that might be the vector potential of a magnetic field, but might also represent some more general force field. The quantities b~ are the components of a covariant vector field b relative to some set of local co-ordinates x ~. We discuss here the simplest case in which the force field ]~,, as defined in eq. (24), vanishes identically, which means that the parallel transport is path independent in simply connected regions.

Consider the continuous closed curves starting and ending at *x E d'~/'.~8,*  and define the product C~ C~ of two curves C~ and C2 as the curve followed when traversing first C~ and afterwards C~. An equivalence class of curves that can be continuously deformed into each other is called a homotopy class. The set of all homotopy classes is seen to form a group, which is characteristic of the space, since the groups belonging to different points are isomorphic. This group is called the first homotopy group, or fundamental group (~4), of the space ~'~/S~ minus its singular points.

The condition of no force field implies that the parallel transport of vectors from hffi around closed curves gives a linear, unitary representation in h~ of the fundamental group. When h~ is one-dimensional, each group element C must

<sup>(14)</sup> p. j. HILTON: *A,n Introduction to Homotopy Theory* (Cambridge, 1953).

be represented by a phase factor:

(52) 
$$C \rightarrow \exp[i\xi(C)]$$
.

Observe that the phase factor exp [i~(C)] is also independent of the point x, by an argument similar to that of eq. (26).

The vector potentia.1 b can always be transformed into zero, that is, one may always choose parallel basis vectors in the local Hilbert spaces, if one is only willing to pay the price of a nonunique basis Z. in h, and, therefore, manyvalued wave functions ~v(x). In the case we are discussing, different parallel displacements of a basis vector z, eh~ will produce the basis vectors *exp[i\$(C)]z.~hx,* hence representation (52) of the fundamental group determines the many-value nature of the wave functions. To find all possibilities, first identify the fundamental group and then list all one-dimensional, unitary representations.

As expected, the fundamental group is found to be related to the symmetric group SN. A regular point *x e ~/S~* is given by N different particle positions x,,..., xNed'., and obviously a closed continuous curve C in d'~/S.v, from x back to x, defines a permutation p of the positions xl, ...,xN. This correspondence *C--~p* is a homomorphism and, sometimes, an isomorphism from the fundamental group onto S~.

We have seen that, for N = 2, n = 2, the fundamental group is the cyclic group of infinite order, that is, the addition group of the integers, Z, which is much larger than S~. It has a continuum of different representations by phase factors. However, generalizing the result for N = 2, n = 3, we conclude that, for n>3, the fundamental group is just the symmetric group SN. For N~2, S~. has exactly two one-dimensional representations, the trivial or completely symmetric representation p-~ 1 and the completely antisymmetric representation p ~ signum (p) = ~ 1. Thus, when n> 3 and N~ 2, there are exactly two possible kinds of wave functions. These correspond to boson or fermion systems, respectively, as is seen when we proceed to define wave functions on the Euclidean space g'~, generalizing the method of subsect. 3"2. The wave functions on ~ will be single-valued and either completely symmetric or completely antisymmetric.

Let us make a final remark concerning our assumption that/~t = 0 identically, which excludes the possibility of a nonzero magnetic field. First note that, because of the relation between *~/S~* and d'~, any tensor field on *~/S~*  can be looked upon as a uniquely defined tensor field on d~, whereas, the other way round, a tensor field on ~ in general defines N! tensor fields on *.~/S.v.* 

Now let us assume, more generally, that the tensor field *]kt* on *~/S~* may be nonzero, but is still nonsingular as a field on \$'~, this time including all those points that are singular points of *g,,/S~.* N Then /~t can be derived from a nonsingular vector potential b' k on ~,. ~ Moreover, b k can be chosen as to become single-valued on *g~/S M.* If necessary, simply replace b' k by the average

of the N! vector potentials it defines on ~/S~. Therefore, given a vector potential bk on ~."/S~ with a nonvanishing, nonsingular ]~, we make the same analysis 17 I as before, but, instead of b~, we consider b~ : b~-- b~, whose corresponding field ]~ ---- 0. In this case, b~ must appear in the Hamiltonian in the usual way, whereas the wave functions still are either symmetric or antisymmetric.

This short remark should indicate that magnetic fields can easily be incorporated into the theory, with no modifications to our conclusions as to the symmetry properties of the many-body wave functions.

In this section we have not discussed intrinsic spin or other internal degrees of freedom. They bring no essential complication, because a one-dimensional representation of the fundamental group is still the only arbitrary element of the theory. The discussion of this point would be a rather obvious generalization of sect. 4, and we do not go into more details.

### 9 RIASSUNT0 (\*)

Si osamina 1o spazio delle oonfigurazioni classico di un sistema di particelle identiche. A causa dell'identificazione di punti ehe sono correlati da permutazioni degli indiei delle particelle, questo spazio ~ in mode globale sostanzialmente diverse dal prodotto cartesiano degli spazi ad una particella. Si prende in considerazione questo fatto esplieitamente in una quantizzazione della teoria. Di conseguenza, non A necessario postulare alcuna costrizione di simmetria per le funzioni d'onda e gti osservabili. Le due possibilit~ corrispondenti a funzioni d'onda simmetriche e antisimmetriehe compaiono nel formalismo in mode naturale. Ma questo avviene solo quando le particelle si muovono in uno spazio a 3 o pitt dimensioni. In una o due dimensioni, un continue di possibili casi intermedi eollega i oasi bosoniei e fermioniei. Si diseute l'effetto dello spin delle particelle nel presente formalismo.

*(~ Traduzione a cura della Redazione.* 

#### **K TeOpHa TOaC~eCTneHHI~tX qacTml.**

Pe310Me (\*). -- I/IccneRyeTc~ KHaCCllqeCKOe KOH(~I4rypaIH4OHHOe HpocTpaHCTBO CHCTeMI~I TO~CCTBCHHI~IX HaCTHIL BcJIeRCTBI4C H~eHTH~l~KaI~RI4 TOqeX, XOTOp~Ie CBg3aHI~I H3-3a rIcpcCTaHOBOK HH~eXCOB ~IaCTHff, paccMaTp~lBacMoe FrpocTpaHCTBO B ueJIOM CyLL~eCTBCH-HO OTRH~IaCTCH OT ~cxapToBa npOH3BC~CH;t~ O~HoqacTHqHbIX IIpocTpaHCTB. ~TOT ~aXT yqHTbIBaeTCn B ~iRHOM BH~[e IIpl4 KBaHTOBaHHH TeopI4tL Kax CJIC~CTBHe 3TOFO HeO6XO- ~HMO IIOCTy~HpOBaTb OTCyTCTBHe orpaHHqCHHJ] CHMMCTpHH Ha BOnHOB~e (~yHKI~HH H Ha6nm~aeMhie aennqnHbl. B pacCMaTpHBaeMOM OopMafln3Me eCT~TBeHH~IM 05pa30M FIOgBII~IIOTCR ~IBr BO3MO}KHOCTH, COOTBeTCTByIOIHHe CHMMeTpHqHOI~ It aHTHCHMMeTpHZl - HOl~ BO31HOBbIM (~yHI{UH~/M. ~Ka3aHHag CHTyaHHJl BO3HHKaeT TOJIbKO B CYly~Iae, ror~a qaCTHHbl ~BH}KyTCg B HpocTpaHcTSe Tpex HJIH 60~IbIIIero qHcJIa H3MepeHH]~. B c2iyqae O~HOrO H ~ayx 143MepeHHl~ KOHTHHyyM BO3MO~(HbIX llpOMe~yTOqH~IX COCTO~IHHI~ SK~IIOqaeT 603OHH611~I H ~bepMHOHHbI~ cYlyqaH. O6cy~aeTcfl 3(~(~KT CIIHHa ~acTn~ B npe~no- }KeHHOM ~opManH3Me.

### *(\*) Hepe~eOeno pe~)arque~.*