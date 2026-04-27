# **On fusion categories**

By Pavel Etingof, Dmitri Nikshych, and Viktor Ostrik

## **Abstract**

Using a variety of methods developed in the literature (in particular, the theory of weak Hopf algebras), we prove a number of general results about fusion categories in characteristic zero. We show that the global dimension of a fusion category is always positive, and that the *S*-matrix of any (not necessarily hermitian) modular category is unitary. We also show that the category of module functors between two module categories over a fusion category is semisimple, and that fusion categories and tensor functors between them are undeformable (generalized Ocneanu rigidity). In particular the number of such categories (functors) realizing a given fusion datum is finite. Finally, we develop the theory of Frobenius-Perron dimensions in an arbitrary fusion category. At the end of the paper we generalize some of these results to positive characteristic.

# **1. Introduction**

Throughout this paper (except for §9), *k* denotes an algebraically closed field of characteristic zero. By a fusion category C over *k* we mean a *k*-linear semisimple rigid tensor (=monoidal) category with finitely many simple objects and finite dimensional spaces of morphisms, such that the endomorphism algebra of the neutral object is *k* (see [BaKi]). Fusion categories arise in several areas of mathematics and physics – conformal field theory, operator algebras, representation theory of quantum groups, and others.

This paper is devoted to the study of general properties of fusion categories. This has been an area of intensive research for a number of years, and many remarkable results have been obtained. However, many of these results were proved not in general but under various assumptions on the category. The goal of this paper is to remove such assumptions, and to give an account of the theory of fusion categories in full generality.

The structure of the paper is as follows.

In Section 2, we give our main results about squared norms, global dimensions, weak Hopf algebras, and Ocneanu rigidity. This section contains many results which are partially or fully due to other authors, and our own results are blended in at appropriate places.

Sections 3-7 are mostly devoted to review of the technical tools and to proofs of the results of Section 2. Namely, in Section 3, we prove one of the main theorems of this paper, saying that any fusion category has a nonzero global dimension (in fact, we show that for *k* = C, the dimension is positive). The proof relies in an essential way on the theorem that in any fusion category, the identity functor is isomorphic to ∗ ∗ ∗∗ : *V* -→ *V* ∗∗∗∗ (where *V* -→ *V* ∗ is the duality in C), as a tensor functor, which is proved using the theory of weak Hopf algebras (more specifically, the formula for the fourth power of the antipode from [N]). We also prove that the SL2(Z)-representation attached to any modular category over C is unitary.

In Section 4, we give a short review of the theory of weak Hopf algebras, which are both a tool and an object of study in this paper, and prove the isomorphism between the identity functor Id and ∗ ∗ ∗∗, which is crucial for the main theorem.

In Section 5, we prove a formula for the trace of squared antipode of a semisimple connected regular weak Hopf algebra. Then we proceed to prove a number of results (partially due to M¨uger) about semisimplicity of the category of module functors between module categories over a fusion category, in particular of the dual and the Drinfeld center. We also generalize these results to multi-fusion categories (the notion obtained from that of a fusion category by relaxing the condition that End(**1**) = *k*). In particular, we prove that a semisimple weak Hopf algebra over *k* is cosemisimple. Finally, we prove a categorical version of the class equation of Kac and Zhu.

In Section 6, we consider a pair of semisimple weak Hopf algebras *B* ⊂ *A* and study the subcomplex of *B*-invariants in the co-Hochschild complex of *A* (this complex is a weak analog of the complex considered in [Sch], [EG1] for Hopf algebras). We prove that this complex is acyclic in positive degrees.

In Section 7, we show that the complex considered in Section 6 coincides with the deformation complex of a monodial functor between two multifusion categories introduced independently by Yetter [Y1, Y2] and Davydov [Da]. Using this, we establish "Ocneanu rigidity" (absence of deformations) for arbitrary nondegenerate multi-fusion categories and tensor functors between them. The idea of the proof of this result is due to Ocneanu-Blanchard-Wassermann, and the fusion category case was worked out completely by Blanchard-Wassermann in [Wa], [BWa] under the assumption that the global dimension is nonzero.

In Section 8 we discuss the notion of Frobenius-Perron dimensions of objects in a fusion category, show that they are additive and multiplicative, and have similar properties to categorical dimensions in a pivotal category. We prove a categorical analogue of the Nichols-Zoeller freeness theorem (saying that a finite dimensional Hopf algebra is a free module over a Hopf subalgebra), in particular prove the freeness theorem for semisimple quasi-Hopf algebras. We also show that the global dimension of a fusion category is divisible by its Frobenius-Perron dimension (in the ring of algebraic integers), and the ratio is ≤ 1. In particular, if the Frobenius-Perron dimension of a fusion category is an integer, then it coincides with the global dimension. This result may be regarded as a categorical version of the well-known theorem of Larson and Radford, saying that the antipode of a semisimple Hopf algebra is involutive. Further, we show that the Frobenius-Perron dimension of a fusion category is divisible by the Frobenius-Perron dimension of its full subcategory, and use this result to show that any fusion category of Frobenius-Perron dimension *p* (a prime) is the category of representations of a cyclic group with a 3-cocycle. We also classify fusion categories of dimension *p*2. Finally, we show that the property of a fusion category to have integer Frobenius-Perron dimensions (which is equivalent to being the representation category of a quasi-Hopf algebra) is stable under basic operations with categories, in particular is "weak Morita invariant" (i.e. invariant under passing to the the opposite of the dual category). At the end of the section we define group-theoretical fusion categories, which is a subclass of fusion categories with integer Frobenius-Perron dimensions; they are constructed explicitly from finite groups.

Many of the results of this paper have analogs in positive characteristic. These generalizations are given in Section 9. In particular, we show that a fusion category of nonzero global dimension over a field of positive characteristic can be lifted to characteristic zero.

Throughout the paper, we are going to freely use the theory of rigid tensor categories. We refer the reader to the textbooks [K], [BaKi] for details. We also recommend the reader the expository paper [CE], where much of the content of this paper is discussed in detail.

Acknowledgments. The research of P.E. was partially supported by the NSF grant DM*S*-9988796, and was done in part for the Clay Mathematics Institute. The research of D.N. was supported by the NSF grant DM*S*-0200202. The research of V.O. was supported by the NSF grant DM*S*-0098830. We are grateful to A. Davydov, A. Kirillov Jr., M. M¨uger, and A. Wassermann for useful discussions, and to E. Blanchard for giving us the formulation of the result of [BWa] before publication.

# **2. Results on squared norms, global dimensions, weak Hopf algebras, and Ocneanu rigidity**

Let *k* be an algebraically closed field. By a multi-fusion category over *k* we mean a rigid semisimple *k*-linear tensor category C with finitely many simple objects and finite dimensional spaces of morphisms. If the unit object **1** of C

is simple, then the category C is said to be a *fusion* category. Otherwise (if **1** is not simple), it is easy to see that we have  $\mathbf{1} = \bigoplus_{i \in J} \mathbf{1}_i$ , where  $\mathbf{1}_i$  are pairwise nonisomorphic simple objects.

Let us list a few examples to keep in mind when thinking about fusion and multi-fusion categories.

Examples of fusion categories. 1. The category  $\operatorname{Vec}_G$  of finite dimensional vector spaces graded by a finite group G (or, equivalently, finite dimensional modules over the function algebra  $\operatorname{Fun}(G,k)$ .) Simple objects in this category are evaluation modules  $V_g$ ,  $g \in G$ , and the tensor product is given by  $V_g \otimes V_h = V_{gh}$ , with the associativity morphism being the identity.

More generally, pick a 3-cocycle  $\omega \in Z^3(G, k^{\times})$ . To this cocycle we can attach a twisted version  $\operatorname{Vec}_{G,\omega}$  of  $\operatorname{Vec}_{G}$ : the simple objects and the tensor product functor are the same, but the associativity isomorphism is given by  $\Phi_{V_g,V_h,V_k} = \omega(g,h,k)$ id. The pentagon axiom then follows from the cocycle condition

$$\omega(h, k, l)\omega(g, hk, l)\omega(g, h, k) = \omega(gh, k, l)\omega(g, h, kl).$$

Note that cohomologous cocycles define equivalent fusion categories.

- 2. The category of finite dimensional k-representations of a finite group G, whose order is relatively prime to the characteristic of k.
- 3. The category of integrable modules (from category  $\mathcal{O}$ ) over the affine algebra  $\widehat{sl}_2$  at level l (see [BaKi]). The tensor product in this category is the fusion product, defined at the level of objects by the Verlinde fusion rule

$$V_i \otimes V_j = \sum_{\substack{k=|i-j|\\k\equiv i+j \mod 2}}^{l-|i+j-l|} V_k.$$

Examples of multi-fusion categories. 1. The category of finite dimensional bimodules over a finite dimensional semisimple k-algebra, with bimodule tensor product. It has simple objects  $M_{ij}$  with "matrix" tensor product  $M_{ij} \otimes M_{jk} = M_{ik}$ ; thus the identity object is  $\mathbf{1} = \bigoplus_i M_{ii}$ .

- 2. The category of finite dimensional modules over the function algebra on a finite groupoid.
- 2.1. Squared norms and global dimensions. Let us introduce the notion of the global dimension of a fusion category. First of all, we have the following known result (see e.g., [O1]).

Proposition 2.1. In a fusion category, any simple object V is isomorphic to its double dual  $V^{**}$ .

To prove this, it suffices to note that for any simple object *V* , the right dual *V* ∗ is the unique simple object *X* for which *V* ⊗ *X* contains the neutral object, while the left dual ∗*V* is the unique simple object *X* for which *V* ⊗ *X* projects to the neutral object; so ∗*V* = *V* ∗ by semisimplicity of the category, and hence *V* = *V* ∗∗ for any simple *V* .

Next, recall ([BaKi, p. 39]) that if *V* ∈ C, and *g* : *V* → *V* ∗∗ is a morphism, then one can define its "quantum trace" Tr<sup>V</sup> (*g*) ∈ *k* by the formula

$$\operatorname{Tr}_V(g) = \operatorname{ev}_{V^*} \circ (g \otimes 1_{V^*}) \circ \operatorname{coev}_V,$$

where **1** is the unit object of C, coev<sup>V</sup> : **1** → *V* ⊗*V* <sup>∗</sup> and ev<sup>V</sup> : *V* <sup>∗</sup> ⊗*V* → **1** are the coevaluation and evaluation maps (see [BaKi]). It is easy to show (and well known, see e.g. [BaKi]) that for any simple object *V* and a nonzero morphism *a* : *V* → *V* ∗∗ one has Tr<sup>V</sup> (*a*) = 0. Indeed, otherwise there is a sequence of nonzero maps **1** → *V* ⊗ *V* ∗ → **1** with zero composition, which would imply that the multiplicity of **1** in *V* ⊗ *V* ∗ is at least 2 – a contradiction.

Now, following [Mu1], for every simple object *V* of a fusion category C, define the squared norm |*V* | <sup>2</sup> ∈ *k*<sup>×</sup> of *V* as follows. Fix an isomorphism *a* : *V* → *V* ∗∗ (which exists by Proposition 2.1), and let |*V* | <sup>2</sup> = Tr<sup>V</sup> (*a*)Tr<sup>V</sup> <sup>∗</sup> ((*a*−1)∗). It is clearly independent on the choice of *a* (since *a* is uniquely determined up to a scaling), and nonzero by the explanation in the previous paragraph. For example, for the neutral object **1** we have |**1**| <sup>2</sup> = 1.

Definition 2.2 ([Mu1]). The global dimension of a fusion category C is the sum of squared norms of its simple objects. It is denoted by dim(C).

One of our main results is

Theorem 2.3. If *k* = C then |*V* | <sup>2</sup> *>* 0 for all simple objects *V* ∈ C; therefore dim(C) ≥ 1, and is *>* 1 for any nontrivial C. In particular, for any fusion category C one has dim(C) = 0.

Remark 2.4. Note that the second statement immediately follows from the first one, since C is always defined over a finitely generated subfield *k* of *k*, which can be embedded into C.

The proof of Theorem 2.3, which relies on Theorem 2.6 below, is given in Section 3. Theorem 2.6 is proved in Section 4.

Remark 2.5. In the course of proof of Theorem 2.3 we show that for any simple object *V* , the number |*V* | <sup>2</sup> is an eigenvalue of an integer matrix. In particular, if *k* = C then |*V* | <sup>2</sup> is an algebraic integer. Thus, for *k* = C Theorem 2.3 actually implies that |*V* | <sup>2</sup> is a "totally positive" algebraic integer, i.e. all its conjugates are real and positive (since one can twist a fusion category by an automorphism of C and get a new fusion category). Similarly, dim(C) is "totally" ≥ 1, i.e. all its conjugates are ≥ 1.

One of the main tools in the proof of Theorem 2.3 is

Theorem 2.6. In any fusion category, the identity functor is isomorphic to the functor ∗ ∗ ∗∗ as a tensor functor.

For the category of representations of a Hopf algebra, this result follows from Radford's formula for *S*<sup>4</sup> [R1]. In general, it follows from the analog of Radford's formula for weak Hopf algebras, which was proved by the second author in [N] (see §4).

Definition 2.7. A pivotal structure on a fusion category C is an isomorphism of tensor functors *i* : Id → ∗∗. A fusion category equipped with a pivotal structure is said to be a pivotal fusion category.

We conjecture a stronger form of Theorem 2.6:

Conjecture 2.8.Any fusion category admits a pivotal structure.

For example, this is true for the representation category of a semisimple Hopf algebra over *k*, since in this case by the Larson-Radford theorem [LR2], the squared antipode is 1 and hence Id = ∗∗. Furthermore, in Section 8 we will show that the conjecture is true for the representation category of a semisimple quasi-Hopf algebra.

2.2. Results on pivotal, spherical, and modular categories. Now let C be a pivotal fusion category. In such a category, one can define the dimension of an object *V* by dim(*V* ) = Tr<sup>V</sup> (*i*), and we have the following result which justifies the notation |*V* | 2.

Proposition 2.9. In a pivotal fusion category one has |*V* | <sup>2</sup> = dim(*V* ) dim(*V* <sup>∗</sup>) for any simple object *V* . Moreover, if *k* = C then dim(*V* <sup>∗</sup>) = dim(*V* ), so |*V* | <sup>2</sup> = | dim(*V* )| 2.

Proposition 2.9 is proved in Section 3.

This result can be further specialized to spherical (in particular, ribbon) categories, (see [Mu1]). Namely, recall from [Mu1] that a pivotal fusion category is spherical if and only if dim(*V* ) = dim(*V* ∗) for all simple objects *V* . Thus we have the following corollary.

Corollary 2.10. In a spherical category, |*V* | <sup>2</sup> = dim(*V* )2. In particular, if *k* = C, then dim(*V* ) is (totally) real.

Corollary 2.10 readily follows from Proposition 2.9.

Remark 2.11. We note that in [Mu1], the number  $|V|^2$  is called the squared dimension of V, and denoted  $d^2(V)$ . We do not use this terminology for the following reason. In a pivotal category over  $\mathbb{C}$ , the dimensions of simple objects do not have to be real numbers (it suffices to consider the category of representations of a finite group G, where i is given by a nontrivial central element of G). Thus, in general  $\dim(V^*) \neq \dim(V)$ , and  $|V|^2 \neq \dim(V)^2$ . Therefore, the term "squared dimension", while being adequate in the framework of spherical categories of [Mu1], is no longer adequate in our more general setting.

Now assume that C is a modular category (i.e., a ribbon fusion category with a nondegenerate S-matrix; see [BaKi]). In this case one can define matrices S and T of algebraic numbers, which yield a projective representation of the modular group  $SL_2(\mathbb{Z})$  ([BaKi]). We note that the matrix S is defined only up to a sign, since in the process of defining S it is necessary to extract a square root of the global dimension of C. So to be more precise we should say that by a modular category we mean the underlying ribbon category together with a choice of this sign.

PROPOSITION 2.12. If  $k = \mathbb{C}$  then the projective representation of  $SL_2(\mathbb{Z})$  associated to  $\mathcal{C}$  is unitary in the standard hermitian metric (i.e. the matrices S and T are unitary).

Proposition 2.12 is proved in Section 3.

Remark 2.13. As before, the proposition actually means that this representation is totally unitary, i.e. the algebraic conjugates of this representation are unitary as well.

Remark 2.14. It is interesting whether Proposition 2.12 generalizes to mapping class groups of higher genus Riemann surfaces.

We note that the results of this subsection are known for hermitian categories [BaKi]. Our results imply that these results are valid without this assumption.

2.3. Module categories, the dual category, the Drinfeld center. Let  $\mathcal{M}$  be an indecomposable left module category over a rigid tensor category  $\mathcal{C}$  [O1] (all module categories we consider are assumed semisimple). This means,  $\mathcal{M}$  is a module category which cannot be split in a direct sum of two nonzero module subcategories. In this case one can define the dual category  $\mathcal{C}_{\mathcal{M}}^*$  to be the category of module functors from  $\mathcal{M}$  to itself:  $\mathcal{C}_{\mathcal{M}}^* = \operatorname{Fun}_{\mathcal{C}}(\mathcal{M}, \mathcal{M})$  [O1]. This is a rigid tensor category (the tensor product is the composition of functors, the right and left duals are the right and left adjoint functors).

For example, let us consider  $\mathcal{C}$  itself as a module category over  $\mathcal{C} \otimes \mathcal{C}^{op}$ , via  $(X,Y) \otimes Z = X \otimes Z \otimes Y$ . Then the dual category is the Drinfeld center  $Z(\mathcal{C})$  of  $\mathcal{C}$  (see [O1], [Mu2]; for the basic theory of the Drinfeld center see [K]).

The following result was proved by Müger [Mu1, Mu2] under the assumption  $\dim(\mathcal{C}) \neq 0$  (which, as we have seen, is superfluous in zero characteristic) and minor additional assumptions.

THEOREM 2.15. For any indecomposable module category  $\mathcal{M}$  over a fusion category  $\mathcal{C}$ , the category  $\mathcal{C}^*_{\mathcal{M}}$  is semisimple (so it is a fusion category), and  $\dim(\mathcal{C}^*_{\mathcal{M}}) = \dim(\mathcal{C})$ . In particular, for any fusion category  $\mathcal{C}$  the category  $Z(\mathcal{C})$  is a fusion category of global dimension  $\dim(\mathcal{C})^2$ .

In fact, we have the following more general results, which (as well as the results in the next subsection) are inspired by [Mu1, Mu2].

THEOREM 2.16. For any module categories  $\mathcal{M}_1, \mathcal{M}_2$  over a fusion category  $\mathcal{C}$ , the category of module functors  $\operatorname{Fun}_{\mathcal{C}}(\mathcal{M}_1, \mathcal{M}_2)$  is semisimple.

Theorems 2.15 and 2.16 are proved in Section 5.

2.4. Multi-fusion categories. We say that a multi-fusion category C is indecomposable if it is not a direct sum of two nonzero multi-fusion categories.

Let  $\mathcal{C}$  be a multi-fusion category. Then for any simple object  $X \in \mathcal{C}$  there exist unique  $i, j \in J$  such that  $\mathbf{1}_i \otimes X \neq 0$  and  $X \otimes \mathbf{1}_j \neq 0$ ; moreover, we have  $\mathbf{1}_i \otimes X = X \otimes \mathbf{1}_j = X$ . Thus, as an additive category,  $\mathcal{C} = \bigoplus_{m,n} \mathcal{C}_{mn}$ , where  $\mathcal{C}_{mn}$  is the full abelian subcategory of  $\mathcal{C}$  with simple objects having i = m, j = n. It is easy to check that  $\mathcal{C}_{ii}$  are fusion categories for all i, and  $\mathcal{C}_{ij}$  are  $(\mathcal{C}_{ii}, \mathcal{C}_{jj})$ -bimodule categories, equipped with product functors  $\mathcal{C}_{ij} \times \mathcal{C}_{jl} \to \mathcal{C}_{il}$  satisfying some compatibility conditions. We will refer to  $\mathcal{C}_{ii}$  as the component categories of  $\mathcal{C}$ .

Since  $C_{ii}$  are fusion categories, they have well-defined global dimensions. In fact, the off-diagonal subcategories  $C_{ij}$  can also be assigned global dimensions, even though they are not tensor categories. To do this, observe that for any simple object  $V \in C_{ij}$ , and any morphism  $g: V \to V^{**}$  one can define  $\mathrm{Tr}_V(g) \in \mathrm{End}(\mathbf{1}_i) = k$ . Therefore, we can define  $|V|^2$  by the usual formula  $|V|^2 = \mathrm{Tr}_V(g)\mathrm{Tr}_{V^*}((g^{-1})^*)$ , and set  $\dim(C_{ij}) := \sum_{V \in \mathrm{Irr}C_{ii}} |V|^2$ .

PROPOSITION 2.17. If C is an indecomposable multi-fusion category, then all the categories  $C_{ij}$  have the same global dimensions.

The setup of the previous section can be generalized to the multi-fusion case. Namely, we have the following generalization of Theorem 2.16 to the multi-fusion case:

THEOREM 2.18. If C is a multi-fusion category, and  $\mathcal{M}_1, \mathcal{M}_2$  are module categories over C, then the category  $\operatorname{Fun}_{C}(\mathcal{M}_1, \mathcal{M}_2)$  is semisimple. In particular, the category  $C_{\mathcal{M}}^*$  is semisimple for any module category  $\mathcal{M}$ .

Proposition 2.17 and Theorem 2.18 is proved in Section 5.

Remark 2.19. We note that it follows from the arguments of [O1], [Mu1] that if  $\mathcal{C}$  is a multifusion category and  $\mathcal{M}$  is a faithful module category of  $\mathcal{M}$ , then  $\mathcal{M}$  is a faithful module category over  $\mathcal{C}_{\mathcal{M}}^*$ , and  $(\mathcal{C}_{\mathcal{M}}^*)_{\mathcal{M}}^* = \mathcal{C}$ .

2.5. Results on weak Hopf algebras. A convenient way to visualize (multi-) fusion categories is using weak Hopf algebras (see §4 for the definitions). Namely, let  $\mathcal{C}$  be a multi-fusion category. Let R be a finite dimensional semi-simple k-algebra, and F a fiber functor (i.e. an exact, faithful tensor functor) from  $\mathcal{C}$  to R-bimod. Let  $A = \operatorname{End}_k(F)$  (i.e. the algebra of endomorphisms of the composition of F with the forgetful functor to vector spaces).

THEOREM 2.20 ([Sz]). The algebra A has a natural structure of a semi-simple weak Hopf algebra with base R, and C is equivalent, as a tensor category, to the category Rep(A) of finite dimensional representations of A.

Remark 2.21. In order to lift the naturally existing map  $A \to A \otimes_R A$  to a weak Hopf algebra coproduct  $A \to A \otimes_k A$ , one needs to use a separability idempotent in  $R \otimes R$ . We will always use the unique symmetric separability idempotent. In this case, the weak Hopf algebra A satisfies an additional regularity condition, saying that the squared antipode is the identity on the base of A.

One can show that for any multi-fusion category  $\mathcal{C}$ , a fiber functor F exists for a suitable R. Indeed, let  $\mathcal{M}$  be any semisimple faithful module category over  $\mathcal{C}$ , i.e. such that any nonzero object of  $\mathcal{C}$  acts by nonzero (for example,  $\mathcal{C}$  itself). Let R be a semisimple algebra whose blocks are labeled by simple objects of  $\mathcal{M}$ :  $R = \bigoplus_{M \in \operatorname{Irr}(\mathcal{M})} R_M$ , and  $R_M$  are simple. Now define a functor  $F: \mathcal{C} \to R$  – bimod as follows: for any object  $X \in \mathcal{C}$  set

$$F(X) = \bigoplus_{M,N \in \operatorname{Irr}(\mathcal{M})} \operatorname{Hom}_{\mathcal{M}}(M, X \otimes N) \otimes B_{NM},$$

where  $B_{NM}$  is the simple  $(R_N, R_M)$ -bimodule. This functor has an obvious tensor structure (coming from composition of morphisms), and it is clearly exact and faithful. So it is a fiber functor.

Therefore, we have

COROLLARY 2.22 ([H], [Sz]). Any multi-fusion category is equivalent to the category of finite dimensional representations of a (nonunique) regular semisimple weak Hopf algebra. This weak Hopf algebra is connected if and only if C is a fusion category.

Remark 2.23. In particular, we can choose R to be a commutative algebra (i.e., all blocks have size 1). Thus, any multi-fusion category is equivalent to the category of representations of a weak Hopf algebra with a commutative base. This result was proved by Hayashi in [H], where weak Hopf algebras with commutative bases appear under the name "face algebras".

The language of weak Hopf algebras is convenient to visualize various categorical constructions. One of them is that of a dual category. Indeed, let  $\mathcal{C}$  be the category of representations of a weak Hopf algebra A. Let R be the base of A. Then we have a natural fiber functor from  $\mathcal{C}$  to the category of R-bimodules – the forgetful functor. This functor defines a natural structure of a module category over  $\mathcal{C}$  on the category  $\mathcal{M} = R$  – bimod. In this case, the dual category  $\mathcal{C}^*_{\mathcal{M}}$  is simply the representation category of the dual weak Hopf algebra  $A^{*\text{cop}}$  with the opposite coproduct (see [O1]). Furthermore, as we just showed, this example is general, in the sense that any faithful module category over a multi-fusion category can be obtained in this way.

The global dimension of the category of representations of a connected weak Hopf algebra is closely related to the trace of squared antipode in this weak Hopf algebra. This connection is expressed by the following theorem.

Let a fusion category C be the representation category of a regular semisimple weak Hopf algebra A. Let S be the antipode of A. Let  $q_i$  be the primitive idempotents of the center of the base  $A_t$ , and  $n_i$  the block sizes of the matrix algebras  $q_iA_t$ .

Theorem 2.24. One has  $\operatorname{Tr}(S^2|_{q_jAS(q_i)}) = \dim(\mathcal{C})n_i^2n_j^2$ . In particular, over  $\mathbb{C}$  one always has  $\operatorname{Tr}(S^2|_{q_iAS(q_i)}) > 0$ .

