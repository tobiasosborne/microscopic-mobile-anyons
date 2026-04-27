![](_page_0_Picture_1.jpeg)

![](_page_0_Picture_2.jpeg)

#### **PAPER**

## Anyon chains with pairing terms

To cite this article: B Majidzadeh Garjani and E Ardonne 2017 J. Phys. A: Math. Theor. 50 135201

View the [article online](https://doi.org/10.1088/1751-8121/aa5fba) for updates and enhancements.

## You may also like

- [Connection between quantum-many-body](/article/10.1088/1742-5468/ab342e) [scars and the](/article/10.1088/1742-5468/ab342e) [Affleck–Kennedy–Lieb–Tasaki model from](/article/10.1088/1742-5468/ab342e) [the viewpoint of embedded Hamiltonians](/article/10.1088/1742-5468/ab342e) Naoto Shiraishi -
- [Quantitatively improved finite-size criteria](/article/10.1088/1751-8121/ac7989) [for spectral gaps](/article/10.1088/1751-8121/ac7989) Marius Lemm and David Xiang -
- [Theory of triangulene two-dimensional](/article/10.1088/2053-1583/aca4e2) [crystals](/article/10.1088/2053-1583/aca4e2) R Ortiz, G Catarina and J Fernández-Rossier -

# **Anyon chains with pairing terms**

## **B Majidzadeh Garjani**[1](#page-1-0)**,**[2](#page-1-1)**,**[3](#page-1-2) **and E Ardonne**[1](#page-1-0)

- <span id="page-1-0"></span><sup>1</sup> Department of Physics, Stockholm University, SE-106 91 Stockholm, Sweden
- <span id="page-1-2"></span><span id="page-1-1"></span><sup>2</sup> Department of Mathematics, Stockholm University, SE-106 91 Stockholm, Sweden
- <sup>3</sup> Nordita, Royal Institute of Technology and Stockholm University, Roslagstullsbacken 23, SE-10691 Stockholm, Sweden

E-mail: [b.majidzadeh@math.su.se](mailto:b.majidzadeh@math.su.se)

Received 22 August 2016, revised 17 January 2017 Accepted for publication 10 February 2017 Published 3 March 2017

![](_page_1_Picture_11.jpeg)

1

### **Abstract**

In this paper we introduce a one-dimensional model of *su*(2)*k* anyons in which the number of anyons can fluctuate by means of a pairing term. The model can be tuned to a point at which one can determine the exact zero-energy ground states, in close analogy to the spin-1 AKLT model. We also determine the points at which the model is integrable and determine the behavior of the model at these integrable points.

Keywords: anyon chain, pairing term, integrable

(Some figures may appear in colour only in the online journal)

## **1. Introduction**

Almost forty years ago, it was realized by Leinaas and Myrheim that in two-dimensional systems, the existence of particles with statistics interpolating between bosonic and fermionic statistics is a possibility [\[1](#page-29-0)]. It is widely believed that particles of this type are realized in the fractional quantum Hall systems [\[2](#page-29-1), [3\]](#page-29-2), even though the anyonic statistics of the quasi-particles has not yet been probed directly. Moore and Read proposed fractional quantum Hall states for which the quasi-particles have non-Abelian statistics [\[4](#page-29-3)]. It is believed that this Moore–Read state describes the *ν* = 5 2/ quantum Hall effect [[5\]](#page-29-4). Interestingly, the one-dimensional *p*-wave superconductor studied by Kitaev [\[6](#page-29-5)] exhibits Majorana bound states, which are the onedimensional cousins of the non-Abelian anyons present in the Moore–Read state. Following the first theoretical proposal [\[7](#page-29-6), [8\]](#page-29-7) of how to realize Kitaev's model, there are experimental indications that Majorana bound states might be realized experimentally [[9](#page-29-8)–[11\]](#page-29-9).

In [\[12](#page-29-10)], the effect of interactions between non-Abelian anyons were studied by means of a one-dimensional model-Hamiltonian. Non-Abelian anyons, in particular so-called Fibonacci anyons, are used as building blocks for this model-Hamiltonian in the same way as spins are used in model-Hamiltonians such as the Heisenberg model in order to study magnetism. In [13] different types of anyon models are explained, while [14] proposes an experimental realization of interacting Fibonacci anyons.

Various generalizations of the original model have already been considered. These include models with longer-range interactions [15], models on ladders [16–18], as well as models making use of different types of anyons [19–22]. In this paper, we consider a generalization of the dilute anyon model [23]—a model in which anyons are allowed to hop to empty neighboring sites. The type of term we add to this model is a pairing term that creates or annihilates pairs of anyons on neighboring sites. The anyons we use are of the type  $su(2)_k$ , which is the same type as the excitations of the Read–Rezayi quantum Hall states [24].

The anyon model we study has a large number of parameters and, since the number of anyons is not considered to be fixed in our model, the size of the Hilbert space grows quickly with system size. We therefore can not characterize the phase diagram of our model in full detail, but we concentrate ourselves on two particular cases. In the first case, we tune the model to a point where the Hamiltonian becomes a sum of projectors. This allows us to determine the exact zero-energy ground states for the case when k, in  $su(2)_k$ , is odd. In addition, we study the model at two integrable points where, in most cases, the model turns out to be critical. Most of these critical points are described by minimal-model conformal field theories.

The outline of this paper is as follows. In section 2, we introduce the notion of anyon models as the language we use to define our Hamiltonian. In section 3, we introduce the anyon model and its corresponding Hilbert space and finally present the Hamiltonian that we investigate in later sections. In section 4, we study the Hamiltonian at a special point where we can determine the exact zero-energy ground states as well as the number of these states. In section 5, we determine for which values of the parameters the model is integrable and determine the behavior of the model at these integrable points. Section 6 is devoted to the conclusions. In appendix A, we give the explicit form of the F-symbols we use in this paper. In appendix B, we map our model-Hamiltonian, in the case of k = 1, to a spin-1/2 Hamiltonian.

## <span id="page-2-0"></span>2. General theory of anyons

The mathematical framework that describes the anyons in a rigorous way is that of tensor categories. However, in this article we do not need this full machinery and we use a more concrete picture of anyons and anyon systems. We will be brief here and refer to [26–28] for more elaborate introductions into the subject.

We start introducing a finite set of *labels*,  $\mathcal{L} = \{a, b, c, ..., n\}$ , that contains the labels of all the anyon types present in the anyon model we consider. We call these labels the anyon 'charges'. One of the elements of this set is distinguished from others and plays the role of the vacuum. We label this element by **1**. In addition, with each label a in the set, we associate another label in  $\mathcal{L}$ , denoted by  $\hat{a}$ , that represents the dual of a. The dual to the vacuum is the vacuum itself, that is,  $\hat{1} = 1$ . For other anyons a, the dual might or might not be the original anyon, but we always have  $\hat{a} = a$ . To define the notions of the vacuum and the dual anyon, we need to introduce the notion of fusion first.

The fusion of anyons is analogous to combining different spin multiplets by means of the tensor product. Thus, to specify the possible fusions, we need to specify what the possible 'fusion outcomes' are for each pair of anyons *a* and *b*. Symbolically, we write this as

<span id="page-2-1"></span>
$$a \otimes b = \bigoplus_{c \in \mathcal{L}} N_{ab}^c c, \tag{1}$$

where the fusion *coefficients*  $N_{ab}^c$  are non-negative integers. If  $N_{ab}^c \ge 1$ , this means that the overall charge of an anyon of type a and an anyon of type b can be an anyon of type c, while

<span id="page-3-0"></span>![](_page_3_Picture_2.jpeg)

**Figure 1.** Anyons a and b fuse to anyon c in the  $\mu$ th way.

this possibility is ruled out if  $N^c_{ab} = 0$ . The labels c for which  $N^c_{ab} \ge 1$  are called fusion *channels* of a and b and if the outcome of the fusion of a and b is c, then c is said to be the fusion channel of a and b. If  $N^c_{ab} > 1$ , then this means that anyons a and b can be fused to the anyon-type c in more than one way. The fusion of charges a and b that has given rise to charge c in the  $\mu$ th way,  $\mu = 1, 2, ..., N^c_{ab}$ , is usually depicted graphically as in figure 1 and it is called a fusion tree.

The anyon models we consider in this paper are *multiplicity-free* models, that is, they have the property that  $N_{ab}^c$  is either zero or one for all labels a, b, and c in  $\mathcal{L}$ . We therefore can simply omit the label  $\mu$  in the remainder of the paper.

We now specify the physical constraints on the fusion rules:

- (i) The vacuum **1** is the unique label such that  $N_{1a}^c = \delta_{ac}$ , for all labels a and c in  $\mathcal{L}$ , with  $\delta$  denoting the Kronecker delta.
- (ii) The dual of a, namely  $\hat{a}$ , is the unique label such that  $N_{ab}^{1} = \delta_{b\hat{a}}$ , which means that a and  $\hat{a}$  can be fused to the vacuum.
- (iii) The fusion rules are *associative* in the sense that the set of all possible fusion outcomes of  $a \times (b \times c)$  is equal to the set of all possible fusion outcomes of  $(a \times b) \times c$ . In terms of the fusion coefficients, this means that

$$\sum_{e \in \mathcal{L}} N_{ab}^e N_{ec}^d = \sum_{f \in \mathcal{L}} N_{bc}^f N_{af}^d, \tag{2}$$

for any labels a, b, c, and d in  $\mathcal{L}$ .

(iv) Finally, we demand that fusion is 'symmetric' in the following sense:

$$N_{ab}^{c} = N_{ba}^{c} = N_{b\hat{c}}^{\hat{a}} = N_{b\hat{c}}^{\hat{c}}.$$
 (3)

An anyon theory is said to be *non-Abelian* if there are labels a and b such that  $\sum_{c \in \mathcal{L}} N_{ab}^c > 1$ , otherwise, it is called *Abelian*. The Fibonacci anyon theory, described in the following, is an example of a non-Abelian and multiplicity-free anyon theory. The label set of this model is  $\mathcal{L} = \{1, \tau\}$ , where  $\tau$ , known as the *Fibonacci* anyon, is the only non-trivial anyon of the model and the fusion rules are given by

$$\mathbf{1} \otimes \mathbf{1} = \mathbf{1},$$
  
 $\tau \otimes \mathbf{1} = \mathbf{1} \otimes \tau = \tau,$   
 $\tau \otimes \tau = \mathbf{1} \oplus \tau.$ 

From the last fusion rule it follows that the Fibonacci anyon is its own dual.

To be able to construct a model describing anyons that can interact with each other, we have to associate a Hilbert space with a collection of anyons. We do this in more detail in the following section. Here, however, we concentrate ourselves on up to four anyons in order to explain the so-called *Pentagon* equations. With two anyons a and b with fusion channel c, we associate the Hilbert space  $\mathcal{H}^c_{ab}$  of dimension  $N^c_{ab}$ . We can label the basis-elements of this

<span id="page-4-0"></span>![](_page_4_Picture_2.jpeg)

**Figure 2.** Possible fusion trees for anyons a, b, and c fusing to d.

space by the diagrams depicted in figure 1, excluding the label  $\mu$  for the reason mentioned earlier. For the case of three anyons a, b, and c, with the overall fusion channel d, we denote the associated Hilbert space by  $\mathcal{H}^d_{abc}$ . In this case, we can consider two different bases. Either a fuses with b first and then the outcome e fuses with c to give d, or b fuses with c first, to give d, which fuses with d to give d. These possibilities are shown in figure 2. The dimension of this Hilbert space is given by  $\sum_{e \in \mathcal{L}} N^e_{ab} N^d_{ec} = \sum_{f \in \mathcal{L}} N^f_{bc} N^d_{af}$ , where the equality follows from the associativity of the fusion rules.

The two different ways of describing the Hilbert space  $\mathcal{H}^d_{abc}$  are related by a basis transformation. The basis-transformation matrix describing this basis transformation is called the *F-matrix* and it is denoted by  $F^{abc}_d$ . Going between the fusion tree on the left to the fusion tree on right in figure 2, is called an *F-move*. When dealing with physical theories, the *F*-matrices are demanded to be invertible and unitary. Symbolically we write

<span id="page-4-1"></span>
$$\begin{array}{cccccccccccccccccccccccccccccccccccc$$

where the sum runs through all possible labels f in the fusion channel of b and c such that d is in the fusion channel of a and f. The symbol  $F_{d;ef}^{abc}$  denotes the (e,f)th entry of the matrix  $F_{d}^{abc}$  and it is called an F-symbol.

As it stands, equation (4) just means that an F-matrix is a basis-transformation matrix and does not constrain the F-symbols any further. To determine the F-symbols, one needs to consider the Hilbert space associated with four anyons. Two different bases for the Hilbert space  $\mathcal{H}^d_{abc}$  are depicted by the following two fusion trees:

![](_page_4_Picture_9.jpeg)

One can describe the basis transformation between these two bases in two different ways, which have to be equivalent to one another. The first one involves two *F*-moves:

![](_page_4_Picture_11.jpeg)

and the second one involves three F-moves:

![](_page_5_Picture_3.jpeg)

This gives rise to the consistency conditions

$$F_{e; vy}^{ucd} F_{e; ux}^{aby} = \sum_{v; uw} F_{e; vx}^{awd} F_{e; vx}^{bcd} F_{x; wy}^{bcd},$$
(5)

which are known as Pentagon equations. Here the sum is over all labels w consistent with fusion rules. Although the Pentagon equations are obtained by considering only four anyons, Mac Lane's coherence theorem [25] asserts that the Pentagon equations are all one needs to guarantee consistency in the case of more than four anyons. One should note that the Pentagon equations are just polynomial equations for F-symbols and it might be the case that there is no solution or there are several ones. It has been shown, however, that the number of inequivalent solutions is actually finite. See appendix A for the notion of gauge equivalence of F-symbols. In this paper, a set of labels with consistent fusion rules together with a particular solution of the Pentagon equations that leads to invertible F-matrices, is called an *anyon system*.

To completely describe an anyon system, one has to allow for the possibility of two anyons to be interchanged or *braided*. The braiding of two anyons should also be consistent with fusion rules. This consistency gives rise to a set of equations called the *Hexagon* equations. In this paper, we do not consider the braiding of anyons and refer the reader to [26–28] for more details.

### <span id="page-5-0"></span>3. Introducing the anyon model

In this section, we introduce the anyon model that we are interested in. We briefly specify the anyon system we are going to use, followed by a description of the associated Hilbert space. Finally, we introduce the Hamiltonian that we study in this paper.

#### 3.1. The anyon system of the model

In this article, we are interested in the anyons with  $su(2)_k$  fusion rules. These fusion rules have close resemblance to the ordinary SU(2) tensor products. To express the  $su(2)_k$  fusion rules, one introduces a highest 'spin' k/2, meaning that there are k+1 anyon types 0, 1/2, 1, ..., k/2. Let  $\mathcal{L}_k$  denote the set  $\{0, 1/2, ..., k/2\}$  of anyon types. Because of the presence of the 'highest spin', the ordinary SU(2) tensor-product rules have to be modified that results in the following multiplicity-free associative fusion rules:

$$i \otimes j = |i - j| \oplus (|i - j| + 1) \oplus \cdots \oplus \min\{i + j, k - i - j\},\tag{6}$$

for all i and j in  $\mathcal{L}_k$ . As mentioned in the previous section, the fusion rules do not, in general, fix the F-symbols. Hence, we need to specify which set of the F-symbols we consider. For the  $su(2)_k$  fusion rules, solutions to the Pentagon equations are known explicitly [29, 30]. In appendix A, we explicitly specify the form of the F-symbols we use to define the model.

Before we introduce the Hilbert space to our specific model, we first introduce the quantum dimension associated with an anyon type. The quantum dimension  $d_a$  associated

with a collection of anyons of type a, describes how the dimension of the Hilbert space corresponding to this collection of anyons grows with the number of such anyons. This dimension grows as  $d_a^n$ , where n is the number of anyons of type a. One can show [26] that the quantum dimensions satisfy the following relation:

$$d_a d_b = \sum_{c \in \mathcal{C}_b} N_{ab}^c d_c,\tag{7}$$

in resemblance with equation (1). In the case of  $su(2)_k$  anyons, the quantum dimension  $d_j(k)$  of anyons of type j, for every j in  $\mathcal{L}_k$ , is given by:

<span id="page-6-0"></span>
$$d_j(k) = \frac{\sin\left(\frac{2j+1}{k+2}\pi\right)}{\sin\left(\frac{1}{k+2}\pi\right)}.$$
 (8)

Since k remains fixed throughout the investigation of the model, we suppress k dependence from the notation for these numbers and denote them simply by  $d_j$ . From equation (8), one can immediately see that  $d_j = d_{k/2-j}$ , for all labels j.

#### <span id="page-6-2"></span>3.2. The Hilbert space of the model

We want to model a physical system of anyons with  $su(2)_k$  fusion rules in which the number of anyons can fluctuate. We do this in the simplest possible setting, namely, we consider a chain consisting of l sites in which each site can be either occupied with an anyon of type 1/2 or be empty. Besides, we do not allow a site to be doubly occupied. A chain with all its sites occupied is called a *dense* chain and one with some empty sites is called a *dilute* chain.

First, one needs to introduce the Hilbert space of the model and we do this by introducing an orthonormal basis for it. To do so, we need a set of labels that keeps track of the occupation of the sites. We denote these labels by  $y_i$ , with i running over all site numbers. So in our model, any  $y_i$  can be either zero or 1/2, depending on whether the ith site is empty or occupied, respectively. Moreover, two consecutive x labels are either equal or differ by 1/2.

Consider the tree-like shape in figure 3 for a given configuration of y labels.

This tree is called a fusion *chain* of size l or with l sites, if the lower labels x—which are also assumed to be chosen from  $\mathcal{L}_k$ —are consistent with fusion rules, that is, if  $x_j$  is a fusion channel of the fusion of  $x_{j-1}$  with  $y_j$ , for all  $1 \le j \le l$ . The part indicated by the blue ellipse in figure 3 is called the ith part or, if we do not need to be explicit, a local part of the fusion chain. In this paper, we consider two types of chains—open chains, for which both labels  $x_0$  and  $x_l$  are fixed but arbitrary, and closed chains, for which we impose the periodic boundary condition  $x_0 = x_l$  on the fusion chains. In the latter case, figure 4 shows what we call the lth part of a closed chain.

Using the notion of the fusion chain, we can now introduce the Hilbert space of our models, one corresponding to open chains and one corresponding to closed chains. That y labels in our models are restricted to take on either 0 or 1/2 makes it possible to introduce a short notation for fusion chains, since knowing only x labels in a fusion chain, uniquely determines the y labels. In fact, if  $x_{i-1}$  and  $x_i$  differ by 1/2, then  $y_i = 1/2$ , and if  $x_{i-1} = x_i$ , then  $y_i = 0$ . Therefore, the fusion chain in figure 3 can be simply indicated by the following ket:

<span id="page-6-1"></span>
$$|x_0, x_1, \dots, x_{i-1}, x_i, x_{i+1}, \dots, x_{l-1}, x_l\rangle.$$
 (9)

For closed chains, we can even simplify the notation further by dropping the last label  $x_l = x_0$ :

<span id="page-7-0"></span>![](_page_7_Picture_2.jpeg)

Figure 3. A typical fusion chain.

<span id="page-7-1"></span>![](_page_7_Picture_4.jpeg)

**Figure 4.** The *l*th part of a closed chain.

<span id="page-7-2"></span>
$$|x_0, x_1, \dots, x_{i-1}, x_i, x_{i+1}, \dots, x_{l-1}\rangle.$$
 (10)

We declare, for given k and l, that the kets introduced in (9) and (10) constitute an orthonormal basis for the Hilbert spaces  $\mathcal{H}_{op}(k,l)$  and  $\mathcal{H}_{cl}(k,l)$  corresponding to open-chain and closed-chain models, respectively. The orthonormality of the basis-elements in each case is defined as

$$\langle x_0, x_1, ..., x_{\nu} | x'_0, x'_1, ..., x'_{\nu} \rangle = \prod_{i=0}^{\nu} \delta_{x_i x'_i}, \tag{11}$$

where  $\nu$  is either l-1 or l, depending on whether the chain is closed or open, respectively.

#### 3.3. The Hamiltonian of the model

Here we introduce the Hamiltonians  $H_{\rm op}(k,l)$  and  $H_{\rm cl}(k,l)$  of the anyon models corresponding to open and closed chains, respectively. They act on Hilbert spaces  $\mathscr{H}_{\rm op}(k,l)$  and  $\mathscr{H}_{\rm cl}(k,l)$  introduced above, correspondingly. In this section, we assume that k and l are fixed given numbers and do not write them explicitly. Both Hamiltonians that we consider in this paper, which we denote them simply by H, have the following form:

<span id="page-7-3"></span>
$$H := \sum_{i=1}^{\nu} h_i, \tag{12}$$

where  $\nu$  is either l-1 or l, depending on whether it acts on open or closed chains, respectively. Each  $h_i$ , which we call the ith local Hamiltonian, is a sum of nine linear operators in its own. Each one of these linear operators is defined to act non-trivially only on the ith part of the chain, in a way that is explained in detail in section 3.3.1. In the remainder of this section though, we describe the general aspects of each one of these terms and fix sum notations.

As mentioned, in the models we consider, each  $h_i$  is a sum of nine terms. Four of these terms act diagonally by assigning energy according to whether the sites i and i + 1 are occupied or not. Thus, these terms act as a chemical potential, if both sites are not occupied simultaneously, and they act as an interaction term, if both sites are occupied simultaneously. We denote these terms by  $h_i = h_i$  and  $h_i$ 

The fifth term we consider, is an interaction term  $h_{i,J}$  between two neighboring anyons that acts in a way similar to the Heisenberg interaction for spin-1/2 chains, that is, it assigns an energy that depends on the fusion channel of the two neighboring anyons.

The next two terms deal with hopping of the anyons. If an anyon is adjacent to an empty site, we consider the possibility of the anyon hopping to this empty site. The terms corresponding to this process are denoted by  $h_{i,t}$  and  $h'_{i,t}$  for hopping to right and left, respectively. These types of terms were first considered in [23].

The last two terms, denoted by  $h_{i,\Delta}$  and  $h'_{i,\Delta}$ , describe the creation and annihilation of two neighboring anyons. These are the new terms that we consider in our model. In the presence of these terms, the number of anyons can fluctuate.

<span id="page-8-0"></span>3.3.1. Different terms in the local Hamiltonian  $h_i$ . To specify how the local Hamiltonian  $h_i$  acts, consider a typical fusion chain, closed or open, and focus on the ith part of this chain, which can be viewed as

$$\frac{\begin{array}{c|c} m & n \\ \hline \downarrow & \\ \hline x & y & z \end{array} := |x, y, z\rangle,$$

where m and n are either zero or 1/2, and y and z are consistent with the fusion rules. We recall that the labels m and n are determined by the labels x, y, and z.

As mentioned in the pervious section, for each i, the local Hamiltonian  $h_i$  is a sum of nine terms as follows:

$$h_{i} = h_{i,\mu_{00}} + h_{i,\mu_{0\frac{1}{2}}} + h_{i,\mu_{\frac{1}{2}0}} + h_{i,\mu_{\frac{1}{2}\frac{1}{2}}} + h_{i,J} + h_{i,t} + h'_{i,t} + h_{i,\Delta} + h'_{i,\Delta},$$
(13)

where each term acts non-trivially only on the *i*th part of the chain and act as identity on other parts. Since, in this section, we always consider the *i*th part of the fusion chain and the *i*th local Hamiltonian, we suppress the subscript *i* everywhere. In order to specify the model, we now define how the different types of terms act on the local part of a fusion chain.

*The diagonal terms*. The terms that assign an energy depending on the occupation of the neighboring sites, act diagonally. Explicitly, we write these terms as

$$h_{\mu_{00}}|x,x,x\rangle := \mu_{00}|x,x,x\rangle,\tag{14}$$

$$h_{\mu_{0\frac{1}{2}}}|x,x,y\rangle := \mu_{0\frac{1}{2}}|x,x,y\rangle,$$
 (15)

$$h_{\mu_{\frac{1}{2}0}}|x,y,y\rangle := \mu_{\frac{1}{2}0}|x,y,y\rangle,$$
 (16)

$$h_{\mu_{\frac{1}{2}\frac{1}{2}}}|x,y,z\rangle := \mu_{\frac{1}{2}\frac{1}{2}}|x,y,z\rangle.$$
 (17)

Recall that, if two neighboring labels in the kets above are different, their values differ by 1/2. This means, for instance, that  $h_{\mu_0\frac{1}{2}}$  assigns an energy  $\mu_0\frac{1}{2}$  if the first site is empty and the second site is occupied and, otherwise, this term acts by zero. Similar considerations apply to the other terms.

We now turn our attention to the terms that act in a non-diagonal way and explain how they actually act in more detail.

The interaction term. In our models, for two anyons sitting on neighboring sites, we include an interaction term  $h_J$  that assigns an energy which depends on the fusion channel of the two anyons. This interaction term was introduced in the original paper [12]. In particular, we demand for this term to assign an energy J, in the case two neighboring 1/2 anyons fuse to zero, and to assign zero energy otherwise. Hence, in order to define  $h_J$  we need to go to a basis for which the fusion channel of the two 1/2 neighboring anyons is explicit. To explain all of this, it is more illustrative to use the fusion tree notation rather than the ket notation. This is illustrated in the following:

<span id="page-9-0"></span>
$$h_J\left(\frac{\frac{1}{2} \quad \frac{1}{2}}{x \quad z}\right) := J \ \delta_{xz}\delta_{u0} \frac{\frac{1}{2} \quad \frac{1}{2}}{x \quad z}$$

$$\tag{18}$$

Here, as demanded,  $\delta_{u0}$  takes care of assigning energy J to the zero channel only, and  $\delta_{xz}$  takes care of the consistency of the last fusion tree with the fusion rules. The term  $h_J$  is defined to act by zero on any other configuration except the one mentioned above.

To know how  $h_J$  acts on a local fusion chain, we exploit equations (4) and (18) and we come up with the following:

$$h_{J}\left(\frac{\frac{1}{2}}{x}, \frac{1}{y}, \frac{1}{z}\right) = \delta_{xz}J\sum_{u}F_{z;yu}^{x\frac{1}{2}\frac{1}{2}} \underbrace{\frac{1}{2}}_{u}\delta_{u0} = \delta_{xz}JF_{z;y0}^{x\frac{1}{2}\frac{1}{2}} \underbrace{\frac{1}{2}}_{v}\delta_{u0}$$
(19)

Switching back to the original basis by employing the inverse of an *F*-move and using the fact that the *F*-matrices we use are their own inverses, one gets

$$h_J\left(\frac{\frac{1}{2} \frac{1}{2}}{x y z}\right) = J\delta_{xz} \sum_{v} \left(F_{z;y0}^{x\frac{1}{2}\frac{1}{2}} F_{z;v0}^{x\frac{1}{2}\frac{1}{2}} \frac{\frac{1}{2}}{x v z}\right). \tag{20}$$

The operator  $h_J$  acts by zero on any other configuration of the local fusion chain other than the ones mentioned above. Plugging the F-symbols introduced in appendix A into the equation above, we have:

$$h_J\left(\frac{\frac{1}{2} \quad \frac{1}{2}}{x \quad y \quad z}\right) = J\delta_{xz} \sum_{v} \left(\frac{\sqrt{d_y d_v}}{d_x d_{1/2}} \frac{\frac{1}{2} \quad \frac{1}{2}}{x \quad v \quad z}\right). \tag{21}$$

Of course, considering fusion rules, the sum above has at most two terms in our model.

The Hopping terms. The models we consider allow for the possibility for a 1/2 anyon to hop onto a neighboring site, provided this site is empty. We denote the strength of the hopping process by t. This hopping process was first considered in [12]. Explicitly, the hopping terms act as

$$h_t|x,y,y\rangle := t |x,x,y\rangle,$$
 (22)

$$h'_t|x, x, y\rangle := t |x, y, y\rangle. \tag{23}$$

Here, again, different letters in the kets refer to different labels and for all other ket configurations,  $h_t$  and  $h'_t$  are defined to act by zero.

The creation and annihilation terms. Finally, we introduce the terms that allow for the number of anyons to fluctuate. This is achieved by considering the possibility for a process in which a pair of 1/2 anyons is created out of the vacuum on two neighboring empty sites as well as the possibility for a process in which a pair of 1/2 anyons sitting on neighboring sites are annihilated. We assume the same strength  $\Delta$  for both of these processes to guarantee the Hermiticity of the Hamiltonian.

The procedure of defining the creation term is along the lines that we had for interaction term. Hence, making explanations short, we have:

$$h_{\Delta}\left(\frac{1}{x}, \frac{1}{x}, \frac{1}{x}\right) := \Delta \frac{\frac{1}{2}}{x}, \frac{\frac{1}{2}}{x} = \Delta \sum_{u} F_{x;0u}^{x\frac{1}{2}\frac{1}{2}}, \frac{\frac{1}{2}}{x}, \frac{\frac{1}{2}}{u} = \frac{1}{x}.$$
(24)

In the first step, we create a pair of 1/2 anyons out of the vacuum so that they are in the fusion channel zero. In the second step, we rewrite the obtained configuration in the basis we use to describe the Hamiltonians. Plugging the explicit form of the F-symbols, yields:

$$h_{\Delta}\left(\frac{\begin{array}{c|c} 0 & 0 \\ \hline \end{array}}{x & x & x}\right) = \Delta \sum_{u} \left(\sqrt{\frac{d_{u}}{d_{x}d_{1/2}}} \frac{\begin{array}{c|c} \frac{1}{2} & \frac{1}{2} \\ \hline \end{array}}{x & u & x}\right). \tag{25}$$

Here again the sum above consists of at most two terms in our models.

The process conjugate to the creation of two anyons on neighboring sites is the annihilation of two anyons sitting on neighboring sites. The latter is possible only if the fusion channel of the two anyons is zero. Using similar arguments as for the creation term, we get:

$$h'_{\Delta}\left(\begin{array}{c|c} \frac{\frac{1}{2} & \frac{1}{2}}{x} \\ \hline x & y & z \end{array}\right) = \delta_{xz}\Delta\sqrt{\frac{d_y}{d_x d_{1/2}}} \begin{array}{c} 0 & 0 \\ \hline x & x & x \end{array}.$$
 (26)

It is straightforward to see that each  $h_i$  is a symmetric operator and, consequently, H is symmetric (in fact, Hermitian) and a physically acceptable Hamiltonian.

#### <span id="page-10-0"></span>4. Ground states of the model Hamiltonians

In this section, we start with the analysis of the dilute anyon model we introduced in the previous section. Since the number of parameters in the model is rather large and also the size of the Hilbert space grows quickly with both k and system size l, we limit ourselves to special choices for the parameters and analyze those analytically, supported by numerical calculations.

A possible strategy, which has already been proven valuable in similar models, is to choose values for the parameters to make each local Hamiltonian  $h_i$  a projector, that is,  $h_i^2 = h_i$ . Consequently, the eigenvalues of each  $h_i$  is either zero or one. The efficiency of this strategy is due to the fact that, if the local Hamiltonians  $h_i$  are projectors, then a state  $|\psi\rangle$  is the *zero*-energy ground state of the total Hamiltonian (12) if and only if  $h_i|\psi\rangle = 0$  for all i or, equivalently, if and only if

<span id="page-11-2"></span>
$$\ker(H) = \bigcap_{i=1}^{\nu} \ker(h_i),\tag{27}$$

for the kernel of these operators. In some cases, it is possible to find all the states  $|\psi\rangle$  such that  $h_i|\psi\rangle=0$  for all i. Two famous examples for which this has been done are the spin-1/2 Majumdar–Ghosh model [31, 32], in which the projector projects onto the spin-3/2 states of three neighboring spin-1/2's, and the spin-1 AKLT model [33, 34], in which the projector projects onto the spin-2 states of two neighboring spin-1's.

Typically, if the Hamiltonian is a sum of projectors and one can find zero-energy ground states, the system is gapped. This has been proven in some cases. Because of the gap, these ground states typically describe the physics of the corresponding models even if one perturbs away from the point where the Hamiltonian is a sum of projectors. We note that it can of course happen that the ground state does not have zero energy. In these cases, one has to resort to other techniques to analyze the model.

Figuring out the values for the parameters to turn the local Hamiltonians into projectors is rather straightforward in our case. This stems from the fact that when a local Hamiltonian acts on the corresponding local piece  $|x_{i-1}, x_i, x_{i+1}\rangle$  of the fusion chain, it does not alter the outer labels  $x_{i-1}$  and  $x_{i+1}$ . Therefore, we can consider the local subspaces  $\{|x, x, x \pm 1/2\rangle, |x, x \pm 1/2, x \pm 1/2\rangle\}$  and  $\{|x, x, x\rangle, |x, x - 1/2, x\rangle, |x, x + 1/2, x\rangle\}$  separately. We note that the states  $|x, x - 1/2, x - 1\rangle$  and  $|x, x + 1/2, x + 1\rangle$  form one-dimensional subspaces in their own.

The constraints on the parameters of the Hamiltonian can straightforwardly be solved. Moreover, in this paper we are interested in a non-zero value for the parameters J, t, and  $\Delta$ . Out of the possible solutions, we pick the following set of values:

<span id="page-11-1"></span>
$$\mu_{00} = \mu_{0\frac{1}{2}} = \mu_{\frac{1}{2}0} = t = \frac{1}{2} , \ \mu_{\frac{1}{2}\frac{1}{2}} = 0 , \ J = \frac{1}{2} , \ \Delta = \frac{1}{2},$$
 (28)

which by assigning the same value 1/2 to parameters  $\mu_{00}$ ,  $\mu_{0\frac{1}{2}}$ ,  $\mu_{\frac{1}{2}0}$ , and t, makes the model easier to handle.

Assigning these values to the parameters, we found that, for *odd* values of k, there are indeed zero-energy ground states. In the case of an open chain, we found that there are (k+1)(k+2)(k+3)/6 zero-energy ground states, provided that the chain is sufficiently long,  $l \ge k$ . For a closed chain, there are (k+1)/2 zero-energy ground states, if  $l \ge k+1$ . In each case, for system sizes smaller than these thresholds, the number of zero-energy ground states depends on the system size l and decreases by increasing l until it saturates at the numbers mentioned above. At this point of the parameter space and for odd values of k, we were able to determine an explicit closed form for these zero-energy ground states. This is discussed separately for the open and closed cases in sections 4.1 and 4.2.

We should note that in the case of *even* k, it turns out that, if the system size is large enough, there are no zero-energy ground states. The reason for the difference in behavior of the model for k even and odd, lies in the fact that the structure of the fusion rules is different for these cases. As an example of this difference, we note that one has the fusion rule  $j \otimes k/2 = k/2 - j$ . Thus, if k is even, there is an anyon type, namely j = k/4, such that  $j \otimes k/2 = j$ , while this is not the case when k is odd.

#### <span id="page-11-0"></span>4.1. Zero-energy ground states, open chain

In this section we first outline the general strategy that we followed to determine the zero-energy ground states for the described model Hamiltonian in the case of a given odd k and a

sufficiently large open chain with the parameter values (28). For an open chain with l sites, the Hamiltonian is given by  $H = \sum_{i=1}^{l-1} h_i$ . This is a sum over l-1 terms, where the first acts on the first three labels  $x_0, x_1$ , and  $x_2$ , while the last term acts on the last three labels  $x_{l-2}, x_{l-1}$ , and  $x_l$  of every given basis state  $|x_0, x_1, ..., x_l\rangle$ .

We start by considering the explicit form of these states for the cases k = 1 and k = 3, and explain the number of ground states for a given boundary condition. As becomes clear, the structure of the coefficients of the ground states are fairly simple for these special cases. Having understood the structure of ground states for k = 1 and k = 3, one can generalize and find the ground states for general odd k, which we present at the end of this section.

We decompose  $\mathcal{H}_{op}$ , the Hilbert space introduced in section 3.2 for an open chain, into  $(k+1)^2$  disjoint sectors with fixed boundary-labels as follows:

$$\mathscr{H}_{\text{op}} = \bigoplus_{a,b \in \mathcal{L}_k} \mathscr{H}_{\text{op}}^{ab},\tag{29}$$

where  $\mathscr{H}_{\text{op}}^{ab}$  denotes the subspace of  $\mathscr{H}_{\text{op}}$  spanned by those basis fusion kets  $|x_0, x_1, ..., x_l\rangle$  in which  $x_0 = a$  and  $x_l = b$ . The Hamiltonian does not alter the values of  $x_0$  and  $x_l$  when it acts on the corresponding ket, so we can search for zero-energy ground states in each subspace  $\mathscr{H}_{\text{op}}^{ab}$  separately. Below, when we write H and  $h_i$ , we actually mean their restrictions to  $\mathscr{H}_{\text{op}}^{ab}$ . To describe the general strategy, let  $|\psi^{ab}\rangle$  be a generic element of  $\mathscr{H}_{\text{op}}^{ab}$ , namely,

$$|\psi^{ab}\rangle = \sum_{\{x_i\}} C^{ab}_{\{x_i\}} |a, x_1, ..., x_{l-1}, b\rangle,$$
 (30)

where  $C_{\{x_i\}}^{ab}$ 's are, in general, complex numbers,  $\{|a,x_1,...,x_{l-1},b\rangle\}_{\{x_i\}}$  is the basis of  $\mathscr{H}_{\text{op}}^{ab}$  composed of fusion chains starting with label a and ending with label b, and the sum runs through all possible intermediate labels  $x_i$ . For  $|\psi^{ab}\rangle$  to be a zero-energy ground state, it must be in the kernel of the Hamiltonian H. Consequently, by equation (27), it must reside in the kernel of all local Hamiltonians  $h_i$ . To determine a set of appropriate coefficients  $C_{\{x_i\}}^{ab}$  for the zero-energy ground state(s), one can act as follows. We first consider the relation  $h_1|\psi^{ab}\rangle=0$ , which gives rise to some constraints on the coefficients  $C_{\{x_i\}}^{ab}$ . Typically, it relates several coefficients. We denote the generic state satisfying these relations  $|\psi_1^{ab}\rangle$ . One continues by considering that  $h_2|\psi_1^{ab}\rangle=0$ , which gives rise to more constraints among the coefficients. Continuing this way, one finds that the number of states, satisfying the increasing number of constraints, decreases until it eventually saturates.

We start by looking at k = 1 in which there are four different boundary conditions. By following the procedure outlined above, one can show explicitly that for each boundary condition, there is one zero-energy ground state. In addition, one finds that the coefficients describing these ground states take a simple form, namely  $C_{\{x_i\}}^{ab} = (-1)^{\#(1/2)}$ , where #(1/2) is the number of 1/2 labels present in the corresponding basis state  $|a, x_1, ..., x_{l-1}, b\rangle$ . The ground states thus take the following simple form:

$$|\psi^{ab}\rangle = \sum_{\{x_i\}} (-1)^{\#(1/2)} |a, x_1, ..., x_{l-1}, b\rangle,$$
 (31)

with the sum over all states in  $\mathcal{H}_{op}^{ab}$ . Because the coefficients appeared in all of these four ground states obey the same rule, we say that these states are all of the same type. As become clear shortly, for higher values of k, there are ground states of different type. We can summarize

the number of ground states for the different boundary conditions in terms of the following matrix:

<span id="page-13-0"></span>
$$M^{(k=1)} = \begin{bmatrix} 1 & 1 \\ 1 & 1 \end{bmatrix}, \tag{32}$$

where the rows and columns correspond to the labels 0 and 1/2.

The case k=3 is more complicated than k=1. There are sixteen different boundary conditions and the constraints imposed by the Hamiltonian are more complicated. We used the same line of arguments as for k=1, but we guided ourselves by diagonalizing the Hamiltonian for small system sizes. For system size  $l \ge 3$ , there is a total of twenty zero-energy ground states. We observe that all these twenty ground states fall into two main types, as compared to only one type for k=1 case. There are ground states with the property that in their expansions in terms of basis states, all basis states contribute. In other words, the labels in  $|a, x_1, ..., x_{l-1}, b\rangle$  are taken from the set  $\{0, 1/2, 1, 3/2\}$ . We call these, ground states of *type one*. The coefficients of this type of ground states turns out to take the following pattern:

$$C_{\{x_i\}}^{ab} = (-1)^{[\#(1/2) + \#(3/2)]} d_{1/2}^{-3/2 \times \#(1,1/2)}, \tag{33}$$

where #(1/2) and #(3/2) are the number of labels in  $|a, x_1, ..., x_{l-1}, b\rangle$  that are 1/2 and 3/2, respectively, and #(1, 1/2) is the number of ordered pairs  $(x_i, x_{i+1})$  in this ket that are equal to (1, 1/2)—taking the cases i = 0 and i = l - 1 into account as well. We remind that  $d_{1/2}$  is the quantum dimension of the anyon type 1/2, which for k = 3 is equal to the golden ratio  $\phi := (1 + \sqrt{5})/2$ , by equation (8).

There is another type of ground states, which we call ground states of *type two*, such that, in their expansions, only those basis states  $|a, x_1, ..., x_{l-1}, b\rangle$  contribute that have their labels in the set  $\{1/2, 1\}$ . The coefficients in this case, take the following pattern:

$$C_{\{x_i\}}^{ab} = (-1)^{\#(1/2)} d_{1/2}^{\frac{1}{2} \times \#(1,1/2)}.$$
 (34)

From the structure of the two types of ground states, we can deduce the number of zeroenergy ground states for each boundary condition. The ground state of the first type is present for all sixteen boundary conditions, while the ground state of the second type only occurs if both labels a and b belong to the set  $\{1/2,1\}$ . We indicate this by the matrix

<span id="page-13-1"></span>
$$M^{(k=3)} = \begin{bmatrix} 1 & 1 & 1 & 1 \\ 1 & 2 & 2 & 1 \\ 1 & 2 & 2 & 1 \\ 1 & 1 & 1 & 1 \end{bmatrix},\tag{35}$$

where the rows and columns correspond to the labels 0, 1/2, 1, and 3/2 in this order.

Having understood the structure of the zero-energy ground states for k=1 and k=3, we now consider a generic odd k. Guided by numerical diagonalization of small system sizes, we found the ground states for odd k in general. For large enough system size, namely for  $l \ge k$ , the number of zero-energy ground states of the system is (k+1)(k+2)(k+3)/6 that can be viewed as (k+1)/2 different types, according to the labels present in the basis states appearing in their expansions.

For a ground state of *type one*, the labels  $x_i$  of the basis states  $|x_0, x_1, ..., x_l\rangle$  with non-zero coefficients all belong to the set  $\{0, 1/2, 1, ..., (k-2)/2, (k-1)/2, k/2\}$ . In other words, all basis states have non-zero coefficients in this case. For a ground state of *type two*, all the labels  $x_i$  belong to the set  $\{1/2, 1, ..., (k-2)/2, (k-1)/2\}$ , that is, any basis state with at least one

label  $x_i$  equal to zero or k/2 has zero coefficient. In general, for a state of type n, the labels of basis states with non-zero coefficient belong to the following set:

<span id="page-14-1"></span>
$$\left\{\frac{n-1}{2}, \frac{n+1}{2}, \dots, \frac{k-(n+1)}{2}, \frac{k-(n-1)}{2}\right\}. \tag{36}$$

To explicitly express the coefficients of the basis states in each type of these ground states, we introduce a piece of notation first. For fixed odd k and integer  $n, 1 \le n \le (k+1)/2$ , and for i = n, n+1, ..., (k+1)/2, we define D(k, n, i) by

$$D(k,n,i) = \begin{cases} d_{1/2}^{1/2} d_{(k-1)/4}^{-1} d_{(i-1)/2}^{-1/2} d_{i/2}^{-1/2} d_{(i-n-1)/4} d_{(k-n-i)/4}, & \text{if } i-n \text{ is odd,} \\ d_{1/2}^{1/2} d_{(k-1)/4}^{-1} d_{(i-1)/2}^{-1/2} d_{i/2}^{-1/2} d_{(n+i-2)/4} d_{(k-n+i+1)/4}, & \text{if } i-n \text{ is even.} \end{cases}$$
(37)

Now let  $|\psi\rangle$  be a type-*n* ground state and let  $|x_0, x_1, ..., x_l\rangle$  be a basis state that appears in the expansion of  $|\psi\rangle$  with constraints on  $x_i$ 's explained above. The coefficient of this basis state in the expansion of  $|\psi\rangle$  is

$$(-1)^m \prod_{i=n}^{(k+1)/2} [D(k,n,i)]^{\theta_i}, \tag{38}$$

where m is the number of half-integers in  $|x_0, x_1, ..., x_l\rangle$ ,

<span id="page-14-2"></span>
$$\theta_i := \#\left(\frac{i}{2}, \frac{i-1}{2}\right) + \#\left(\frac{k-i+1}{2}, \frac{k-i}{2}\right), \qquad (n \leqslant i \leqslant (k-1)/2), \tag{39}$$

and

<span id="page-14-3"></span>
$$\theta_{(k+1)/2} := \#\left(\frac{k+1}{4}, \frac{k-1}{4}\right). \tag{40}$$

Here #(r, s) refers to the number of pairs  $(x_i, x_{i+1})$  composed of labels in  $|x_0, x_1, ..., x_l\rangle$  that are equal to the ordered pair (r, s). This completes the description of the explicit form of the zero-energy ground states.

We mention that the number of zero-energy ground states follows the same pattern as for k = 1 and k = 3. Explicitly, the entries  $m_{ij}$  of the matrix  $M^{(k)}$ , analog to matrices (32) and (35), encoding the number of ground states are given by

$$m_{ij} = \frac{1}{2} \left[ k + 2 - \max\{|k - 4i|, |k - 4j|\} \right],\tag{41}$$

where i and j run over the values 0, 1/2, ..., k/2.

#### <span id="page-14-0"></span>4.2. Zero-energy ground states, closed chain

In this section, we deal with the ground states of the closed chain. Interestingly, we find that the number of zero-energy ground states differs from the open case. As in the previous section, k has to be odd, otherwise, no zero-energy ground states exist, if the system is large enough.

For a closed chain, we have that  $x_l = x_0$ , therefore, as mentioned earlier, we label the states in the Hilbert space by the kets  $|x_0, x_1, ..., x_{l-1}\rangle$ . In terms of the Hilbert space of the open chain, we have

$$\mathscr{H}_{cl} = \bigoplus_{a \in \mathcal{L}_t} \mathscr{H}_{op}^{aa}. \tag{42}$$

The Hamiltonian is now a sum over l terms  $H = \sum_{i=1}^{l} h_i$ —including one more term compared to the Hamiltonian for the open case. This additional term acts on the label  $x_0 = x_l$ , which is not left invariant by the Hamiltonian anymore.

To find the zero-energy ground state  $|\psi\rangle$  of the closed chain, we take all the ground states of the open chain with the boundary conditions  $x_0 = x_l = a$ . On these states, we need to impose an additional constraint, namely,  $h_l|\psi\rangle = 0$ . This additional constraint reduces the number of zero-energy ground states. The result is that there is exactly one ground state for each 'type' of ground state that was introduced in the previous section. In this case, the unique zero-energy ground state of type n, denoted by  $|GS_n\rangle$ , can be explicitly written as

$$|GS_n\rangle = \sum_{\{x_i\}} \left( (-1)^m \prod_{i=n}^{(k+1)/2} [D(k,n,i)]^{\theta_i} \right) |x_0, x_1, \dots, x_{l-1}\rangle, \tag{43}$$

where the sum is over all possible labels chosen from the set (36). As is apparent in the formula above, the form of the coefficients are exactly the same as for the open case, but this time m refers to the number of half integers in  $|x_0, x_1, ..., x_{l-1}\rangle$ , and although  $\theta_i$ , i = n, n+1, ..., (k+1)/2, is defined as mentioned in equations (39) and (40), but this time #(r,s) refers to the number of ordered pairs  $(x_i, x_{i+1})$  in  $|x_0, x_1, ..., x_{l-1}\rangle$  equal to (r, s), where we use the identification  $x_l = x_0$ .

#### <span id="page-15-0"></span>5. Integrability of the model

In the previous section, we studied the model for the parameters chosen in such a way that the Hamiltonian becomes a sum of projectors. This allowed us, for odd k, to find the zero-energy ground states of the model. In this section, we investigate if the parameters in the model can be chosen such that the model becomes integrable. We refer to [35] for an introduction on the Yang–Baxter equation and transfer matrices.

We start by briefly recalling the situation for the dense anyon chain where all l sites are occupied, that is,  $y_i = 1/2$  for all i. In this case, the only types of terms that survive in the Hamiltonian are the 'interaction' terms  $h_J$  and  $h_{\mu_{1,1}}$ . Letting  $J = \mu_{\frac{1}{2}\frac{1}{2}} = 1$ ,  $h_{\frac{\mu_{1,1}}{2}}$  acts as the identity operator and  $h_{i,J}$  acts as a projector that assigns an energy +1 to two neighboring anyons, if they fuse to the zero channel, and assigns energy zero, if they fuse to the one channel. Therefore, up to an overall shift,  $H = \sum_i h_{i,J=1}$ . It is straightforward to see that the operators  $e_i$ ,  $i = 1, 2, \ldots, l$ , defined by  $e_i = d_{1/2} h_{i,J=1}$  satisfy the Temperley–Lieb algebra, namely,

<span id="page-15-1"></span>
$$e_i^2 = d_{1/2}e_i$$
, for all  $i$ ,  
 $e_ie_{i\pm 1}e_i = e_i$ , for all  $i$ ,  
 $[e_i, e_i] = 0$ , for  $|i - j| \ge 2$ . (44)

It is instructive to give a pictorial representation of the Temperley–Lieb algebra. Consider a chain of l sites, corresponding to the l spin-1/2 anyons of the dense anyon model and, for each site, draw a vertical line as is depicted on the left in figure 5. This picture is associated with the identity operator acting on the l sites. The picture associated with the operator  $e_i$  is depicted on the right panel of figure 5. The operator  $e_i$  is represented in a similar way, except that now sites i and i+1 are connected by a line at the top and a line at the bottom.

<span id="page-16-0"></span>
$$\mathbf{1} = egin{bmatrix} & & & & & & & & & & & & & & & & & & &$$

**Figure 5.** Graphical representations of the identity operator 1 and the operator  $e_i$ .

Multiplying two operators corresponds to gluing the picture of the operator sitting on the left on top of the picture of the operator sitting on the right. Two additional rules also apply. Firstly, two pictures are the same if they can continuously be deformed into one another. Secondly, a closed loop corresponds to a factor of  $d_{1/2}$ . Actually, the first rule ensures  $e_i e_{i\pm 1} e_i = e_i$ , for all i, and  $[e_i, e_i] = 0$ , for  $|i - j| \ge 2$ , and the second rule ensures the relation  $e_i^2 = d_{1/2} e_i$ .

We now recall briefly how the Temperley–Lieb algebra can be used to show that the dense anyon model is integrable. For more details the reader is referred to [12].

First, one constructs a one-parameter family of matrices  $R_i(u)$ , called R-matrices, such that each one of them satisfies the Yang–Baxter equation:

<span id="page-16-1"></span>
$$R_i(u)R_{i+1}(u+v)R_i(v) = R_{i+1}(v)R_i(u+v)R_{i+1}(u).$$
(45)

From the R-matrices, one in turn constructs a new one-parameter family of matrices T(u):

$$T(u) := \prod_{i} R_i(u), \tag{46}$$

called the *transfer* matrices. It follows from equation (45) that [T(u),T(v)] = 0, for all values of the parameters u and v. Using the transfer matrix T(u), one defines a Hamiltonian H through

$$T(u) = e^{-uH + o(u^2)}, (47)$$

from which one obtains the following explicit form for the Hamiltonian *H*:

<span id="page-16-3"></span>
$$H = -\frac{\mathrm{d}\ln T(u)}{\mathrm{d}u}\bigg|_{u=0} = -\sum_{i} R_{i}^{-1}(u=0) \frac{\mathrm{d}R_{i}(u)}{\mathrm{d}u}\bigg|_{u=0}.$$
 (48)

By its definition, the Hamiltonian H commutes with the transfer matrices and, hence, has a large number of conserved quantities, implying that the model is integrable.

Turning back to the case of the dense anyon model, consider the one-parameter family of matrices  $R_i(u)$  defined by

<span id="page-16-2"></span>
$$R_i(u) = \sin\left(\frac{\pi}{k+2} - u\right)\mathbf{1} + \sin(u)e_i. \tag{49}$$

Here, the index i has a similar meaning as in the Hamiltonian, namely, it indicates where the corresponding matrix acts, and k is the same as in  $su(2)_k$ . Using only the algebraic properties of the operators  $e_i$  given in (44), one can show that the  $R_i(u)$  matrices, given by (49), satisfy the Yang–Baxter equation. Therefore, from the recipe outlined above, one gets the following Hamiltonian:

$$H = \frac{2}{\tan(\frac{\pi}{k+2})} \sum_{i} \left( \frac{1}{2} \mathbf{1} - \frac{1}{d_{1/2}} e_i \right) = \frac{2}{\tan(\frac{\pi}{k+2})} \sum_{i} \left( \frac{1}{2} \mathbf{1} - h_{i,J=1} \right).$$
 (50)

This Hamiltonian, up to a shift and a negative overall scale factor, is simply the Hamiltonian  $H = \sum_i h_{i,J=1}$ , which describes the dense anyon chain. Hence, as mentioned above, it should

<span id="page-17-0"></span>
$$e_0 = \begin{vmatrix} & & & & & & & & & & & & & & & & & &$$

Figure 6. The nine different types of operators corresponding to the dilute anyon model.

be possible to solve the model. Although doing this turns out to be complicated, however, the solution was obtained by Andrews, Baxter, and Forrester, who solved the associated two-dimensional statistical mechanics model [36].

We now turn our attention to the dilute anyon model and start by describing the algebraic structure that we need to construct *R*-matrices that satisfy the Yang–Baxter equation in this case. This structure was introduced by Warnaar *et al* [37]. Here we follow their presentation.

In the dilute model, sites can be empty. We represent an empty site by a dashed line. Compared to the dense anyon model, where the only operators considered were the identity operator and e, the presence of empty sites for the dilute anyon model provides us with the possibility to consider additional operators. We introduce these operators by means of their pictorial representation. For ease of presentation, we give these pictures for a system of two sites only. For a larger system, one should think that the strands correspond to sites i and i+1 and any operator with index i acts as the identity operator on other sites. The operators we need are depicted in figure 6.

The first four operators  $e_0$ ,  $e_r$ ,  $e_l$ , and  $e_{lr}$  correspond to the identity. The operators  $e_-$  and  $e_+$  move an occupied site one place to the left and right, respectively. The operators  $e_a$  and  $e_c$  correspond to the annihilation and creation of particles at neighboring sites. Finally, e is the same as before.

Multiplication of the various operators is determined as mentioned earlier, namely, by stacking pictures on top of one another, acting from right to left. Hence, the product  $e_{\beta}e_{\alpha}$  means that we stack the picture of  $e_{\beta}$  on top of the picture of  $e_{\alpha}$ . One should note that multiplication of two operators is, by definition, non-zero only if the dashed and solid lines corresponding to their pictorial representations match, in the sense that if at some site i from the picture below a dashed (solid) line is terminated, the line originated from the same site i in the picture above must be a dashed (solid) line as well, for all i. For example,  $e_{\alpha}e_{+}=0$  for all  $\alpha \neq r$ , —; in addition,  $e_{-}e_{+}=e_{l}$  and  $e_{r}e_{+}=e_{+}$ . We again have the rule that pictures which can continuously be deformed into each other are equivalent and a closed full loop corresponds to a factor  $d_{1/2}$ . Moreover, in this case, a closed dashed loop can be removed without any factor or better to say, with a factor  $d_{0}=1$ . With the rules above, one can establish the relations  $e_{0}e_{a}=e_{a}$  and  $e_{c}e_{0}=e_{c}$ , that is,  $e_{0}$  acts as the identity on 'matching operators'. The same is true for  $e_{l}$ ,  $e_{r}$ , and  $e_{lr}$ . Other non-trivial relations with two operators are  $e_{a}e_{c}=d_{1/2}e_{0}$ ,  $e_{a}e=d_{1/2}e_{a}$ ,  $e_{c}e_{a}=e$ , and  $e_{c}=d_{1/2}e_{c}$ .

Following a case-by-case-check strategy, we verified that the above-mentioned algebraic relations for  $e_{\alpha}$  operators are realized by the terms present in the Hamiltonian, provided that one makes the following identifications:

<span id="page-17-1"></span>
$$h_{\mu_{00}} = \mu_{00} e_0, \qquad h_{\mu_{0\frac{1}{2}}} = \mu_{0\frac{1}{2}} e_r, \qquad h_{\mu_{\frac{1}{2}0}} = \mu_{\frac{1}{2}0} e_l, \qquad h_{\frac{\mu_{11}}{2}} = \mu_{\frac{1}{2}\frac{1}{2}} e_{lr},$$

$$h_t = t (e_- + e_+), \quad h'_{\Delta} = \Delta d_{1/2}^{-1/2} e_a, \quad h_{\Delta} = \Delta d_{1/2}^{-1/2} e_c, \quad h_J = J d_{1/2}^{-1} e.$$
(51)

With the algebraic structure in place, we use the results of [37] to construct *R*-matrices that satisfy the Yang–Baxter equation. Consider the following family of matrices:

$$R_{i}(u; \lambda) := [\sin(2\lambda)\cos(3\lambda) + \sin(u)\cos(u + 3\lambda)] e_{i,0} + \sin(2\lambda)\cos(u + 3\lambda) (e_{i,l} + e_{i,r}) + \sin(2\lambda)\sin(u) (e_{i,a} + e_{i,c}) + \sin(u)\cos(u + 3\lambda) (e_{i,+} + e_{i,-}) + \sin(u + 2\lambda)\cos(u + 3\lambda) e_{i,lr} + \sin(u)\cos(u + \lambda) e_{i},$$
(52)

<span id="page-18-0"></span>where we reinstated the subscript i on the operators, denoting on which site the operator acts. One can verify—using only the algebraic properties of the  $e_{i,\alpha}$ 's—that these R-matrices satisfy the Yang–Baxter equation (45), provided that  $-2\cos(4\lambda) = d_{1/2}$ . On the other hand, in our Hamiltonian describing the dilute anyon system, from equation (8), we get  $d_{1/2} = 2\cos[\pi/(k+2)]$ . This puts a constraint on  $\lambda$ , namely,  $\lambda = \pm \pi (k+2\pm 1)/[4(k+2)]$ .

Since the terms in the Hamiltonian satisfy the algebraic relations of the operators  $e_{\alpha}$ , one can use the same procedure as outlined above for the dense anyon model to find a Hamiltonian that commutes with a set of commuting transfer matrices. Using the *R*-matrices introduced by equation (52), the coefficients of the various terms in the Hamiltonian can be obtained from equation (48) and identifications (51). The result, up to the overall scaling factor  $-\sin(2\lambda)\cos(3\lambda)$ , is as follows:

$$\mu_{00} = \cos(3\lambda), \quad \mu_{0\frac{1}{2}} = \mu_{\frac{1}{2}0} = -\sin(2\lambda)\sin(3\lambda), \quad \mu_{\frac{1}{2}\frac{1}{2}} = \cos(5\lambda),$$

$$t = \cos(3\lambda), \qquad J = d_{1/2}\cos(\lambda), \qquad \Delta = d_{1/2}^{1/2}\sin(2\lambda),$$
(53)

<span id="page-18-1"></span>where  $\lambda$  can take the values  $\pm \pi (k+2\pm 1)/[4(k+2)]$ . As mentioned earlier, the system is integrable at the points corresponding to these values for  $\lambda$ .

As relations in (53) show, the only coefficient that is odd in  $\lambda$  is  $\Delta$ , which corresponds to the term in the Hamiltonian that creates and annihilates pairs of anyons. Numeric indicates that the sign of this term does not change the spectrum of the model. This means that, instead of investigating all four values for  $\lambda$ , we can concentrate ourselves on only two of them, namely,  $\lambda_1 := \pi \ (k+3)/[4 \ (k+2)]$  and  $\lambda_2 := \pi \ (k+1)/[4 \ (k+2)]$ , provided that we consider both the Hamiltonian as defined by the coefficients as given in (53), as well as minus that Hamiltonian, which of course also commutes with the transfer matrix.

Based on the original paper [37], for the dilute loop model under consideration there, the points corresponding to these values of  $\lambda$  are all critical points. There, using the equivalence to the O(n) model [38, 39], the authors have quoted the values of the central charge c corresponding to these critical points. Expressed in terms of the parameter k that is used in this paper, these central charges are given, for each value of  $\lambda$ , in the following tables:

$$\begin{array}{c|ccccccccccccccccccccccccccccccccccc$$

These central charges point in the direction of minimal-model CFTs. Even though the central charges are known in the setting of the dilute loop models studied in [37], it is still interesting to investigate the situation for the anyon model we introduced. This is because the central charge, on its own, does not in general fully determine the corresponding CFT. We mention that Zhou and Batchelor [40] studied these models using the Bethe Ansatz.

#### 5.1. Identifying the critical points

In this section, we study the dilute anyon Hamiltonian at the integrable points that were identified in the previous section. Let  $H_1$  and  $H_2$  denote the dilute anyon Hamiltonian corresponding to integrable points  $\lambda = \lambda_1$  and  $\lambda = \lambda_2$ , respectively. As mentioned earlier, to investigate all four integrable points determined in the previous section, it suffices to consider the spectra of all four Hamiltonians  $\pm H_1$  and  $\pm H_2$ . In each case, using exact diagonalization for small system sizes, we obtain the low-lying part of the spectrum numerically. Since the dimension of the Hilbert space increases rapidly with both system size and k, we limit ourselves to k = 1, 2, 3.

For a one-dimensional critical system that can be described in terms of a conformal field theory, the energy of the states, as a function of the system size l to order 1/l, takes the following form:

<span id="page-19-0"></span>
$$E = E_s l - \frac{\pi \, vc}{6l} + \frac{2\pi \, v}{l} (2h_i + n) + \cdots, \tag{54}$$

where the non-universal constants  $E_s$  and v are the energy per site and the velocity. The constant c denotes the central charge of the conformal field theory,  $h_i$ 's are the scaling dimensions of the fields of the CFT, and n is a non-negative integer. For the primary fields n = 0, while positive n's give the states corresponding to the descendants at level n. We refer to the [41, 42] for an introduction on CFT.

In the case of physical (Hermitian) Hamiltonians, the corresponding CFT is unitary. This means that the scaling dimension  $h_0=0$  of the identity field is the smallest scaling dimension. In addition, the possible values of the central charge and the possible scaling dimensions are highly constrained. Therefore, the strategy to identify which CFT (if any) describes the spectrum at a given integrable point is as follows.

For a given system size, we obtain the low-lying part of the spectrum. We then shift and rescale the obtained spectrum in order to eliminate the non-universal constants in energies given by equation (54). For the ground state of the system, one has  $h_i = n = 0$ . Hence, the ground-state energy is given by  $E_0 = E_s l - \frac{\pi vc}{6l}$ . We shift the levels by setting the ground-state energy to zero. The energy  $E_1$  of the lowest excited level corresponds to the field with the lowest non-zero scaling dimension, which we denote by  $h_{low}$ . We rescale the spectrum such that  $E_1 = 1$ . After this shift and rescaling, the energies are given by

$$E = \frac{2h_i + n}{2h_{\text{low}}},\tag{55}$$

which does not depend on  $E_s$  and v and, therefore, it can be compared with the predictions for various conformal field theories. Once the CFT has been identified, one can rescale the energy such that  $E_1 = 2h_{\text{low}}$  and the generic energies take the form  $E = 2h_i + n$ . This rescaling will be used in the plots of the various energy spectra in the next section. One should note that CFT does not predict at which momenta the primary fields occur, however, each time n increases by one, the momentum of a state changes by one, in units of  $2\pi/l$ , as well. In the next section, we specify at which momenta the various primary fields occur.

In the case of the dense anyon models, the minimal-model CFTs play an important role. From the central charges that we quoted in the previous section, we expect that this will also be the case for the dilute anyon models we consider. We therefore give the central charge and scaling dimensions of the (unitary) minimal-model CFTs.

The unitary minimal models  $\mathcal{M}_m$  are labeled by a parameter m that takes integers greater than or equal to three. The central charge of these minimal models are given by c = 1 - 6/[m(m+1)]. The primary fields of  $\mathcal{M}_m$ , denoted by  $\phi_{r,s}$ , are labeled by two integers

r and s with  $1 \le r \le m$  and  $1 \le s \le m-1$ . The labels (r,s) and (m+1-r,m-s) correspond to the same field, so  $\mathcal{M}_m$  has m(m-1)/2 primary fields. The scaling dimension  $h_{r,s}$  of  $\phi_{r,s}$  is given by

$$h_{r,s} = \frac{[mr - (m+1)s]^2 - 1}{4m(m+1)}. (56)$$

5.1.1. The integrable point  $\lambda_1$  We start by considering the low-lying part of the spectrum of the Hamiltonian  $H_1$ , for k = 1,2,3, and relatively small system sizes. We find that the spectra, for each value of k, can be described in terms of the simple minimal model  $\mathcal{M}_{k+2}$  and, consequently,  $\lambda_1$  is a critical point. More explicitly, for k = 1, the system is described by the Ising CFT, for k = 2, the system is described by the tri-critical Ising CFT, and so on. We mention that in [43], the CFT describing  $H_1$  for k = 2 was already identified as the tri-critical Ising CFT. Our findings are consistent with this result.

As an illustration, in the left panel of figure 7, we display the spectrum of  $H_1$  for k = 3 and l = 14 as a function of the momentum K.

The crosses denote the energy levels, while the horizontal lines, drawn for ease of comparison, denote the CFT predictions of  $\mathcal{M}_5$  for states with an energy E < 3.5. The black lines denote primary fields, while the red, the blue, and the green lines denote descendants at orders 1, 2, and 3, respectively. We observe that, even for this moderate system size, the numerically obtained spectrum matches the CFT prediction well. We observe that all the primary fields occur at momentum K = 0, which is also the case for k = 1 and k = 2. We expect this to be true for higher k's as well. We continue with the low-lying part of the spectra of  $-H_1$ , again for k = 1, 2, 3. This time, we could identify the corresponding CFT as a product of two minimal models. For k = 1, the CFT is just  $\mathcal{M}_3$ , namely, the Ising CFT. We find that, for k = 2, the CFT is the product of two Ising CFTs and, for k = 3, it is the product of the Ising and tri-critical Ising CFTs. Hence,  $-\lambda_1$  is also a critical point. In general, the CFT describing this critical point is  $\mathcal{M}_3 \times \mathcal{M}_{k+1}$ , where we identify  $\mathcal{M}_2$  with the completely trivial CFT, that is, the one containing just the vacuum state.

We display the spectrum of  $-H_1$ , for k=3 and l=14, in the right panel of figure 7. Despite the rather small system size, we observe a good match with the  $\mathcal{M}_3 \times \mathcal{M}_4$  CFT and the fact that some of the primary fields occur at momentum  $K=\pi$  that effectively reduces the system size.

To describe, in general, the momenta of the states corresponding to the primary fields, we label the fields of the  $\mathcal{M}_3 \times \mathcal{M}_{k+1}$  CFT by  $(1,(r,s)),(\sigma,(r,s))$ , and  $(\psi,(r,s))$ , where the first label corresponds to the fields of  $\mathcal{M}_3$  and the second label (r,s) corresponds to the fields of  $\mathcal{M}_{k+1}$ . So,  $1 \le r \le k+1$  and  $1 \le s \le k$ . We observed that the states corresponding to all the primary fields (1,(r,s)) and  $(\psi,(r,s))$  occur at K=0, while all the primary fields  $(\sigma,(r,s))$  occur at K=0.

5.1.2. The integrable point  $\lambda_2$ . For the second integrable point, we could determine whether or not a CFT describes the low-lying part of the spectrum for  $H_2$  and we could also identify the corresponding CFT for the cases for which such a CFT exists, but we did not succeed in identifying a CFT for  $-H_2$  in general.

By considering the low-lying part of the spectrum of  $H_2$  for k = 1, we found that the spectrum does not allow for a description by a CFT in this case. We comment on this below when we discuss the spectrum of  $-H_2$ . For k = 2, we again find that the spectrum of  $H_2$  is described by the simple minimal model  $\mathcal{M}_3$ , namely, the Ising CFT. In figure 8, we give the spectrum

<span id="page-21-0"></span>![](_page_21_Figure_2.jpeg)

**Figure 7.** (Left) The spectrum of  $H_1$ , k = 3 and l = 14, and the CFT predictions of the  $\mathcal{M}_5$  minimal model. (Right) The spectrum of  $-H_1$ , k = 3 and l = 14, and the CFT predictions of the (Ising  $\times \mathcal{M}_4$ ) conformal field theory.

for this model for a system with 16 sites. We observe that, roughly up to energies  $E \approx 7$ , this spectrum follows the CFT prediction, which is remarkably high for a system of this size. For k = 3, the spectrum is described well by the minimal model  $\mathcal{M}_4$ .

Based on these observations, the general picture that results is as follows. For  $k \ge 2$ , the low-lying part of the spectrum of  $H_2$  is well described by the minimal model  $\mathcal{M}_{k+1}$ . Hence,  $\lambda_2$  is a critical point, if  $k \ge 2$ , and it is not a critical point, if k = 1. As was the case for the low-lying part of the spectrum of the critical point of  $H_1$ , we observe that all the states that correspond to the primary fields have momentum K = 0.

Finally, we turn our attention to the case  $-H_2$ . In this case, as indicated above, we had problems identifying the correct CFT describing the critical behavior. We focus our attention on the case k=1. Even though the spectrum has features that are reminiscent of a spectrum described by a CFT, we could not find an obvious match. In principle, there are many causes that can make identifying the CFT hard. One possible reason is the presence of large finite-size effect. To gain insight in the situation, we studied the k=1 Hamiltonian for general parameters in more detail. In particular, in appendix B, we map this Hamiltonian onto a Hamiltonian for a spin-1/2 chain.

For periodic boundary conditions, the spin-1/2 Hamiltonian one obtains, splits into two sectors. In both sectors, the number of down spins is even and the only difference between the two sectors lies in the boundary conditions. One sector has periodic boundary conditions, while the other sector has anti-periodic boundary conditions. Using the parameters corresponding to the integrable point  $\lambda_2$ , that is, considering  $H_2$ , we find that the corresponding spin-Hamiltonian takes the form:

$$H_{k=1}^{+} = \sum_{i=1}^{l} (\sigma_i^x \sigma_{i+1}^x - \sigma_i^y \sigma_{i+1}^y + \sigma_i^z \sigma_{i+1}^z),$$
(57)

$$H_{k=1}^{-} = \sum_{i=1}^{l} [(-1)^{\delta_{il}} (\sigma_i^x \sigma_{i+1}^x - \sigma_i^y \sigma_{i+1}^y) + \sigma_i^z \sigma_{i+1}^z].$$
 (58)

See equations (B.5) and (B.6) in appendix B. Apart from the difference in the sectors and the minus sign of the  $\sigma_i^y \sigma_{i+1}^y$  term, this is just the ordinary spin-1/2 Heisenberg model. We note that swapping the sign of the  $\sigma_i^y \sigma_{i+1}^y$  term, merely results in a change of the sign of all the energies, hence, we find that  $H_2$  corresponds to  $-H_{\text{Heisenberg}}$ , where  $H_{\text{Heisenberg}} = \sum_i \sigma_i \cdot \sigma_{i+1}$ . We are interested in identifying the low-lying part of the spectrum of  $-H_2$  that, for k=1, corresponds to the low-lying part of the spectrum of  $H_{\text{Heisenberg}}$ .

<span id="page-22-0"></span>![](_page_22_Figure_2.jpeg)

**Figure 8.** The spectrum of the model Hamiltonian *H*2 for *k* = 2 and the CFT predictions of the Ising CFT. The full blue lines indicate the energies corresponding to the primary fields and the dashed red lines correspond to the descendants.

It is known that the finite-size spectra of the Heisenberg model exhibit large finite-size effects, see for instance [[44\]](#page-30-26). This is the reason that it is hard to determine the correct CFT by means of exact diagonalization of small systems. Luckily, one can perturb the Heisenberg model in such a way that one does not open a gap in the system and, in the meantime, effectively reduces the finite-size effect. This can be achieved by adding a Heisenberg term with a next-nearest-neighbor coupling:

$$H = \sum_{i} (\boldsymbol{\sigma}_{i} \cdot \boldsymbol{\sigma}_{i+1} + \lambda \, \boldsymbol{\sigma}_{i} \cdot \boldsymbol{\sigma}_{i+2}). \tag{59}$$

The reader is referred to [\[44](#page-30-26)] for details. Increasing *λ* from *λ* = 0 to *λ<sup>c</sup>* ≈ 0.241 167, gradually reduces the finite-size effects. For *λ* > *λc*, the system becomes gapped and enters the Majumdar–Ghosh phase [[31,](#page-30-13) [32\]](#page-30-14).

Based on this, we can reduce the finite-size effects by studying the dilute anyon model that includes both nearest-neighbor and next-nearest-neighbor terms. We did this for the *k* = 1 anyon model, which corresponds to the Heisenberg spin-1/2 chain by taking the parameters for the nearest-neighbor terms to be *µ* = 0 <sup>0</sup> , *µ* = = *µ* −1 1 2 , *t* = 1, ∆ = 0, and *J* = 1. For the notations used for these parameters, see the last two lines of the forth paragraph of appendix [B.](#page-26-0) The low-lying part of the spectrum of this model corresponds to the low-lying part of the spectrum of −*H*2. The parameters of the next-nearest-neighbor terms are obtained from the nearest-neighbor ones by multiplying them with *λc*.

In figure [9,](#page-23-0) we show the spectrum of this model for a system of size *l* = 20. The energy levels are denoted by the crosses. For comparison, we also include the states of the model without the next-nearest-neighbor terms, which are denoted by small dots. One observes that the effect of adding the next-nearest-neighbor terms does change the spectrum significantly.

From the spectrum including the next-nearest-neighbor terms, we can identify the CFT that describes the critical behavior of the −*H*2 model with *k* = 1. The CFT is a compactified boson with *c* = 1 and has eight primary fields whose scaling dimensions are *h p <sup>p</sup>* = /16 <sup>2</sup> , where *p* = 0, ±±± 1, 2, 3, 4. The momenta of the states corresponding to the primary fields are given by *pπ π* / ( 2 mod 2 ). In figure [9,](#page-23-0) for states with *E* ⩽ 2.5, we also indicate the CFT

<span id="page-23-0"></span>![](_page_23_Figure_2.jpeg)

**Figure 9.** The spectrum of the model Hamiltonian −*H*2 for *k* = 1 with next-nearestneighbor terms (crosses) as well as with only nearest-neighbor terms (dots). The CFT predictions for the *u*(1)8 CFT are indicated by the black lines (primary fields), the red lines (first descendants), and the blue lines (second descendants).

primary fields (black lines), first descendants (red lines), and second descendants (blue lines). We find that the numerically obtained energies match this CFT spectrum well.

To provide further evidence that we correctly identified the CFT, we give the prediction of the multiplicities of the states for this CFT and the closely related one, namely, the four-state Potts CFT. In the case of particular twisted boundary conditions, this CFT describes the critical behavior of the spin-1/2 Heisenberg model [\[45](#page-30-27)]. The four-state Potts CFT also has *c* = 1 and can be viewed as the 'orbifold' of the compactified boson CFT with eight primary fields. The multiplicities can be obtained from the characters of these CFTs [[46\]](#page-30-28). These multiplicities together with the numerically obtained multiplicities for −*H*2 with *k* = 1 are given in table [1.](#page-24-1) We find perfect agreement with the *u*(1)8 CFT, while the 4-state Potts CFT , even for the lowest-lying states, does not give the right multiplicities.

Given that it was hard to determine the CFT describing the critical behavior of the model Hamiltonian −*H*2 for *k* = 1, it is not surprising that it is hard to figure out the CFT for higher values of *k*. We leave this for future work.

We close the discussion on the integrable point *λ*2 by commenting on the observation that the spectrum of the model Hamiltonian *H*2 for *k* = 1 is not described by a CFT. By using the mapping to the spin model, we found that this spectrum is described by the ferro-magnetic spin-1/2 Heisenberg model. It is known that this model is gapless, but the excitations, socalled spin waves, have a quadratic dispersion instead of the linear dispersion that is predicted by CFT.

To conclude this section, we mention that we were able to identify the CFT that describes the spectra of the Hamiltonians *H*1 and −*H*1 for *k* ⩾ 1, and the Hamiltonian *H*2 for *k* ⩾ 2. Not surprisingly, in each case, the central charge of the CFT matches the central charges obtained in [\[37](#page-30-19)] for the dilute loop models. For the Hamiltonian −*H*2, the analysis is hampered by large finite-size effects. Nevertheless, we determined the CFT describing this model, for *k* = 1, as compactified boson CFT with central charge equal to one. Again, the central charge matches the value obtained for the dilute loop model. However, it was not clear that which CFT with central charge equal to one would be the right description. Other possibilities would have been the product of two Ising CFTs or the 4-state Potts CFT. In light of this, it is interesting to investigate this model for higher values of *k* in more detail.

<span id="page-24-1"></span>**Table 1.** The multiplicities predicted by the *u*(1)8 and 4-state Potts CFTs, as well as the numerically obtained multiplicities for −*H*2 for *k* = 1.

| E             | 0 | 1/8 | 1/2 | 1 | 9/8 | 3/2 | 2 | 17/8 | 5/2 |
|---------------|---|-----|-----|---|-----|-----|---|------|-----|
| u(1)8         | 1 | 2   | 2   | 2 | 6   | 4   | 9 | 18   | 14  |
| 4-state Potts | 1 | 3   | 1   | 0 | 9   | 2   | 5 | 27   | 7   |
| −H2 for k = 1 | 1 | 2   | 2   | 2 | 6   | 4   | 9 | 18   | 14  |

## <span id="page-24-0"></span>**6. Conclusion**

In this paper we introduced a one-dimensional anyon model with the feature that the number of anyons, the spin-1/2 anyon of *su*(2)*k*, is allowed to fluctuate. This is achieved by adding a pairing term that creates and annihilates pairs of anyons on neighboring sites. This term is analogous to the pairing term that creates Cooper pairs in mean-field description of superconductors, such as the Kitaev chain model of a one-dimensions *p*-wave superconductor.

We studied the model at five special points. At the first point, the model is a sum of projectors. For *k* odd, there are exact zero-energy ground states which indicates that the model is gapped. For even *k*, there are no such exact zero-energy ground states and it would be interesting to study the model in more detail to determine if the model is also gapped at this point.

At the other four points, the system is integrable for all values of *k*. At these points, corresponding to four different choices of the parameters, the model is gapless and we were able to determine the CFT description in three out of the four cases. In the remaining case, large finite-size effects were the cause that exact diagonalization of small system sizes does not yield enough information to determine the CFT. For *k* = 1, however, the Hamiltonian maps to a particular version of the spin-1/2 Heisenberg for which one can reduce the finite-size effects by adding next-nearest-neighbor terms. It would be interesting to see if one can reduce the finite-size effects in a similar way for higher values of *k*.

As is already noted in [\[12](#page-29-10)], the anyon models are closely related to two-dimensional statistical-mechanics-models, namely the so-called 'restricted solid on solid models' (RSOS), which were introduced by Andrews, Baxter and Forrester [\[36](#page-30-18)]. Using this connection, it is possible to obtain information about the critical point of the anyon models. RSOS models have attracted much attention over the years and various generalizations have been considered, see for instance [[37,](#page-30-19) [47,](#page-30-29) [48](#page-30-30)]. Much more recently [[49\]](#page-30-31), a generalized RSOS model was constructed to solve an integrable point of the anyon models considered in [[15\]](#page-30-1). It would be interesting to see if the techniques introduced by Andrews, Baxter and Forrester can by employed to shed light on the critical point for which we could not identify the CFT for arbitrary *k*.

Finally, we mention that we did not embark on a more detailed numerical study of the model, but we hope that the behavior at the special points mentioned above can be a guide for such a study.

#### **Acknowledgments**

EA would like to thank M Soni and D Poilblanc for discussions. This work was sponsored, in part, by the Swedish research council.

## <span id="page-25-0"></span>Appendix A. The F-symbols

The form we use for F-symbols in this article deviates slightly from the 'standard form'. In this appendix, we explicitly give the F-symbols for the  $su(2)_k$  fusion rules that we use in this paper. In particular, it is convenient for our purposes that the F-symbols we use in the Hamiltonian are all positive.

We denote the standard form of the *F*-symbols by  $\widetilde{F}$ , which is derived in [29, 30], and we give it here for completeness:

$$\begin{split} \widetilde{F}_{d;\,ef}^{abc} &= (-1)^{a+b+c+d} \Delta(a,b,e) \Delta(c,d,e) \Delta(b,c,f) \Delta(a,d,f) \sqrt{\lfloor 2e+1 \rfloor_q} \sqrt{\lfloor 2f+1 \rfloor_q} \\ &\times \sum_{n=m}^{M} (-1)^n \bigg( \frac{\lfloor n+1 \rfloor_q!}{\lfloor a+b+c+d-n \rfloor_q! \, \lfloor a+c+e+f-n \rfloor_q! \, \lfloor b+d+e+f-n \rfloor_q!} \\ &\times \frac{1}{\lfloor n-a-b-e \rfloor_q! \, \lfloor n-c-d-e \rfloor_q! \, \lfloor n-b-c-f \rfloor_q! \, \lfloor n-a-d-f \rfloor_q!} \bigg). \end{split} \tag{A.1}$$

Here for any real number r, the so-called q-number  $[r]_q$ , is defined by

<span id="page-25-1"></span>
$$[r]_q = \frac{q^{r/2} - q^{-r/2}}{q^{1/2} - q^{-1/2}}, \quad q := \exp\left(\frac{2\pi i}{k+2}\right),$$
 (A.2)

and for a non-negative integer n, the q-factorial  $|n|_a!$  is defined by

$$[n]_q! = [n]_q [n-1]_q \cdots [1]_q, \quad [0]_q! := 1.$$
 (A.3)

Moreover, for labels a, b, and c from  $\{0, 1/2, ..., k/2\}$ , with  $a \le b + c$ ,  $b \le c + a$ ,  $a \le b + c$ , and  $a + b + c = 0 \pmod{1}$ ,

$$\Delta(a,b,c) := \sqrt{\frac{[a+b-c]_q! [a-b+c]_q! [-a+b+c]_q!}{[a+b+c+1]_q!}}.$$
 (A.4)

Finally, summation-limits m and M are defined by

$$m = \max\{a + b + e, c + d + e, b + c + f, a + d + f\},\tag{A.5}$$

$$M = \min\{a + b + c + d, a + c + e + f, b + d + e + f\}. \tag{A.6}$$

These values for summation-limits guarantees that the arguments of q-factorials appeared in equation (A.1) to be non-negative integers. The quantum dimensions  $d_j$  relate themselves to the notion of q-numbers through the relation  $d_j = \lfloor 2j+1 \rfloor_q$ . For the solutions given by equation (A.1), the  $\widetilde{F}$ -matrices are their own inverses.

The *F*-symbols that appear in the Hamiltonian of our model take the form  $\widetilde{F}_{x;x\pm\frac{1}{2},0}^{x\frac{1}{2}}$ . From equation (A.1), one finds:

$$\widetilde{F}_{x}^{\frac{x^{\frac{1}{2}}}{2}} = \frac{1}{\sqrt{d_{1/2}d_{x}}} \begin{bmatrix} -\sqrt{d_{x-1/2}} & \sqrt{d_{x+1/2}} \\ \sqrt{d_{x+1/2}} & \sqrt{d_{x-1/2}} \end{bmatrix}, \quad (0 < x < k/2),$$
(A.7)

where the rows correspond to e = x - 1/2, x + 1/2 and the columns to f = 0, 1, respectively.

In general, the *F*-symbols have the following gauge freedom. If a set of *F*-symbols  $\widetilde{F}_{d;ef}^{abc}$  is a solution to the Pentagon equations, then the set of *F*-symbols  $F_{d;ef}^{abc}$  defined by

$$F_{d;ef}^{abc} = \frac{u_f^{bc} u_d^{af}}{u_e^{ab} u_e^{dc}} \widetilde{F}_{d;ef}^{abc}, \tag{A.8}$$

where  $u_c^{ab}$  are arbitrary constants and are called *gauge factors*, is an *equivalent* solution—equivalent in the sense that although the new set of *F*-symbols change the explicit form of the Hamiltonian in general, but the new Hamiltonian has the same spectrum as the previous one.

In this paper, all gauge factors have been assigned either -1 or +1. We have assigned -1 to gauge factors of the forms  $u_a^{a0}$  and  $u_a^{a+\frac{1}{2},\frac{1}{2}}$ , if a is a half-integer, and also to gauge factors of the form  $u_a^{a1}$ , if a is an integer. In all other cases, the gauge factors have taken to be +1. One can check that in this gauge, all the F-symbols that appear in the Hamiltonian are positive. More explicitly, we have:

$$F_x^{\frac{1}{2}\frac{1}{2}} = \frac{1}{\sqrt{d_{1/2}d_x}} \begin{bmatrix} \sqrt{d_{x-1/2}} & \sqrt{d_{x+1/2}} \\ \sqrt{d_{x+1/2}} & -\sqrt{d_{x-1/2}} \end{bmatrix}.$$
(A.9)

Again the rows correspond to e = x - 1/2, x + 1/2 and the columns to f = 0, 1, respectively.

#### <span id="page-26-0"></span>Appendix B. Alternative formulation of the k = 1 chain

In this appendix, we write the anyon chain model for k = 1 in terms of a spin-1/2 model. In this way, we hope to get insight in the critical behavior at the second critical point that we identified. The spin-1/2 model obtained in this way is a version of the XYZ model in a magnetic field, whose phase diagram has been investigated, see for instance [50, 51].

First, we consider the chain with open boundary conditions and start by comparing the Hilbert spaces of the anyon chain and a spin-1/2 chain, both with l sites. We know that the Hilbert space of a spin-1/2 chain with l sites has dimension  $2^l$ . For the anyon chain with l sites, each of the sites can be occupied with an anyon or be empty, namely,  $y_i = 0$ , 1/2 for i = 1, ..., l. In addition, we have to take the labels of the fusion chain,  $x_i$ 's, into account. For k = 1, the fusion rules are Abelian and, thus, all the labels  $x_i$ , with i = 1, 2, ..., l, are specified, once  $x_0$  is specified. Therefore, if we allow for all possibilities, the Hilbert space of the anyon chain has dimension  $2^{l+1}$ . We note, however, that the anyon chains with  $x_0 = 0$  and  $x_0 = 1/2$  are completely equivalent. Therefore, we simply consider the chain with  $x_0 = 0$  and rewrite this chain in terms of a spin-1/2 chain.

To map the anyon chain to a spin chain, we first need to find a correspondence between the anyon and spin degrees of freedom. For the open chain, it turns out that the simplest possible correspondence, in which an empty site  $y_i = 0$  corresponds to a spin-up  $|\uparrow_i\rangle$  and an occupied site  $y_i = 1/2$  corresponds to a spin-down  $|\downarrow_i\rangle$ , works.

With these conventions in place, we can start to write the Hamiltonian for the anyon chain in terms of the Hamiltonian for the spin chain. We deal with the terms that act diagonally first. For k=1, this includes the 'chemical-potential' terms as well as the 'interaction term'  $h_J$ . Note that, for k=1, the interaction term  $h_J$  acts diagonally. In fact, it acts in exactly the same way as the term  $h_{\mu_{11}\over 2}$  does, namely, it assigns energy only if two neighboring sites are occupied. Hence, we can easily take the  $h_J$  term into account by combining it with the term

 $h_{\mu_{\frac{1}{2}\frac{1}{2}}}$ . For simplicity, we consider the case  $\mu_1 := \mu_{0\frac{1}{2}} = \mu_{\frac{1}{2}0}$ , where the subscript 1 denotes that only one of the two sites is occupied. In this notation, we also have  $\mu_0 := \mu_{00}$  and  $\mu_2 := \mu_{\frac{1}{2}\frac{1}{2}}$ .

The diagonal term in the anyon chain acting on  $(y_i, y_{i+1})$  assigns an energy  $\mu_0$ , if  $(y_i, y_{i+1}) = (0, 0)$ , assigns an energy  $\mu_1$ , if  $(y_i, y_{i+1}) = (0, 1/2)$  or (1/2, 0), and assigns an energy  $\mu_2 + J$ , if  $(y_i, y_{i+1}) = (1/2, 1/2)$ . The most general spin-term acting on the neighboring sites i and i + 1 takes the form  $\alpha \sigma_i^z \sigma_{i+1}^z + \beta \sigma_i^z + \beta' \sigma_{i+1}^z + \gamma \mathbf{1}$ . Matching the coefficients gives  $\alpha = (\mu_0 - 2\mu_1 + \mu_2 + J)/4$ ,  $\beta = \beta' = (\mu_0 - \mu_2 - J)/4$ , and  $\gamma = (\mu_0 + 2\mu_1 + \mu_2 + J)/4$ . At the cost of introducing two terms that act on the first and last sites, we can separate the  $\sigma_i^z \sigma_{i+1}^z$  term, which acts on neighboring sites, from the other ones. This gives the diagonal part  $H_d$  of the Hamiltonian:

$$H_{d} = \sum_{i=1}^{l} \frac{\mu_{0} - \mu_{2} - J}{2} \sigma_{i}^{z} + \sum_{i=1}^{l-1} \frac{\mu_{0} - 2\mu_{1} + \mu_{2} + J}{4} \sigma_{i}^{z} \sigma_{i+1}^{z} - \frac{\mu_{0} - \mu_{2} - J}{4} (\sigma_{1}^{z} + \sigma_{L}^{z}) - \frac{l-1}{4} (\mu_{0} + 2\mu_{1} + \mu_{2} + J) \mathbf{1}.$$
 (B.1)

Finally, we need to consider the off-diagonal terms in the Hamiltonian, namely, the hopping and 'superconducting' terms. The hopping term, which hops an anyon from site i to i+1 or vice-versa, takes the form  $\sigma_i^-\sigma_{i+1}^+ + \sigma_i^+\sigma_{i+1}^-$ , in terms of the spin raising and lowering operators, or, equivalently, takes the form  $1/2(\sigma_i^x\sigma_{i+1}^x + \sigma_i^y\sigma_{i+1}^y)$ , in terms of spin operators. Similarly, the term that creates or annihilates a pair of anyons on two neighboring sites, takes the form  $\sigma_i^+\sigma_{i+1}^+ + \sigma_i^-\sigma_{i+1}^-$  or  $1/2(\sigma_i^x\sigma_{i+1}^x - \sigma_i^y\sigma_{i+1}^y)$ . Thus, the final form of the spin Hamiltonian that is equivalent to the open k=1 anyon chain has the following form:

$$H_{k=1,\text{spin}} = \sum_{i=1}^{l} \frac{\mu_0 - \mu_2 - J}{2} \sigma_i^z + \sum_{i=1}^{l-1} \left( \frac{\mu_0 - 2\mu_1 + \mu_2 + J}{4} \sigma_i^z \sigma_{i+1}^z + \frac{t + \Delta}{2} \sigma_i^x \sigma_{i+1}^x + \frac{t - \Delta}{2} \sigma_i^y \sigma_{i+1}^y \right) - \frac{\mu_0 - \mu_2 - J}{4} (\sigma_1^z + \sigma_L^z) + \frac{l - 1}{4} (\mu_0 + 2\mu_1 + \mu_2 + J) \mathbf{1}.$$
(B.2)

We now turn our attention to the anyon chain with periodic boundary conditions. The main difference with the open case is that the relation between the anyon and spin Hilbert spaces is a bit more complicated. The Hilbert space of the periodic spin system is identical to the Hilbert space of the open spin system and has dimension  $2^l$ . In the case of the anyon chain with periodic boundary conditions, there is a constraint on the number of anyons in the system. Namely, because of the fusion rules, the number of anyons in the system, that is, the number of  $y_i$  labels that take the value 1/2, has to be even. This gives us  $2^{l-1}$  possible assignments for the  $y_i$  labels. However, for each assignment to the  $y_i$  labels, there are now two distinct assignments for the  $x_i$  labels consistent with fusion rules. The  $x_i$  labels take the values 0 and 1/2 and the relation between the consistent assignments for the  $x_i$  labels sends 0 to 1/2 and vice-versa. Thus, the total dimension of the Hilbert space is again given by  $2^l$ , just as for the spin system.

To relate the degrees of freedom between the anyon and spin system, we run into a problem. In the open case, we identified an empty anyon site with a spin-up and a filled anyon site with a spin-down. In the periodic case, we can only have an even number of anyons, which corresponds to an even number of spin-downs in the spin system. For a spin chain of length *l*, there

are only  $2^{l-1}$  such states which means that we have twice as many anyon states compared to the number of spin states. To deal with this problem, we first take a closer look at the anyon system.

As we stated above, in the anyon chain with periodic boundary conditions, the number of anyons has to be even, giving  $2^{l-1}$  assignments for the  $y_i$  labels. We can divide the corresponding assignments for the  $x_i$  labels in two classes, namely, those with  $x_0 = 0$ , and those with  $x_0 = 1/2$ . One should note that the choice of  $x_0$ , as the label to make the distinction, is arbitrary and one could have well chosen any other label. We denote these two sets of states by  $|\psi_{j,x_0=0}\rangle$  and  $|\psi_{j,x_0=1/2}\rangle$ , where j labels the  $2^{l-1}$  states in each set. For any given j, the state  $|\psi_{j,x_0=1/2}\rangle$  can be obtained from  $|\psi_{j,x_0=0}\rangle$  by sending  $x_i$  to  $1/2 - x_i$ , that is, by the exchange  $0 \leftrightarrow 1/2$  for each  $x_i$ .

We note that the Hamiltonian can change the value of  $x_0$  by hopping an anyon 'over the boundary' or by creating or annihilating a pair of anyons on sites 1 and l. Thus, the Hamiltonian mixes the two sets of states  $|\psi_{j,x_0=0}\rangle$  and  $|\psi_{j,x_0=1/2}\rangle$ . It is possible, however, to go to a basis in which the Hamiltonian becomes block-diagonal, with two blocks of size  $2^{l-1}$  each. As we now discuss, the basis in which this happens is

$$|\psi_{j}^{+}\rangle := \frac{1}{\sqrt{2}}(|\psi_{j,x_{0}=0}\rangle + |\psi_{j,x_{0}=1/2}\rangle), \quad |\psi_{j}^{-}\rangle := \frac{1}{\sqrt{2}}(|\psi_{j,x_{0}=0}\rangle - |\psi_{j,x_{0}=1/2}\rangle).$$
 (B.3)

To see that in this basis the Hamiltonian splits up in two blocks, we note the following. Only the term in the Hamiltonian that hops an anyon 'over the boundary'—denoted here by  $h_{t,l}$ —and the terms that create or annihilate a pair of anyons 'over the boundary'—denoted here by  $h_{\Delta,l}$  and  $h'_{\Delta,l}$ , respectively—can change the label  $x_0$ . In addition, all the other terms act in the same way on  $|\psi_{j,x_0=0}\rangle$  and  $|\psi_{j,x_0=1/2}\rangle$ . The action of  $h_{t,l}$  on  $|\psi_{j,x_0=0}\rangle$  gives one state with  $x_0=1/2$ , say t  $|\psi_{j',x_0=1/2}\rangle$ . Then, we have that  $h_{t,l}|\psi_{j,x_0=1/2}\rangle=t$   $|\psi_{j',x_0=0}\rangle$ . Thus, we find that  $h_{t,l}|\psi_j^+\rangle=t$   $|\psi_j^+\rangle$  and  $h_{t,l}|\psi_j^-\rangle=-t$   $|\psi_j^+\rangle$ . Indeed, the term  $h_{t,l}$  does not mix the sectors  $|\psi_j^+\rangle$  and  $|\psi_j^-\rangle$ . Furthermore,  $h_{t,l}$  acts on  $|\psi_j^-\rangle$  with an additional minus sign. Exactly the same reasoning applies to  $h_{\Delta,l}$  and  $h'_{\Delta,l}$  terms.

We can use the decomposition of the anyon Hamiltonian into the two blocks mentioned above to find the corresponding spin Hamiltonian. In both blocks, the number of anyons is even and the only difference in the form of the Hamiltonian is the additional sign in the hopping, creation, and annihilation terms going across the boundary. This means that we can map the anyon Hamiltonian to a spin system in the following way. We consider a spin system with an even number of spin-downs, that is, a spin system with a Hilbert space of dimension  $2^{l-1}$ . The spectrum that corresponds to the spectrum of the anyon Hamiltonian acting on the space  $|\psi_j^+\rangle$  can be found in the same way as we did in the open case, resulting in the following Hamiltonian:

$$H_{k=1}^{+} = \sum_{i=1}^{l} \left[ (\mu_0 - \mu_1) \, \sigma_i^z + \mu_1 \, \mathbf{1} + \frac{t + \Delta}{2} \, \sigma_i^x \sigma_{i+1}^x + \frac{t - \Delta}{2} \, \sigma_i^y \sigma_{i+1}^y \right. \\ \left. + \frac{\mu_2 + J - 2\mu_1 + \mu_0}{4} \left( \sigma_i^z \sigma_{i+1}^z - \sigma_i^z - \sigma_{i+1}^z + \mathbf{1} \right) \right], \tag{B.4}$$

which by collecting the  $\sigma_i^z$  terms, becomes:

<span id="page-28-0"></span>
$$\begin{split} H_{k=1}^{+} &= \sum_{i=1}^{l} \biggl( \frac{\mu_{0} - \mu_{2} - J}{2} \, \sigma_{i}^{z} + \frac{t + \Delta}{2} \, \sigma_{i}^{x} \sigma_{i+1}^{x} + \frac{t - \Delta}{2} \, \sigma_{i}^{y} \sigma_{i+1}^{y} \\ &+ \frac{\mu_{2} + J - 2\mu_{1} + \mu_{0}}{4} \, \sigma_{i}^{z} \sigma_{i+1}^{z} + \frac{\mu_{0} + 2\mu_{1} + \mu_{2} + J}{4} \, \mathbf{1} \biggr). \end{split} \tag{B.5}$$

The anyon spectrum in the space  $|\psi_j^-\rangle$  corresponds to the spectrum of the following spin Hamiltonian:

<span id="page-29-13"></span>
$$\begin{split} H_{k=1}^{-} &= \sum_{i=1}^{l} \biggl( \frac{\mu_{0} - \mu_{2} - J}{2} \, \sigma_{i}^{z} + (-1)^{\delta_{il}} \, \frac{t + \Delta}{2} \, \sigma_{i}^{x} \sigma_{i+1}^{x} + (-1)^{\delta_{il}} \, \frac{t - \Delta}{2} \, \sigma_{i}^{y} \sigma_{i+1}^{y} \\ &+ \frac{\mu_{2} + J - 2\mu_{1} + \mu_{0}}{4} \, \sigma_{i}^{z} \sigma_{i+1}^{z} + \frac{\mu_{0} + 2\mu_{1} + \mu_{2} + J}{4} \, \mathbf{1} \biggr), \end{split} \tag{B.6}$$

which also acts on the space in which all states have an even number of spin-downs and whose only difference with the Hamiltonian  $H_{k=1}^+$  is the change in boundary conditions. We note that there is no additional sign for the term  $\sigma_i^z \sigma_i^z$ , because it acts diagonally.

In conclusion, we found that the k=1 anyon Hamiltonian can be written in terms of the XYZ spin-1/2 Hamiltonian with a magnetic field in the z direction. In the case of an open anyon chain, there are boundary terms, while in the periodic case, the spectrum corresponds to two versions of a spin model. Both versions have an even number of spin-downs but have different boundary conditions. For concreteness, we give the explicit form of the spin-1/2 Hamiltonian in the sector with periodic boundary conditions. For the two critical points we have:

$$H_{k=1,c1} = \sum_{i} \left( \frac{\sqrt{3} - 2}{4} \sigma_{i}^{x} \sigma_{i+1}^{x} + \frac{\sqrt{3} + 2}{4} \sigma_{i}^{y} \sigma_{i+1}^{y} - \sigma_{i}^{z} \right), \tag{B.7}$$

$$H_{k=1,c2} = \sum_{i} (\sigma_{i}^{x} \sigma_{i+1}^{x} - \sigma_{i}^{y} \sigma_{i+1}^{y} + \sigma_{i}^{z} \sigma_{i+1}^{z}),$$
(B.8)

and for the case that the Hamiltonian takes the form of a sum over projectors:

$$H_{k=1,\text{proj}} = \sum_{i} \sigma_i^x \sigma_{i+1}^x. \tag{B.9}$$

In the case of  $H_{k=1,c2}$  and  $H_{k=1,proj}$ , we discarded the unimportant shift, and rescaled the energy with a positive factor. We note that the term  $\sigma_i^z \sigma_{i+1}^z$  is not present in the Hamiltonians  $H_{k=1,c1}$  and  $H_{k=1,proj}$ . Therefore, they can be solved analytically by means of a Jordan–Wigner transformation. The Hamiltonian  $H_{k=1,c2}$  can be solved by using the Bethe ansatz.

#### References

- <span id="page-29-0"></span>[1] Leinaas J M and Myrheim J 1977 Nuovo Cimento B 37 1
- <span id="page-29-1"></span>[2] Tsui D C, Stormer H L and Gossard A C 1982 Phys. Rev. Lett. 48 1559
- <span id="page-29-2"></span>[3] Laughlin R B 1983 Phys. Rev. Lett. 50 1395
- <span id="page-29-3"></span>[4] Moore G and Read N 1991 Nucl. Phys. B 360 362
- <span id="page-29-4"></span>[5] Morf R H 1998 Phys. Rev. Lett. 80 1505
- <span id="page-29-5"></span>[6] Kitaev A Y 2001 Phys.-Usp. 44 131
- <span id="page-29-6"></span>[7] Oreg Y, Refael G and von Oppen F 2010 Phys. Rev. Lett. 105 177002
- <span id="page-29-7"></span>[8] Lutchyn R M, Sau J D and Das Sarma S 2010 Phys. Rev. Lett. 105 077001
- <span id="page-29-8"></span>[9] Mourik V, Zuo K, Frolov S M, Plissard S R, Bakkers E P A M and Kouwenhoven L P 2012 Science 336 1003
- [10] Deng MT, Yu CL, Huang GY, Larsson M, Caroff P and Xu HQ 2012 Nano Lett. 12 6414
- <span id="page-29-9"></span>[11] Das A, Ronen Y, Most Y, Oreg Y, Heiblum M and Shtrikman H 2012 Nat. Phys. 8 887
- <span id="page-29-10"></span>[12] Feiguin A, Trebst S, Ludwig A W W, Troyer M, Kitaev A, Wang Z and Freedman M H 2007 Phys. Rev. Lett. 98 160409
- <span id="page-29-11"></span>[13] Trebts S, Troyer M, Wang Z and Ludwig A W W 2008 Prog. Theor. Phys. Suppl. 176 384
- <span id="page-29-12"></span>[14] Lesanovsky I and Katsura H 2012 Phys. Rev. A 86 041601

- <span id="page-30-1"></span>[15] Trebst S, Ardonne E, Feiguin A, Huse D A, Ludwig A W W and Troyer M 2008 *Phys. Rev. Lett.* **[101](https://doi.org/10.1103/PhysRevLett.101.050401)** [050401](https://doi.org/10.1103/PhysRevLett.101.050401)
- <span id="page-30-2"></span>[16] Gils C, Trebst S, Kitaev A, Ludwig A W W, Troyer M and Wang Z 2009 *Nat. Phys.* **[5](https://doi.org/10.1038/nphys1396)** [834](https://doi.org/10.1038/nphys1396)
- <span id="page-30-3"></span>[17] Schulz M D, Dusuel S and Vidal J 2015 *Phys. Rev.* B **[91](https://doi.org/10.1103/PhysRevB.91.155110)** [155110](https://doi.org/10.1103/PhysRevB.91.155110)
- [18] Soni M, Troyer M and Poilblanc D 2016 *Phys. Rev.* B **[93](https://doi.org/10.1103/PhysRevB.93.035124)** [035124](https://doi.org/10.1103/PhysRevB.93.035124)
- <span id="page-30-4"></span>[19] Gils C, Ardonne E, Trebst S, Ludwig A W W, Troyer M and Wang Z 2009 *Phys. Rev. Lett.* **[103](https://doi.org/10.1103/PhysRevLett.103.070401)** [070401](https://doi.org/10.1103/PhysRevLett.103.070401)
- [20] Gils C 2009 *J. Stat. Mech.* [P07019](https://doi.org/10.1088/1742-5468/2009/07/P07019)
- [21] Dancer K A, Finch P E, Isaac P S and Links J 2009 *Nucl. Phys.* B **[812](https://doi.org/10.1016/j.nuclphysb.2008.12.002)** [456](https://doi.org/10.1016/j.nuclphysb.2008.12.002)
- <span id="page-30-5"></span>[22] Finch P E 2011 *J. Stat. Mech.* [P04012](https://doi.org/10.1088/1742-5468/2011/04/P04012)
- <span id="page-30-6"></span>[23] Poilblanc D, Troyer M, Ardonne E and Bonderson P 2012 *Phys. Rev. Lett.* **[108](https://doi.org/10.1103/PhysRevLett.108.207201)** [207201](https://doi.org/10.1103/PhysRevLett.108.207201)
- <span id="page-30-7"></span>[24] Read N and Rezayi E 1999 *Phys. Rev.* B **[59](https://doi.org/10.1103/PhysRevB.59.8084)** [8084](https://doi.org/10.1103/PhysRevB.59.8084)
- <span id="page-30-10"></span>[25] Mac Lane S 1978 *Categories for the Working Mathematician* 2nd edn (Berlin: Springer)
- <span id="page-30-8"></span>[26] Kitaev A Y 2006 *Ann. Phys.* **[321](https://doi.org/10.1016/j.aop.2005.10.005)** [2](https://doi.org/10.1016/j.aop.2005.10.005)
- [27] Bonderson P H 2007 *PhD Thesis* CalTech (<http://thesis.library.caltech.edu/2447/>)
- <span id="page-30-9"></span>[28] Wang Z 2010 *Topological Quantum Computation* (*Regional Conference Series in Mathematics*  vol 112) (Providence, RI: American Mathematical Society)
- <span id="page-30-11"></span>[29] Kirillov A N and Reshetikhin N Y 1988 Representations of the algebra *Uq*(*sl*(2)), *q*-orthogonal polynomials and invariants of links *Infinite Dimensional Lie Algebras and Groups, Proceedings of the Conference held at CIRM, Luminy, Marseille* ed V G Kac (Singapore: World Scientific) p 285
- <span id="page-30-12"></span>[30] Pasquier V 1988 *Commun. Math. Phys.* **[118](https://doi.org/10.1007/BF01466721)** [355](https://doi.org/10.1007/BF01466721)
- <span id="page-30-13"></span>[31] Majumdar C K and Ghosh D K 1969 *J. Math. Phys.* **[10](https://doi.org/10.1063/1.1664978)** [1388](https://doi.org/10.1063/1.1664978)
- <span id="page-30-14"></span>[32] Majumdar C K and Ghosh D K 1969 *J. Math. Phys.* **[10](https://doi.org/10.1063/1.1664979)** [1399](https://doi.org/10.1063/1.1664979)
- <span id="page-30-15"></span>[33] Affleck I, Kennedy T, Lieb E H and Tasaki H 1987 *Phys. Rev. Lett.* **[59](https://doi.org/10.1103/PhysRevLett.59.799)** [799](https://doi.org/10.1103/PhysRevLett.59.799)
- <span id="page-30-16"></span>[34] Affleck I, Kennedy T, Lieb E H and Tasaki H 1988 *Commun. Math. Phys.* **[115](https://doi.org/10.1007/BF01218021)** [477](https://doi.org/10.1007/BF01218021)
- <span id="page-30-18"></span><span id="page-30-17"></span>[35] Baxter R J 1982 *Exactly Solved Models in Statistical Mechanics* (London: Academic)
- [36] Andrews G E, Baxter R J and Forrester P J 1984 *J. Stat. Phys.* **[35](https://doi.org/10.1007/BF01014383)** [193](https://doi.org/10.1007/BF01014383)
- <span id="page-30-19"></span>[37] Warnaar S O, Nienhuis B and Seaton K A 1992 *Phys. Rev. Lett.* **[69](https://doi.org/10.1103/PhysRevLett.69.710)** [710](https://doi.org/10.1103/PhysRevLett.69.710)
- <span id="page-30-20"></span>[38] Bachelor M T, Nienhuis B and Warnaar S O 1989 *Phys. Rev. Lett.* **[62](https://doi.org/10.1103/PhysRevLett.62.2425)** [2425](https://doi.org/10.1103/PhysRevLett.62.2425)
- <span id="page-30-21"></span>[39] Warnaar S O, Bachelor M T and Nienhuis B 1992 *J. Phys. A: Math. Gen.* **[25](https://doi.org/10.1088/0305-4470/25/10/027)** [3007](https://doi.org/10.1088/0305-4470/25/10/027)
- <span id="page-30-22"></span>[40] Zhou Y K and Batchelor M T 1995 *Nucl. Phys.* B **[485](https://doi.org/10.1016/S0550-3213(96)00654-2)** [646](https://doi.org/10.1016/S0550-3213(96)00654-2)
- <span id="page-30-24"></span><span id="page-30-23"></span>[41] Belavin A A, Polyakov A M and Zamolodchikov A B 1984 *Nucl. Phys.* B **[241](https://doi.org/10.1016/0550-3213(84)90052-X)** [333](https://doi.org/10.1016/0550-3213(84)90052-X)
- [42] Di Francesco P, Mathieu P and Sénéchal D 1999 *Conformal Field Theory* (New York: Springer)
- <span id="page-30-26"></span><span id="page-30-25"></span>[43] Seaton K A 2002 *J. Phys. A: Math. Gen.* **[35](https://doi.org/10.1088/0305-4470/35/7/309)** [1597](https://doi.org/10.1088/0305-4470/35/7/309)
- [44] Eggert S 1996 *Phys. Rev.* B **[54](https://doi.org/10.1103/PhysRevB.54.R9612)** [R9612](https://doi.org/10.1103/PhysRevB.54.R9612)
- <span id="page-30-27"></span>[45] Alcaraz F C, Barber M N and Batchlor M T 1988 *Ann. Phys.* **[182](https://doi.org/10.1016/0003-4916(88)90015-2)** [280](https://doi.org/10.1016/0003-4916(88)90015-2)
- <span id="page-30-29"></span><span id="page-30-28"></span>[46] Dijkgraaf R, Verlinde E and Verlinde H 1988 *Commun. Math. Phys.* **[115](https://doi.org/10.1007/BF01224132)** [649](https://doi.org/10.1007/BF01224132)
- [47] Date E, Jimbo M, Miwa T and Okado M 1986 *Lett. Math. Phys.* **[12](https://doi.org/10.1007/BF00416511)** [209](https://doi.org/10.1007/BF00416511)
- <span id="page-30-30"></span>[48] Pasquier V 1987 *Nucl. Phys.* B **[285](https://doi.org/10.1016/0550-3213(87)90332-4)** [162](https://doi.org/10.1016/0550-3213(87)90332-4)
- <span id="page-30-32"></span><span id="page-30-31"></span><span id="page-30-0"></span>[49] Kakashvili P and Ardonne E 2012 *Phys. Rev.* B **[85](https://doi.org/10.1103/PhysRevB.85.115116)** [115116](https://doi.org/10.1103/PhysRevB.85.115116)
- [50] Peschel I and Emery V J 1981 *Z. Phys.* B **[43](https://doi.org/10.1007/BF01297524)** [241](https://doi.org/10.1007/BF01297524)
- <span id="page-30-33"></span>[51] Kurmann J, Thomas H and Müller G 1982 *Physica* A **[112](https://doi.org/10.1016/0378-4371(82)90217-5)** [235](https://doi.org/10.1016/0378-4371(82)90217-5)