Remark 2.25. Theorem 2.24 implies that  $Tr(S^2|_A) = \dim(\text{Rep}(A))\dim(A_t)^2$ .

We also have the following result, which generalizes the Larson-Radford theorem for Hopf algebras [LR1].

Theorem 2.26. A semisimple weak Hopf algebra over k is also cosemisimple.

Theorem 2.24 is proved in Section 5. Theorem 2.26 follows from Theorem 2.18, since the representation category of the dual weak Hopf algebra is the dual category.

2.6. Vanishing of the Yetter cohomology. The cohomology theory that controls deformations of tensor categories and tensor functors is the cohomology theory developed in [CY], [Y1, Y2], [Da], which we will call the Yetter cohomology theory. This theory associates to any tensor category  $\mathcal{C}$  and a tensor functor F for  $\mathcal{C}$  to another tensor category  $\mathcal{C}'$ , a sequence of cohomology

spaces  $H_F^i(\mathcal{C})$  (see §7). If F is the identity functor, then these groups are simply denoted by  $H^i(\mathcal{C})$ . Namely, first order deformations of  $\mathcal{C}$  are elements of  $H^3(\mathcal{C})$ , while first order deformations of a tensor structure on a given functor F between fixed tensor categories  $\mathcal{C}, \mathcal{C}'$  are elements of  $H_F^2(\mathcal{C})$ . Obstructions to such deformations lie, respectively, in  $H^4(\mathcal{C})$  and  $H_F^3(\mathcal{C})$ .

For multi-fusion categories, the Yetter cohomology often vanishes. Namely, we have the following result.

THEOREM 2.27. Let C, C' be multi-fusion categories, and  $F: C \to C'$  be a (unital) tensor functor from C to C'. Then  $H_F^i(C) = 0$  for i > 0.

Theorem 2.27 is proved in Section 7, using weak Hopf algebras. The idea of this proof is due to Ocneanu, Blanchard, and Wassermann.

2.7. Ocneanu rigidity. The statement that a fusion category over a field of characteristic zero cannot be nontivially deformed is known as Ocneanu rigidity, because its formulation and proof for unitary categories was suggested (but not published) by Ocneanu. Later Blanchard and Wassermann ([BWa], [Wa]) proposed an algebraic version of Ocneanu's argument, which proves the following result.

Theorem 2.28. A fusion category does not admit nontrivial deformations. In particular, the number of such categories (up to equivalence) with a given Grothendieck ring (=fusion rules) is finite.

Remark 2.29. This theorem is proved in [BWa], [Wa] under the assumption that  $\dim(\mathcal{C}) \neq 0$ , but as we know from Theorem 2.3, this assumption is superfluous in zero characteristic.

In fact, one has the following somewhat more general theorem.

Theorem 2.30. Theorem 2.28 is valid for multi-fusion categories.

This theorem follows directly from Theorem 2.27 for i=3 and  $F=\mathrm{Id}$  (this is, essentially, the proof of Ocneanu-Blanchard-Wassermann). A sketch of proof is given in Section 7.

Note that Theorem 2.30 implies that any multi-fusion category is defined over an algebraic number field.

Question. Is any multi-fusion category defined over a cyclotomic field?

Note that the answer is yes for fusion categories coming from quantum groups at roots of unity, for the categories of [TY], and for group-theoretical categories discussed in Section 8. Also, it follows from the results of subsection

8.10 that the global dimension of a fusion category belongs to a cyclotomic field. We also have

Theorem 2.31. A (unital) tensor functor between multi-fusion categories does not have nontrivial deformations. In particular, the number of such functors (up to equivalence) for fixed source and target categories is finite.

Remark 2.32. In particular, Theorem 2.31 implies that a given fusion category has finitely many fiber functors. This is also shown in [IK] in the special case of categories coming from subfactors (see Theorem 2.4 in [IK]).

Remark 2.33. Theorem 2.31 also implies Ocneanu's result that a given fusion category has finitely many braidings. Indeed, any braiding in particular defines an equivalence of tensor categories between C and Cop.

The proof of Theorem 2.31 is analogous to the proof of Theorem 2.30. Namely, the first part of the result follows directly from Theorem 2.27 for *i* = 2. The second part is a consequence of a combinatorial fact that there are only finitely many homomorphisms between the Grothendieck rings of the categories under consideration; this fact is a consequence of Proposition 2.1 of [O1] since the second Grothendieck ring can be considered as a based module over the first one.

Remark 2.34. One says that an indecomposable multi-fusion category C is a quotient category of an indecomposable multi-fusion category C if there exists a tensor functor *F* : C→C such that any object of C is a subobject of *F*(*X*)*, X* ∈ C (see §5). It follows from the above that a given multi-fusion category C has only finitely many quotient categories.

Corollary 2.35. A module category M over a multi-fusion category C does not admit nontrivial deformations. In particular, the number of such module categories (up to equivalence) with a given number of simple objects is finite.

To prove Corollary 2.35, it suffices to choose a semisimple algebra *R* with number of blocks equal to the number of simple objects in M, and apply Theorem 2.31 to the functor *F* : C → *R* − bimod associated with M.

Remark 2.36. We note that this result was conjectured in [O1].

# **3. Fusion categories over** C

The goal of this subsection is to prove Theorem 2.3, Proposition 2.9, Proposition 2.12, and discuss their consequences.

Let  $\mathcal{C}$  denote a fusion category over  $\mathbb{C}$ . We will denote representatives of isomorphism classes of simple objects of  $\mathcal{C}$  by  $X_i$ ,  $i \in I$ , with  $0 \in I$  labeling the neutral object 1. Denote by  $*: I \to I$  the dualization map. (We note that at the level of labels, there is no distinction between right and left dualization, since by Proposition 2.1, V is isomorphic to  $V^{**}$  for any simple object V).

3.1. Proof of Theorem 2.3. By Theorem 2.6, there exists an isomorphism of tensor functors  $g: \mathrm{Id} \to ****$ . Let us fix such an isomorphism. So for each simple  $V \in \mathcal{C}$  we have a morphism  $g_V: V \to V^{****}$  such that  $g_{V \otimes W} = g_V \otimes g_W$ , and  $g_{V^*} = (g_V^{-1})^*$ . For all simple V, let us fix an isomorphism  $a_V: V \to V^{**}$  such that  $a_V^2 = g_V$  ( $a_V^2$  makes sense as  $\mathrm{Hom}(V, V^{**})$  is canonically isomorphic to  $\mathrm{Hom}(V^{**}, V^{****})$ , and so  $a_V$  can also be regarded as an element of  $\mathrm{Hom}(V^{**}, V^{****})$ ). Then  $a_{V^*} = \epsilon_V (a_V^{-1})^*$ , where  $\epsilon_V = \pm 1$ , and  $\epsilon_V \epsilon_{V^*} = 1$ . Define  $d(V) = \mathrm{Tr}_V(a_V)$ , in particular  $d_i = d(X_i)$ . These numbers are not at all canonical – they depend on the choices we made. Nevertheless, it is easy to see from the definition that  $|V|^2 = \epsilon_V d(V) d(V^*)$ .

Now let us take any simple objects  $V,W\in\mathcal{C}$  and consider the tensor product  $a_V\otimes a_W:V\otimes W\to (V\otimes W)^{**}$ . We have  $V\otimes W=\oplus_U\mathrm{Hom}(U,V\otimes W)\otimes U$ , so we have  $a_V\otimes a_W=\oplus b_U^{VW}\otimes a_U$ , where  $b_U^{VW}:\mathrm{Hom}(U,V\otimes W)\to\mathrm{Hom}(U^{**},V^{**}\otimes W^{**})$ . The source and target of this map are actually canonically isomorphic, so we can treat  $b_U^{VW}$  as an automorphism of  $\mathrm{Hom}(U,V\otimes W)$ . Also, since  $a_V^2=g_V$  and  $g_{V\otimes W}=g_V\otimes g_W$ , we get  $(b_U^{VW})^2=1$ .

Let  $b_j^{ik} := b_{X_j}^{X_i X_k}$ . Let  $T_j^{ik} = \operatorname{tr}(b_j^{ik})$ . Since  $(b_j^{ik})^2 = 1$ , its eigenvalues are  $\pm 1$ , hence  $T_j^{ik}$  are integers.

By the definition of  $b_i^{ik}$ , we have

$$d_i d_k = \sum_{j \in I} T_j^{ik} d_j.$$

Let  $T_i$  be the matrix such that  $(T_i)_{kj} = T_j^{ik}$ , and let **d** be the vector with components  $d_i$ . This vector is clearly nonzero (e.g.,  $d_0 \neq 0$ ), and we have

$$T_i \mathbf{d} = d_i \mathbf{d}$$
.

Thus, **d** is a common eigenvector of  $T_i$  with eigenvalue  $d_i$ .

Let  $\epsilon_i = \epsilon_{X_i}$ . Then we have: **d** is an eigenvector of the matrix  $A_i = \epsilon_i T_i T_{i^*}$  with eigenvalue  $|X_i|^2$ .

We claim that  $T_{i^*} = \epsilon_i T_i^t$ . This implies the theorem, as in this case  $A_i = T_i T_i^t$ , which is nonnegative definite (since the entries of  $T_i$  are integer, hence real), so its eigenvalues, including  $|X_i|^2$ , have to be nonnegative.

To prove that  $T_{i^*} = \epsilon_i T_i^t$ , we need to show that  $T_j^{i^*k} = \epsilon_i T_k^{ij}$ . But this, in turn, follows from the equality  $b_j^{i^*k} = \epsilon_i (b_k^{ij})^*$  (which makes sense since we have canonical isomorphisms  $\operatorname{Hom}(U, V \otimes W) \to \operatorname{Hom}(V^* \otimes U, W) \to \operatorname{Hom}(W, V^* \otimes U)^*$ , the latter by semisimplicity).

It remains to prove the last equality. Let  $f: X_j \to X_i \otimes X_k$  be a morphism. By the definition,  $b_j^{ik} f = (a_i \otimes a_k) f a_j^{-1}$ . On the other hand, f gives rise to an element  $f': X_{i^*} \otimes X_j \to X_k$ , given by  $f' = (\operatorname{ev}_i \otimes 1)(1 \otimes f)$ , and hence to a linear function on  $\operatorname{Hom}(X_k, X_{i^*} \otimes X_j)$  given by

$$f''(h) = (\operatorname{ev}_i \otimes 1)(1_{i^*} \otimes f)h \in \operatorname{End}(X_k) = \mathbb{C}$$

(for brevity we omit associativity maps and use the same notation for a morphism and its double dual). Now, we have

$$(b_j^{ik}f)''(h) = (\operatorname{ev}_i \otimes 1)(1_{i^*} \otimes (a_i \otimes a_k)fa_j^{-1})h$$

$$= \epsilon_i a_k (\operatorname{ev}_i \otimes 1)(a_{i^*}^{-1} \otimes fa_j^{-1})h$$

$$= \epsilon_i (\operatorname{ev}_i \otimes 1)(1 \otimes f)(a_{i^*}^{-1} \otimes a_j^{-1})ha_k$$

$$= \epsilon_i (\operatorname{ev}_i \otimes 1)(1 \otimes f)(a_{i^*} \otimes a_j)ha_k^{-1},$$

where the last equality due to the facts that  $g_{V \otimes W} = g_V \otimes g_W$ , and  $a_V = g_V a_V^{-1}$ . Thus,

$$(b_i^{ik}f)''(h) = f''(b_k^{i^*j}h),$$

as desired. Theorem 2.3 is proved.

Remark 3.1. Here is a modification of the above proof, which is simpler but requires an extension of the category C.

The first step is to prove the result in the case of pivotal categories. This is a substantially simplified version of the above proof, since in the pivotal case  $\epsilon_i$  and  $b_i^{ik}$  are 1, so  $T_i^{ik}$  are equal to  $N_i^{ik}$ , the multiplicity of  $X_j$  in  $X_i \otimes X_k$ .

The second step is reduction to the pivotal case. To do this, take the isomorphism  $g: \mathrm{Id} \to ****$  as tensor functors constructed in the proof of Theorem 2.6. Define the fusion category  $\tilde{\mathcal{C}}$ , whose simple objects are pairs (X, f), where X is a simple object of  $\mathcal{C}$ , and  $f: X \to X^{**}$  is an isomorphism, such that  $f^{**}f = g$ . It is easy to see that this fusion category has a canonical pivotal structure. Thus,  $|X|^2 > 0$  in  $\tilde{\mathcal{C}}$ . However, we have the forgetful functor  $F: \tilde{\mathcal{C}} \to \mathcal{C}$ , F(X, f) = X, which obviously preserves squared norms. Hence,  $|V|^2 > 0$  for simple objects V in  $\mathcal{C}$  (since for any V there exists  $f: V \to V^{**}$  such that  $f^{**}f = g$ ), which completes the proof.

3.2. Proof of Proposition 2.9. The first statement is straightforward. To prove the second statement, let  $N_i$  be the matrix whose entries are given by  $(N_i)_{kj} = \dim \operatorname{Hom}(X_j, X_i \otimes X_k)$ . Then, like in the proof of Theorem 2.3,  $N_i \mathbf{d} = d_i \mathbf{d}$ . Let us multiply this equation on the left by  $\mathbf{d}^*$  (the hermitian adjoint). We have  $\mathbf{d}^*N_i = (N_i^t \mathbf{d})^* = (N_{i^*} \mathbf{d})^* = \overline{d_{i^*}} \mathbf{d}^*$ . Thus the multiplication will yield

$$\overline{d_{i^*}}|\mathbf{d}|^2 = d_i|\mathbf{d}|^2.$$

Since  $|\mathbf{d}|^2 > 0$ , this yields the second statement. The proposition is proved.

3.3. Proof of Proposition 2.12 and properties of modular categories. It is well known (see [BaKi]) that the matrix T is diagonal with eigenvalues being roots of unity. So we only need to show that the S-matrix is unitary. The entries  $s_{ij}$  of the S-matrix are known to satisfy  $s_{ij} = s_{ji}$ , and  $\sum_j s_{i*j} s_{jl} = \delta_{il}$  ([BaKi]). So it suffices to show that  $s_{i*j} = \overline{s_{ij}}$ .

Recall that  $s_{j0} = \pm \dim(V_j)/\sqrt{D}$ , where D is the global dimension of the category. So  $s_{j0}$  is a real number. Further, by the Verlinde formula ([BaKi, 3.1]), if  $\mathbf{v}_m$  is the  $m^{\text{th}}$  column of S then

$$N_i \mathbf{v}_m = \frac{s_{im}}{s_{0m}} \mathbf{v}_m,$$

for all i. Let  $\mathbf{v}_m^*$  denote the row vector, Hermitian adjoint to  $\mathbf{v}_m$ . Then

$$\mathbf{v}_m^* N_i \mathbf{v}_m = \frac{s_{im}}{s_{0m}} |\mathbf{v}_m|^2.$$

One the other hand, since  $N_i^T = N_{i^*}$ , and  $N_i$  is real, we have

$$\mathbf{v}_m^* N_i \mathbf{v}_m = (N_i^T \mathbf{v}_m)^* \mathbf{v}_m = (N_{i^*} \mathbf{v}_m)^* \mathbf{v}_m = (\frac{s_{i^*m}}{s_{0m}} \mathbf{v}_m)^* \mathbf{v}_m = \frac{\overline{s_{i^*m}}}{s_{0m}} |\mathbf{v}_m|^2.$$

Since  $|\mathbf{v}_m|^2 \neq 0$ , the statement is proved.

Remark 3.2. An important property of modular categories is

PROPOSITION 3.3 ([EG4, Lemma 1.2]). The dimension of every simple object of a modular category divides  $\sqrt{D}$ , where D is the global dimension of the category.

This implies that in a ribbon category, dimensions of objects divide the global dimension (this is seen by taking the Drinfeld center and using Theorem 2.15 and the well-known fact that the Drinfeld center of a braided category contains the original category). This fact is useful in classification of modular categories (see §8).

In conclusion of this subsection let us give a simple application of Theorem 2.3 to modular categories.

Let  $c \in \mathbb{C}/8\mathbb{Z}$  be the Virasoro central charge of a modular category  $\mathcal{C}$ , defined by the relation  $(ST)^3 = e^{2\pi i c/8}S^2$  (see [BaKi]), and D be the global dimension of  $\mathcal{C}$ . Let  $f: (-\infty, 1] \to [1, \infty)$  be the inverse function to the monotonely decreasing function  $g(x) = (3-x)\sqrt{x}/2$ .

Proposition 3.4. One has

$$D \ge f(\operatorname{sign}(s_{00}) \cos(\pi c/4)).$$

Remark 3.5. The number  $s_{00}$  equals  $\pm 1/\sqrt{D}$ .

Proof. We need to show that

$$sign(s_{00}) cos(\pi c/4) \ge (3 - D)\sqrt{D}/2.$$

To prove this, recall [BaKi] that the number *e*πic/<sup>4</sup> can be expressed via a Gaussian sum:

$$\operatorname{sign}(s_{00})e^{\pi ic/4} = \sum |X_i|^2 \theta_i / \sqrt{D},$$

where *θ*<sup>i</sup> are the twists. This means that

$$sign(s_{00})e^{\pi ic/4} - D^{-1/2} = \sum_{i \neq 0} |X_i|^2 \theta_i / \sqrt{D}.$$

Taking squared absolute values of both sides, and using that |*θ*i| = 1, and |*X*i| <sup>2</sup> *>* 0 (by Theorem 2.3), we get

$$|\operatorname{sign}(s_{00})e^{\pi ic/4} - D^{-1/2}|^2 \le (\sum_{i \ne 0} |X_i|^2)^2 / D = \frac{(D-1)^2}{D}.$$

After simplifications, this yields the desired inequality.

Remark 3.6. Sometimes this inequality is sharp. For example, for *c* = <sup>±</sup>2*/*5*,* <sup>±</sup>22*/*5, it yields an estimate *<sup>D</sup>* <sup>≥</sup> (5−√5)*/*2, which becomes an equality for the well-known Yang-Lee category (*c* = −22*/*5, see [DMS]) and three its Galois images. The same is true for *c* = ±14*/*5*,* ±34*/*5, in which case the estimate is *<sup>D</sup>* <sup>≥</sup> (5 + <sup>√</sup>5)*/*2 (it is attained at four Galois images of the Yang-Lee category). Also, it goes without saying that the inequality is sharp for *c* = 0, where it becomes an equality for the trivial category.

These considerations inspire the following questions.

Questions. Does there exist a sequence of nontrivial fusion categories over C for which the global dimensions tend to 1? Does there exist such a sequence with a bounded number of simple objects? Is the set of global dimensions of fusion categories over C a discrete subset of R?

We expect that the answer to the first question is "no", i.e. the point 1 of the set of possible dimensions of fusion categories is an isolated point ("categorical property T").

## **4. Weak Hopf algebras and their integrals**

Below we collect the definition and basic properties of weak Hopf algebras.

4.1. Definition of a weak Hopf algebra.

Definition 4.1 ([BNSz]). A weak Hopf algebra is a vector space *A* with the structures of an associative algebra (*A, m,* 1) with a multiplication *m* : *A* ⊗<sup>k</sup> *A* → *A* and unit 1 ∈ *A* and a coassociative coalgebra (*A,* ∆*, -*) with a comultiplication ∆ : *A* → *A* ⊗<sup>k</sup> *A* and counit *-*: *A* → *k* such that:

(i) The comultiplication  $\Delta$  is a (not necessarily unit-preserving) homomorphism of algebras:

(1) 
$$\Delta(hg) = \Delta(h)\Delta(g), \quad h, g \in A.$$

(ii) The unit and counit satisfy the following identities:

$$(2) \qquad (\Delta \otimes \mathrm{id})\Delta(1) = (\Delta(1) \otimes 1)(1 \otimes \Delta(1)) = (1 \otimes \Delta(1))(\Delta(1) \otimes 1),$$

(3) 
$$\epsilon(fgh) = \epsilon(fg_{(1)}) \epsilon(g_{(2)}h) = \epsilon(fg_{(2)}) \epsilon(g_{(1)}h),$$
 for all  $f, g, h \in A$ .

(iii) There is a linear map  $S: A \to A$ , called an *antipode*, such that

(4) 
$$m(\mathrm{id} \otimes S)\Delta(h) = (\epsilon \otimes \mathrm{id})(\Delta(1)(h \otimes 1)),$$

(5) 
$$m(S \otimes id)\Delta(h) = (id \otimes \epsilon)((1 \otimes h)\Delta(1)),$$

(6) 
$$S(h) = S(h_{(1)})h_{(2)}S(h_{(3)}),$$

for all  $h \in A$ .

Remark 4.2. We use Sweedler's notation for a comultiplication:  $\Delta(c) = c_{(1)} \otimes c_{(2)}$ .

Axioms (2) and (3) above are analogous to the usual bialgebra axioms of  $\Delta$  being a unit preserving map and  $\epsilon$  being an algebra homomorphism. Axioms (4) and (5) generalize the properties of the antipode in a Hopf algebra with respect to the counit. Also, it is possible to show that given (1)–(5), axiom (6) is equivalent to S being both anti-algebra and anti-coalgebra map.

The antipode of a finite dimensional weak Hopf algebra is bijective [BNSz, 2.10].

Remark 4.3. A weak Hopf algebra is a Hopf algebra if and only if the comultiplication is unit-preserving and if and only if  $\epsilon$  is a homomorphism of algebras.

A morphism between weak Hopf algebras  $A_1$  and  $A_2$  is a map  $\phi: A_1 \to A_2$  which is both algebra and coalgebra homomorphism preserving 1 and  $\epsilon$  and which intertwines the antipodes of  $A_1$  and  $A_2$ , i.e.,  $\phi \circ S_1 = S_2 \circ \phi$ . The image of a morphism is clearly a weak Hopf algebra.

When  $\dim_k A < \infty$ , there is a natural weak Hopf algebra structure on the dual vector space  $A^* = \operatorname{Hom}_k(A, k)$  given by

(7) 
$$\phi\psi(h) = (\phi \otimes \psi)(\Delta(h)),$$

(8) 
$$\Delta(\phi)(h \otimes g) = \phi(hg)$$

(9) 
$$S(\phi)(h) = \phi(S(h)),$$

for all  $\phi, \psi \in A^*$ ,  $h, g \in A$ . The unit of  $A^*$  is  $\epsilon$  and the counit is  $\phi \mapsto \phi(1)$ .

The linear maps defined in (4) and (5) are called *target* and *source counital* maps and are denoted  $\varepsilon_t$  and  $\varepsilon_s$  respectively:

(10) 
$$\varepsilon_t(h) = \epsilon(1_{(1)}h)1_{(2)}, \qquad \varepsilon_s(h) = 1_{(1)}\epsilon(h1_{(2)}),$$

for all  $h \in A$ . The images of the counital maps

(11) 
$$A_t = \varepsilon_t(A), \qquad A_s = \varepsilon_s(A)$$

are separable subalgebras of A, called target and source bases or counital subalgebras of A. These subalgebras commute with each other; moreover

$$A_t = \{ (\phi \otimes id)\Delta(1) \mid \phi \in A^* \} = \{ h \in A \mid \Delta(h) = \Delta(1)(h \otimes 1) \},$$

$$A_s = \{ (id \otimes \phi)\Delta(1) \mid \phi \in A^* \} = \{ h \in A \mid \Delta(h) = (1 \otimes h)\Delta(1) \},$$

i.e.,  $A_t$  (respectively,  $A_s$ ) is generated by the right (respectively, left) tensor factors of  $\Delta(1)$  in the shortest possible presentation of  $\Delta(1)$  in  $A \otimes_k A$ .

The category Rep(A) of left A-modules is a rigid tensor category [NTV]. The tensor product of two A-modules V and W is  $V \otimes_{A_t} W$  with the A-module structure defined via  $\Delta$ . The unit object 1 of Rep(A) is the target counital algebra  $A_t$  with the action  $h \cdot z = \varepsilon_t(hz)$  for all  $h \in A$ ,  $z \in A_t$ .

For any algebra B we denote by Z(B) the center of B. Then the unit object of Rep(A) is irreducible if and only if  $Z(A) \cap A_t = k$ . In this case we will say that A is connected. We will say that A is connected if  $A^*$  is connected, and that A is biconnected if it is both connected and coconnected.

If  $p \neq 0$  is an idempotent in  $A_t \cap A_s \cap Z(A)$ , then A is the direct sum of weak Hopf algebras pA and (1-p)A. Consequently, we say that A is *indecomposable* if  $A_t \cap A_s \cap Z(A) = k1$ .

Every weak Hopf algebra A contains a canonical minimal weak Hopf subalgebra  $A_{\min}$  generated, as an algebra, by  $A_t$  and  $A_s$  [N, §3]. In other words,  $A_{\min}$  is the minimal weak Hopf subalgebra of A that contains 1. Obviously, A is an ordinary Hopf algebra if and only if  $A_{\min} = k1$ . Minimal weak Hopf algebras over k, i.e., those for which  $A = A_{\min}$ , were completely classified in [N, Prop. 3.4].

The restriction of  $S^2$  on  $A_{\min}$  is always an inner automorphism of  $A_{\min}$ ; see [N].

Remark 4.4. Unless indicated otherwise, in what follows we will use only weak Hopf algebras satisfying the following natural property:

$$(12) S^2|_{A_{\min}} = \mathrm{id}.$$

This property has an easy categorical interpretation. Let  $\mathbf{1} = A_t$  be the trivial A-module. Then (12) is satisfied if and only if the canonical isomorphism  $\mathbf{1} \to \mathbf{1}^{**}$  is the identity map.

Definition 4.5. We will call a weak Hopf algebra satisfying (12) regular.

Remark 4.6. It was shown in [NV, 6.1] that every weak Hopf algebra can be obtained as a twisting of some regular weak Hopf algebra with the same algebra structure.

4.2. Integrals. The following notion of an integral in a weak Hopf algebra is a generalization of that of an integral in a usual Hopf algebra [M].

Definition 4.7 ([BNSz]). A left integral in *A* is an element  ∈ *A* such that

(13) 
$$h\ell = \varepsilon_t(h)\ell, \quad (rh = r\varepsilon_s(h)) \quad \text{for all } h \in A.$$

The space of left integrals in *A* is a left ideal of *A* of dimension equal to dimk(*A*t).

Any left integral *λ* in *A*∗ satisfies the following invariance property:

(14) 
$$g_{(1)}\lambda(hg_{(2)}) = S(h_{(1)})\lambda(h_{(2)}g), \qquad g, h \in A.$$

In what follows we use the Sweedler arrows and  for the dual actions:

(15) 
$$h \rightharpoonup \phi(g) = \phi(gh) \quad \text{and} \quad \phi \leftharpoonup h(g) = \phi(hg).$$

for all *g, h* ∈ *A, φ* ∈ *A*∗.

Recall that a functional *φ* ∈ *A*∗ is nondegenerate if *φ*◦*m* is a nondegenerate bilinear form on *A*. Equivalently, *φ* is nondegenerate if the linear map *h* -→ (*hφ*) is injective. An integral (left or right) in a weak Hopf algebra *A* is called nondegenerate if it defines a nondegenerate functional on *A*∗. A left integral  is called normalized if *ε*t() = 1.

It was shown by P. Vecserny´es [V] that a finite dimensional weak Hopf algebra always possesses a nondegenerate left integral. In particular, a finite dimensional weak Hopf algebra is a Frobenius algebra (this extends the wellknown result of Larson and Sweedler for usual Hopf algebras).

Maschke's theorem for weak Hopf algebras, proved in [BNSz, 3.13], states that a weak Hopf algebra *A* is semisimple if and only if *A* is separable, and if and only if there exists a normalized left integral in *A*. In particular, every semisimple weak Hopf algebra is finite dimensional.

For a finite dimensional *A* there is a useful notion of duality between nondegenerate left integrals in *A* and *A*∗ [BNSz, 3.18]. If  is a nondegenerate left integral in *A* then there exists a unique *λ* ∈ *A*∗ such that *λ*  = 1. This *λ* is a nondegenerate left integral in *A*∗. Moreover,  *λ* = *-*. Such a pair of nondegenerate integrals ( *, λ*) is called a pair of dual integrals.

An invertible element *g* ∈ *A* is called group-like if ∆(*g*)=(*g* ⊗ *g*)∆(1) = ∆(1)(*g* ⊗ *g*) [N, Def. 4.1]. Group-like elements of *A* form a group *G*(*A*) under multiplication. This group has a normal subgroup *G*0(*A*) := *G*(*A*min) of trivial group-like elements. If *A* is finite dimensional, the quotient group *G*(*A*) = *G*(*A*)*/G*0(*A*) is finite. It was shown in [N] that if *A* is finite dimensional and  ∈ *A* and *λ* ∈ *A*∗ is a dual pair of left integrals, then there exist group-like elements *α* ∈ *G*(*A*∗) and *a* ∈ *G*(*A*), called distinguished group-like elements, whose classes in *G*(*A*∗) and *G*(*A*) do not depend on the choice of  and *λ*, such that

(16) 
$$S(\ell) = \alpha \rightharpoonup \ell$$
 and  $S(\lambda) = a \rightharpoonup \lambda$ .

(Note that *α* and *a* themselves depend on the choice of  and *λ*.)

The following result is crucial for this paper. It is an analogue of Radford's formula for usual Hopf algebras.

Theorem 4.8([N, Th. 5.13]). One has

(17) 
$$S^{4}(h) = a^{-1}(\alpha \rightarrow h \leftarrow \alpha^{-1})a$$

for all *h* ∈ *A*.

A weak Hopf algebra *A* is said to be unimodular if it contains a nondegenerate 2-sided integral; equivalently, *A* is unimodular if the coset of *α* in *G*(*A*∗) is trivial. A semisimple weak Hopf algebra is automatically unimodular [BNSz].

- 4.3. Proof of Theorem 2.6. Let C be a fusion category over *k*. By Theorem 2.22, C is the representation category of a semisimple connected weak Hopf algebra *A*. Since *A* is semisimple, it is unimodular, and hence one can choose a left integral  such that the corresponding element *α* = *-*. Thus, by Theorem 4.8, one has *S*4(*h*) = *a*−1*ha*, for some group-like element *a* ∈ *G*(*H*), and hence for any simple object *V* ∈ C = Rep(*A*), the operator *a*−1|<sup>V</sup> defines an isomorphism *V* → *V* ∗∗∗∗. Since *a* is group-like, this isomorphism respects the tensor product. The theorem is proved.
- 4.4. Canonical integrals. Using the squared antipode, one can construct integrals on a weak Hopf algebra *A* called the canonical integrals. Namely, we have the following proposition, a particular case of which was proved in [BNSz].

Proposition 4.9. Let *A* be a finite-dimensional weak Hopf algebra and let {*q*i} be primitive central idempotents in *A*t. Then *χ*i(*h*) := Tr(*L*h◦*S*2|AS(q*i*)), where *L*<sup>h</sup> ∈ Endk(*A*) is given by *L*h(*x*) = *hx, h, x* ∈ *A*, defines a left integral in *A*∗ such that

(18) 
$$\chi_i(q_j) = \text{Tr}(S^2|_{q_j A S(q_i)}) \qquad and$$

(19) 
$$\chi_i(gh) = \chi(hS^2(g)),$$

for all *g, h* ∈ *A*.

*Proof.* The identities (18) and (19) follow immediately from the definition of  $\chi$ , since A is regular and  $S^2 \circ L_q = L_{S^2(q)} \circ S^2$  for all  $g \in A$ .

Next, for all  $\phi \in A^*$  we define  $R_{\phi} \in \operatorname{End}_k(A)$  by  $R_{\phi}(x) = x - \phi$ ,  $x \in A^*$ . Then  $R_{\phi}(xS(q_i)) = R_{\phi}(x)S(q_i)$  so that  $AS(q_i)$  is  $R_{\phi}$ -invariant. A direct computation shows that  $L_{(h-\phi)} = R_{\phi_{(1)}} \circ L_h \circ R_{S^{-1}(\phi_{(2)})}$  for all  $h \in A, \phi \in A^*$ ; hence,

$$(\phi \otimes \chi_i)(\Delta(h)) = \operatorname{Tr}(L_{(h \leftarrow \phi)} \circ S^2|_{AS(q_i)})$$

$$= \operatorname{Tr}(R_{\phi_{(1)}} \circ L_h \circ R_{S^{-1}(\phi_{(2)})} \circ S^2|_{AS(q_i)})$$

$$= \operatorname{Tr}(R_{\varepsilon_t(\phi)} \circ L_h \circ S^2|_{AS(q_i)}),$$

therefore,  $(id \otimes \chi_i)\Delta(h) = (\varepsilon_t \otimes \chi_i)\Delta(h)$  for all  $h \in A$ , i.e.,  $\chi_i$  is a left integral in  $A^*$ .

4.5. Sufficient conditions for semisimplicity. The next proposition is a refinement of [N, Prop. 6.4] and is analogous to the Larson-Radford theorem [LR1] for usual Hopf algebras which says that if A is a finite dimensional Hopf algebra with  $\text{Tr}(S^2|_A) \neq 0$  then A is semisimple and cosemisimple.

PROPOSITION 4.10. Let A be a finite dimensional weak Hopf algebra. If for every primitive idempotent p in  $A_t \cap Z(A)$  there exist idempotents  $q_p$ ,  $q'_p$  in  $pA_t$  such that

(20) 
$$\operatorname{Tr}(S^{2}|_{q_{p}AS(q'_{p})}) \neq 0,$$

then A is semisimple.

*Proof.* Let  $\ell$  and  $\lambda$  be a dual pair of nondegenerate left integrals in A and  $A^*$  respectively. Then  $(\ell_{(2)} \rightharpoonup \lambda) \otimes q_p S^{-1}(\ell_{(1)}) S(q'_p)$  is the dual bases tensor for  $q_p A S(q'_p)$ , cf. [N]. Therefore,

$$0 \neq \operatorname{Tr}(S^{2}|_{q_{p}AS(q'_{p})})$$

$$= \langle \ell_{(2)} \rightharpoonup \lambda, q_{p}S(\ell_{(1)})S(q'_{p}) \rangle$$

$$= \langle \lambda, q_{p}\varepsilon_{s}(q'_{p}\ell) \rangle.$$

Therefore,  $y_p := \varepsilon_s(q_p'\ell) \neq 0$ . Next, we compute

$$\begin{aligned} y_{p}\ell &= S(\ell_{(1)})S(q'_{p})\ell_{(2)}\ell \\ &= S(\ell_{(1)})S(q'_{p})\varepsilon_{t}(\ell_{(2)})\ell \\ &= S(\ell_{(1)})\varepsilon_{t}(\ell_{(2)})S(q'_{p})\ell = S(\ell)y_{p}. \end{aligned}$$

Let  $\xi_p$  be an element in  $A_t^*$  (here and below we write  $A_t^* := (A^*)_t$ ,  $A_s^* := (A^*)_s$ ) such that  $\xi_p \rightharpoonup 1 = y_p$ . Then from the previous computation we have

$$(21) y_p \ell = (\alpha \rightharpoonup \ell) y_p,$$

where  $\alpha$  is a distinguished group-like element of  $A^*$ . Arguing as in [N, Prop. 6.4] one gets

(22) 
$$\xi_p = S(\xi_p)\alpha,$$

whence  $\alpha$  is trivial, i.e.,  $\alpha \in A_{\min}^*$ . This means that one can choose  $\ell$  in such a way that  $\alpha = \epsilon$ , i.e.,  $\ell = S(\ell)$ . Hence,  $y_p \in A_s \cap Z(A)$  is a nonzero multiple of S(p). We conclude that  $y := \varepsilon_s(\sum_p q_p'\ell) = \sum_p y_p$  is an invertible central element of A. Hence,  $\ell' = y^{-1}\ell$  is a normalized right integral in A. By Maschke's theorem, A is semisimple.

Let q and q' be idempotents in  $A_t$ , and let  $\rho = \epsilon - q$  and  $\rho' = \epsilon - q'$ . Then  $\rho$  and  $\rho'$  are idempotents in  $A_t^*$ .

LEMMA 4.11. The space  $\rho A^*S(\rho')$  may be identified, in an  $S^2$ -invariant way, with the dual space of qAS(q').

*Proof.* It is easy to check that for all  $h \in A$  and  $\phi \in A^*$  one has  $\langle \phi, qhS(q') \rangle = \langle \rho\phi S(\rho'), h \rangle$ , whence the statement follows.

The next three corollaries refine [N, Cors. 6.5–6.7].

COROLLARY 4.12. Let A be a finite dimensional weak Hopf algebra. If for every primitive idempotent  $\pi$  in  $A_t^* \cap A_s^*$  there exist idempotents  $\rho_{\pi}$ ,  $\rho'_{\pi}$  in  $\pi A_t^*$  such that

(23) 
$$\operatorname{Tr}(S^2|_{\rho_{\pi}A^*S(\rho'_{-})}) \neq 0,$$

then A is semisimple.

*Proof.* This immediately follows from Proposition 4.10 and Lemma 4.11, since the latter implies  $\operatorname{Tr}(S^2|_{\rho_{\pi}A^*S(\rho'_{\pi})}) = \operatorname{Tr}(S^2|_{q_nAS(q'_n)})$ .

COROLLARY 4.13. Let A be a connected finite dimensional weak Hopf algebra. If there exist idempotents q, q' in  $A_t$  such that  $\text{Tr}(S^2|_{qAS(q')}) \neq 0$  then A is semisimple.

COROLLARY 4.14. Let A be a biconnected finite dimensional weak Hopf algebra. If there exist idempotents q, q' in  $A_t$  such that  $\text{Tr}(S^2|_{qAS(q')}) \neq 0$  then A and  $A^*$  are semisimple.

# 5. $Tr(S^2)$ and the global dimension

5.1. Proof of Theorem 2.24. Let A be a connected semisimple weak Hopf algebra. Then  $\mathcal{C} = \text{Rep}(A)$  is a fusion category. In particular,  $V^{**}$  is isomorphic to V for any simple object V, which means that  $S^2$  is an inner

automorphism of A (this is also proved in [BNSz, 3.22]). So let  $g \in A$  be such that  $S^2(x) = gxg^{-1}$  for all  $x \in A$ . Then  $g|_V : V \to V^{**} : v \mapsto g \cdot v$  is an isomorphism of representations.

The calculation of  $\operatorname{Tr}_V(g)$  and  $\operatorname{Tr}_V((g^{-1})^*)$  yields

(24) 
$$\operatorname{Tr}_{V}(g)\operatorname{Id}_{A_{t}} = \operatorname{Tr}(S(g)1_{(1)}|_{V^{*}})1_{(2)},$$

(25) 
$$\operatorname{Tr}_{V^*}((g^{-1})^*)\operatorname{Id}_{A_t} = \operatorname{Tr}(g^{-1}1_{(1)}|_V)1_{(2)}.$$

Remark 5.1. We note an important distinction between the quantum trace in an object V of a morphism  $V \to V^{**}$ , which is denoted by  $\text{Tr}_V$ , and the usual trace of a linear operator in the vector space V, which is denoted just by Tr.

Let  $\{q_i\}$  be primitive idempotents in  $Z(A_t)$  and for every i let  $n_i^2 = \dim_k(q_iA_t)$  (i.e.,  $n_i$  is the dimension of the irreducible representation of  $A_t$  corresponding to  $q_i$ ). Multiplying equations (24) and (25) on the right by  $q_j$  and  $q_i$  respectively, applying  $\operatorname{Tr}_{A_t}$ , and using that for a regular weak Hopf algebra  $\operatorname{Tr}_{Z_t}(z) = \epsilon(z)$  for all  $z \in A_t$  [N], we get

$$\operatorname{Tr}_{V}(g)n_{j}^{2} = \operatorname{Tr}(g|_{q_{j}V}), \quad \operatorname{Tr}_{V^{*}}((g^{-1})^{*})n_{i}^{2} = \operatorname{Tr}(g^{-1}|_{S(q_{i})V}),$$

and hence,

(26) 
$$\operatorname{Tr}(g|_{q_iV})\operatorname{Tr}(g^{-1}|_{S(q_i)V}) = |V|^2 n_i^2 n_i^2.$$

Taking the sum over all isomorphism classes of simple V, we obtain:

(27) 
$$\operatorname{Tr}(S^2|_{q_j A S(q_i)}) = \dim(\operatorname{Rep}(A)) n_i^2 n_j^2.$$

This proves the first statement of the theorem. The second one follows from Theorem 2.3. Theorem 2.24 is proved.

5.2. Proof of Theorem 2.15. Let  $\mathcal{C}$  be a fusion category, and let  $\mathcal{M}$  be an indecomposable module category over  $\mathcal{C}$ . Let us show that  $\mathcal{C}_{\mathcal{M}}^*$  is semisimple.

Choose a semisimple algebra R with blocks labeled by simple objects of  $\mathcal{M}$ . Let F be the fiber functor  $F:\mathcal{C}\to R$  – bimod associated with  $\mathcal{M},R$  as explained in Section 2. Let  $A=\operatorname{End}_k(F)$  be the corresponding weak Hopf algebra. Consider the weak Hopf algebra  $A^{*\operatorname{cop}}$ . The representation category of  $A^{*\operatorname{cop}}$  is  $\mathcal{C}^*_{\mathcal{M}}$ . Thus,  $A^{*\operatorname{cop}}$  is connected (as  $\mathcal{M}$  is indecomposable). So, A is biconnected. Also, by Theorem 2.24, we have  $\operatorname{Tr}(S^2|_{q_jAS(q_i)})=\dim(\mathcal{C})n_i^2n_j^2\neq 0$ . Thus, by Corollary 4.14,  $A^{*\operatorname{cop}}$ , and hence  $\mathcal{C}^*_{\mathcal{M}}$  is semisimple. The equality  $\dim(\mathcal{C})=\dim(\mathcal{C}^*_{\mathcal{M}})$  follows from Theorem 2.24 and Lemma 4.11 (noting that the block sizes corresponding to the idempotents q and  $\epsilon \leftarrow q$  are the same). Theorem 2.15 is proved.

5.3. Proof of Theorem 2.16. Let  $\mathcal{M}$  be a possibly decomposable module category over  $\mathcal{C}$ . So  $\mathcal{M} = \bigoplus \mathcal{M}_j$  is a direct sum of indecomposable subcategories. Now for each i choose semisimple algebras  $R_i$  with blocks labeled

by simple objects of  $\mathcal{M}_i$ , and let  $R = \bigoplus R_i$ . Let F be the fiber functor  $\mathcal{C} \to R$ -bimod, associated to  $(\mathcal{M}, R)$ , and let  $B = \operatorname{End}_k(F)$  be the corresponding weak Hopf algebra. Then by Theorem 2.24 and Corollary 4.12 applied to  $A = B^*$ , we find that  $B^*$  is semisimple. In other words, the category  $\mathcal{C}^*_{\mathcal{M}}$  is semisimple. This implies Theorem 2.16, since the category  $\operatorname{Fun}_{\mathcal{C}}(\mathcal{M}_1, \mathcal{M}_2)$  is contained in  $\mathcal{C}^*_{\mathcal{M}_1 \oplus \mathcal{M}_2}$ . Theorem 2.16 is proved.

5.4. A refinement of Theorem 2.24. Let A be a connected, but not necessarily coconnected, semisimple weak Hopf algebra. Let  $\pi_i$  be the primitive idempotents in  $A_s^* \cap Z(A^*)$ , and let  $A_{ij} \subset A$  be defined by  $A_{ij}^* = \pi_i A^* S(\pi_j)$ . It is easy to see that  $A_{ij} = p_j A p_i$ , where  $p_i$  are the primitive idempotents of  $A_s \cap A_t$ . In particular,  $A_{ii}$  are semisimple algebras.

In fact, for every i the algebra  $A_{ii}$  has a natural structure of a biconnected weak Hopf algebra, and its representation category  $\operatorname{Rep}(A_{ii})$  is equivalent to  $\operatorname{Rep}(A)$  via the usual Morita equivalence  $V \to p_i V$ ,  $V \in \operatorname{Rep}(A)$ . Indeed, this map is a tensor functor since  $\Delta(p_i) = (p_i \otimes p_i)\Delta(1)$ . To prove that it is an equivalence it suffices to show that the central support  $\hat{p}_i$  of  $p_i$  equals 1. From the formula for  $\Delta(p_i)$  above we have  $\Delta(\hat{p}_i A) \subset \hat{p}_i A \otimes \hat{p}_i A$ . But  $\hat{p}_i A$  contains the matrix block  $q_0 A$  corresponding to the trivial representation of A (which is irreducible since A is connected). Hence,  $\Delta(q_0 A) \subset \hat{p}_i A \otimes \hat{p}_i A$  and so  $\hat{p}_i = 1$ .

Let  $q_{ir}$  be the primitive idempotents of  $Z(A_{rr})$ . Let  $n_{ir}^2 = \dim(q_{ir}(A_{rr})_t)$ . We have the following refinement of Theorem 2.24.

Theorem 5.2. One has 
$$\operatorname{Tr}(S^2|_{q_{jr}A_{rs}S(q_{is})}) = \dim(\operatorname{Rep}(A))n_{jr}^2n_{is}^2$$
.

*Proof.* The proof is completely analogous to the proof of Theorem 2.24. Namely, let g be an element of A such that  $gxg^{-1} = S^2(x)$ . Then  $p_rgp_r$  realizes  $S^2$  in  $A_{rr}$ . Hence, as was shown in the proof of Theorem 2.24 for any  $V \in \text{Rep}(A)$ , one has

$$\operatorname{Tr}(p_r g p_r|_{q_{ir}V}) = \operatorname{Tr}_V(g) n_{ir}^2,$$

and

$$\operatorname{Tr}(p_r g^{-1} p_r |_{S(q_{ir})V}) = \operatorname{Tr}_V((g^{-1})^*) n_{ir}^2.$$

Now,  $A_{rs} = \bigoplus_V p_s V \otimes (p_r V)^*$ , and  $S^2|_{A_{rs}} = p_s g p_s \otimes (p_r g^{-1} p_r)^*$ . Hence, taking the sum over all V, we arrive at the result.

5.5. Proof of Proposition 2.17. Let  $\mathcal{C}$  be an indecomposable multi-fusion category. Fix an index r and let  $\mathcal{M} = \bigoplus_i \mathcal{C}_{ir}$ . It is clear that  $\mathcal{M}$  is an indecomposable  $\mathcal{C}$ -module category, and the category  $\mathcal{C}^*_{\mathcal{M}} := \operatorname{Fun}_{\mathcal{C}}(\mathcal{M}, \mathcal{M})$  equals  $\mathcal{C}^{\operatorname{op}}_{rr}$ .

Choose a semisimple algebra R with blocks labeled by simple objects of  $\mathcal{M}$ . Let  $R_j$  be the two sided ideal in R whose blocks are labeled by simple objects of  $\bigoplus_i \mathcal{C}_{ij} \subset \mathcal{M}$ . Let  $n_i^2 = \dim(R_j)$ . Let F be the corresponding fiber

functor, and  $B = \operatorname{End}_k(F)$  the corresponding weak Hopf algebra, and let  $A = B^*$ . Then A is connected and semisimple. Therefore, by Theorem 5.2,  $\operatorname{Tr}(S^2|_{q_{ir}A_{rs}S(q_{is})}) = \dim(\operatorname{Rep}(A))n_{is}^2n_{jr}^2$ . Thus, using Lemma 4.11, we get

$$\dim(\mathcal{C}_{rs})n_{is}^2 n_{jr}^2 = \operatorname{Tr}(S^2|_{(\epsilon \leftarrow q_{jr})A_{rs}^*S(\epsilon \leftarrow q_{is})})$$

$$= \operatorname{Tr}(S^2|_{q_{jr}A_{rs}S(q_{is})})$$

$$= \dim(\operatorname{Rep}(A))n_{is}^2 n_{jr}^2,$$

so  $\dim(\mathcal{C}_{rs}) = \dim(\operatorname{Rep}(A))$ , as desired.

5.6. Proof of Theorem 2.18. Without loss of generality it can be assumed that the multi-fusion category  $\mathcal{C}$  is indecomposable. Let  $\mathcal{M}_1$ ,  $\mathcal{M}_2$  be module categories over  $\mathcal{C}$ . Let  $\mathbf{1}_i$  be the simple constituents of the unit object of  $\mathcal{C}$ . Then it is shown in the standard way that for each i, the restriction functor  $\operatorname{Fun}_{\mathcal{C}}(\mathcal{M}_1, \mathcal{M}_2) \to \operatorname{Fun}_{\mathcal{C}_i}(\mathbf{1}_i \mathcal{M}_1, \mathbf{1}_i \mathcal{M}_2)$  is an equivalence of categories (one can construct a quasi-inverse functor by extending a functor from  $\mathbf{1}_i \mathcal{M}_1$  to  $\mathbf{1}_j \mathcal{M}_1$  by tensoring with objects of  $\mathcal{C}_{ij}$  and checking various compatibilities). Therefore, the result follows from Theorem 2.16.

5.7. Surjective and injective functors. Let  $\mathcal{C}, \mathcal{D}$  be multi-fusion categories, and  $F: \mathcal{C} \to \mathcal{D}$  be a unital tensor functor.

We will say that F is injective if it is fully faithful (in this case F identifies  $\mathcal{C}$  with a full tensor subcategory of  $\mathcal{D}$ ). We will say that F is surjective if any simple object X of  $\mathcal{D}$  is contained in an object of the form F(T),  $T \in \mathcal{C}$ . If F is surjective and  $\mathcal{C},\mathcal{D}$  are indecomposable, then  $\mathcal{D}$  is said to be a quotient category of  $\mathcal{C}$ .

Now let  $\mathcal{M}$  be a faithful module category over  $\mathcal{D}$ . Then it is also a faithful module category over  $\mathcal{C}$ . Let R be a semisimple algebra with blocks labeled by simple objects of  $\mathcal{M}$ , and G the corresponding fiber functor  $\mathcal{D} \to R$ -bimod. Let  $A = \operatorname{End}_k(G)$ ,  $B = \operatorname{End}_k(G \circ F)$  be the corresponding weak Hopf algebras. Then the functor F induces a morphism of weak Hopf algebras  $\phi_F : A \to B$ , and vice versa. It is easy to check that F is surjective, respectively injective if and only if  $\phi_F$  is injective, respectively surjective.

Let us now consider the corresponding dual categories  $\mathcal{C}^*$ ,  $\mathcal{D}^*$  (we will drop the subscript  $\mathcal{M}$ , since the only module category we will consider in this subsection will be  $\mathcal{M}$ ). We have a natural dual functor  $F^*: \mathcal{D}^* \to \mathcal{C}^*$ , since any  $\mathcal{D}$ -linear functor  $\Phi: \mathcal{M} \to \mathcal{M}$  has a natural  $\mathcal{C}$ -linear structure, defined using F. It is clear that the morphism  $\phi_{F^*}: B^* \to A^*$  is given by  $\phi_{F^*} = \phi_F^*$ .

PROPOSITION 5.3. Let  $F: \mathcal{C} \to \mathcal{D}$  be a unital tensor functor between multi-fusion categories. If F is surjective (injective) then  $F^*$  is injective (surjective).

*Proof.* The claim is equivalent to the statement that surjectivity of  $\phi_F$  is equivalent to injectivity of  $\phi_F^*$ , and vice versa, which is obvious.

5.8. The induction functor and the class equation for fusion categories. In finite group theory, an important role is played by the "class equation"  $\sum_s \frac{1}{|G_s|} = 1$ , where the summation is over conjugacy classes of a finite group G, and  $G_s$  are the corresponding centralizers. There is a similar formula for semisimple Hopf algebras (due to G. I. Kac and Y. Zhu, see [Ka], [Zhu]), which is also very useful. Here we will prove a class equation for any fusion category, which generalizes the results of Kac and Zhu.

Let  $\mathcal{C}$  be a fusion category. Let  $I: \mathcal{C} \to Z(\mathcal{C})$  be the induction functor, defined by the condition  $\operatorname{Hom}_{Z(\mathcal{C})}(I(V), X) = \operatorname{Hom}_{\mathcal{C}}(V, X), V \in \mathcal{C}, X \in Z(\mathcal{C})$ .

Let [X:Y] denote the multiplicity of a simple object Y in an object X. For  $X \in Z(\mathcal{C})$ , let  $X|_{\mathcal{C}}$  denote the corresponding object of  $\mathcal{C}$ . Then  $I(V) = \bigoplus_{X \in \operatorname{Irr}(Z(\mathcal{C}))} [X|_{\mathcal{C}} : V] X$ .

Proposition 5.4. One has  $I(V)|_{\mathcal{C}} = \bigoplus_{Y \in Irr(\mathcal{C})} Y \otimes V \otimes Y^*$ .

Example 5.5. If G is a finite group and  $\mathcal{C} = \operatorname{Rep}(G)$ , then  $I(\mathbf{1})$  is the following representation of the quantum double  $D(G) = \mathbb{C}[G] \ltimes \mathcal{O}(G)$ : it is the regular representation of the function algebra  $\mathcal{O}(G)$ , on which G acts by conjugation. In this case proposition 5.4 for trivial V is the standard fact that for conjugation action,  $\mathcal{O}(G) = \bigoplus_{Y \in \operatorname{Irrep}(G)} Y \otimes Y^*$ .

Proof. Let  $\mathcal{C}=\operatorname{Rep}(A)$ , where A is a weak Hopf algebra. Then  $Z(\mathcal{C})=\operatorname{Rep}(D(A))$ , where D(A) is the quantum double of A (see [NTV]). As a space,  $D(A)=A^*\otimes_{A_{\min}}A$ . So we have  $I(V)|_{\mathcal{C}}=D(A)\otimes_AV=A^*\otimes_{A_{\min}}V$ , with the action of A defined by  $h(\phi\otimes v)=h_{(3)}\rightharpoonup\phi \leftharpoonup S(h_{(1)})\otimes h_{(2)}v$  for all  $h\in A, \phi\in A^*, v\in V$ . This yields exactly  $\bigoplus_{Y\in\operatorname{Irr}(\mathcal{C})}Y\otimes V\otimes Y^*$ , where the tensor product is taken in the representation category of A. The proposition is proved.

PROPOSITION 5.6. The number  $\sum_{X \in Irr(Z(\mathcal{C}))} [X|_{\mathcal{C}} : \mathbf{1}]^2$  is equal to the number of simple objects of  $\mathcal{C}$ .

*Proof.* This sum equals dim  $\operatorname{End}(I(\mathbf{1}))$ , which is the same as  $[I(\mathbf{1})|_{\mathcal{C}}:\mathbf{1}]$ . But by Proposition 5.4 we know that  $I(\mathbf{1})|_{\mathcal{C}}=\bigoplus_{Y\in\operatorname{Irr}(\mathcal{C})}Y\otimes Y^*$ , so the result follows.

PROPOSITION 5.7 (The class equation). Let C be a pivotal category. Then one has

$$\sum_{X \in \operatorname{Irr}(\mathcal{C}): [X|_{\mathcal{C}}: \mathbf{1}] \neq 0} [X|_{\mathcal{C}}: \mathbf{1}] \frac{1}{m_X} = 1,$$

where  $m_X = \frac{\dim \mathcal{C}}{\dim X}$  is an algebraic integer.

Proof. The proposition is immediately obtained by computing the dimension of *I*(**1**) in two ways. On the one hand, this dimension is equal to dim C by Proposition 5.4. On the other hand, it equals [*X*|<sup>C</sup> : **<sup>1</sup>**] dim *<sup>X</sup>*. The fact that *m*<sup>X</sup> is an algebraic integer follows from Proposition 3.3. The proposition is proved.

Example 5.8. Let C = Rep(*G*). In this case *Z*(C) = Rep*D*(*G*), so simple objects are parametrized by pairs (conjugacy class, irreducible representation of the centralizer). The simple objects *X* ∈ *Z*(C) for which *X*|<sup>C</sup> contains **1** are exactly those for which the representation of the centralizer is trivial. Thus, the equation of Proposition 5.7 is exactly the class equation for *G*.

5.9. Graded categories. Let *G* be a finite group.

Definition 5.9. A *G*-grading on a tensor category C is a decomposition C = *⊕*g∈GCg, such that ⊗ : C<sup>g</sup> × C<sup>h</sup> → Cgh, **1** ∈ Ce, and ∗ : C<sup>g</sup> → Cg−<sup>1</sup> . We will say that the grading is faithful if C<sup>g</sup> = 0 for any *g* ∈ *G*.

It is clear that if C is a *G*-graded category, then C<sup>e</sup> is a tensor category, and C<sup>g</sup> are left and right module categories over Ce.

Let C be a fusion category, *G* a finite abelian group.

Proposition 5.10. Suppose that *Z*(C) contains, as a full tensor subcategory, the category of modules *G*˜ over O(*G*), and that all simple objects of this subcategory map to the neutral object of C under the functor *Z*(C) → C. Then C admits a faithful *G*∨-grading (where *G*∨ is the dual group to *G*).

Proof. Let *g* ∈ *G*˜ be a simple object. Since *g* is trivial as an object of C, it defines a tensor automorphism of the identity functor of C. Thus we have a homomorphism *G* → Aut⊗(Id), and hence any simple object of C defines an element of the dual group *G*∨. This is obviously a faithful grading.

5.10. Deformations of weak Hopf algebras. It is well known that a nonsemisimple finite dimensional algebra can be perturbed into a semisimple one. However, for (connected) weak Hopf algebras the situation is different. Namely, we have the following result.

Proposition 5.11. Let *H*<sup>t</sup> be a continuous family of finite dimensional regular connected weak Hopf algebras over C depending of a real parameter *t* ∈ (*a, b*) (i.e., *H*<sup>t</sup> is independent of *t* as a vectors space, and the structure maps continuously depend on *t*). Then either *H*<sup>t</sup> is semisimple for all *t* or *H*<sup>t</sup> is nonsemisimple for all *t*.

Proof. The set *U* ⊂ (*a, b*) where *H*<sup>t</sup> is semisimple is open. Assume that this set is nonempty. The function *f*(*t*) = Tr(*S*2|H*<sup>t</sup>* ) is a continuous function of *t*. By Corollary 4.13, *f* is zero on the complement *U*<sup>c</sup> of *U*. Also, by Theorem 2.3 and Remark 2.25, *f* is a nonzero algebraic integer for any *t* ∈ *U*. Since *f* is continuous, this implies that *f* is constant (and nonzero) on each connected component of *U*. Thus, *U*<sup>c</sup> is empty. We are done.

5.11. Sphericity of pivotalization. In this section we allow the ground field to have a positive characteristic, different from 2.

Let *A* be a quasitriangular weak Hopf algebra, i.e., such that Rep(*A*) is a braided monoidal category. Let R ∈ (*A* ⊗ *A*)∆(1) be the *R*-matrix of *A*. It was shown in [NTV] that the Drinfeld element *u* = *S*(R(2))R(1) is invertible, satisfies *S*2(*h*) = *uhu*−<sup>1</sup> for all *h* in *A*, and

(28) 
$$\Delta(u^{-1}) = \mathcal{R}_{21}\mathcal{R}(u^{-1} \otimes u^{-1}).$$

Furthermore, the element *uS*(*u*)−<sup>1</sup> is group-like and implements *S*<sup>4</sup> via the adjoint action.

Observe that for any group-like element *η* ∈ *G*(*A*∗) the element *g*<sup>η</sup> = R(1) *η,* R(2) is group-like in *A* and the map *η* -→ *g*<sup>η</sup> is a group homomorphism from *G*(*A*∗) to *G*(*A*op).

Recall that distinguished elements of *A* and *A*∗ were defined in Section 4.2. In the next lemma we extend a result of Radford [R2] relating the distinguished elements and *uS*(*u*)−1.

Lemma 5.12. Let *a* ∈ *A* and *α* ∈ *A*∗ be a pair of distinguished group-like elements chosen as in Section 4.2. Then *g*α*a* = *S*(*u*)*u*−1.

Proof. Let  ∈ *A* be a nondegenerate integral from which *a* and *α* are constructed. It follows from [N, §5] that

$$\ell_{(2)} \otimes \ell_{(1)} = \ell_{(1)} \otimes S^2(\ell_{(2)})a^{-1}$$
  
 $\ell_{(1)}h \otimes \ell_{(2)} = \ell_{(1)} \otimes \ell_{(2)}S(h \leftarrow \alpha), \qquad h \in A.$ 

Using these identities and properties of integrals and *R*-matrices we compute

$$\ell_{(2)}S(\mathcal{R}^{(2)} \leftarrow \alpha)\mathcal{R}^{(1)} \otimes \ell_{(1)} = \ell_{(2)}\mathcal{R}^{(1)} \otimes \ell_{(1)}\mathcal{R}^{(2)}$$

$$= \mathcal{R}^{(1)}\ell_{(1)} \otimes \mathcal{R}^{(2)}\ell_{(2)}$$

$$= \mathcal{R}^{(1)}S(\mathcal{R}^{(2)})\ell_{(1)} \otimes \ell_{(2)}$$

$$= \mathcal{R}^{(1)}S(\mathcal{R}^{(2)})S^{2}(\ell_{(2)})a^{-1} \otimes \ell_{(1)},$$

whence *S*(R(2) *α*)R(1) = R(1)*S*(R(2))*a*−<sup>1</sup> = *S*(*u*)*a*−<sup>1</sup> by nondegeneracy of . On the other hand, from the axioms of *R*-matrix we have *S*(R(2) *α*)R(1) = *S*(R(2))R(1)*g*<sup>α</sup> = *ug*α, which completes the proof.

Recall [NTV, §7] that a central  $\nu \in A$  is a ribbon element if  $\nu = S(\nu)$  and  $\Delta(\nu) = \mathcal{R}_{21}\mathcal{R}(\nu \otimes \nu)$ . A quasitriangular weak Hopf algebra A has a ribbon element if and only if Rep(A) is a ribbon category.

COROLLARY 5.13. Suppose that A is a unimodular quasitriangular weak Hopf algebra and that  $\alpha$  is gauged to be  $\epsilon$ . If  $g \in A$  is a group-like element such that  $g^2 = a^{-1}$  and  $S^2(h) = ghg^{-1}$  for all  $h \in A$  then  $\nu = u^{-1}g$  is a ribbon element of A.

*Proof.* In this case we have  $g_{\alpha} = 1$ . Since both u and g implement  $S^2$ , the element  $\nu$  is central. It follows from equation (28) that  $\Delta(\nu) = \mathcal{R}_{21}\mathcal{R}(\nu \otimes \nu)$ . Finally,  $S(\nu) = S(u)^{-1}g^{-1} = u^{-1}g = \nu$  by Lemma 5.12.

Recall that in Remark 3.1, it was shown that to every fusion category  $\mathcal{C}$  one can associate a twice bigger fusion category  $\tilde{\mathcal{C}}$ , which has a canonical pivotal structure.

PROPOSITION 5.14. If dim  $C \neq 0$  then the canonical pivotal stucture of the category  $\tilde{C}$  is in fact a spherical structure.

*Proof.* Let us realize  $\tilde{\mathcal{C}}$  as the representation category of a regular weak Hopf algebra A. In this case, the pivotal structure of  $\tilde{\mathcal{C}}$  is defined by a group-like element  $g \in A$ , such that  $g^2 = a^{-1}$ , where a is the distinguished group-like element of A. Assume that the distinguished group-like element  $\alpha \in A^*$  is gauged to be  $\epsilon$ . Consider the Drinfeld center  $Z(\tilde{\mathcal{C}})$ , i.e., the representation category of the Drinfeld double D(A). One can check that a is also the distinguished group-like element for D(A). Since g is a group-like element such that  $gxg^{-1} = S^2(x)$  for  $x \in D(A)$ , and  $g^2 = a^{-1}$ , it follows from Corollary 5.13 that D(A) is ribbon; hence,  $Z(\tilde{\mathcal{C}})$  is ribbon.

Thus, we have  $\dim(V) = \dim(V^*)$  in  $Z(\tilde{\mathcal{C}})$  [K]. Hence, the same holds in  $\tilde{\mathcal{C}}$  (i.e.,  $\tilde{\mathcal{C}}$  is spherical). Indeed, let  $I: \tilde{\mathcal{C}} \to Z(\tilde{\mathcal{C}})$  be the induction functor defined in subsection 5.8. Then by Proposition 5.4, for any  $V \in \tilde{\mathcal{C}}$ ,  $I(V) = \bigoplus_{X \in \operatorname{Irr}(\tilde{\mathcal{C}})} X \otimes V \otimes X^*$  as an object of  $\tilde{\mathcal{C}}$ . Hence,  $\dim I(V) = \dim V \dim \tilde{\mathcal{C}}$ . On the other hand,  $I(V)^* = I(V^*)$ , which implies the statement.

COROLLARY 5.15. In any pivotal fusion category C over  $\mathbb{C}$ , the dimension of a simple object is a positive number times a root of unity.

*Proof.* Consider the category  $\tilde{\mathcal{C}}$ . It has two pivotal structures  $b_1, b_2: V \to V^{**}$ . Namely,  $b_1$  comes from  $\mathcal{C}$  and  $b_2$  is the canonical pivotal structure. By Proposition 5.14,  $b_2$  is spherical. On the other hand,  $b_2^{-1} \circ b_1$  is a tensor endomorphism of the identity functor, which obviously acts by roots of unity on simple objects. This implies the statement.

# 6. The co-Hochschild complex of a cosemisimple unimodular weak Hopf algebra and its subcomplex of invariants

6.1. The definition. Let A be a weak Hopf algebra and let  $B \subset A$  be a weak Hopf subalgebra. We will define a complex  $C^{\bullet}(A, B)$  that generalizes the subcomplex of the co-Hochschild complex of a Hopf algebra consisting of invariants of the adjoint action; cf. [S], [Sch].

We set  $C^0(A, B) = A_t \cap Z(A)$ , the algebra of endomorphisms of the trivial A-module; and for all  $n \geq 1$ , we set

(29) 
$$C^{n}(A,B) := \{ f \in A^{\otimes n} \mid f = \operatorname{Ad}(1)f \text{ and } \operatorname{Ad}(h)f = \operatorname{Ad}(\varepsilon_{t}(h))f, \forall h \in B \},$$

where Ad(h) denotes the adjoint action of h, i.e.,

$$Ad(h)f = \Delta^n(h_{(1)})f\Delta^n(S(h_{(2)}))$$

for all  $h \in B$  and  $f \in A^{\otimes n}$ . Here  $\Delta^n : A \to A^{\otimes n}$  is the iteration of the comultiplication (we set  $\Delta^1 = \text{id}$ ). Note that  $A^{\otimes n}$  is a nonunital B-module with respect to Ad. The conditions of (29) mean that f lies in  $A \otimes_{A_t} \cdots \otimes_{A_t} A$  (where A is an  $A_t$ -bimodule via  $z_1 \cdot h \cdot z_2 = z_1 S(z_2) h$  for  $h \in A$ ,  $z_1, z_2, \in A_t$ ) viewed as a subspace of  $A^{\otimes n}$  and that f commutes with  $\Delta^n(h)$  for all  $h \in A$ .

Let us define a linear map  $\delta^n: C^n(A,B) \to A^{\otimes (n+1)}$  by  $\delta^0(f) = f - S(f)$  and

(30) 
$$\delta^n(f) = \operatorname{Ad}(1)\{1 \otimes f + \sum_{i=1}^n (-1)^i (\operatorname{id}_{i-1} \otimes \Delta \otimes \operatorname{id}_{n-i})(f) + (-1)^{n+1} f \otimes 1\}$$

for  $n \geq 1$ .

LEMMA 6.1. For all  $n \geq 0$  we have  $\operatorname{Im}(\delta^n) \subset C^{n+1}(A,B)$  and  $\delta^{n+1} \circ \delta^n = 0$ , i.e., the collection  $\{C^n(A,B), \delta^n\}_{n\geq 0}$  is a complex.

*Proof.* That  $\delta^n(f)$ ,  $f \in C^n(A, B)$  is Ad(1) stable is a part of definition (30). For all  $h \in B$  we compute

$$Ad(h)\delta^{n}(f)$$

$$= Ad(h)(1 \otimes f) - Ad(h)(\Delta \otimes id_{n-1})f + \cdots$$

$$\cdots + (-1)^{n}Ad(h)(id_{n-1} \otimes \Delta)f + (-1)^{n+1}Ad(h)(f \otimes 1)$$

$$= h_{(1)}S(h_{(3)}) \otimes Ad(h_{(2)})f - (\Delta \otimes id_{n-1})(Ad(h)f) + \cdots$$

$$\cdots + (-1)^{n}(id_{n-1} \otimes \Delta)Ad(h)f + (-1)^{n+1}\Delta^{n}(h_{(1)})f\Delta^{n}(S(h_{(3)})) \otimes \varepsilon_{t}(h_{(2)})$$

$$= 1_{(1)}\varepsilon_{t}(h) \otimes Ad(1_{(2)})f - (\Delta \otimes id_{n-1})(Ad(\varepsilon_{t}(h))f) + \cdots$$

$$\cdots + (-1)^{n}(id_{n-1} \otimes \Delta)Ad(\varepsilon_{t}(h))f + (-1)^{n+1}\Delta^{n}(1_{(1)})Ad(\varepsilon_{t}(h))f \otimes 1_{(2)}$$

$$= Ad(\varepsilon_{t}(h))\delta^{n}(f).$$

where we used the identity  $(id \otimes \varepsilon_t)\Delta(x) = (1 \otimes x)\Delta(1)$  for all  $x \in A$ . Therefore,  $\delta^n(f) \in C^{n+1}(A,B)$ . Thus,  $\delta^n(C^n(A,B)) \subset C^{n+1}(A,B)$ .

That  $\delta^{n+1} \circ \delta^n = 0$  can be checked in a direct standard way, by cancelling the similar terms with opposite signs among (n+3)(n+2) tensors in  $\delta^{n+1} \circ \delta^n(f)$ .

The  $n^{\text{th}}$  cohomology group of the pair A, B is

(31) 
$$H^n(A, B) := H^n(C^{\bullet}(A, B)) = \operatorname{Ker}(\delta^n)/\operatorname{Im}(\delta^{n-1}), \quad \text{for } n \ge 0.$$

6.2. The vanishing theorem for cohomology. Now let A be a regular finite-dimensional semisimple (and hence, cosemisimple) weak Hopf algebra.

LEMMA 6.2. Suppose that A is indecomposable. Let  $q_i$  be a primitive idempotent in  $Z(A_t)$  and let  $\chi := \chi_i$  be the corresponding canonical left integral in  $A^*$  from Proposition 4.9. Then  $u = 1_{(1)}\chi(1_{(2)})$  is an invertible scalar.

*Proof.* Since  $\chi$  is a left integral in  $A^*$ , we have

(32) 
$$u = 1_{(1)}\chi(1_{(2)}) = S(1_{(1)})\chi(1_{(2)}) = S(u) \in A_s \cap A_t.$$

Next, the following identities hold in every weak Hopf algebra A:

$$\Delta(1)(h \otimes 1) = (\mathrm{id} \otimes \varepsilon_t)\Delta(h), \qquad (h \otimes 1)\Delta(1) = (\mathrm{id} \otimes \varepsilon_t^{\mathrm{op}})\Delta(h), \qquad h \in A,$$

where  $\varepsilon_t^{\text{op}}$  is the target counital map in  $A^{\text{op}}$ .

Using Proposition 4.9 we compute for all  $h \in A$ :

$$\begin{split} \mathbf{1}_{(1)} h \chi(\mathbf{1}_{(2)}) &= h_{(1)} \chi(\varepsilon_t(h_{(2)})) = h_{(1)} \chi(h_{(2)} S(h_{(3)})) \\ &= h_{(1)} \chi(S^{-1}(h_{(3)}) h_{(2)}) = h_{(1)} \chi(\varepsilon_t^{\mathrm{op}}(h_{(2)})) \\ &= h \mathbf{1}_{(1)} \chi(\mathbf{1}_{(2)}); \end{split}$$

hence,  $u \in A_s \cap A_t \cap Z(A) = k1_A$ .

For any primitive central idempotent  $q_i$  in  $A_t$  we have

$$\chi(q_j) = \operatorname{Tr}(S^2|_{q_j A S(q_i)}) = \dim(\operatorname{Rep}(A)) n_i^2 n_j^2 \neq 0,$$

where  $n_i^2 = \dim_k(q_i A_t)$  and  $n_j^2 = \dim_k(q_j A_t)$ . Therefore,  $\chi|_{A_t} \neq 0$  and  $u \neq 0$ .  $\square$ 

THEOREM 6.3. Let C be the complex associated to A, B as above. Then  $H^0(A, B) = A_t \cap A_s \cap Z(A)$  and  $H^n(A, B) = 0$  for all  $n \ge 1$ .

*Proof.* It suffices to prove this theorem in the case when A is indecomposable. In this case we have  $H^0(A, B) = \operatorname{Ker}(\delta^0) = A_t \cap A_s \cap Z(A) = k$ . Let  $f \in C^n(A, B), n \geq 1$  be a cycle, i.e.,  $\delta^n(f) = 0$ . We will show by a direct computation that

(33) 
$$\tilde{f} = (\mathrm{id}_{n-1} \otimes \chi)(f)$$

belongs to  $C^{n-1}(A,B)$  and that f is a scalar multiple of the differential  $\delta^{n-1}(\tilde{f})$ .

We will write  $f = f^{(1)} \otimes \cdots \otimes f^{(n)}$ , where a sum of some set of tensors is understood. We have:

$$Ad(1)\tilde{f} 
= 1_{(1)}f^{(1)}S(1_{(2n-2)}) \otimes \cdots \otimes 1_{(n-1)}f^{(n-1)}S(1_{(n)})\chi(f^{(n)}) 
= \Delta^{n-1}(1_{(1)}1'_{(1)})(f^{(1)} \otimes \cdots \otimes f^{(n-1)})\Delta^{n-1}(S(1_{(2)}1'_{(4)}))\chi(1'_{(2)}f^{(n)}S(1'_{(3)})) 
= \Delta^{n-1}(1'_{(1)})(f^{(1)} \otimes \cdots \otimes f^{(n-1)})\Delta^{n-1}(S(1'_{(4)}))\chi(1'_{(2)}f^{(n)}S(1'_{(3)})) = \tilde{f},$$

where 1' stands for a second copy of 1 and we use that in any regular weak Hopf algebra one has  $(1_{(1)} \otimes 1 \otimes 1 \otimes 1_{(2)})\Delta^4(1) = \Delta^4(1)$ . Next, we have for all  $h \in B$ :

$$\begin{split} \operatorname{Ad}(h)\tilde{f} &= h_{(1)}f^{(1)}S(h_{(2n-2)}) \otimes \cdots \otimes h_{(n-1)}f^{(n-1)}S(h_{(n)})\chi(f^{(n)}) \\ &= h_{(1)}f^{(1)}S(h_{(2n-1)}) \otimes \cdots \otimes h_{(n-1)}f^{(n-1)}\varepsilon_{s}(h_{(n)})S(h_{(n+1)})\chi(f^{(n)}) \\ &= h_{(1)}f^{(1)}S(h_{(2n-1)}) \otimes \cdots \otimes h_{(n-1)}f^{(n-1)}S(h_{(n+1)})\chi(f^{(n)}S(\varepsilon_{s}(h_{(n)}))) \\ &= h_{(1)}f^{(1)}S(h_{(2n)}) \otimes \cdots \otimes h_{(n-1)}f^{(n-1)}S(h_{(n+2)})\chi(h_{(n)}f^{(n)}S(h_{(n+1)})) \\ &= (\operatorname{id}_{n-1} \otimes \chi)(\operatorname{Ad}(h)f) = (\operatorname{id}_{n-1} \otimes \chi)(\operatorname{Ad}(\varepsilon_{t}(h))f) = \operatorname{Ad}(\varepsilon_{t}(h))\tilde{f}. \end{split}$$

Here we used that

$$(34) f = f(1 \otimes \cdots \otimes 1\Delta(1))$$

for all  $f \in C^n(A, B)$ , the weak Hopf algebra identities

$$x_{(1)}\varepsilon_s(x_{(2)}) = x$$
 and  $(y \otimes 1)\Delta(1) = (1 \otimes S^{-1}(y))\Delta(1)$ 

for all  $x \in A$  and  $y \in A_s$  (cf. [NV]), and Proposition 4.9.

Hence, 
$$\tilde{f} \in C^{n-1}(A, B)$$
. Next, since  $(\mathrm{id}_n \otimes \chi)(\delta^n(f)) = 0$ , we get

$$0 = (\mathrm{id}_n \otimes \chi) \mathrm{Ad}(1) \{ 1 \otimes f^{(1)} \otimes \cdots \otimes f^{(n)} - \Delta(f^{(1)}) \otimes \cdots \otimes f^{(n)}$$

$$+ \cdots + (-1)^n f^{(1)} \otimes \cdots \otimes \Delta(f^{(n)}) + (-1)^{n+1} f^{(1)} \otimes \cdots \otimes f^{(n)} \otimes 1 \}$$

$$= \mathrm{Ad}(1) \{ 1 \otimes f^{(1)} \otimes \cdots \otimes f^{(n-1)} \chi(f^{(n)}) - \Delta(f^{(1)}) \otimes \cdots \otimes f^{(n-1)} \chi(f^{(n)})$$

$$+ \cdots + (-1)^n f^{(1)} \otimes \cdots \otimes (\mathrm{id} \otimes \chi) \Delta(f^{(n)}) \} + (-1)^{n+1} f \Delta^n(1_{(1)}) \chi(1_{(2)}).$$

Let  $u = 1_{(1)}\chi(1_{(2)})$ . Then

$$f \Delta^{n}(u) = (-1)^{n} \delta^{n-1}(\tilde{f})$$

$$+ \operatorname{Ad}(1) \{ f^{(1)} \otimes \cdots \otimes (\operatorname{id} \otimes \chi) \Delta(f^{(n)}) - f^{(1)} \otimes \cdots \otimes f^{(n-1)} \otimes \chi(f^{(n)}) 1 \}.$$

Let us show that

(35) 
$$\operatorname{Ad}(1)\{(\operatorname{id}_{n-1}\otimes\chi)(f)\otimes 1-(\operatorname{id}_n\otimes\chi)(\operatorname{id}_{n-1}\otimes\Delta)(f)\}=0$$

for all  $f \in C^n(A, B)$ . Observe that the left-hand side of (35) belongs to  $C^{n+1}(A, B)$ .

We compute:

$$\begin{aligned} \operatorname{Ad}(1) & \{ f^{(1)} \otimes \cdots \otimes f^{(n-1)} \otimes f^{(n)}_{(1)} \chi(f^{(n)}_{(2)}) \} \\ & = f^{(1)} \otimes \cdots \otimes f^{(n-1)} \otimes S(1_{(1)}) \chi(1_{(2)} f^{(n)}) \\ & = f^{(1)} \otimes \cdots \otimes 1'_{(1)} f^{(n-1)} \otimes 1'_{(2)} S(1_{(1)}) \chi(1_{(2)} f^{(n)}) \\ & = f^{(1)} \otimes \cdots \otimes 1'_{(1)} 1_{(1)} f^{(n-1)} \otimes 1'_{(2)} \chi(1_{(2)} f^{(n)}) \\ & = f^{(1)} \otimes \cdots \otimes 1_{(1)} f^{(n-1)} \otimes 1_{(2)} \chi(f^{(n)}) \\ & = \operatorname{Ad}(1) & \{ f^{(1)} \otimes \cdots \otimes f^{(n-1)} \otimes \chi(f^{(n)}) 1 \}. \end{aligned}$$

Here 1' stands for another copy of 1. We used the definition of a left integral, several identities in a weak Hopf algebra, and equation (34) applied to f and  $\tilde{f}$ .

Therefore,  $f\Delta^n(u)=(-1)^n\delta^{n-1}(\tilde{f})$ . Now u is a nonzero scalar by Lemma 6.2, hence  $f=\delta^{n-1}((-1)^nu^{-1}\tilde{f})$ , i.e.,  $\operatorname{Ker}\delta^n\subset\operatorname{Im}\delta^{n-1}$  and  $H^n(A,B)=0$  for  $n\geq 1$ .

# 7. The Yetter cohomology of a tensor category and Ocneanu rigidity

7.1. The definition. The following cohomology of a tensor category with respect to a tensor functor was defined in [Y1, Y2], motivated by the previous work [CY], and independently in [Da].

Let  $\mathcal{C}, \mathcal{C}'$  be tensor categories over a field k, and  $F: \mathcal{C} \to \mathcal{C}'$  be a (unital) tensor functor.

For a nonnegative integer n, let  $\mathcal{C}^n$  denote the  $n^{\text{th}}$  Cartesian power of  $\mathcal{C}$ . In particular,  $\mathcal{C}^0$  has one object (empty tuple  $\emptyset$ ) and one morphism (identity). Define the functor  $T_n: \mathcal{C}^n \to \mathcal{C}$  by  $T_n(X_1, \ldots, X_n) := X_1 \otimes \cdots \otimes X_n$ . In particular,  $T_0: \mathcal{C}^0 \to \mathcal{C}$  is defined by  $T_0(\emptyset) = \mathbf{1}$ , and  $T_1 = \text{Id}$ . Let  $C_F^n(\mathcal{C}) = \text{End}(T_n \circ F^{\otimes n})$  (so e.g.,  $C_F^0(\mathcal{C}) = \text{End}(\mathbf{1}_{\mathcal{C}'})$ ). We define a differential  $d: C^n(\mathcal{C}) \to C^{n+1}(\mathcal{C})$  by the formula

$$df = \operatorname{Id} \otimes f_{2,\dots,n+1} - f_{12,\dots,n+1} + f_{1,23,\dots,n+1} - \dots + (-1)^n f_{1,\dots,n+1} + (-1)^{n+1} f_{1,\dots,n} \otimes \operatorname{Id},$$

where for instance  $f_{12,3,...,n+1}$  is the endomorphism of the product of n objects  $F(X_1) \otimes F(X_2), F(X_3), \ldots, F(X_{n+1})$ , and we use the identification  $F(X_1) \otimes F(X_2) \to F(X_1 \otimes X_2)$  defined by the tensor structure on F.

It is easy to show that  $d^2 = 0$ . Thus  $(C^{\bullet}(\mathcal{C}), d)$  is a complex. We will call the cohomology groups  $H_F^n(\mathcal{C}), n \geq 0$  of this complex the Yetter cohomology groups of  $\mathcal{C}$  with respect to F. In the important special case  $\mathcal{C} = \mathcal{C}', F = \mathrm{Id}$ , we will denote this cohomology simply by  $H^i(\mathcal{C})$  and call it the Yetter cohomology of  $\mathcal{C}$ .

As usual, low dimensional Yetter cohomology groups have an independent meaning [Y1, Y2], [Da]. The group  $H_F^1(\mathcal{C})$  classifies derivations of F as a tensor functor. The group  $H_F^2(\mathcal{C})$  classifies first order deformations of the tensor structure on the functor F. The group  $H^3(\mathcal{C})$  classifies first order defomations of the associativity constraint in  $\mathcal{C}$ , i.e. of the structure of  $\mathcal{C}$  itself. As usual, obstructions to these deformations live in the cohomology groups one degree higher.

To illustrate this definition, we give a few examples.

Example 7.1. If  $\mathcal{C}$  is Rep(H) for a Hopf algebra H and F the forgetful functor, then  $H_F^i(\mathcal{C})$  is the usual Hochschild cohomology of H as a coalgebra.

Example 7.2. Let G be an affine proalgebraic group over k, and  $\mathcal{C} = \operatorname{Rep}(G)$  be the category of algebraic representations of G. Then  $H^i(\mathcal{C}) = H^i(O(G))$ , the Hochschild cohomology of O(G) as a coalgebra, where O(G) is the Hopf algebra of algebraic functions on G. In other words,  $H^i(\mathcal{C}) = H^i_{\operatorname{alg}}(G,k)$ , the algebraic group cohomology of G.

Example 7.3. Let G be a reductive algebraic group over k with Lie algebra  $\mathfrak{g}$ . Let  $\operatorname{Rep}(G)$  denote the category of algebraic representations of G. Then  $H^i(\operatorname{Rep}(G)) = (\Lambda^i \mathfrak{g})^G$  for all i. Indeed,  $\operatorname{Rep}(G) = \operatorname{Rep}(O(G)^*)$ . Therefore,  $C^n(\operatorname{Rep}(G)) = (O(G^n)^*)^G$ , where G acts diagonally by conjugation. Since G is reductive, the cohomology of this complex is the G-invariants in the Hochschild cohomology of O(G) with coefficients in the trivial representation (corresponding to  $1 \in G$ ). This cohomology is well known to be  $\Lambda \mathfrak{g}$ , so the answer is  $(\Lambda \mathfrak{g})^G$ , as desired. Thus, if  $\mathfrak{g}$  is a simple Lie algebra, then there are no nontrivial derivations or tensor structure deformations of the identity functor, but there exists a unique (up to scaling) first order deformation of the associativity constraint, corresponding to a basis element in  $(\Lambda^3 \mathfrak{g})^G$ . It is easy to guess that this deformation comes from an actual deformation, namely from the deformation of O(G) to the quantum group  $O_g(G)$ .

7.2. Comparison of two complexes. The following proposition shows that for categories and functors coming from weak Hopf algebras, the Yetter complex defined here is the same as the complex defined in the previous section.

PROPOSITION 7.4. Let A be a weak Hopf algebra, B a weak Hopf subalgebra in A, C = Rep(A), C' = Rep(B), and  $F : C \to C'$  be the restriction functor. Then the complex  $C_F^{\bullet}(C)$  coincides with the complex  $C^{\bullet}(A, B)$  defined in Section 6.

Proof. Let us show that  $\operatorname{End}(T_n \circ F^{\otimes n}) = C^n(A, B)$ . For this, define a map  $\xi: C^n(A, B) \to \operatorname{End}(T_n)$ . Recall that for any representations  $X_1, \ldots, X_n$  of A, the representation  $X_1 \otimes_{\mathcal{C}} \cdots \otimes_{\mathcal{C}} X_n$  is defined to be the image of the projection  $\Delta^n(1)$  acting on  $X_1 \otimes \cdots \otimes X_n$  [NTV]. Therefore, any element  $a \in C^n(A, B)$  defines an operator on the usual tensor product  $X_1 \otimes \cdots \otimes X_n$  which preserves the subspace  $X_1 \otimes_{\mathcal{C}} \cdots \otimes_{\mathcal{C}} X_n$  (since  $a = \operatorname{Ad}(1)a$ ). Let us denote by  $\xi(a)$  its

restriction to this subspace. Since a is invariant under the adjoint action, we find that  $\xi(a)$  is not only a linear map but also a morphism of representations. So we have defined the map  $\xi$ .

Now we need to show that the map  $\xi$  is an isomorphism. For this purpose, we construct the inverse map. Take  $f \in \operatorname{End}(T_n \circ F^{\otimes n})$ . Extend it by zero to the space  $\operatorname{Ker}\Delta^n(1)$  in  $X_1 \otimes \cdots \otimes X_n$ . Then we get a linear operator  $\tilde{f}$  on  $X_1 \otimes \cdots \otimes X_n$ , which is functorial in  $X_1, \ldots, X_n$ . Thus,  $\tilde{f}$  corresponds to a unique element  $\hat{f}$  of  $A^{\otimes n}$ . It is clear that  $\hat{f} = \operatorname{Ad}(1)\hat{f}$ , since both sides define the same operators in  $X_1 \otimes \cdots \otimes X_n$ . It is also clear that  $\hat{f}$  is invariant under adjoint action, as f is a morphism in the category. Finally, it is clear that  $\xi(\hat{f}) = f$ , and  $\widehat{\xi(a)} = a$ . Thus,  $\xi$  is an isomorphism.

Finally, it is easy to see that the map  $\xi$  identifies the differentials of the two complexes. The proposition is proved.

7.3. Proof of Theorem 2.27 and Theorem 2.30. Let  $\mathcal{C}, \mathcal{C}'$  be multifusion categories, and  $F: \mathcal{C} \to \mathcal{C}'$  a tensor functor between them. We can assume without loss of generality that F is faithful and surjective. Let R be a semisimple algebra, and let  $G: \mathcal{C}' \to R$  – bimod be a fiber functor on  $\mathcal{C}'$  (we know by now that it necessarily exists for a suitable R). Let  $B = \operatorname{End}(G)$  be the corresponding weak Hopf algebra. Let  $A = \operatorname{End}(G \circ F)$ . Then B is a weak Hopf subalgebra of A,  $\mathcal{C}' = \operatorname{Rep}(B)$ ,  $\mathcal{C} = \operatorname{Rep}(A)$ , and F is the restriction functor. Thus, by Proposition 7.4, the complex  $C_F^{\bullet}(\mathcal{C})$  is isomorphic to the complex C(A, B). Now, since A is semisimple, it is also cosemisimple by Theorem 2.26. Hence, by Theorem 6.3,  $C_F^{\bullet}(\mathcal{C})$  is acyclic in positive degrees. Theorem 2.27 is proved.

Now let us prove Theorem 2.30. Let  $\mathcal{C}$  be a multifusion category. By Theorem 2.27, we have  $H^i(\mathcal{C}) = 0$ , i > 0, in particular  $H^3(\mathcal{C}) = 0$ .

Now consider the set of all admissible associativity constraints for a tensor category with the same Grothendieck ring as  $\mathcal{C}$ . It is an affine algebraic variety. This variety is acted upon by the group of twists. By a standard argument, one finds that the quotient of the tangent space to this variety at the point  $\mathcal{C}$  by the tangent space to the orbit of  $\mathcal{C}$  is equal to  $H^3(\mathcal{C})$ . Since  $H^3(\mathcal{C}) = 0$ , the group action is locally transitive, and hence has finitely many orbits. We are done.

In conclusion we give the formulation of Ocneanu rigidity for semisimple weak Hopf algebras. This is a generalization to the weak case of Stefan's rigidity theorem for semisimple Hopf algebras [S], which was conjectured in [N, 3.9].

Theorem 7.5. A regular semisimple finite dimensional weak Hopf algebra does not admit nontrivial deformations in the class of regular weak Hopf algebras. In particular, there are finitely many such weak Hopf algebras in each dimension.

Proof. Let *A* be a regular semisimple weak Hopf algebra, Rep(*A*) its representation category, *R* its base, and let *F* : Rep(*A*) → *R* − bimod be the forgetful functor. Suppose we have a deformation of *A*. Then by Theorem 2.30, this deformation produces a trivial deformation of Rep(*A*) as a tensor category. It is also clear that the base *R* of *A*, being a semisimple algebra, is deformed trivially. This means that this deformation comes from a deformation of the forgetful functor *F* as a tensor functor (indeed, a regular weak Hopf algebra is completely determined by the associated forgetful functor, since the symmetric separability idempotent is unique). But the deformation of *F* must also be trivial, by Theorem 2.31. This implies the first statement of the theorem. The second statement follows from the first one as in the proof of Theorem 2.30.

## **8. Frobenius-Perron dimensions**

In this section we will give some applications of the Frobenius-Perron theorem to the theory of fusion categories. We work with categories over C.

8.1. Definition of the Frobenius-Perron dimensions. We start by recalling the Frobenius-Perron theorem (see [Ga]).

Theorem 8.1.Let *A* be a square matrix with nonnegative entries.

- (1) *A* has a nonnegative real eigenvalue. The largest nonnegative real eigenvalue *λ*(*A*) of *A* dominates absolute values of all other eigenvalues of *A*.
- (2) If *A* has strictly positive entries then *λ*(*A*) is a simple positive eigenvalue, and the corresponding eigenvector can be normalized to have strictly positive entries.
- (3) If *A* has an eigenvector **f** with strictly positive entries, then the corresponding eigenvalue is *λ*(*A*).

Now let *A* be a unital based ring of finite rank in the sense of Lusztig (see, e.g., [O1] for a definition). Let *b*<sup>i</sup> be the basis of *A* (*b*<sup>0</sup> = 1), and [*b*i] be the matrix of multiplication by *b*<sup>i</sup> ∈ *A* in the basis *b*<sup>j</sup> . This matrix has nonnegative entries. Let *λ*<sup>i</sup> be the largest nonnegative eigenvalue of [*b*i]. Since *b*<sup>i</sup> is clearly not nilpotent, this eigenvalue is actually positive.

We will call *λ*<sup>i</sup> the Frobenius-Perron dimension of *b*i. We note that Frobenius-Perron dimensions for commutative based rings were defined and used in the book [FK].

Theorem 8.2. The assignment *b*<sup>i</sup> → *λ*<sup>i</sup> extends to a homomorphism of algebras *A* → R.

*Proof.* For any j define  $z_j = \sum_i b_i b_j b_i^*$ . We claim that  $z_j$  is central. Indeed, let  $b_i b_j = \sum_k N_{ij}^k b_k$ . Then  $N_{ri}^k = N_{k^*r}^i$ , so

$$b_r z_j = b_r \sum_i b_i b_j b_i^* = \sum_{k,i} N_{ri}^k b_k b_j b_i^* = \sum_{k,i} N_{k^*r}^{i^*} b_k b_j b_{i^*} = \sum_k b_k b_j b_{k^*} b_r = z_j b_r.$$

Let  $z = \sum_j z_j$ . Since  $z_j$  contain  $b_j$  as a summand, the matrix [z] of multiplication by  $z = \sum_j z_j$  has strictly positive entries. Let  $\mathbf{f}$  be the unique eigenvector of [z] with positive entries and  $f_0 = 1$  (its existence and uniqueness follows from the Frobenius-Perron theorem). Then  $[b_j]\mathbf{f}$  must be a multiple of  $\mathbf{f}$ , since  $\mathbf{f}$  has positive entries and  $[z][b_j] = [b_j][z]$ . So by the Frobenius-Perron theorem,  $[b_j]\mathbf{f} = \lambda_j \mathbf{f}$ , whence the statement follows.

We note that  $b_i \to \lambda_i$  is the unique homomorphism of A to  $\mathbb{R}$  such that images of the basis vectors are positive. This is demonstrated by the following simple and probably well-known lemma.

Let A be a  $\mathbb{Z}_+$ -ring of finite rank with  $\mathbb{Z}_+$ -basis  $b_i$  (see [O1] for definition).

LEMMA 8.3. If there exists a homomorphism  $\phi: A \to \mathbb{R}$  such that  $\phi(b_i) > 0$  for all i, then  $\phi$  is unique.

*Proof.* Let  $[b_i]$  be the matrix of multiplication by  $b_i$  in the basis  $b_j$ , and  $\mathbf{f}$  be the column vector with entries  $\phi(b_j)$ . Then  $[b_i]\mathbf{f} = \phi(b_i)\mathbf{f}$ . But  $[b_i]$  is a matrix with nonnegative entries, and  $\mathbf{f}$  has positive entries. Thus, by the Frobenius-Perron theorem,  $\phi(b_i)$  is the largest positive eigenvalue of  $[b_i]$ , and hence is uniquely determined. The lemma is proved.

Remark 8.4. M. Müger pointed out to us that for any i one has  $\lambda_i \geq 1$ ; moreover if  $\lambda_i < 2$  then  $\lambda_i = 2\cos(\pi/n)$  for some integer  $n \geq 3$  (this follows from the well-known Kronecker theorem on the eigenvalues of positive integer matrices).

One can also define the Frobenius-Perron dimensions of basis elements of a based module over a unital based ring. Indeed, let M be an indecomposable based A-module with basis  $m_j$  (see [O1] for definition).

PROPOSITION 8.5. There exists a unique up to scaling common eigenvector  $\mathbf{m}$  of the matrices  $[b_i]|_M$  of the operators  $b_i$  in M, which has strictly positive entries. The corresponding eigenvalues are  $\lambda_i$ .

*Proof.* Let z be the element from the proof of Theorem 8.2. The matrix  $[z]|_M$  has strictly positive entries. Let  $\mathbf{m}$  be an eigenvector of  $[z]|_M$  with positive entries. It exists and is unique up to a positive scalar, by the Frobenius-Perron theorem. Hence, it is an eigenvector of  $[b_i]|_M$ , and the eigenvalues are  $\lambda_i$  by Lemma 8.3.

Now let  $\mathcal{C}$  be a fusion category. Let  $K(\mathcal{C})$  be the Grothendieck ring of  $\mathcal{C}$ . For any object  $X \in \mathcal{C}$ , define the Frobenius-Perron dimension of X,  $\mathrm{FPdim}(X)$ , to be the largest positive eigenvalue of the matrix [X] of multiplication by X in  $K(\mathcal{C})$ . Since  $K(\mathcal{C})$  is a unital based ring of finite rank, Theorem 8.2 implies the following result.

THEOREM 8.6. The assignment  $X \to \text{FPdim}(X)$  extends to a homomorphism of algebras  $K(\mathcal{C}) \to \mathbb{R}$ .

Similarly, one can define Frobenius-Perron dimensions of simple objects of a module category over a fusion category. Namely, let  $\mathcal{M}$  be an indecomposable module category over a fusion category  $\mathcal{C}$ . For any  $X \in \mathcal{C}$  let  $[X]_{\mathcal{M}}$  be the matrix of action of X on the Grothendieck group of  $\mathcal{M}$ . Since the Grothendieck group  $K(\mathcal{M})$  is an indecomposable based module over  $K(\mathcal{C})$ , Proposition 8.5 implies

PROPOSITION 8.7. There exists a unique up to scaling common eigenvector  $\mathbf{m}$  of the matrices  $[X]_{\mathcal{M}}$ , which has strictly positive entries. The corresponding eigenvalues are  $\operatorname{FPdim}(X)$ .

The entries  $\mu_i$  of **m** are called the Frobenius-Perron dimensions of simple objects  $M_i$  of  $\mathcal{M}$ . Unlike Frobenius-Perron dimensions of objects of  $\mathcal{C}$ , they are well defined only up to scaling.

8.2. Frobenius-Perron dimension of a fusion category. Let  $\mathcal{C}$  be a fusion category. Define the Frobenius-Perron dimension  $\operatorname{FPdim}(\mathcal{C})$  of  $\mathcal{C}$  to be the sum of squares of Frobenius-Perron dimensions of simple objects of  $\mathcal{C}$ .

Also, define the regular representation  $R_{\mathcal{C}}$  to be the (virtual) object  $\bigoplus_{X \in \operatorname{Irr}(\mathcal{C})} \operatorname{FPdim}(X)X$ , where  $\operatorname{Irr}(\mathcal{C})$  is the set of isomorphism classes of simple objects of  $\mathcal{C}$ . It is clear that  $\operatorname{FPdim}(\mathcal{C}) = \operatorname{FPdim}(R_{\mathcal{C}})$ .

PROPOSITION 8.8. Let  $F: \mathcal{C} \to \mathcal{D}$  be a surjective tensor functor between fusion categories. Then  $F(R_{\mathcal{C}}) = \frac{\mathrm{FPdim}(\mathcal{C})}{\mathrm{FPdim}(\mathcal{D})} R_{\mathcal{D}}$ .

*Proof.* Let X be an object of  $\mathcal{C}$  such that F(X) contains all simple objects of  $\mathcal{D}$ . It exists since F is surjective. The vectors of multiplication of  $F(R_{\mathcal{C}})$  and  $R_{\mathcal{D}}$  are eigenvectors of the matrix of multiplication by F(X). The matrix and the vectors have strictly positive entries. By the Frobenius-Perron theorem, this implies that  $F(R_{\mathcal{C}})$  and  $R_{\mathcal{D}}$  differ by a positive scalar. This scalar is readily found to be the claimed one by taking FPdim of  $F(R_{\mathcal{C}})$  and  $R_{\mathcal{D}}$ .

COROLLARY 8.9. Let  $A \subset B$  be an inclusion of finite dimensional semisimple quasi-Hopf algebras. Then B is free as a left A-module.

*Proof.* In this case Frobenius-Perron dimensions coincide with the usual ones, so if C = Rep(B),  $\mathcal{D} = \text{Rep}(A)$  then  $R_{\mathcal{C}} = B$ ,  $R_{\mathcal{D}} = A$ , proving the claim.

Remark 8.10. For Hopf algebras, Corollary 8.9 is the well-known freeness theorem of Nichols and Zoeller [NZ] (it is true in the nonsemisimple case as well). In the quasi-Hopf case it was independently obtained by P. Schauenburg (without the semisimplicity assumption), [Scha].

COROLLARY 8.11. If  $F: \mathcal{C} \to \mathcal{D}$  is surjective then  $\operatorname{FPdim}(\mathcal{C})$  is divisible by  $\operatorname{FPdim}(\mathcal{D})$  (i.e. the ratio is an algebraic integer).

*Proof.* Taking the multiplicity of the neutral object of  $\mathcal{D}$  in Proposition 8.8, we find  $\sum_{X \in \operatorname{Irr}(\mathcal{C})} \operatorname{FPdim}(X)[F(X):\mathbf{1}] = \frac{\operatorname{FPdim}(\mathcal{C})}{\operatorname{FPdim}(\mathcal{D})}$ , which yields the statement.

PROPOSITION 8.12. For any fusion category C, one has  $\operatorname{FPdim}(Z(C)) = \operatorname{FPdim}(C)^2$ .

Remark 8.13. If  $\mathcal{C}$  is a representation category of a quasi-Hopf algebra A, then Proposition 8.12 is saying that the Frobenius-Perron dimension of  $Z(\mathcal{C})$  is  $\dim(A)^2$ . This is a simple consequence of the result of Hausser and Nill [HN], who constructed a quasi-Hopf algebra D(A) (the double of A), isomorphic to  $A \otimes A^*$  as a vector space, such that  $Z(\mathcal{C}) = \operatorname{Rep}(D(A))$ .

*Proof.* Recall from Section 5 that  $V \to I(V)$  denotes the induction functor. By Proposition 5.4, we have

$$\begin{split} \operatorname{FPdim}(I(V)) &= \sum_{X \in \operatorname{Irr}(Z(\mathcal{C}))} \operatorname{FPdim}(X)[I(V) : X] \\ &= \sum_{X \in \operatorname{Irr}(Z(\mathcal{C}))} \operatorname{FPdim}(X)[X|_{\mathcal{C}} : V] \\ &= [R_{Z(\mathcal{C})} : V] = \frac{\operatorname{FPdim}Z(\mathcal{C})}{\operatorname{FPdim}\mathcal{C}}[R_{\mathcal{C}} : V] = \frac{\operatorname{FPdim}Z(\mathcal{C})}{\operatorname{FPdim}\mathcal{C}} \operatorname{FPdim}\mathcal{C} \end{split}$$

In particular,  $\operatorname{FPdim}(I(\mathbf{1})) = \frac{\operatorname{FPdim}Z(\mathcal{C})}{\operatorname{FPdim}\mathcal{C}}$ .

On the other hand, by Proposition 5.4,  $I(\mathbf{1}) = \bigoplus_{Y \in \operatorname{Irr}(\mathcal{C})} Y \otimes Y^*$ , which implies the desired statement (since the dimension of the right-hand side is  $\operatorname{FPdim}(\mathcal{C})$ ). The proposition is proved.

COROLLARY 8.14. Let C be a fusion category and  $C^*$  be its dual with respect to an indecomposable module category. Then  $FPdim(C) = FPdim(C^*)$ .

*Proof.* This follows from Proposition 8.12 and the fact that  $Z(\mathcal{C})$  is equivalent to  $Z(\mathcal{C}^*)$  [O1], [Mu2].

PROPOSITION 8.15. Let C be a full tensor subcategory of a fusion category D. Then  $\mathrm{FPdim}(D)/\mathrm{FPdim}(C)$  is an algebraic integer.

*Proof.* Consider the decomposition of  $\mathcal{D}$ , as a left module category over  $\mathcal{C}$ , in a direct sum of indecomposables. We have  $\mathcal{D} = \bigoplus_{i=1}^r \mathcal{M}_r$ . Let us consider the duals of  $\mathcal{C}$  and  $\mathcal{D}$  with respect to this module category. We have  $\mathcal{D}^* = \mathcal{D}^{\text{op}}$ , and  $\mathcal{C}^*$  is a multi-fusion category  $\mathcal{C}^* = \bigoplus_{i,j=1}^r \mathcal{C}_{ij}^*$ , where  $\mathcal{C}_{ij}^* := \text{Fun}(\mathcal{M}_j, \mathcal{M}_i)$ . Note that the Frobenius-Perron dimensions of  $\mathcal{C}_{ii}^*$  are equal to FPdim( $\mathcal{C}$ ) by Corollary 8.14.

Let  $E_{ij}$  denote nonzero virtual objects of  $C_{ij}^*$ , which satisfy the condition  $X \otimes E_{ij} \otimes Y = \text{FPdim}(X)\text{FPdim}(Y)E_{ij}, X \in C_{ii}^*, Y \in C_{jj}^*$ . Since the category  $C_{ij}^*$  is an indecomposable bimodule over  $C_{ii}^*$  and  $C_{jj}^*$ , by the Frobenius-Perron theorem, the object  $E_{ij}$  is unique up to scaling. We require that the coefficients in  $E_{ij}$  be positive, which determines it uniquely up to a positive scalar.

To fix the scaling completely, we will require that  $E_{ii}$ , which is a multiple of the regular representation  $R_{ii}$  in  $C_{ii}^*$ , be actually equal to  $\operatorname{FPdim}(C)^{-1}R_{ii}$ . Further, we normalize  $E_{1j}$  arbitrarily, then normalize  $E_{j1}$  by the condition  $E_{j1} \otimes E_{1j} = E_{jj}$ , and finally define  $E_{jk}$  as  $E_{j1} \otimes E_{1k}$ . It is easy to see that  $E_{ij}$  satisfy the matrix unit relations  $E_{ij} \otimes E_{kl} = \delta_{jk}E_{il}$ .

Now let  $F: \mathcal{D}^* \to \mathcal{C}^*$  be the natural functor, R be the regular representation of  $\mathcal{D}^*$ , and consider  $F(R) \in \mathcal{C}^*$ . We claim that  $F(R) = \bigoplus_{i,j} b_{ij} E_{ij}$ , where  $b_{ij} > 0$ . Indeed,  $F(R)^{\otimes 2} = \operatorname{FPdim}(\mathcal{D})F(R)$ , so for any i the virtual object  $L_i := \bigoplus_j b_{ij} E_{ij}$  is an eigen-object of the functor of right multiplication by F(R). Since the category  $\bigoplus_j \mathcal{C}^*_{ij}$  is an indecomoposable right module over  $\mathcal{C}^*$ , by the Frobenius-Perron theorem such eigen-object with positive coefficients is unique up to scaling. Thus, for any  $X \in \mathcal{C}^*_{ii}$ ,  $X \otimes L_i = c(X)L_i$ , where c(X) is a scalar. By the Frobenius-Perron theorem  $c(X) = \operatorname{FPdim}(X)$ . Similarly,  $P_j := \bigoplus_i b_{ij} E_{ij}$  satisfies  $P_j \otimes X = \operatorname{FPdim}(X)P_j$ ,  $X \in \mathcal{C}^*_{jj}$ . This implies the claim

Now let B be the matrix  $(b_{ij})$ . Since  $F(R)^{\otimes 2} = \operatorname{FPdim}(\mathcal{D})F(R)$ , and  $E_{ij}$  behave like matrix units, we have  $B^2 = \operatorname{FPdim}(\mathcal{D})B$ . Thus eigenvalues of B are  $\operatorname{FPdim}(\mathcal{D})$  and zero, and B is diagonalizable. Since  $b_{ij} > 0$ , by the Frobenius-Perron theorem the multiplicity of the eigenvalue  $\operatorname{FPdim}(\mathcal{D})$  is 1, so the rank of B is 1. Hence  $\operatorname{Tr}(B) = \operatorname{FPdim}(\mathcal{D})$ .

On the other hand, let us compute  $b_{ii}$ . We have

$$\sum_{X \in \operatorname{Irr}(\mathcal{D})} \operatorname{FPdim}(X)[F(X) : \mathbf{1}_{ii}] = b_{ii}/\operatorname{FPdim}(\mathcal{C})$$

(as  $E_{ii} = R_{ii}/\text{FPdim}(\mathcal{C})$ ). Thus,  $b_{ii}/\text{FPdim}(\mathcal{C})$  is an algebraic integer. Summing over all i, we find that  $\text{Tr}(B)/\text{FPdim}(\mathcal{C}) = \text{FPdim}(\mathcal{D})/\text{FPdim}(\mathcal{C})$  is an algebraic integer, as desired.

Remark 8.16. Since  $b_{ii} \geq 1$ , we see that  $\text{FPdim}(\mathcal{D})/\text{FPdim}(\mathcal{C})$  dominates the number of indecomposable blocks in  $\mathcal{D}$  as a left  $\mathcal{C}$ -module category.

Remark 8.17. Let  $\mathcal{M}_1 = \mathcal{C}$ . Then  $\mathcal{C}_{i1}^* = \mathcal{M}_i$ . It is easy to see that  $F(R)_{i1} = \sum_{X \in \operatorname{Irr}(\mathcal{M}_i)} \operatorname{FPdim}(X)X$ . By uniqueness of eigen-object of F(R) in  $\bigoplus_j \mathcal{C}_{ii}^*$ , we have  $F(R)_{i1} \otimes F(R)_{1i} = \operatorname{FPdim}(\mathcal{C})F(R)_{ii}$ . Thus,

$$[F(R)_{ii}: \mathbf{1}_{ii}] = \dim \operatorname{End}(F(R)_{i1}, F(R)_{i1})/\operatorname{FPdim}(\mathcal{C})$$
  
=  $\operatorname{FPdim}(\mathcal{M}_i)/\operatorname{FPdim}(\mathcal{C}).$ 

This implies the refinement of Theorem 8.15 stating that  $FPdim(\mathcal{M}_i)/FPdim(\mathcal{C})$  is an algebraic integer.

Remark 8.18. We do not know if the global dimension of a fusion category is divisible by the global dimension of its full tensor subcategory.

Example 8.19. The following example shows that Proposition 8.15 is a property of tensor categories and not just of based rings.

Let G be a finite group and n a nonnegative integer. Consider the based ring  $A_n(G)$  with basis  $G \cup \{X\}$ , with multiplication given by the usual multiplication in G and the relations  $gX = Xg = X, g \in G$ , and  $X^2 = nX + \sum_{g \in G} g$ . Such rings for special n, G can arise as Grothendieck rings of fusion categories (for example, the categories of [TY], or representation categories of affine groups  $Aff(\mathbb{F}_q)$ ). We claim that if  $A_n(G)$  is categorifiable, then the number  $(n+\sqrt{n^2+4|G|})^2/4|G|$  is an algebraic integer. In particular, for  $n \neq 0$  one has  $|G| \leq 2n^2$ . (For n=1 we find |G|=1,2, so G=1 or  $G=\mathbb{Z}/2\mathbb{Z}$ , which was proved by T. Chmutova even for nonrigid categories.) Indeed, let  $\mathcal{C}$  be a fusion category with Grothendieck ring  $A_n(G)$ . Then the Frobenius-Perron dimensions of elements of G are 1, while the Frobenius-Perron dimension of X is the largest root of the equation  $x^2 - nx - m = 0$ , where m = |G|. Thus  $x = \frac{1}{2}(n + \sqrt{n^2 + 4m})$ . By Proposition 8.15,  $x^2/m$  should be an algebraic integer.

PROPOSITION 8.20. If a fusion category C is faithfully graded by a finite group G, then the Frobenius-Perron dimensions of  $C_g$  are equal for all  $g \in G$ . In particular, |G| divides  $\operatorname{FPdim}(C)$ .

Proof. Let R be the regular object of C. Then  $R = \bigoplus R_g$ , where  $R_g$  is a virtual object of  $C_g$ . We have  $R \otimes R_h = \operatorname{FPdim}(R_h)R$ . Taking the  $gh^{\operatorname{th}}$  component of this equation, we find  $R_g \otimes R_h = \operatorname{FPdim}(R_h)R_{gh}$ . Similarly,  $R_g \otimes R = \operatorname{FPdim}(R_g)R$ , which yields  $R_g \otimes R_h = \operatorname{FPdim}(R_g)R_{gh}$ . Since  $R_{gh} \neq 0$ , we get  $\operatorname{FPdim}(R_g) = \operatorname{FPdim}(R_h)$ , i.e.  $\operatorname{FPdim}(R_g) = \operatorname{FPdim}(X)/|G|$ .

8.3. Comparison of the global and Frobenius-Perron dimensions.

PROPOSITION 8.21. Let C be a fusion category. Then for any simple object V of C one has  $|V|^2 \leq \text{FPdim}(V)^2$ , and hence  $\dim(C) \leq \text{FPdim}(C)$ . Hence, if  $\dim(C) = \text{FPdim}(C)$  then  $|V|^2 = \text{FPdim}(V)^2$  for all simple objects V.

*Proof.* Let  $X_i$  be the i<sup>th</sup> simple object of  $\mathcal{C}$ , and  $d_i = d(X_i)$  be its dimension introduced in the proof of Theorem 2.3. Then  $|d_i|^2 = |V|^2$ , and  $d_i$  is an eigenvalue of the matrix  $T_i$ . It follows from Section 3 that the absolute values of the entries of  $T_i$  are dominated by the corresponding entries of the matrix  $N_i$  of multiplication by  $X_i$ . Let  $f_i$  be the Frobenius-Perron dimension of  $X_i$ , and consider a norm on the Grothendieck group  $Gr_{\mathbb{C}}(\mathcal{C})$  given by  $||\sum a_i X_i|| = \sum f_i |a_i|$ . Let us estimate the norm of the operator  $T_i$ . We have

$$||T_i \mathbf{a}|| = \sum_j f_j |\sum_k (T_i)_{jk} a_k| \le \sum_{j,k} f_j (N_i)_{jk} |a_k| = f_i \sum_k f_k |a_k| = f_i ||\mathbf{a}||.$$

Thus,  $||T_i|| \leq f_i$ . This implies that  $|V|^2 \leq f_i^2$ , which proves the proposition.  $\square$ 

PROPOSITION 8.22. Let C be a fusion category of global dimension D and Frobenius-Perron dimension  $\Delta$ . Then  $D/\Delta$  is an algebraic integer, which is  $\leq 1$ .

*Proof.* By Proposition 8.21, we only need to prove that  $D/\Delta$  is an algebraic integer.

First of all, we can assume without loss of generality that  $\mathcal{C}$  is a spherical category. Indeed, if  $\mathcal{C}$  is not spherical, then, as explained in Proposition 5.14, we can construct a spherical fusion category  $\tilde{\mathcal{C}}$  which projects onto  $\mathcal{C}$ . It is easy to see that this category has global dimension 2D and Frobenius-Perron dimension  $2\Delta$ , so the ratio of dimensions is the same.

Now assume that  $\mathcal{C}$  is spherical. Consider the Drinfeld center  $Z(\mathcal{C})$ . This is a modular category of global dimension  $D^2$ , and by Proposition 8.12, its Frobenius-Perron dimension is  $\Delta^2$ . Let  $S=(s_{ij})$  be its S-matrix. It follows from Verlinde's formula (see [BaKi]) that the commuting matrices  $N_i$  of multiplication by simple objects  $X_i$  of  $Z(\mathcal{C})$  have common eigenvectors  $\mathbf{v}_j$  with eigenvalues  $s_{ij}/s_{0j}$ . In particular, there exists a unique (by nondegeneracy of S) distinguished label j=r such that  $s_{ir}/s_{0r}=f_i$ , the Frobenius-Perron dimension of  $X_i$ . Since S is symmetric, and  $S^2$  is the charge conjugation matrix, we have  $\Delta^2 = \sum_i f_i^2 = \delta_{rr^*}/s_{0r}^2$ . Thus  $r=r^*$  and  $\Delta^2 = 1/s_{0r}^2 = D^2/d_r^2$ , where  $d_r$  is the categorical dimension of the  $r^{\text{th}}$  simple object. So  $D^2/\Delta^2 = d_r^2$  is an algebraic integer.

8.4. Pseudo-unitary categories. Let us say that a fusion category  $\mathcal{C}$  is pseudo-unitary if  $\dim(\mathcal{C}) = \mathrm{FPdim}(\mathcal{C})$ . This property is automatically satisfied for unitary categories, which occur in the theory of operator algebras, but it fails, for example, for the Yang-Lee category.

Proposition 8.23. Any pseudo-unitary fusion category C admits a unique pivotal (in fact, spherical) structure, with respect to which the categorical dimensions of all simple objects are positive, and coincide with their Frobenius-Perron dimensions.

*Proof.* Let  $g: \mathrm{Id} \to ****$  be an isomorphism of tensor functors,  $a: \mathrm{Id} \to **$  an isomorphism of additive functors, such that  $a^2 = g$ ,  $d_i$  be the dimensions of simple objects  $X_i$  associated to a as in Section 3.1, and  $\mathbf{d}$  the vector with components  $d_i$ . Then  $T_i\mathbf{d} = d_i\mathbf{d}$ , and  $|d_i| = f_i$  is the Frobenius-Perron dimension of  $X_i$ . But  $|(T_i)_{jk}| \leq (N_i)_{jk}$ . Thus,

$$f_i f_j = |d_i d_j| = |\sum_{i=1}^{n} (T_i)_{jk} d_k| \le \sum_{i=1}^{n} (N_i)_{jk} f_k = f_i f_j.$$

This means that the inequality in this chain is an equality. In particular  $(T_i)_{jk} = \pm (N_i)_{jk}$ , and the argument of  $d_i d_j$  equals the argument of  $(T_i)_{jk} d_k$  whenever  $(N_i)_{jk} > 0$ . This implies that whenever  $X_k$  occurs in the tensor product  $X_i \otimes X_j$ , the ratio  $d_i^2 d_j^2 / d_k^2$  is positive. Thus, the automorphism of the identity functor  $\sigma$  defined by  $\sigma|_{X_i} = d_i^2 / |d_i|^2$  is a tensor automorphism. Let us twist g by this automorphism. After this twisting, the new dimensions  $d_i$  will be real. Thus, we can assume without loss of generality that  $d_i$  were real from the beginning.

It remains to twist the square root a of g by the automorphism of the identity functor  $\tau$  given by  $\tau|_{X_i} = d_i/|d_i|$ . After this twisting, new  $T_i$  is  $N_i$  and new  $d_k$  is  $f_k$ . This means that  $b_i^{jk} = 1$  and a is a pivotal structure with positive dimensions. It is obvious that such a structure is unique. We are done.

#### 8.5. Fusion categories with integer Frobenius-Perron dimension.

PROPOSITION 8.24. Let C be a fusion category, such that  $\Delta := \mathrm{FPdim}(C)$  is an integer. Then C is pseudo-unitary. In particular, the category of representations of a semisimple finite dimensional quasi-Hopf algebra is pseudo-unitary.

Proof. Let D be the global dimension of  $\mathcal{C}$ . Let  $D_1 = D, D_2, \ldots, D_N$  be all the algebraic conjugates of D, and  $g_1, \ldots, g_N$  the elements of  $Gal(\bar{\mathbb{Q}}/\mathbb{Q})$  such that  $D_i = g_i(D)$ . Applying Propostion 8.22 to the category  $g_i(\mathcal{C})$ , we find that  $D_i/\Delta$  is an algebraic integer  $\leq 1$ . Then  $\prod_i (D_i/\Delta)$  is an algebraic integer  $\leq 1$ . But this product is a rational number. So it equals 1 and hence all factors equal 1. Hence  $D = \Delta$ , as desired.

Remark 8.25. We note that Proposition 8.24 may be regarded as a categorical analog of the well-known theorem of Larson and Radford [LR2], saying that in a semisimple Hopf algebra, the square of the antipode is the identity. More precisely, using Proposition 8.24, one can obtain the following proof of the Larson-Radford theorem (which is close to the original proof). Let A be a finite dimensional semisimple Hopf algebra with antipode S. Since S has finite order,  $S^2$  is semisimple, and its eigenvalues are roots of 1. Now, for every simple A-module V,  $S^2$  preserves  $End(V) \subset A$  (as  $V^{**}$  is isomorphic to V),

and  $|V|^2 = \text{Tr}(S^2|_{\text{End}(V)})$ , while  $\text{FPdim}(V)^2 = \dim(V)^2 = \dim \text{End}(V)$ . Thus, by Proposition 8.24,  $\text{Tr}(S^2|_{\text{End}(V)}) = \dim \text{End}(V)$ . Since  $S^2$  is semisimple and its eigenvalues are roots of unity, we have  $S^2 = 1$ .

Remark 8.26. In general, the Frobenius-Perron dimension of a fusion category may not only be different from its global dimension, but may in fact be not conjugate to the global dimension by the Galois group action. The same is true for the numbers  $\operatorname{FPdim}(V)^2$  and  $|V|^2$  for a simple object V. An example is a tensor product of the Yang-Lee category and its Galois conjugate. It has global dimension 5, but Frobenius-Perron dimension  $5(3+\sqrt{5})/2$ . Also, this category has a simple object V with  $|V|^2 = 1$  but  $\operatorname{FPdim}(V)^2 = (7+3\sqrt{5})/2$ .

One may wonder if a fusion category  $\mathcal{C}$  with integer  $\operatorname{FPdim}(\mathcal{C})$  must have integer Frobenius-Perron dimensions of simple objects. Unfortunately, the answer is "no" (see [TY], where dimensions of some simple objects are square roots of integers). However, the following weaker result is true. Let  $\mathcal{C}_{\operatorname{ad}}$  be the full tensor subcategory of  $\mathcal{C}$  generated by objects occurring in  $X \otimes X^*$ , where  $X \in \mathcal{C}$  is simple (if  $\mathcal{C} = \operatorname{Rep}(G)$  for a group G then  $\mathcal{C}_{\operatorname{ad}}$  is the representation category of the adjoint group G/Z(G) – the quotient by the center).

PROPOSITION 8.27. Suppose that  $\operatorname{FPdim}(\mathcal{C})$  is an integer. The Frobenius-Perron dimensions of simple objects in  $\mathcal{C}_{\operatorname{ad}}$  are integers. Furthermore, for any simple object  $X \in \mathcal{C}$ , one has  $\operatorname{FPdim}(X) = \sqrt{N}$ , where N is an integer.

Proof. The second statement follows from the first one, since for any simple object  $X \in \mathcal{C}$  the object  $X \otimes X^*$  lies in  $\mathcal{C}_{ad}$ . To prove the first statement, consider the object  $B = \bigoplus_i X_i \otimes X_i^* \in \mathcal{C}_{ad}$ , where  $X_i$  are the simple objects of  $\mathcal{C}$ . For some n the matrix of multiplication by the object  $B^{\otimes n}$  has strictly positive entries. On the other hand, the vector of dimensions of objects of  $\mathcal{C}_{ad}$  is an eigenvector of this matrix with integer eigenvalue  $\mathrm{FPdim}(\mathcal{C})^n$ . Thus, by the Frobenius-Perron theorem its entries are rational (as  $d_0 = 1$ ), and hence integer (as they are algebraic integers).

8.6. Fusion categories of Frobenius-Perron dimension  $p^n$ .

THEOREM 8.28. Let C be a fusion category of Frobenius-Perron dimension  $p^n$ , where  $n \ge 1$  is an integer, and p is a prime. Then:

- (i) There exists a nontrivial automorphism  $g \in \operatorname{Aut}_{\otimes}(\operatorname{Id}_{\mathcal{C}})$  of order p, so that  $\mathcal{C}$  is  $\mathbb{Z}/p\mathbb{Z}$  graded:  $\mathcal{C} = \bigoplus_{j=0}^{p-1} \mathcal{C}_j$ , where  $\mathcal{C}_j$  is spanned by simple objects X such that  $g|_X = e^{2\pi i j/p}$ . The Frobenius-Perron dimension of the fusion category  $\mathcal{C}_0$  and module categories  $\mathcal{C}_j$  over it are equal to  $p^{n-1}$ .
- (ii) C admits a filtration by fusion subcategories  $C \supset C^{(1)} \supset \cdots \supset C^{(n)} = \langle \mathbf{1} \rangle$ , where  $\dim C^{(i)} = p^{n-i}$ .

Remark 8.29. For representation categories of semisimple Hopf algebras, this theorem says that a semisimple Hopf algebra of order *p*<sup>n</sup> has a central group-like element of order *p*, so one can take a quotient and obtain a Hopf algebra of dimension *p*n−1. This result is due to Masuoka [Ma].

Proof. It is clear that (ii) follows from (i), so it suffices to prove (i). Since the Frobenius-Perron dimension of C is an integer, it is pseudo-unitary. In particular, it is spherical. By Proposition 3.3, the dimensions of all objects *X* ∈ *Z*(C) which occur in *I*(**1**), are divisors of *p*n. In addition, they are all integers, since the image of *X* in C belongs to Cad. By the class equation (Proposition 5.7), there have to be at least *p* such objects *X*, which are invertible. This means, the group of invertible objects of *Z*(C) is nontrivial. By Proposition 8.15, the order of this group must divide *p*2n. In particular, this group contains a cyclic subgroup *G* of order *p*. The group *G* maps trivially to C, so by Proposition 5.10 we get a faithful *G*∨-grading on C. The rest follows from Proposition 8.20. The theorem is proved.

The following corollary of this result is a categorical generalization of (the semisimple case of) the well-known result of Y. Zhu [Zhu] saying that a Hopf algebra of prime dimension is a group algebra.

Corollary 8.30. Let C be a fusion category of Frobenius-Perron dimension *p*, where *p* is a prime number. Then C is the category of representations of the group Z*/p*Z, in which associativity is defined by a cohomology class in *H*3(Z*/p*Z*,* C∗) = Z*/p*Z.

Proof. The corollary is immediate from Theorem 8.28. Indeed, this theorem shows that C is faithfully graded by Z*/p*Z, so by Proposition 8.20, all C<sup>g</sup> are 1-dimensional; i.e., C<sup>g</sup> contains a single simple object, which is invertible. Thus, C has *p* simple objects, which are invertible, and we are done.

Corollary 8.31. A semisimple quasi-Hopf algebra of prime dimension *p* is twist equivalent to the group algebra of a cyclic group of order *p*, with associator defined by a 3-cocycle.

The following proposition classifies fusion categories of dimension *p*2.

Proposition 8.32. Let C be a fusion category of Frobenius-Perron dimension *p*2, where *p* is a prime number. If *p* is odd, then simple objects of C are invertible, so C is the category of representations of a group of order *p*<sup>2</sup> with associativity defined by a 3-cocycle. If *p* = 2, then either C is the representation category of a group of order 4 with a 3-cocycle, or it has three objects of dimensions <sup>1</sup>*,* <sup>1</sup> and <sup>√</sup>2, and thus belongs to the list of [TY].

*Proof.* Assume that not all simple objects of  $\mathcal{C}$  are invertible. Our job is to show that p=2. Indeed, in this case the dimension is 4, and we have a subcategory of dimension 2 by Theorem 8.28. Since dimensions of all simple objects are square roots of integers, there is room for only one new object of dimension  $\sqrt{2}$ . All such categories are listed in [TY] (there are two of them, and they correspond in physics to "Ising model").

Assume the contrary, i.e. that p is odd. We have a grading of  $\mathcal{C}$  by  $\mathbb{Z}/p\mathbb{Z}$ , and for all  $j \in \mathbb{Z}/p\mathbb{Z}$  the dimension of  $\mathcal{C}_j$  is p by Proposition 8.20. Clearly,  $\mathcal{C}_0$  holds p invertible simple objects, and no other simple objects. It is also clear that all invertible objects of  $\mathcal{C}$  are contained in  $\mathcal{C}_0$  (as by Proposition 8.15, the order of the group of invertibles is a divisor of  $p^2$ ). Further, any object X in  $\mathcal{C}_j$ ,  $j \neq 0$ , must be invariant under tensoring (on either side) with invertibles from  $\mathcal{C}_0$ , since otherwise the dimension of  $\mathcal{C}_j$  would be greater than p (as the dimension of X is greater than 1). This means that  $X \otimes X^*$  contains all the invertibles from  $\mathcal{C}_0$ , and hence the dimension of X is at least  $\sqrt{p}$ . Since the dimension of  $\mathcal{C}_j$  is p, we find that the dimension of X is exactly  $\sqrt{p}$ , and X is the only simple object of  $\mathcal{C}_j$ . Let  $j,k \in \mathbb{Z}/p\mathbb{Z}$  be nonzero and distinct (they exist since p > 2). Let  $X_j, X_k$  be the only simple objects of  $\mathcal{C}_j, \mathcal{C}_k$ . Then  $X_j \otimes X_k^*$  is a p-dimensional object, which is an integer multiple of a  $\sqrt{p}$ -dimensional object, which spans  $\mathcal{C}_{j-k}$ . Contradicton. The proposition is proved.

8.7. Categories with integer Frobenius-Perron dimensions of simple objects.

Theorem 8.33. Let C be a fusion category. The following two conditions are equivalent.

- (i) For all  $X \in \mathcal{C}$ , the number  $\operatorname{FPdim}(X)$  is an integer.
- (ii) C is a representation category of a finite dimensional quasi-Hopf algebra A.

Remark 8.34. It is shown in [EG2] that A is determined uniquely up to twisting.

*Proof.* (i)  $\rightarrow$  (ii). Let  $F: \mathcal{C} \rightarrow \text{Vect}$  be the additive functor that maps simple objects  $X_i$  of  $\mathcal{C}$  to vector spaces  $F(X_i)$  of dimension  $\text{FPdim}(X_i)$ . For any i, j, choose any isomorphism  $J_{ij}: F(X_i) \otimes F(X_j) \rightarrow F(X_i \otimes X_j)$  (this is possible by Theorem 8.6). Then by a standard reconstruction argument the algebra  $\text{End}_k(F)$  has a natural structure of a quasi-Hopf algebra (changing J corresponds to twisting the quasi-Hopf algebra). We note that A is not, in general, a Hopf algebra, since J is not required to be a tensor structure on F.

(ii) $\rightarrow$  (i). This is clear since for  $\mathcal{C} = \text{Rep}(A)$ , FPdim(X) = Dim(X), where Dim(X) denotes the dimension of the underlying vector space.

It is obvious that the class of fusion categories with integer Frobenius-Perron dimensions is closed under the operations of tensor product, passing to the opposite category, and taking a fusion subcategory. The following theorem shows that it is also closed under taking duals (i.e., in the language of [Mu1], [O1] the property of integer Frobenius-Perron dimensions is weak Morita invariant).

THEOREM 8.35. Let C be a fusion category with integer Frobenius-Perron dimensions,  $\mathcal{M}$  be an indecomposable module category over C. Then the fusion category  $C_{\mathcal{M}}^*$  has integer Frobenius-Perron dimensions.

*Proof*. We know from [Mu1], [O2] that  $Z(\mathcal{C})$  is canonically equivalent to  $Z(\mathcal{C}_{\mathcal{M}}^*)$ . So let V be an object of  $Z(\mathcal{C})$  such that the matrix of multiplication by V in both  $\mathcal{C}$  and  $\mathcal{C}_{\mathcal{M}}^*$  has strictly positive entries (it exists, since both  $\mathcal{C}$  and  $\mathcal{C}_{\mathcal{M}}^*$  are fusion categories, and so the natural functors  $Z(\mathcal{C}) \to \mathcal{C}$ ,  $Z(\mathcal{C}^*) \to \mathcal{C}_{\mathcal{M}}^*$  are surjective).

Let  $[X], [X]_*$  be the matrices of multiplication by  $X \in Z(\mathcal{C})$  in the Grothendieck groups  $K(\mathcal{C}), K(\mathcal{C}_{\mathcal{M}}^*)$ , respectively. For a square matrix A with nonnegative entries, let t(A) be the largest real eigenvalue of A. By the assumptions of the theorem, t([V]) is an integer (it is the Frobenius-Perron dimension of V as an object of  $\mathcal{C}$ ). Since the assignments  $X \to t([X]), X \to t([X]_*), X \in Z(\mathcal{C})$ , are both homomorphisms of algebras, Lemma 8.3 implies that  $t([V]) = t([V]_*)$ . Hence,  $t([V]_*)$  is an integer.

The vector of Frobenius-Perron dimensions of simple objects in  $\mathcal{C}_{\mathcal{M}}^*$  is the unique, up to scaling, eigenvector of  $[V]_*$  with eigenvalue  $t([V]_*)$ . Since the matrix  $[V]_*$  has integer entries, the entries of this vector are rational numbers (as the zeroth entry is 1). This means that they are integers (as they are eigenvalues of integer matrices and hence algebraic integers). The theorem is proved.

COROLLARY 8.36. The class of fusion categories with integer Frobenius-Perron dimensions is closed under the operation of taking a component of a quotient category.

Proof. Let  $\mathcal{C}$  be a fusion category with integer Frobenius-Perron dimensions,  $\mathcal{D}$  an indecomposable multi-fusion category, and and  $F:\mathcal{C}\to\mathcal{D}$  be a surjective tensor functor (so  $\mathcal{D}$  is a quotient of  $\mathcal{C}$ ). Let  $\mathcal{M}$  be an indecomposable module category over  $\mathcal{D}$ . Then  $F^*:\mathcal{D}^*\to\mathcal{C}^*$  is an injective tensor functor between the corresponding dual fusion categories ( $\mathcal{C}^*$  is fusion since  $\mathcal{M}$  is indecomposable over  $\mathcal{C}$ , by surjectivity of F). By Theorem 8.35,  $\mathcal{C}^*$  has integer Frobenius-Perron dimensions. Hence, so does  $\mathcal{D}^*$  as its full subcategory. But any component category  $\mathcal{D}_{ii}$  of  $\mathcal{D}$  is dual to  $\mathcal{D}^*$  with respect to the  $i^{\text{th}}$  part of  $\mathcal{M}$  as a  $\mathcal{D}^*$ -module. Thus,  $\mathcal{D}_{ii}$  has integer Frobenius-Perron dimensions by Theorem 8.35.

PROPOSITION 8.37. Let C be a fusion category with integer Frobenius-Perron dimensions. Then for any indecomposable module category  $\mathcal{M}$  over C, the Frobenius-Perron dimensions of objects in  $\mathcal{M}$  are integers (under a suitable normalization).

*Proof.* Since the matrix  $[V]_{\mathcal{M}}$  from Proposition 8.7 has integer entries, and its largest real eigenvalue  $\mathrm{FPdim}(V)$  is an integer and has multiplicity 1, the entries of  $\mathbf{m}$  are rational.

In [O3], it is asked whether there are finitely many fusion categories with a given number of simple objects, and proved that the answer is "yes" for representation categories of Hopf algebras. Using the above techniques, one can show that the answer is "yes" for fusion categories with integer Frobenius-Perron dimension (which includes Hopf and quasi-Hopf algebras). Namely, we have

Proposition 8.38. There are finitely many fusion categories of integer Frobenius-Perron dimension with a given number of simple objects. In particular, there are finitely many equivalence classes of semisimple quasi-Hopf algebras with a given number of matrix blocks.

Proof. Let  $\mathcal{C}$  be such a category with N simple objects. Since the Frobenius-Perron dimension of  $\mathcal{C}$  is an integer, it is pseudo-unitary, in particular has a canonical spherical structure. Let  $d_i$  be the categorical (=Frobenius-Perron) dimensions of simple objects of  $Z(\mathcal{C})$  which occur in I(1), and D be its global (=Frobenius-Perron) dimension. Then  $d_i$  are integers (by Proposition 8.27, since for  $X_i$  occuring in I(1),  $X_i|_{\mathcal{C}}$  lies in  $\mathcal{C}_{ad}$  by Proposition 5.4). Thus,  $D/d_i = m_i$  are (usual) integers by Proposition 3.3, and  $\sum_i [X_i|_{\mathcal{C}}:1] \frac{1}{m_i} = 1$ . The number of summands  $1/m_i$  here is  $\sum [X_i|_{\mathcal{C}}:1]$ , which is at most N by Proposition 5.6. By a classical argument of Landau (see [O3] and references therein), the number of such collections  $m_i$  is finite for any given N. On the other hand,  $m_0 = D$  (as  $X_0$  is the neutral object). Thus, D is bounded by some function of N. But for a given D, there are only finitely many fusion rings, and hence, by Ocneanu rigidity, finitely many fusion categories.

8.8. Group-theoretical fusion categories. An example of a fusion category with integer Frobenius-Perron dimensions is the category  $\mathcal{C}(G, H, \omega, \psi)$  associated to a quadruple  $(G, H, \omega, \psi)$ , where G is a finite group, H is a subgroup,  $\omega \in Z^3(G, \mathbb{C}^*)$  is a 3-cocycle,  $\psi \in C^2(H, \mathbb{C}^*)$  a 2-cochain such that  $d\psi = \omega|_H$  (see [O2]). Namely, let  $\text{Vec}_{G,\omega}$  be the category of finite dimensional G-graded vector spaces with associativity defined by  $\omega$ . Let  $\text{Vec}_{G,\omega}(H)$  be the subcategory of  $\text{Vec}_{G,\omega}$  of objects graded by H. Consider the twisted group algebra  $A = \mathbb{C}_{\psi}[H]$ . Since  $d\psi = \omega|_H$ , it is an associative algebra in this category. Then  $\mathcal{C}(G, H, \omega, \psi)$  is defined to be the category of A-bimodules in  $\text{Vec}_{G,\omega}$ .

Remark 8.39. If (*ω , ψ* ) is another pair of elements such that *ω* = *ω* + *dη, ψ* = *ψ* + *η*|<sup>H</sup> + *dχ*, *η* ∈ *C*2(*G,* C∗), *χ* ∈ *C*1(*H,* C∗), then C(*G, H, ω, ψ*) is equivalent to C(*G, H, ω , ψ* ). Thus, the categories C(*G, H, ω, ψ*) are parametrized by the set *S*(*G, H*) of equivalence classes of pairs (*ω, ψ*) under the above equivalence, which is a fibration over Ker(*H*3(*G,* C∗) → *H*3(*H,* C∗)) with fiber being a torsor over Coker(*H*2(*G,* C∗) → *H*2(*H,* C∗)).

Definition 8.40. A fusion category is said to be group-theoretical if it is of the form C(*G, H, ω, ψ*).

Remark 8.41. We note that there may be more than one way to represent a given fusion category in the form C(*G, H, ω, ψ*). In particular, *G* is not uniquely determined. However, |*G*| is uniquely determined, since it equals the global dimension of C(*G, H, ω, ψ*).

Group-theoretical fusion categories have the following simple characterization. Let us say that a fusion category D is pointed if all its simple objects are invertible. Any pointed fusion category has the form VecG,ω.

Proposition 8.42 ([O2]). A fusion category C is group-theoretical if and only if it is dual to a pointed category with respect to some indecomposable module category.

Corollary 8.43. Group-theoretical fusion categories have integer Frobenius-Perron dimensions of simple objects. In particular, they are pseudounitary.

Proof. This follows from Proposition 8.42, Theorem 8.35, and the fact that any invertible object has Frobenius-Perron dimension 1.

It is clear from the results of [O2] that the class of group-theoretical categories is closed under tensor product, taking the opposite category, and taking the dual category with respect to an indecomposable module category. Moreover, the following result shows that this class is also closed under taking a subcategory or a component of a quotient category.

Proposition 8.44. (i) A full fusion subcategory of a group-theoretical category is group-theoretical.

- (ii) A component in a quotient category of a group-theoretical category is group-theoretical.
- Proof. (i) Let C⊂D be fusion categories (C is a full subcategory), and let D be group-theoretical. Let M be an indecomposable module category over D such that D<sup>∗</sup> is VecG,ω. Then by Proposition 5.3, C<sup>∗</sup> is a quotient of VecG,ω. Let *I* label the component categories of C∗. It is clear that for each *g* ∈ *G* and

- $i \in I$  there exists a unique  $g(i) \in I$  such that the functor  $g \otimes$  is an equivalence  $C_{ir} \to C_{g(i)r}$  for each  $r \in I$ . So we have an action of G on I. Let  $j \in I$  and H be the stabilizer of j in G. For any  $g \in H$ , denote by  $\bar{g}_{jj}$  the projection of g to the fusion category  $C_{jj}^*$ . Then the assignment  $g \to \bar{g}_{jj}$  is a surjective tensor functor  $\text{Vec}_{H,\omega} \to C_{jj}^*$ . This functor must map invertible objects to invertible objects. Hence, all simple objects of  $C_{jj}^*$  are invertible, so  $C_{jj}^*$  is pointed, and hence C is group-theoretical (as it is dual to  $C_{jj}^*$  with respect to a module category).
- (ii) Let  $\mathcal{D}$  be group-theoretical,  $F: \mathcal{D} \to \mathcal{C}$  be surjective ( $\mathcal{C}$  is indecomposable), and  $\mathcal{C}_{ii}$  a component of  $\mathcal{C}$ . We need to show that  $\mathcal{C}_{ii}$  is group-theoretical. Let  $\mathcal{M}$  be an indecomposable module category over  $\mathcal{C}$ . It suffices to show that  $\mathcal{C}^*$  is group-theoretical, as  $\mathcal{C}^*$  is dual to  $\mathcal{C}_{ii}$  with respect to the  $i^{\text{th}}$  part of  $\mathcal{M}$ . But by Proposition 5.3,  $\mathcal{C}^*$  is embedded into  $\mathcal{D}^*$ , so it suffices to know that  $\mathcal{D}^*$  is group-theoretical, which follows by duality from the fact that  $\mathcal{D}$  is group-theoretical.
  - 8.9. A question. We think that the following question is interesting.

Question 8.45. Does there exist a finite dimensional semisimple Hopf algebra H whose representation category is not group-theoretical?

Remark 8.46. Hopf algebras with group-theoretical category of representations can be completely classified in group-theoretical terms (see [O2]). Therefore, a negative answer to Question 8.45 would provide a full classification of semisimple Hopf algebras.

Remark 8.47. The answer to Question 8.45 is "no" for triangular Hopf algebras, as follows from [EG3]. However, if the answer is "yes" in general, then it is "yes" already for quasitriangular Hopf algebras. Indeed, if Rep(D(H)) is group-theoretical then so is  $Rep(H) \otimes Rep(H^{*cop})$  (as a dual category to Rep(H)), from which it follows by Proposition 8.44 that so is Rep(H).

Remark 8.48. It is interesting that there exists a quasi-Hopf algebra H whose category of representations is not group-theoretical. Namely, recall that in [TY], there is a classification of fusion categories whose simple objects are elements of a group G and an additional object  $X = X^*$ , with fusion rules  $g \otimes X = X \otimes g = X, X \otimes X = \sum_{g \in G} g$  (and the usual multiplication rule in G). The result is that G must be abelian, and for each G the categories are parametrized by pairs (q, r) where q is a nondegenerate symmetric bilinear form on G with coefficients in  $\mathbb{C}^*$ , and r is a choice of  $\sqrt{|G|}$ . Let us denote such category by TY(G,q,r). It is clear that TY(G,q,r) is a representation category of a quasi-Hopf algebra (i.e. has integer Frobenius-Perron dimensions) if and only if |G| is a square. So let us take  $G = (\mathbb{Z}/p)^2$ , where p > 2 is a prime, and let q be given by  $q((x,y),(x,y)) = ax^2 - by^2$ , where  $a,b \in \mathbb{F}_p$  and a/b is a

quadratic nonresidue (i.e. the quadratic form  $ax^2 - by^2$  is elliptic). Then one can check by direct inspection that TY(G,q,r) is not group-theoretical. (We note that TY(G,q,r) is not a representation category of a Hopf algebra; on the other hand, if q is a hyperbolic form, then  $TY(G,q,+\sqrt{|G|})$  is a representation category of a Hopf algebra, but is group-theoretical.)

8.10. Cyclotomicity of dimension functions. The forgetful functor  $Z(\mathcal{C}) \to \mathcal{C}$  induces a homomorphism of rings  $F: K(Z(\mathcal{C})) \to K(\mathcal{C})$ . It is clear that the image of this map is contained in the center  $Z(K(\mathcal{C}))$  of the ring  $K(\mathcal{C})$ .

LEMMA 8.49. The map  $K(Z(\mathcal{C})) \otimes \mathbb{Q} \to Z(K(\mathcal{C})) \otimes \mathbb{Q}$  is surjective.

Proof. Recall that  $I: \mathcal{C} \to Z(\mathcal{C})$  denotes the induction functor, that is the left adjoint to the forgetful functor  $Z(\mathcal{C}) \to \mathcal{C}$ . We will denote the induced map  $K(\mathcal{C}) \to K(Z(\mathcal{C}))$  by the same letter. Let  $b_i$  be the basis of  $K(\mathcal{C})$ . We have by Proposition 5.4  $F(I(x)) = \sum_i b_i x b_i^*$  for any  $x \in K(\mathcal{C})$ . In particular for  $x \in Z(K(\mathcal{C}))$  we have  $F(I(x)) = x \sum_i b_i b_i^*$ . Finally note that the operator of multiplication by the element  $\sum_i b_i b_i^* \in Z(K(\mathcal{C}))$  is a self-adjoint positive definite operator  $K(\mathcal{C}) \to K(\mathcal{C})$  (with respect to the usual scalar product defined by  $(b_i, b_i^*) = \delta_{ij}$ ) and hence invertible. The lemma is proved.

Remark 8.50. In the special case C = Rep(H) for some Hopf algebra H Lemma 8.49 was proved in [KSZ, 6.3].

THEOREM 8.51. Let C be a fusion category over  $\mathbb{C}$  and let L be an irreducible representation of K(C). There exists a root of unity  $\xi$  such that for any object X of C one has  $Tr([X], L) \in \mathbb{Z}[\xi]$ .

*Proof.* First of all we can assume without loss of generality that the category  $\mathcal{C}$  is spherical. Indeed as explained in Proposition 5.14 we can construct a spherical fusion category  $\tilde{\mathcal{C}}$  which projects onto  $\mathcal{C}$ ; moreover the map  $K(\tilde{\mathcal{C}}) \to K(\mathcal{C})$  is surjective and the simple objects of  $\tilde{\mathcal{C}}$  map to the simple objects of  $\mathcal{C}$ .

Now let  $\mathcal{C}$  be spherical and let  $b_i$  be the basis of  $K(\mathcal{C})$ . The element  $e_L = \sum_i \operatorname{Tr}(b_i, L)b_i^*$  is proportional to a primitive central idempotent in  $K(\mathcal{C})$ , see e.g. [L] 19.2 (b). By Lemma 8.49 there exists a primitive central idempotent  $\tilde{e}_L \in K(Z(\mathcal{C}))$  such that  $e_L$  is proportional to  $F(\tilde{e}_L)$ . The element  $\tilde{e}_L$  can expressed in terms of S-matrix of the category  $Z(\mathcal{C})$ ; see e.g. [BaKi]. By Theorem 10.1 there exists a root of unity  $\xi$  such that the entries of S-matrix lie in  $\mathbb{Q}(\xi)$  and thus  $\tilde{e}_L \in K(Z(\mathcal{C})) \otimes \mathbb{Q}(\xi)$ . Hence  $e_L$  is proportional to some element of  $K(\mathcal{C}) \otimes \mathbb{Q}(\xi)$ . Now the coefficient of  $b_0 = 1 \in K(\mathcal{C})$  in  $e_L$  equals to  $\dim(L) \in \mathbb{Q}(\xi)$  and is nonzero. Hence  $e_L \in K(\mathcal{C}) \otimes \mathbb{Q}(\xi)$  and  $\operatorname{Tr}(b_i, L) \in \mathbb{Q}(\xi)$ . Obviously the number  $\operatorname{Tr}(b_i, L)$  is an algebraic integer and the ring of integers in  $\mathbb{Q}(\xi)$  is  $\mathbb{Z}[\xi]$ . The theorem is proved.

Remark 8.52. Again in the case when C = Rep(H) for some Hopf algebra H, Theorem 8.51 is proved in [KSZ, 6.3].

COROLLARY 8.53. Any irreducible representation of  $K(\mathcal{C})$  is defined over some cyclotomic field. In particular for any homomorphism  $\phi: K(\mathcal{C}) \to \mathbb{C}$  we have  $\phi(b_i) \in \mathbb{Q}[\xi]$  for some root of unity  $\xi$ .

*Proof.* Let  $\mathbb{Q}^{ab}$  be the field of all cyclotomic numbers. We already proved that  $K(\mathcal{C}) \otimes \mathbb{Q}^{ab}$  decomposes into direct sum of simple algebras (such decomposition is the same as the decomposition of  $1 \in K(\mathcal{C})$  into the sum of primitive central idempotents). Now it is well known that the Brauer group of  $\mathbb{Q}^{ab}$  is trivial. The result follows.

COROLLARY 8.54. Let C be a fusion category over  $\mathbb{C}$ . There exists a root of unity  $\xi$  such that for any object X of C one has  $\operatorname{FPdim}(X) \in \mathbb{Z}[\xi]$ .

8.11. Module categories over products. Let a, b be two algebraic integers. We say that a, b are coprime if there exist algebraic integers p, q such that pa + qb = 1.

PROPOSITION 8.55. Let C, D be nondegenerate fusion categories with coprime Frobenius-Perron dimensions. Then any indecomposable module category over  $C \otimes D$  is  $M \otimes N$ , where M is an indecomposable module category over C, and N over D.

Proof. Let  $\mathcal{B}$  be an indecomposable module category over  $\mathcal{C} \otimes \mathcal{D}$ . Let us restrict it to  $\mathcal{C}$ . We get  $\mathcal{B}|_{\mathcal{C}} = \bigoplus_i \mathcal{M}_i$ , where  $\mathcal{M}_i$  are indecomposable. Thus the action of  $\mathcal{D}$  on  $\mathcal{B}$  can be regarded as a tensor functor  $F: \mathcal{D} \to \bigoplus_{i,j} \operatorname{Fun}_{\mathcal{C}}(\mathcal{M}_i, \mathcal{M}_j)$ . Let  $\mathcal{D}'$  be the image of this functor, i.e. the category generated by subquotients of F(X). Then  $\mathcal{D}'$  is a multifusion category, which is indecomposable (as  $\mathcal{B}$  is indecomposable over  $\mathcal{C} \otimes \mathcal{D}$ ). Since the functor  $F: \mathcal{D} \to \mathcal{D}'$  is surjective, the Frobenius-Perron dimension d of any component category of  $\mathcal{D}'$  divides  $\operatorname{FPdim}(\mathcal{D})$ . On the other hand, each component category of  $\mathcal{D}'$  is a tensor subcategory in  $\operatorname{Fun}_{\mathcal{C}}(\mathcal{M}_i, \mathcal{M}_i)$  for some i. The latter is a dual category to  $\mathcal{C}$ , so it has the same Frobenius-Perron dimension as  $\mathcal{C}$ . Hence, d must divide  $\operatorname{FPdim}(\mathcal{C})$ . Thus, d=1 by the coprimeness condition. Hence  $\mathcal{D}' = A - \operatorname{bimod}$ , where A is a semisimple algebra, and furthermore, all  $\mathcal{M}_i$  are equivalent to a single module category  $\mathcal{M}$ . The functor  $F: \mathcal{D} \to \mathcal{D}'$  defines a module category  $\mathcal{N}$  over  $\mathcal{D}$ , and it is clear that  $\mathcal{B} = \mathcal{M} \otimes \mathcal{N}$ . We are done.  $\square$ 

Example. Let  $C_h$  be the fusion category associated to the quantum group  $U_q(so_3)$  for  $q=e^{\pi i/h}$ . The Frobenius-Perron dimension of this category is  $d(h)=\frac{h}{4\sin^2(\pi/h)}$  (this follows from [BaKi, (3.3.9)]). The denominator of this

fraction is an algebraic integer. Thus, our result implies that if *h*<sup>i</sup> are pairwise coprime then any indecomposable module category over *⊗*iCh*<sup>i</sup>* is the product of those over Ch*<sup>i</sup>* .

## **9. Fusion categories in positive characteristic**

In this section we will consider fusion and multi-fusion categories over an algebraically closed field *k* of positive characteristic *p*. We will show that many of the results of the previous sections continue to hold in this case after very minor modifications.

9.1. List of modifications. Fusion and multi-fusion categories in characteristic *p* are defined in the same way as in charactersitic zero. Below we will describe the modifications which need to be made to validate the statements from the previous sections in this case.

Section 2. The statements of subsections 2.1, 2.2 which make sense generalize without changes, except the last statement of Theorem 2.3, which claims that the global dimension of a fusion category is nonzero. This is in fact false in positive characteristic. For example, if *G* is a finite group whose order is divisible by *p*, then the category of modules over the function algebra Fun(*G, k*) is a fusion category of global dimension |*G*| = 0. This is the main difference between the zero and positive characteristic case. To deal with this difference, we introduce the following definition.

Definition 9.1. A fusion category over *k* is said to be nondegenerate if its global dimension is nonzero. An indecomposable multi-fusion category is nondegenerate if at least one of its component categories is nondegenerate. A multi-fusion category is nondegenerate if all its indecomposable parts are nondegenerate. A regular semisimple weak Hopf algebra over *k* is nondegenerate if its category of representations is a nondegenrate multi-fusion category.

Theorems 2.15, 2.16, 2.18 remain valid if the category C is nondegenerate. Proposition 2.17 remains true without any additional conditions.

In Section 2.5 (and at other places throughout), the algebra *R* has to be chosen in such a way that its block sizes are not divisible by *p* (since only such algebras admit a symmetric separability idempotent). Theorem 2.20 is valid for such *R*. Corollary 2.22 and Theorem 2.24 also remain valid. Theorem 2.26 is valid for nondegenerate weak Hopf algebras.

Theorems 2.27, 2.28, 2.30, 2.31, and Corollary 2.35 remain valid for nondegenerate categories. More precisely, in Theorems 2.27, 2.31 one only needs nondegeneracy of the category C.

Remark 9.2. We note that the nondegeneracy condition is essential. For example, if *A* is the Hopf algebra Fun(*G, k*), where the order of *G* is divisible by *p*, then Theorem 2.15 is false for Rep(*A*), and Theorem 2.26 is false for *A*. Similarly, Theorem 2.27 is false for Rep(*A*) and the identity functor, since the corresponding cohomology is *H*<sup>i</sup> (*G, k*), which may be nonzero if the order of *G* is divisible by *p*. However, we do not know a counterexample to Theorem 2.28 in positive characteristic.

Sections 3–7. While Section 3 makes no sense in positive characteristic, the material of Section 4 generalizes without changes, as long as one considers regular weak Hopf algebras. The only change in Section 5 is that one should always choose nonzero block sizes for the algebra *R* (except subsections 5.8,5.9 where the characteristic should be zero). Theorems 6.3 and 7.5 are valid for nondegenerate weak Hopf algebras.

Section 8. The results of Section 8.1 generalize without changes, since they have nothing to do with the characteristic of the ground field. So do the results of Section 8.2, except Proposition 8.12, Corollary 8.14, and Proposition 8.15, which are valid for nondegenerate categories. Finally, let us point out that Theorem 8.33 is valid in positive characteristic.

Example. A semisimple Hopf algebra *H* is nondegenerate if and only if it is cosemisimple. Indeed, if *H* is nondegenerate, then so is Rep(*H*), and hence *H*<sup>∗</sup> is semisimple, since Rep(*H*∗op) is a dual category to Rep(*H*). Conversely, if *H* is cosemisimple, then Tr(*S*2) = 0 ([LR1]), so the global dimension of Rep(*H*) is nonzero, and *H* is nondegenerate.

9.2. Lifting theorems. In this subsection we will show that a nondegenerate multi-fusion category over a field of characteristic *p*, and a tensor functor between such categories, can be lifted to characteristic zero. It is an analog of the result of [EG1], where this was shown for semisimple cosemisimple Hopf algebras and morphisms between them.

First of all, we need to define fusion categories over any commutative ring. To do this, recall that a fusion category over a field *k* can be regarded as a collection of finite dimensional vector spaces *H*<sup>k</sup> ij = Hom(*X*<sup>i</sup> ⊗ *X*<sup>j</sup> *, X*k) (multiplicity spaces), together with a collection of linear maps between tensor products of these spaces (associativity morphism, evaluation, coevaluation morphisms), satisfying some equations (axioms of a rigid tensor category). Now let *R* be a commutative ring with unit, and define a fusion category over *R* to be a collection of free finite rank *R*-modules *H*<sup>k</sup> ij together with a collection of module homomorphisms satisfying the same equations.

Tensor functors between fusion categories over *k* can be defined in similar terms, as collections of linear maps satisifying algebraic equations; this allows one to define tensor functors over *R* in an obvious way.

Now let *W*(*k*) be the ring of Witt vectors of *k*. Let *I* be the maximal ideal in *W*(*k*) generated by *p*. If C is a fusion category over *k*, then a lifting of C to *W*(*k*) is a fusion category C˜ over *W*(*k*), together with an equivalence C˜*/I* → C, where  $\mathcal{C}/I$  is the reduction of  $\mathcal{C}$  modulo p. In a similar way one defines a lifting of a module category and, more generally, a lifting of a tensor functor.

Theorem 9.3. A nondegenerate multi-fusion category C over k admits a unique lifting to W(k). Moreover, a tensor functor F between nondegenerate fusion categories C, C' over k admits a unique lifting to W(k). In particular, a module category over a nondegenerate multi-fusion category C has a unique lifting to W(k).

*Proof.* The theorem follows from the facts that  $H^3(\mathcal{C}) = 0, H^4(\mathcal{C}) = 0,$   $H_F^2(\mathcal{C}) = 0, H_F^3(\mathcal{C}) = 0$ , proved in Section 7, in the same way as in [EG1].  $\square$ 

COROLLARY 9.4. A nondegenerate braided (symmetric) fusion category over k is uniquely liftable to a braided (resp. symmetric) fusion category over W(k).

*Proof.* A braiding on  $\mathcal{C}$  is the same as a splitting  $\mathcal{C} \to Z(\mathcal{C})$  of the tensor functor  $Z(\mathcal{C}) \to \mathcal{C}$ . By Theorem 9.3, such splitting is uniquely liftable. Hence, a braiding on  $\mathcal{C}$  is uniquely liftable.

Now let us prove the result in the symmetric case. A braiding gives rise to a categorical equivalence  $B: \mathcal{C} \to \mathcal{C}^{\text{op}}$ . A braiding is symmetric if and only if the composition of two categorical equivalences B and  $B^{21}$  is the identity. Thus, the corollary follows from Theorem 9.3.

Remark 9.5. Corollary 9.4 is false for degenerate categories. For example, let  $\tilde{\mathcal{C}}$  be the fusion category corresponding to the quantum group  $U_q(\mathrm{sl}_2)$  at  $q=e^{\pi i/p}$ , where p is an odd prime. This category is known to have semisimple reduction to  $\bar{\mathbb{F}}_p$ , which is symmetric. However, this reduction does not lift to a symmetric category, since it has noninteger Frobenius-Perron dimensions. This example also shows that there exist semisimple and cosemisimple triangular weak Hopf algebras over k which do not come from group algebras. For usual Hopf algebras, this is impossible (see [EG3]).

9.3. Faithfulness of lifting. In this section we will show that the lifting procedure of nondegenerate fusion (braided, symmetric) categories is faithful, i.e. if two such categories over k have equivalent liftings, then they are equivalent. We will also show that if two tensor functors from a nondegenerate fusion category over k to another fusion category have isomorphic liftings, then they are isomorphic.

Let R be a complete local ring,  $\mathbb{F}$  the fraction field of  $R, I \subset R$  the maximal ideal, and and k = R/I the residue field.

THEOREM 9.6. (i) Let  $C_1, C_2$  be fusion categories defined over R, such that the fusion categories  $C_1/I$ ,  $C_2/I$  are nondegenerate, and the categories

C<sup>1</sup> ⊗<sup>R</sup> F*,* C<sup>1</sup> ⊗<sup>R</sup> F are tensor equivalent. Then C1*,* C<sup>2</sup> (and hence C1*/I,* C2*/I*) are tensor equivalent.

(ii) The same statement is valid for braided and symmetric fusion categories.

Proof. (i) Pick a tensor equivalence *E* : C<sup>1</sup> ⊗<sup>R</sup> F → C<sup>1</sup> ⊗<sup>R</sup> F. Now pick an equivalence of C1, C<sup>2</sup> as additive categories, which is the same as *E* at the level of isomorphism classes of objects. By doing this, we may assume without loss of generality that C<sup>1</sup> and C<sup>2</sup> are really one category (C*,* ⊗) with two different associativity isomorphisms Φ1*,* Φ<sup>2</sup> ∈ *C*3(C) and evaluation maps ev1*,* ev<sup>2</sup> (the coevaluation maps of simple objects of both categories may be identified with any fixed collection of such maps by renormalization).

We know that there exists an invertible element *J* of *C*2(C)⊗<sup>R</sup> F such that (Φ1*,* ev1)<sup>J</sup> = (Φ2*,* ev2) (where <sup>J</sup> denotes the twisting by *J*). Our job is to show that such *J* can be found in *C*2(C), without localization to F.

Consider the affine group scheme *T* (defined over *R*) of all invertible elements of *C*2(C). Let *T*<sup>0</sup> be the subscheme of *T* consisting of "trivial" twists, i.e. those of the form ∆(*x*)(*x*−<sup>1</sup> ⊗ *x*−1), where *x* is an invertible element of *C*1(C) (i.e. the center of C). It is clear that *T*<sup>0</sup> is central in *T*.

Remark. Since the algebra *C*2(C) is a direct sum of matrix algebras (split over *R*), *T* is a direct product of general linear groups.

Let *Z* be the affine scheme of all invertible associators Φ ∈ *C*3(C) and collections of evaluation morphisms ev satisfying (together with the fixed coevaluation morphisms) the axioms for a rigid tensor category (i.e. the pentagon relation, the unit object axiom, and the duality axioms). The group scheme *T* acts on *Z* by twisting (and then renormalizing the coevaluations to be the fixed ones): (Φ*,* ev) → (Φ*,* ev)<sup>J</sup> . The restriction of this action to *T*<sup>0</sup> is trivial, so we get an action of *T /T*<sup>0</sup> on *Z*. Consider the regular mapping *φ* : *T /T*<sup>0</sup> → *Z*, given by *J* → (Φ1*,* ev1)<sup>J</sup> .

Lemma 9.7.The mapping *φ* is finite.

Proof. By Nakayama's lemma, it is sufficient to check the finiteness of the reduction *φ*|<sup>k</sup> of *φ* modulo *I*.

First of all, we have *H*2(C1*/I*) = 0, which implies that the stabilizer of (Φ1*,* ev1) in *T /T*<sup>0</sup> is a finite group. Thus the map *φ*|<sup>k</sup> : *T /T*<sup>0</sup> → *φ*|k(*T /T*0) is a finite covering.

It remains to show that *φ*|k(*T /T*0) is closed in *Z*. To do this, consider its closure *Z* . Points of *Z* represent fusion categories over *k*, all of which are nondegenerate. Indeed, the global dimension is a regular (in fact, locally constant) function on *Z*, and it is nonzero on C1*/I*, so it must be nonzero for all points of *Z* . But for a nondegenerate fusion category D over *k* we have  $H^3(\mathcal{D}) = 0$ , which implies that the action of  $T/T_0$  on Z' is locally transitive. This means that Z' is in fact a single orbit of  $T/T_0$ , i.e.  $\phi|_k(T/T_0)$  is closed. The lemma is proved.

Thus we have a homomorphism  $\phi^*: R[Z] \to R[T/T_0]$ , which makes  $R[T/T_0]$  into a finitely generated R[Z]-module.

Now let  $J \in (T/T_0)(\mathbb{F})$  be such that  $(\Phi_1, \operatorname{ev}_1)^J = (\Phi_2, \operatorname{ev}_2)$ . Thus, J can be regarded as a homomorphism  $J : R[T/T_0] \to \mathbb{F}$ . This homomorphism satisfies the condition  $J(af) = \gamma(a)J(f), f \in R[T/T_0], a \in R[Z]$ . where  $\gamma : R[Z] \to R$  corresponds to the point  $(\Phi_2, \operatorname{ev}_2)$ . Now, by Lemma 9.7, for any  $f \in R[T/T_0]$  there exist  $b_1, \ldots, b_n \in R[Z]$  such that  $f^n + b_1 f^{n-1} + \cdots + b_n = 0$ . But then  $J(f)^n + \gamma(b_1)J(f)^{n-1} + \cdots + \gamma(b_n) = 0$ . Now, since  $\gamma(b_i)$  are integers, we see that J(f) is an integer, so J in fact belongs to  $(T/T_0)(R)$ . But it is easy to see that the map  $T(R) \to (T/T_0)(R)$  is surjective. Hence, there exists  $J \in T(R)$  such that  $(\Phi_1, \operatorname{ev}_1)^J = (\Phi_2, \operatorname{ev}_2)$ , as desired. The theorem is proved.

(ii) The proof is the same, since, as we showed, the integrality of  $J \in T/T_0$  follows already from the equation  $(\Phi_1, \operatorname{ev}_1)^J = (\Phi_2, \operatorname{ev}_2)$ .

THEOREM 9.8. Let C, C' be fusion categories defined over R, such that the fusion category C/I is nondegenerate. Let  $F_1, F_2 : C \to C'$  be tensor functors, which become isomorphic after tensoring with  $\mathbb{F}$ . Then  $F_1, F_2$  (and hence their reductions modulo I) are isomorphic.

*Proof.* The proof is analogous to the proof of Theorem 9.6. As in Theorem 9.6, we may assume that  $F_1 = F_2 = F$  as additive functors, with two different tensor structures  $J_1, J_2$ . Let G be the group scheme of invertible elements of  $C_F^1(\mathcal{C})$ . Let S be the scheme of tensor structures on F. The group scheme G naturally acts on S by "gauge transformations",  $J \to J^g$ . We know there exists  $g \in G(\mathbb{F})$  such that  $J_1^g = J_2$ , and need to show that this g is in fact in G(R).

Using the fact that  $H_F^1(\mathcal{C}) = H_F^2(\mathcal{C}) = 0$ , one finds that the action map  $\chi: G \to S$  given by  $g \to J_1^g$  is finite. Now the proof that  $g \in G(R)$  runs analogously to the proof that  $J \in (T/T_0)(R)$  in Theorem 9.6. Theorem 9.8 is proved.

Now let K be the algebraic closure of the field of quotients of W(k).

COROLLARY 9.9. (i) If two nondegenerate fusion (braided, symmetric) categories over k have equivalent liftings to K, then they are equivalent.

(ii) If two tensor functors between nondegenerate fusion categories over k have isomorphic liftings to K, then they are isomorphic.

*Proof.* (i) follows easily from Theorem 9.6, (ii) from Theorem 9.8.

To give the next corollary, recall that in [EG1] it was proved that a semisimple cosemisimple Hopf algebra over *k* has a unique lifting to *K*. In fact, this is a special case of the lifting theory developed in this paper, since a semisimple cosemisimple Hopf algebra is nothing but a pair (C*, F*), where C is a nondegenerate fusion category over *k*, and *F* a fiber functor on C.

Corollary 9.10. If two semisimple cosemisimple Hopf algebras over *k* have isomorphic liftings to *K* then they are isomorphic.

Proof. We can regard these two Hopf algebras as pairs (C1*, F*1) and (C2*, F*2). By theorem 9.9(i), we can assume that C<sup>1</sup> = C2; then by Theorem 9.9(ii), *F*<sup>1</sup> is isomorphic to *F*2. The corollary is proved.

The same theorem applies to quasitriangular, triangular Hopf algebras. The proof is parallel.

9.4. Some applications of lifting.

Corollary 9.11. Let C be a nondegenerate fusion category over *k*. Then its Frobenius-Perron dimension ∆ is not divisible by *p*.

Remark 9.12. We do not know if the converse statement is true. For Hopf algebras the converse statement is the well-known conjecture that if *H* is a semisimple Hopf algebra whose dimension is not divisible by *p* then *H* is cosemisimple.

Proof. Assume that ∆ is divisible by *p*. Let C˜ be the lifting of C, and Cˆ = C ⊗˜ <sup>W</sup>(k) *K*, where *K* is the algebraic closure of the field of fractions of *W*(*k*). Then by Theorem 8.22, the global dimension *D* of Cˆ is divisible by ∆, hence by *p*. So the global dimension of C is zero. Contradiction.

Corollary 9.13. Let D be a nondegenerate fusion category over *k*, and C be a full subcategory of D of integer Frobenius-Perron dimension *N*. Then C is nondegenerate.

Remark 9.14. We do not know if this result is valid without assuming that *N* is an integer.

Proof. Consider the lifting D˜ of D. This lifting necessarily contains a lifting C˜ of C. Consider the corresponding categories Cˆ, Dˆ over the algebraically closed field *K* of zero characteristic. Let *D* be the global dimension of Dˆ, ∆ its Frobenius-Perron dimension. Then *D* is divisible by ∆ by Proposition 8.22. Also, the Frobenius-Perron dimension of Cˆ is *N* (an integer), hence it is equal to the global dimension of Cˆ by Proposition 8.24. But by Theorem 8.15, *N* divides ∆, and hence *D*. But *D* is not divisible by *p*, hence *N* is not divisible by *p*. Thus, C is nondegenerate, as desired.

#### 10. Appendix: Galois properties of S-matrix

The remarkable result due to J. de Boere, J. Goeree, A. Coste and T. Gannon states that the entries of the S-matrix of a semisimple modular category lie in a cyclotomic field, see [dBG, CG]. This result is used in Section 8. For the reader's convenience in this Appendix we reproduce a proof of this result.

THEOREM 10.1. Let  $S = (s_{ij})_{i,j \in I}$  be the S-matrix of a modular fusion category C. There exists a root of unity  $\xi$  such that  $s_{ij} \in \mathbb{Q}(\xi)$ .

*Proof.* Let  $\{X_i\}_{i\in I}$  be the representatives of isomorphism classes of simple objects of  $\mathcal{C}$ ; let  $0\in I$  be such that  $X_0$  is the unit object of  $\mathcal{C}$  and the involution  $i\mapsto i^*$  of I be defined by  $X_i^*\cong X_{i^*}$ .

By the definition of modularity, any homomorphism  $f: K(\mathcal{C}) \to \mathbb{C}$  is of the form  $f([X_i]) = s_{ij}/s_{0j}$  for some well defined  $j \in I$ . Hence for any automorphism g of  $\mathbb{C}$  one has  $g(s_{ij}/s_{0j}) = s_{ig(j)}/s_{0g(j)}$  for a well-defined action of g on I.

Now we are going to use the following identities (see [BaKi]):

- (i)  $\sum_{i} s_{ij} s_{jk} = \delta_{ik^*}$ ;
- (ii)  $s_{ij} = s_{ji}$ ;
- (iii)  $s_{0i^*} = s_{0i} \neq 0$ .

Thus,  $\sum_j s_{ij} s_{ji^*} = 1$  and hence  $(1/s_{0i})^2 = \sum_j (s_{ji}/s_{0i})(s_{ji^*}/s_{0i^*})$ . Applying the automorphism g to this equation we get

(36) 
$$g(\frac{1}{s_{0i}^2}) = g(\sum_j \frac{s_{ji}}{s_{0i}} \frac{s_{ji^*}}{s_{0i^*}}) = \sum_j \frac{s_{jg(i)}}{s_{0g(i)}} \frac{s_{jg(i^*)}}{s_{0g(i)}} = \frac{\delta_{g(i)g(i^*)^*}}{s_{0g(i)}s_{0g(i^*)}}.$$

It follows that  $g(i^*) = g(i)^*$  and  $g((s_{0i})^2) = (s_{0g(i)})^2$ . Hence

$$g((s_{ij})^2) = g((s_{ij}/s_{0j})^2 \cdot (s_{0j})^2) = (s_{ig(j)})^2.$$

Thus  $g(s_{ij}) = \pm s_{ig(j)}$ . Moreover the sign  $\epsilon_g(i) = \pm 1$  such that  $g(s_{0i}) = \epsilon_g(i)s_{0g(i)}$  is well defined since  $s_{0i} \neq 0$ , and  $g(s_{ij}) = g((s_{ij}/s_{0j})s_{0j}) = \epsilon_g(j)s_{ig(j)} = \epsilon_g(i)s_{g(i)j}$ . In particular, the extension L of  $\mathbb{Q}$  generated by all entries  $s_{ij}$  is finite and normal, that is Galois extension.

Now let h be another automorphism of  $\mathbb{C}$ . We have

$$gh(s_{ij}) = g(\epsilon_h(j)s_{ih(j)}) = \epsilon_g(i)\epsilon_h(j)s_{g(i)h(j)}$$

and

$$hg(s_{ij}) = h(\epsilon_g(i)s_{q(i)j}) = \epsilon_h(j)\epsilon_g(i)s_{q(i)h(j)} = gh(s_{ij})$$

and the Galois group of L over  $\mathbb{Q}$  is abelian. Now the Kronecker-Weber theorem (see e.g. [Ca]) implies the result.

Massachusetts Institute of Technology, Cambridge, MA

*E-mail address*: etingof@math.mit.edu

University of New Hampshire, Durham, NH*E-mail address*: nikshych@math.unh.edu

University of Oregon, Eugene, OR*E-mail address*: vostrik@darkwing.uoregon.edu

#### References

- [BaKi] B. Bakalov and A. Kirillov Jr., Lectures on tensor categories and modular functors, *University Lecture Series* **21** A.M.S., Providence, RI (2001).
- [BNSz] G. Bohm, F. Nill ¨ , and K. Szlachanyi ´ , Weak Hopf algebras I. Integral theory and *C*∗-structure, *J. Algebra* **221** (1999), 385–438.
- [BWa] E. Blanchard and A. Wassermann, private communication.
- [BW] J. Barrett and B. Westbury, Spherical categories, *Adv. Math*. **143** (1999), 357– 375.
- [Ca] J. W. Cassels, *Local Fields*, *London Math. Soc. Student Texts* **3**, Cambridge Univ. Press, Cambridge (1986).
- [CE] P. Etingof and D. Calaque, Lectures on tensor categories; math.QA/0401246.
- [CG] A. Coste and T. Gannon, Remarks on Galois symmetry in rational conformal field theories, *Phys. Lett. B* **323** (1994), 316–321.
- [CY] L. Crane and D. Yetter, Deformations of (bi)tensor categories, *Cahiers de Topologie G´eom. Diff´erentielle Cat´eg*. **39** 1998, 163–180.
- [Da] A. Davydov, Twisting of monoidal structures; q-alg/9703001, preprint MPI 95-123.
- [dBG] J. de Boer and J. Goeree, Markov traces and II<sup>1</sup> factors in conformal field theory, *Comm. Math. Phys*. **139** (1991), 267–304.
- [DMS] P. Di Francesco, P. Mathieu, and D. Senechal, *Conformal Field Theory*, *Grad. Texts in Contemp. Physics*, Springer-Verlag, New York (1997).
- [EG1] P. Etingof and S. Gelaki, On finite-dimensional semisimple and cosemisimple Hopf algebras in positive characteristic, *Internat. Math. Res. Notices* **(1998)**, no. 16, 851–864.
- [EG2] ———, Some properties of finite-dimensional semisimple Hopf algebras, *Math. Res. Lett.* **5** (1998), 191–197.
- [EG3] ———, The classification of triangular semisimple and cosemisimple Hopf algebras over an algebraically closed field, *Internat. Math. Res. Notices* **(2000)**, no. 5, 223– 234.
- [EG4] ———, *On families of triangular Hopf algebras*, *Internat. Math. Res. Notices* **(2002)**, no. 14, 757–768.
- [FK] J. Frohlich ¨ and T. Kerler, *Quantum Groups*, *Quantum Categories and Quantum Field Theory*, *Lecture Notes in Math*. **1542**, Springer-Verlag, New York, 1993.
- [Ga] F. R. Gantmacher, *The Theory of Matrices*, A.M.S. Chelsea Publishing, Providence, RI (1998).
- [HN] F. Hausser and F. Nill, Doubles of quasi-quantum groups, *Comm. Math. Phys*, **199** (1999), 547-589.
- [H] T. Hayashi, A canonical Tannaka duality for finite semisimple tensor categories, preprint (1999); math.QA/9904073.

- [IK] M. Izumi and H. Kosaki, On a subfactor analogue of the second cohomology, *Rev. Math. Phys*. **14** (2002), 733–737.
- [Ka] G. K. Kac, Certain arithmetic properties of ring groups (Russian), *Funkcional. Anal. i Priloˇzen* **6** (1972), 88–90.
- [K] Ch. Kassel, *Quantum Groups*, *Grad. Texts in Math*. **155**, Springer-Verlag, New York, 1995.
- [KSZ] Y. Kashina, Y. Sommerhaeuser, and Y. Zhu, On higher Frobenius-Schur indicators, preprint (2003); math.RA/0311199.
- [LR1] R. Larson and D. Radford, Finite-dimensional cosemisimple Hopf algebras in characteristic 0 are semisimple, *J. Algebra* **117** (1988), 267–289.
- [LR2] ———, Semisimple cosemisimple Hopf algebras, *Amer. J. Math*. **110** (1988), 187– 195.
- [L] G. Lusztig, *Hecke Algebras with Unequal Parameters*, *CRM Monograph Series* **18**, A.M.S., Providence, RI (2003).
- [Ma] A. Masuoka, The *p<sup>n</sup>* theorem for semisimple Hopf algebras, *Proc. Amer. Math. Soc*. **124** (1996), 735–737.
- [M] S. Montgomery, *Hopf Algebras and Their Actions on Rings*, *CBMS Regional Conference Series in Mathematics* **82**, A.M.S., Providence, RI (1993).
- [Mu1] M. Muger ¨ , From subfactors to categories and topology I. Frobenius algebras in and Morita equivalence of tensor categories, *J. Pure Appl. Algebra* **180** (2003), 81–157.
- [Mu2] ———, From subfactors to categories and topology II, The quantum double of tensor categories and subfactors, *J. Pure Appl. Algebra* **180** (2003), 159–219.
- [N] D. Nikshych, On the structure of weak Hopf algebras, *Adv. Math*. **170** (2002), 257–286.
- [NTV] D. Nikshych, V. Turaev, and L. Vainerman, Invariants of knots and 3-manifolds from quantum groupoids, *Proc. of the Pacific Institute for the Mathematical Sciences Workshop* "*Invariants of Three-Manifolds*" (Calgary, AB, 1999), *Topology Appl*. **127** (2003), 91–123.
- [NV] D. Nikshych and L. Vainerman, Finite quantum groupoids and their applications, in *New Directions in Hopf Algebras*, *MSRI Publications* **43**, 211–262, Cambridge Univ. Press, Cambridge, 2002.
- [NZ] W. D. Nichols and M. B. Zoeller, A Hopf algebra freeness theorem, *Amer. J. Math*. **111** (1989), 381–385.
- [O1] V. Ostrik, Module categories, weak Hopf algebras and modular invariants, *Transform. Groups* **8** (2003), 177–206.
- [O2] ———, Module categories over the Drinfeld double of a finite group, *Internat. Math. Res. Notices* (**2003**), no. 27, 1507–1520.
- [O3] ———, Fusion categories of rank 2, *Math. Res. Lett.* **10** (2003), 177–183.
- [R1] D. Radford, The order of the antipode of a finite dimensional Hopf algebra is finite, *Amer. J. Math*. **98** (1976), 333–355.
- [R2] ———, On the antipode of a quasitriangular Hopf algebra, *J. Algebra* **151** (1992), 1–11.
- [S] D. Stefan, The set of types of *n*-dimensional semisimple and cosemisimple Hopf algebras is finite, *J. Algebra* **193** (1997), 571–580.
- [Scha] P. Schauenburg, A quasi-Hopf algebra freeness theorem, *Proc. Amer. Math. Soc*. **132** (2004), 965–972.

- [Sch] H.-J. Schneider, Finiteness results for semisimple Hopf algebras, preprint.
- [Sz] K. Szlachanyi ´ , Finite quantum groupoids and inclusions of finite type, in *Mathematical Physics in Mathematics and Physics* (Siena, 2000), 393–407, *Fields Inst. Commun*. **30**, A. M. S., Providence, RI (2001).
- [TY] D. Tambara and S. Yamagami, Tensor categories with fusion rules of self-duality for finite abelian groups, *J. Algebra* **209** (1998), 692–707.
- [V] P. Vecsernyes´ , Larson-Sweedler theorem and the role of grouplike elements in weak Hopf algebras, *J. Algebra* **270** (2003), 471–520.
- [Wa] A. Wassermann, Quantum subgroups and vertex algebras, talk given at MSRI; http://www.msri.org/publications/ln/msri/2000/subfactors/wassermann/1/.
- [Y1] D. Yetter, *Braided deformations of monoidal categories and Vassiliev invariants*, in *Higher Category Theory* (Evanston, IL, 1997), *Contemp. Math*. **230**, 117–134, A.M.S., Providence, RI (1998).
- [Y2] ———, Abelian categories of modules over a (Lax) monoidal functor, *Adv. Math*. **174** (2003), 266–309.
- [Zhu] Y. Zhu, Hopf algebras of prime dimension, *Internat. Math. Res. Notices* (**1994**), no. 1, 53–59.

(Received March 19, 2002)