### 3. Unitary fusion categories

We write  $c \in \mathcal{C}$  to denote an object of a category  $\mathcal{C}$ , and we write  $\mathcal{C}(a \to b)$  for the set of morphisms from a to b. We assume the isomorphism classes of our category form a set.

**Definition 3.0.1.** We call a category  $\mathcal{C}$  linear if it is enriched in finite dimensional complex vector spaces. This means that  $\mathcal{C}(a \to b)$  is a finite dimensional complex vector space for each  $a, b \in \mathcal{C}$ , and pre- and post-composition by any composable morphism in  $\mathcal{C}$  is a linear operation. In other words, the composition operation

$$-\circ_{\mathcal{C}} - : \mathcal{C}(b \to c) \otimes \mathcal{C}(a \to b) \longrightarrow \mathcal{C}(a \to c)$$
 given by  $q \otimes f \mapsto q \circ f$ 

is a linear map.

A functor  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$  between linear categories is called *linear* if it is linear on hom spaces, i.e., for all  $f, g \in \mathcal{C}(a \to b)$  and  $\lambda \in \mathbb{C}$ ,  $\mathcal{F}(\lambda f + g) = \lambda \mathcal{F}(f) + \mathcal{F}(g)$ .

Two linear categories  $\mathcal{C}, \mathcal{D}$  are equivalent if there are linear functors  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$  and  $\mathcal{G}: \mathcal{D} \to \mathcal{C}$  such that  $\mathcal{F} \circ \mathcal{G} \cong \mathrm{id}_{\mathcal{D}}$  and  $\mathcal{G} \circ \mathcal{F} \cong \mathrm{id}_{\mathcal{C}}$ .

Unless stated otherwise, all categories and functors in this section are linear.

**Example 3.0.2.** Let A be a unital finite dimensional complex algebra. The category BA, called the *delooping* of A, has one object  $\star$  and  $End(\star) := A$ . In this sense, one should think of a linear category as an algebra with more than one object.

<span id="page-0-0"></span>**Example 3.0.3.** Let S be a set. The category  $\mathsf{Vec}_{\mathsf{fd}}(S)$  has objects finite dimensional S-graded complex vector spaces  $V = \bigoplus_{s \in S} V_s$  and grading-preserving linear maps, i.e., if  $T: V \to W$ , then  $T(V_s) \subset W_s$ .

**Example 3.0.4.** Let G be a finite group. The category  $\operatorname{\mathsf{Rep}}(G)$  has objects pairs  $(V,\pi)$  where V is a finite dimensional complex vector space and  $\pi:G\to GL(V)$  is a homomorphism, where GL(V) denotes the group of invertible linear transformations. The morphisms are G-equivariant maps, i.e.,  $T:(V,\pi)\to (W,\rho)$  is a linear map  $T:V\to W$  such that  $T\pi_g=\rho_gT$  for all  $g\in G$ .

<span id="page-0-1"></span>**Example 3.0.5.** Let  $d \in \mathbb{C}$ . The category  $\mathsf{TLJ}(d)$  has objects  $n \in \mathbb{N} = \{0, 1, 2, \ldots\}$  and  $\mathsf{TLJ}(m \to n)$  consists of complex linear combinations of Kauffman diagrams with m boundary points on the bottom and n boundary points on the top. For example, the basis for  $\mathsf{TLJ}(d)(4 \to 2)$  is given by

$$\left\{ \left[ \left[ \left[ \left[ \left[ \left[ \left[ \left[ \left[ \left[ \left[ \left[ \left[$$

Composition is given by the usual stacking of diagrams and bubble popping relation.

3.1. Cauchy complete linear categories and semisimplicity. In this section, unless stated otherwise, C denotes a linear category.

**Definition 3.1.1.** Given a finite collection of objects  $c_1, \ldots, c_n$ , an object  $\bigoplus_{i=1}^n c_i$  with morphisms  $\iota_j : c_j \to \bigoplus_{i=1}^n c_i$  and  $\pi_j : \bigoplus_{i=1}^n c_i \to c_j$  is called the *direct sum* of  $c_1, \ldots, c_n$  if  $(\oplus 1)$   $\pi_i \circ \iota_j = \delta_{i=j} \operatorname{id}_{c_j}$  for all  $i, j = 1, \ldots, n$ , and

$$(\oplus 2) \sum_{j=1}^{n} \iota_j \circ \pi_j = \mathrm{id}_{\bigoplus_{i=1}^{n} c_i}.$$

Observe there is a canonical isomorphism

<span id="page-1-0"></span>
$$\mathcal{C}\left(\bigoplus_{i=1}^{n} c_i \to \bigoplus_{j=1}^{n} c_j\right) \cong \bigoplus_{i,j=1}^{n} \mathcal{C}(c_j \to c_i) \quad \text{given by} \quad f \mapsto (f_{ij} := \pi_i \circ f \circ \iota_j), \quad (3.1.2)$$

where the direct sum on the right hand side is in the category of  $\mathbb{C}$  vector spaces. The right hand side carries the obvious matrix-multiplication composition.

**Exercise 3.1.3.** Suppose that  $(\bigoplus_{i=1}^n c_i, (\iota_j)_{j=1}^n, (\pi_j)_{j=1}^n)$  is the direct sum of  $c_1, \ldots, c_n$ . Show that  $(\bigoplus_{i=1}^n c_i, (\iota_j)_{j=1}^n)$  is the coproduct of  $c_1, \ldots, c_n$  and  $(\bigoplus_{i=1}^n c_i, (\pi_j)_{j=1}^n)$  is the product of  $c_1, \ldots, c_n$ .

**Exercise 3.1.4.** Suppose  $\mathcal{C}, \mathcal{D}$  are linear categories and  $c, a_1, \ldots, a_n \in \mathcal{C}$ . Use (3.1.2) to show that the property  $c \cong \bigoplus_{i=1}^n a_i$  is preserved by all linear functors  $\mathcal{F} : \mathcal{C} \to \mathcal{D}$ .

**Definition 3.1.5.** Given a linear category C, the additive envelope of C is the linear category Add(C) whose objects are formal finite direct sums  $\bigoplus_{i=1}^{n} a_i$  for  $a_1, \ldots, a_n \in C$ , and whose morphism sets are given by matrices of operators:

$$\mathsf{Add}(\mathcal{C})\left(\bigoplus_{j=1}^n b_j \to \bigoplus_{i=1}^m a_i\right) := \{(x_{ij})|x_{ij} \in \mathcal{C}(b_j \to a_i)\}$$
(3.1.6)

where composition is given by  $(x_{ij}) \circ (y_{jk}) := (\sum_i x_{ij} \circ y_{jk}).$ 

Observe that  $c \mapsto (c)$  for  $c \in \mathcal{C}$  and  $x \mapsto (x)$  for  $x \in \mathcal{C}(a \to b)$  is a fully faithful linear functor  $\mathcal{C} \hookrightarrow \mathsf{Add}(\mathcal{C})$ .

**Exercise 3.1.7.** Suppose  $\mathcal{C}, \mathcal{D}$  are linear categories, and assume  $\mathcal{D}$  admits all finite direct sums. Show that any linear functor  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$  factors uniquely through  $\mathsf{Add}(\mathcal{C})$ , i.e., there is a unique linear functor  $\mathsf{Add}(\mathcal{F}): \mathsf{Add}(\mathcal{C}) \to \mathcal{D}$  such that the following diagram commutes:

$$\begin{array}{ccc}
\operatorname{Add}(\mathcal{C}) \\
\uparrow & & \exists ! \operatorname{Add}(\mathcal{F}) \\
\mathcal{C} & \xrightarrow{\mathcal{F}} & \mathcal{D}
\end{array} (3.1.8)$$

Deduce that if  $\mathcal{C}$  admits all finite direct sums, then  $\mathcal{C}$  is equivalent to  $Add(\mathcal{C})$ .

**Definition 3.1.9.** An idempotent in C is a pair (c, e) where  $c \in C$  and  $e \in C(c \to c)$  such that  $e \circ e = e$ . A splitting for an idempotent (c, e) is an triple (a, r, s) where  $a \in C$ ,  $r \in C(c \to a)$  called a retract, and  $s \in C(a \to c)$  such that  $s \circ r = e$  and  $r \circ s = \mathrm{id}_a$ . A linear category C is called idempotent complete if every idempotent admits a splitting.

<span id="page-1-1"></span>**Exercise 3.1.10.** Suppose  $(a, r_a, s_a), (b, r_b, s_b)$  are two splittings of (c, e). Show that there is a unique isomorphism  $f: a \to b$  which is compatible with  $(r_a, s_a)$  and  $(r_b, s_b)$ .

**Exercise 3.1.11.** Suppose  $\mathcal{C}, \mathcal{D}$  are categories. Show that the property that the idempotent (c, e) admits a splitting is preserved by all functors  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$ .

Definition 3.1.12. The idempotent/Karoubi completion Idem(C) is the linear category whose objects are pairs (c, e) where c ∈ C and e ∈ C(c → c) is an idempotent. The morphism spaces are given by

$$\mathcal{C}((a,e)\to(b,f)):=\left\{x\in\mathcal{C}(a\to b)|x=f\circ x\circ e\right\}.$$

Observe that C((a, e) → (b, f)) ⊆ C(a → b) is a linear subspace, and if x ∈ C((a, e) → (b, f)), then x = x ◦ e = f ◦ x. Composition of morphisms is exactly composition in C, i.e., if x ∈ C((a, e) → (b, f)) and y ∈ C((b, f) → (c, g)), then y ◦ x ∈ C((a, e) → (c, g)).

There is an obvious faithful inclusion functor C ,→ Idem(C) given by c 7→ (c, idc).

<span id="page-2-0"></span>Exercise 3.1.13. Show that Idem(C) is idempotent complete.

Exercise 3.1.14. Suppose C is a linear category and D is an idempotent complete linear category. Show that any linear functor F : C → D factors uniquely through Idem(C). That is, show there is a linear functor Idem(F) : Idem(C) → D such that the following diagram commutes:

<span id="page-2-1"></span>
$$\begin{array}{ccc}
\operatorname{Idem}(\mathcal{C}) \\
\uparrow & & \\
\mathcal{C} & \xrightarrow{\mathcal{F}} & \mathcal{D}
\end{array} (3.1.15)$$

and prove the functor Idem(F) is unique up to unique natural isomorphism (using Exercise [3.1.10\)](#page-1-1). Deduce that if C is idempotent complete, then C is equivalent to Idem(C).

Definition 3.1.16. A linear category C is called Cauchy complete if it admits all finite direct sums and it is idempotent complete. The Cauchy completion of a linear category C is Cauchy(C) := Idem(Add(C)). Observe that Cauchy(C) is Cauchy complete by Exercise [3.1.13,](#page-2-0) and c 7→ (c, idc) gives a faithful linear functor C ,→ Cauchy(C).

Exercise 3.1.17. Suppose C is a linear category and D is a Cauchy complete linear category. Show that any linear functor F : C → D factors uniquely through Cauchy(C), i.e., there is a unique linear functor Cauchy(F) : Cauchy(C) → D such that the following diagram commutes:

$$\begin{array}{c}
\mathsf{Cauchy}(\mathcal{C}) \\
\uparrow \\
\mathcal{C} \xrightarrow{\mathcal{F}} \mathcal{D}
\end{array} (3.1.18)$$

Deduce that if C is Cauchy complete, then C is equivalent to Cauchy(C).

Exercise 3.1.19 (?). Show that every linear abelian category is Cauchy complete. Then find an example of a Cauchy complete linear category which is not abelian.

Exercise 3.1.20. Find an example of a linear category C such that Add(Idem(C)) is not equivalent to Idem(Add(C)).

Hint: Use an algebra without non-trivial idempotents with projective modules which are not free, e.g., C(S 2 ).

Exercise 3.1.21. Prove that a fully faithful linear functor F : C → D between Cauchy complete linear categories is essentially surjective if and only if it is dominant, i.e., every object d ∈ D is isomorphic to a retract of F(c) for some c ∈ C.

Exercise 3.1.22 (??). A colimit in a (linear) category is called absolute if it is preserved by every (linear) functor.

- Show that a category C has all absolute colimits if and only it is idempotent complete.
- Show that a linear category C has all absolute colimits if and only if it is Cauchy complete.

Definition 3.1.23. An object c ∈ C is called simple if EndC(c) = C idc. Two simple objects a, b ∈ C are called distinct if C(a → b) = (0) and C(b → a) = (0).

<span id="page-3-5"></span>Exercise 3.1.24. Suppose C is a Cauchy complete linear category whose isomorphism classes of objects form a set. Show that the following conditions are equivalent.

- <span id="page-3-1"></span>(SS1) There is a set S and an equivalence of categories C ∼= Vecfd(S) (cf. Example [3.0.3\)](#page-0-0).
- <span id="page-3-2"></span>(SS2) For every object c ∈ C, the endomorphism space C(c → c) is a finite dimensional complex semisimple algebra, i.e., a multimatrix algebra.
- <span id="page-3-3"></span>(SS3) Every c ∈ C is isomorphic to a finite direct sum of simple objects c = L<sup>n</sup> <sup>i</sup>=1 c<sup>i</sup> , where each pair c<sup>i</sup> , c<sup>j</sup> are either isomorphic or distinct.
- <span id="page-3-4"></span>(SS4) There is a set of pairwise distinct simple objects {cs}s∈<sup>S</sup> where S is some index set such that for any a, b ∈ C, the composition map

<span id="page-3-0"></span>
$$\bigoplus_{s \in S} \mathcal{C}(a \to c_s) \otimes_{\mathbb{C}} \mathcal{C}(c_s \to b) \longrightarrow \mathcal{C}(a \to b)$$
(3.1.25)

is an isomorphism. (The direct sum in [\(3.1.25\)](#page-3-0) is the direct sum in the category of finite dimensional complex vector spaces.)

Hint: It is fairly straightforward to prove the implications [\(SS1\)](#page-3-1) ⇒ [\(SS2\)](#page-3-2) ⇒ [\(SS3\)](#page-3-3) ⇒ [\(SS4\).](#page-3-4) To prove [\(SS4\)](#page-3-4) ⇒ [\(SS1\),](#page-3-1) show the functor C → Vecfd(S) given by c 7→ L s∈S C(s → c) ⊗ C<sup>s</sup> is an equivalence of categories.

Definition 3.1.26 ([\[BW96,](#page-25-0) Adapted from Def. 2.10], see also [\[M¨ug03\]](#page-26-0)). A Cauchy complete linear category C is called semisimple if the equivalent conditions of Exercise [3.1.24](#page-3-5) hold.[1](#page-3-6) We call C finitely semisimple if in addition C has finitely many isomorphism classes of simple objects.

Exercise 3.1.27. Suppose C, D are linear categories and F : C → D is a linear functor. Show that if C is semisimple, then F is completely determined by where it sends simple objects.

Hint: Let Irr(C) be a set of representatives for the isomorphism classes of C. Restrict F to the full subcategory C<sup>0</sup> whose only objects are Irr(C) and apply Exercise [3.1.15.](#page-2-1)

<span id="page-3-7"></span>Exercise 3.1.28 (??). Show that a linear category C is semisimple if and only if it is abelian and every exact sequence in C splits.

## 3.2. Unitary categories.

Definition 3.2.1. A dagger structure on a linear category C is a conjugate-linear map † : C(a → b) → C(b → a) for all a, b ∈ C such that:

- For all f ∈ C(a → b) and g ∈ C(b → c), (g f) † = f † ◦ g † , and
- For all f ∈ C(a → b), f †† = f.

<span id="page-3-6"></span><sup>1</sup>The condition [\(SS4\)](#page-3-4) was used in [\[BW96,](#page-25-0) Def. 2.10] and [\[M¨ug03\]](#page-26-0).

Observe these conditions implies  $id_a^{\dagger} = id_a$  for all  $a \in \mathcal{C}$ .

A †-functor  $\mathcal{C} \to \mathcal{D}$  is a †-preserving linear functor, i.e., for  $f \in \mathcal{C}(a \to b)$ ,  $\mathcal{F}(f^{\dagger}) = \mathcal{F}(f)^{\dagger}$ .

<span id="page-4-7"></span>**Exercise 3.2.2** (\*\*\*). Suppose A is a unital †-subalgebra of  $M_n(\mathbb{C})$ . Prove that A = A''. Note: For a subset  $S \subset M_n(\mathbb{C})$ ,  $S' := \{x \in M_n(\mathbb{C}) | xs = sx \text{ for all } s \in S\}$ .

<span id="page-4-5"></span>Exercise 3.2.3 ( $\star\star$ , [Pal01, Thm. 9.1.45]).

- (1) Show that any involution \* on  $M_n(\mathbb{C})$  is of the form  $a^* = ha^{\dagger}h^{-1}$  for some invertible  $h \in M_n(\mathbb{C})$  such that  $h = h^{\dagger}$ .
- (2) Show that  $(M_n(\mathbb{C}), \dagger) \cong (M_n(\mathbb{C}), *)$  as involutive algebras if and only if the corresponding h for \* is positive or negative definite.

<span id="page-4-6"></span>**Exercise 3.2.4** ( $\star\star$ ). Prove that the following conditions are equivalent for a finite dimensional unital complex \*-algebra A.

- <span id="page-4-0"></span>(C\*1) There is a norm  $\|\cdot\|$  on A which is submultiplicative ( $\|ab\| \leq \|a\| \cdot \|b\|$ ) such that  $\|a^*a\| = \|a\|^2$ .
- <span id="page-4-1"></span>(C\*2) (multimatrix) There exists a \*-isomorphism  $A \cong \bigoplus_{i=1}^n M_{a_i}(\mathbb{C})$  where each summand has the usual conjugate transpose † operation.
- <span id="page-4-2"></span>(C\*3) (matrix †-subalgebra) There exists an injective unital \*-homomorphism  $A \to M_n(\mathbb{C})$  for some  $n \in \mathbb{N}$ , where  $M_n(\mathbb{C})$  has the usual conjugate transpose † operation.
- <span id="page-4-4"></span>(C\*4) ( $\exists$  faithful state) There exists a faithful state  $\varphi: A \to \mathbb{C}$ , i.e.,  $\varphi(a^*a) \geq 0$  for all  $a \in A$ , and  $\varphi(a^*a) = 0$  implies a = 0.
- <span id="page-4-3"></span>(C\*5) (\*-definite) For every  $a \in A$ ,  $a^*a = 0$  implies a = 0.

Note: It is fairly straightforward to prove the following implications:

To show  $(C^*5) \Rightarrow (C^*2)$ , one could proceed as follows.

(1) Recall that the  $Jacobson\ radical\ of\ A$  is

$$J(A) = \left\{b \in A \middle| 1 + abc \text{ is invertible } \forall a, c \in A\right\}.$$

Show that every element of J(A) is nilpotent.

Hint: If  $a \in A$ , there is a polynomial  $p \in \mathbb{C}[x]$  such that p(a) = 0.

- (2) Show that if there is a non-zero  $a \in J(A)$ , then there is a non-zero  $b \in J(A)$  such that  $b^*b = 0$ .
  - *Hint:* Reduce to the case  $a = a^*$  and use part (1).
- (3) Use the Artin-Wedderburn Theorem to deduce that  $(C^*5)$  implies A is isomorphic to a multimatrix algebra.
- (4) Show (C\*5) implies each full matrix algebra summand of A is preserved under \*. Hint: Consider the minimal central idempotents  $\{p_i\}_{i=1}^n$ . Show that  $\{p_i^*\}_{i=1}^n$  are also minimal central idempotents, so  $p_i^* = p_j$  for some j = 1, ..., n. Then apply (C\*5).
- (5) Consider the involution of A restricted to a single full matrix algebra summand  $M_n(\mathbb{C})$  of A. By Exercise 3.2.3, there is a self-adjoint  $h \in M_n(\mathbb{C})$  such that  $x^* = hx^{\dagger}h$  for all  $x \in M_n(\mathbb{C})$ , where  $\dagger$  denotes the usual conjugate-transpose in  $M_n(\mathbb{C})$ . Show that

 $(C^*5)$  implies h is positive or negative definite.

Hint: If h is not positive or negative definite, choose  $-\infty < r < 0$  and  $0 < s < \infty$  such that  $r, s \in \operatorname{spec}(h)$ , and pick eigenvectors  $v, w \in \mathbb{C}^n$  for h corresponding to r, s respectively. Then find a non-zero  $x \in M_n(\mathbb{C})$  such that  $hx^{\dagger}h^{-1}x = 0$ . (For example, take x to have one non-zero column, which is a linear combination of v, w.)

(6) Show  $(C^*5)$  implies  $(C^*2)$ 

**Definition 3.2.5.** A unitary algebra is a finite dimensional unital complex \*-algebra that satisfies the equivalent conditions of Exercise 3.2.4. A unitary category is a Cauchy complete linear dagger category such that every endomorphism \*-algebra is unitary. One should interpret a unitary category as a unitary algebra with more than one object.

**Exercise 3.2.6.** Prove that every unitary category is semisimple. Hint: Use ( $\mathbb{C}^*2$ ) from Exercise 3.2.4 for the endomorphism algebra  $\mathcal{C}(c \to c)$ .

<span id="page-5-0"></span>**Definition 3.2.7** (Polar decomposition). Suppose A is a unitary algebra and  $a \in A$ . Using functional calculus, we define  $|a| := \sqrt{a^*a}$ . Using (C\*3), view A as a subalgebra of  $M_n(\mathbb{C})$  acting on  $\mathbb{C}^n$ . The map  $u : |a|\xi \mapsto a\xi$  on  $\operatorname{im}(|a|)$  and and u = 0 on  $\operatorname{im}(|a|)^{\perp}$  is an isometric linear operator and thus well-defined:

$$|||a|\xi||^2 = \langle |a|\xi, |a|\xi\rangle = \langle |a|^2\xi, \xi\rangle = \langle a^*a\xi, \xi\rangle = \langle a\xi, a\xi\rangle = ||a\xi||^2.$$

The partial isometry u actually commutes with A', and thus lies in A = A'' by Exercise 3.2.2. Indeed, for all unitaries  $v \in A'$ ,

$$vuv^*|a|\xi = vu|a|v^*\xi = vav^*\xi = a\xi,$$

and thus  $vuv^* = u$ .

Hence we may write a = u|a| in A where u is a partial isometry and  $|a| \ge 0$ . Writing a = u|a| is called the *polar decomposition* of a.

<span id="page-5-1"></span>Exercise 3.2.8. In this exercise, we will prove the uniqueness of the polar decomposition.

- (1) Show that for  $a \in A$ , |a| is the unique positive operator that squares to  $a^*a$ .
- (2) Prove that u is the unique partial isometry with a = u|a| such that  $\ker(u) = \ker(a)$ .
- (3) Prove that u is independent of the choice of representation  $A \to M_n(\mathbb{C})$  chosen in Definition 3.2.7.

**Exercise 3.2.9.** Suppose A is a unitary algebra and  $a \in A$ . Prove that the unique partial isometry in the polar decomposition a = u|a| satisfies  $a = |a^*|u$ .

**Definition 3.2.10.** Suppose  $\mathcal{C}$  is a unitary category. Given  $c_1, \ldots, c_n \in \mathcal{C}$ , an object  $\bigoplus_{i=1}^n c_i$  together with morphisms  $\iota_j : c_j \to \bigoplus_{i \in I} c_i$  for  $1 \leq j \leq n$  is called the *orthogonal direct* sum of  $c_1, \ldots, c_n$  if  $(\bigoplus_{i=1}^n c_i, (\iota_j)_{j=1}^n, (\iota_j^{\dagger})_{j=1}^n)$  is the direct sum of  $c_1, \ldots, c_n$ . Observe that the maps  $\iota_j$  are isometries, the maps  $\iota_j \iota_j^{\dagger}$  are mutually orthogonal projections in  $\operatorname{End}(\bigoplus_{i \in I} c_i)$ , and the canonical isomorphism from (3.1.2) is a  $\dagger$ -isomorphism.

**Exercise 3.2.11.** Suppose  $\mathcal{C}$  is a unitary category and  $(\bigoplus_{i=1}^n c_i, (\iota_j)_{j=1}^n, (\pi_j)_{j=1}^n)$  is the direct sum of  $c_1, \ldots, c_n$ . Find isometries  $v_j : c_j \to \bigoplus_{i=1}^n c_i$  such that  $(\bigoplus_{i=1}^n c_i, (v_j)_{j=1}^n, (v_j^{\dagger})_{j=1}^n)$  is the orthogonal direct sum of  $c_1, \ldots, c_n$ .

Hint: Perform polar decomposition for the  $\iota_j$  in the unitary algebra  $\operatorname{End}(\bigoplus_{i=1}^n c_i)$ .

**Definition 3.2.12.** Suppose  $\mathcal{C}$  is a unitary category and  $f \in \mathcal{C}(a \to b)$ . Then considering f as an off-diagonal morphism in

$$\mathcal{C}(a \oplus b \to a \oplus b) \cong \begin{pmatrix} \mathcal{C}(a \to a) & \mathcal{C}(b \to a) \\ \mathcal{C}(a \to b) & \mathcal{C}(b \to b) \end{pmatrix}$$

where  $a \oplus b$  denotes the orthogonal direct sum, we may decompose f = u|f| where  $|f| \in \mathcal{C}(a \to a)$  is the unique positive square root of  $f^{\dagger}f$  and  $u \in \mathcal{C}(a \to b)$  is a partial isometry.

**Exercise 3.2.13.** Suppose  $\mathcal{C}$  is unitary so that  $\mathcal{C}$  is also abelian by Exercise 3.1.28; in particular,  $\mathcal{C}$  has kernels. Formulate and prove the uniqueness statement for the partial isometry in the polar decomposition f = u|f| in  $\mathcal{C}$ .

**Exercise 3.2.14.** Suppose C is a unitary category. Prove that objects  $a, b \in C$  are isomorphic if and only if they are unitarily isomorphic.

**Definition 3.2.15.** Suppose  $\mathcal{C}$  is a unitary category. A(n) (orthogonal) projection in  $\mathcal{C}$  is a pair (c, p) where  $c \in \mathcal{C}$  and  $p \in \mathcal{C}(c \to c)$  such that  $p \circ p = p = p^{\dagger}$ . An orthogonal splitting for a projection (c, p) is a pair (a, v) where  $a \in \mathcal{C}$ ,  $v \in \mathcal{C}(a \to c)$  is an isometry such that  $v^{\dagger} \circ v = \mathrm{id}_a$  and  $v \circ v^{\dagger} = p$ . A unitary category  $\mathcal{C}$  is called projection complete if every projection admits an orthogonal splitting.

**Exercise 3.2.16.** Suppose  $(a, v_a), (b, v_b)$  are two orthogonal splittings of (c, p). Show that there is a unique unitary isomorphism  $u: a \to b$  which is compatible with  $v_a, v_b$ .

**Exercise 3.2.17.** Suppose  $\mathcal{C}$  is a unitary category and  $p \in \mathcal{C}(c \to c)$  is an orthogonal projection. Suppose (a, r, s) is a splitting of p as an idempotent, and let s = v|s| be the polar decomposition of s. Prove that (a, v) is an orthogonal splitting of p.

**Exercise 3.2.18.** Suppose  $\mathcal{C}$  is a linear category which admits finite direct sums such that every endomorphism  $\dagger$ -algebra is a unitary algebra. Prove that the projection completion of  $\mathcal{C}$  is idempotent complete. Deduce that  $\mathsf{Idem}(\mathcal{C}^{\natural})$  is equivalent to  $\mathsf{Proj}(\mathcal{C})^{\natural}$  where  $\natural$  denotes forgetting the  $\dagger$  structure. (The projection completion  $\mathsf{Proj}(\mathcal{C})$  is defined analogously to the idempotent completion.)

Hint: The following proof outline was worked out with David Reutter and Jan Steinebrunner.

- (1) For an idempotent  $e \in C(c \to c)$ , let e = u|e| be its polar decomposition. Use Exercise 3.2.8 to show that u = ue.
- (2) As  $u^{\dagger}u$  is an orthogonal projection, suppose (a, v) be an orthogonal splitting of  $u^{\dagger}u$ , so  $v^{\dagger}v = \mathrm{id}_a$  and  $vv^{\dagger} = u^{\dagger}u$ . Show that  $(a, r := v^{\dagger}, s := ev)$  is a splitting of e.

**Exercise 3.2.19.** Suppose  $\mathcal{C}, \mathcal{D}$  are unitary categories. Show that the following properties are preserved by all  $\dagger$ -functors  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$ .

- (1) c is unitarily isomorphic to  $\bigoplus_{i=1}^{n} a_i$
- (2) The projection (c, p) admits an orthogonal splitting.

### 3.3. Monoidal categories.

**Definition 3.3.1.** A monoidal category is a category C together with the following additional data:

- A functor  $-\otimes -: \mathcal{C} \times \mathcal{C} \to \mathcal{C}$ ,
- A distinguished object  $1_{\mathcal{C}} \in \mathcal{C}$ ,

- assocaitor isomorphisms  $\alpha_{a,b,c}: a \otimes (b \otimes c) \xrightarrow{\cong} (a \otimes b) \otimes c$  for all  $a,b,c \in \mathcal{C}$ , separately natural in all components, and
- unitor natural isomorphisms  $\lambda_a: 1_{\mathcal{C}} \otimes a \xrightarrow{\cong} a$  and  $\rho_a: a \otimes 1_{\mathcal{C}} \xrightarrow{\cong} a$  for all  $a \in \mathcal{C}$ , and this data must satisfy the following axioms:
  - (pentagon) for all  $a, b, c, d \in \mathcal{C}$ , the following diagram commutes:

• (triangle) for all  $a, b \in \mathcal{C}$ , the following diagram commutes:

<span id="page-7-0"></span>
$$a \otimes (1_{\mathcal{C}} \otimes b) \xrightarrow{\operatorname{id}_{a} \otimes \lambda_{b}} a \otimes b$$

$$(a \otimes 1_{\mathcal{C}}) \otimes b$$

$$(\Delta)$$

A monoidal category  $(\mathcal{C}, \otimes, 1_{\mathcal{C}}, \alpha, \lambda, \rho)$  is called *strict* if for every  $a, b, c \in \mathcal{C}$ ,  $a \otimes (b \otimes c) = (a \otimes b) \otimes c$  and  $1_{\mathcal{C}} \otimes a = a \otimes 1_{\mathcal{C}} = a$ , and the natural isomorphisms  $\alpha_{a,b,c}$ ,  $\lambda_a$ , and  $\rho_a$  are all identity morphisms.

A linear monoidal category is a linear category with a monoidal structure such that  $\otimes$ :  $\mathcal{C} \times \mathcal{C} \to \mathcal{C}$  is linear.

**Example 3.3.2.** Suppose G is a finite group and consider  $\mathsf{Vec}_{\mathsf{fd}}(G)$  from Example 3.0.3 with S = G. We endow  $\mathsf{Vec}_{\mathsf{fd}}(G)$  with the structure of a tensor category by

<span id="page-7-1"></span>
$$(V \otimes W)_g := \bigoplus_{hk=q} V_h \otimes W_k$$

where the associator just moves parentheses.

<span id="page-7-3"></span>**Example 3.3.3.** Let G be a finite group. A 3-cocycle  $\omega \in Z^3(G; \mathbb{C}^{\times})$  is a function  $\omega : G \times G \times G \to \mathbb{C}^{\times}$  such that for all  $g, h, k \in G$ ,

$$\omega(h,k,\ell)\omega(gh,k,\ell)^{-1}\omega(g,hk,\ell)\omega(g,h,k\ell)^{-1}\omega(g,h,k)=1.$$

The linear monoidal category  $\mathsf{Vec}_{\mathsf{fd}}(G,\omega)$  has the same underlying linear category and monoidal product as  $\mathsf{Vec}_{\mathsf{fd}}(G)$ , but we twist the associator and unitors by  $\alpha_{g,h,k} := \omega(g,h,k) \operatorname{id}_{ghk}$ ,  $\lambda_g := \omega(g,1,1) \operatorname{id}_g$ , and  $\rho_g := \omega(1,1,g)^{-1}$ . (Prove that the pentagon  $(\ )$  and triangle  $(\ )$  axioms hold!)

<span id="page-7-2"></span>**Example 3.3.4.** We endow Rep(G) from Example 3.3.4 with the structure of a tensor category by

$$(V,\pi)\otimes(W,\rho):=(V\otimes W,\pi\otimes\rho),$$

where again the associator just moves parentheses.

**Example 3.3.5.** We endow  $\mathsf{TLJ}(d)$  from Example 3.0.5 with the structure of a strict tensor category as follows. On objects, we define  $m \otimes n := m + n$ . For string diagrams  $x \in \mathcal{TL}(d)(m \to n)$  and  $y \in \mathcal{TL}(d)(p \to q)$ , we define  $x \otimes y \in \mathsf{TLJ}(d)(m + p \to n + q)$  to be the horizontal concatenation of x and y. For an explicit example,

$$\otimes$$
  $\otimes$   $\otimes$   $\otimes$   $\otimes$   $\otimes$   $\otimes$   $\otimes$   $\otimes$   $\otimes$ 

We then extend  $-\otimes -: \mathsf{TLJ}(d) \times \mathsf{TLJ}(d) \to \mathsf{TLJ}(d)$  bilinearly in each argument.

**Exercise 3.3.6** (Exchange relation). Suppose  $\mathcal{C}$  is a monoidal category and  $f \in \mathcal{C}(a \to c)$  and  $g \in \mathcal{C}(b \to d)$ . Prove that  $(f \otimes \mathrm{id}_d) \circ (\mathrm{id}_a \otimes g) = (\mathrm{id}_b \otimes g) \circ (f \otimes \mathrm{id}_b)$ .

**Remark 3.3.7.** We may view the unitors  $\lambda$  and  $\rho$  as natural isomorphisms  $\lambda : 1_{\mathcal{C}} \otimes - \Rightarrow \mathrm{id}_{\mathcal{C}}$  and  $\rho : - \otimes 1_{\mathcal{C}} \Rightarrow \mathrm{id}_{\mathcal{C}}$  respectively.

**Exercise 3.3.8** (\*\*\*, [HV19, Ex. 1.13]). Prove that  $\lambda_{1_{\mathcal{C}}} = \rho_{1_{\mathcal{C}}} : 1_{\mathcal{C}} \otimes 1_{\mathcal{C}} \to 1_{\mathcal{C}}$ .

**Remark 3.3.9.** The existence of  $(1_{\mathcal{C}}, \lambda, \rho)$  is a *property* and not additional structure. That is, if  $(1'_{\mathcal{C}}, \lambda', \rho')$  is another choice of unit and unitors for  $\mathcal{C}$ , then

$$1_{\mathcal{C}}' \xrightarrow{\lambda_{1_{\mathcal{C}}'}^{-1}} 1_{\mathcal{C}} \otimes 1_{\mathcal{C}}' \xrightarrow{\rho_{1_{\mathcal{C}}}'} 1_{\mathcal{C}}$$

is the unique isomorphism which intertwines the unitors  $(\lambda', \rho')$  with  $(\lambda, \rho)$ , i.e., the following diagram commutes for all  $c \in \mathcal{C}$ : **TODO:** check this is the right condition.

$$1'_{\mathcal{C}} \otimes c \xrightarrow{\lambda_{1'_{\mathcal{C}}}^{-1} \otimes \mathrm{id}_{c}} (1_{\mathcal{C}} \otimes 1'_{\mathcal{C}}) \otimes c \xrightarrow{\rho'_{1_{\mathcal{C}}} \otimes \mathrm{id}_{c}} 1_{\mathcal{C}} \otimes c$$

and a similar diagram commutes tensoring with c on the left.

**Definition 3.3.10.** A unitary monoidal category is a unitary category with a monoidal structure such that  $\otimes : \mathcal{C} \times \mathcal{C} \to \mathcal{C}$  is a linear †-functor, and all associators and unitor isomorphisms are unitary.

**Exercise 3.3.11.** Let G be a finite group, and let U(1) denote the unitary group of unimodular complex scalars. The unitary category  $\mathsf{Hilb_{fd}}(G,\omega)$  for  $\omega \in Z^3(G,U(1))$  has objects G-graded finite dimensional Hilbert spaces with grading preserving linear maps. The tensor structure is given similar to Example 3.3.3. (Verify  $\mathsf{Hilb_{fd}}(G,\omega)$  is a unitary monoidal category!)

**Exercise 3.3.12.** Let G be a finite group. The category  $\mathsf{Rep}^\dagger(G)$  has objects  $(H, \pi)$  where H is a Hilbert space and  $\pi: G \to U(H)$  is a homomorphism, where U(H) denotes the group of unitaries on H. The morphisms are G-equivariant linear maps. (Verify  $\mathsf{Rep}^\dagger(G)$  is a unitary monoidal category!)

**Definition 3.3.13.** A monoidal functor  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$  between monoidal categories is a functor  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$  together with a family of tensorator isomorphisms  $\mathcal{F}_{a,b}^2: \mathcal{F}(a) \otimes \mathcal{F}(b) \to \mathcal{F}(a \otimes b)$  and a unitor isomorphism  $\mathcal{F}^1: 1_{\mathcal{D}} \to \mathcal{F}(1_{\mathcal{C}})$  satisfying the following axioms:

• (associative) for all  $a, b, c \in \mathcal{C}$ , the following diagram commutes:

$$\mathcal{F}(a) \otimes (\mathcal{F}(b) \otimes \mathcal{F}(c)) \xrightarrow{\mathrm{id}_{\mathcal{F}(a)} \otimes \mathcal{F}_{b,c}^{2}} \mathcal{F}(a) \otimes \mathcal{F}(b \otimes c) \xrightarrow{\mathcal{F}_{a,b \otimes c}^{2}} \mathcal{F}(a \otimes (b \otimes c)) \\
\downarrow^{\alpha_{\mathcal{F}(a),\mathcal{F}(b),\mathcal{F}(c)}^{\mathcal{D}}} \xrightarrow{\mathcal{F}_{a,b}^{2} \otimes \mathrm{id}_{\mathcal{F}(c)}} \mathcal{F}(a \otimes b) \otimes \mathcal{F}(c) \xrightarrow{\mathcal{F}_{a \otimes b,c}^{2}} \mathcal{F}((a \otimes b) \otimes c)$$

• (unital) for all  $c \in \mathcal{C}$ , the following diagrams commute:

$$1_{\mathcal{D}} \otimes \mathcal{F}(c) \xrightarrow{\lambda_{\mathcal{F}(c)}^{\mathcal{D}}} \mathcal{F}(c) \qquad \qquad \mathcal{F}(c) \otimes 1_{\mathcal{D}} \xrightarrow{\rho_{\mathcal{F}(c)}^{\mathcal{D}}} \mathcal{F}(c)$$

$$\downarrow^{\mathcal{F}^{1} \otimes \operatorname{id}_{\mathcal{F}(c)}} \qquad \uparrow^{\mathcal{F}(\lambda_{c}^{\mathcal{C}})} \qquad \qquad \downarrow^{\operatorname{id}_{\mathcal{F}(c)} \otimes \mathcal{F}^{1}} \qquad \uparrow^{\mathcal{F}(\rho_{c}^{\mathcal{C}})}$$

$$\mathcal{F}(1_{\mathcal{C}}) \otimes \mathcal{F}(c) \xrightarrow{\mathcal{F}^{2}_{1_{\mathcal{C}},c}} \mathcal{F}(1_{\mathcal{C}} \otimes c) \qquad \qquad \mathcal{F}(c) \otimes \mathcal{F}(1_{\mathcal{C}}) \xrightarrow{\mathcal{F}^{2}_{c,1_{\mathcal{C}}}} \mathcal{F}(c \otimes 1_{\mathcal{C}})$$

A monoidal natural transformation  $\theta: \mathcal{F} \Rightarrow \mathcal{G}$  between monoidal functors is a natural transformation satisfying the following axiom:

• (monoidal) For all  $a, b \in \mathcal{C}$ , the following diagram commutes:

$$\mathcal{F}(a) \otimes \mathcal{F}(b) \xrightarrow{\theta_a \otimes \theta_b} \mathcal{G}(a) \otimes \mathcal{G}(b) 
\downarrow^{\mathcal{F}^2_{a,b}} \qquad \qquad \downarrow^{\mathcal{G}^2_{a,b}} 
\mathcal{F}(a \otimes b) \xrightarrow{\theta_a \otimes b} \mathcal{G}(a \otimes b)$$

Two monoidal categories  $\mathcal{C}, \mathcal{D}$  are *equivalent* if there is a monoidal functor  $\mathcal{F}: \mathcal{C} \to \mathcal{D}$  whose underlying functor is an equivalence of categories.

**Exercise 3.3.14** ( $\star$ , MacLane Coherence). Show that every monoidal category  $\mathcal{C}$  is equivalent to a strict monoidal category.

Hint: Embed  $\mathcal{C} \hookrightarrow \operatorname{End}(\mathcal{C})$  by  $c \mapsto c \otimes -$ , and hide the associator in the tensorator.

**Exercise 3.3.15.** A category is called *skeletal* if whenever two objects are isomorphic, they are in fact equal. Show that every (monoidal) category is equivalent to a skeletal (monoidal) category.

**Remark 3.3.16.** For a linear monoidal category C, we can ask for at most 2 out of 3 of the properties strict, skeletal, and Cauchy complete.

**Exercise 3.3.17.** Suppose  $\mathcal{C}$  is a linear monoidal category. Endow the following linear categories with monoidal structures, and then endow the fully faithful inclusion of  $\mathcal{C}$  with the structure of a monoidal functor:

- the additive envelope  $Add(\mathcal{C})$ ,
- the idempotent completion  $\mathsf{Idem}(\mathcal{C})$ , and
- the Cauchy completion Cauchy(C).
- 3.4. **Graphical calculus**, dualizability, and multifusion categories. The graphical calculus is a powerful and elegant formalism for calculations in a monoidal category. Essentially, string diagrams are *dual* to pasting diagrams. We first illustrate for ordinary categories, after which we illustrate for monoidal categories.

Morphisms are often first viewed as 1D arrows between 0D objects.

$$\stackrel{\bullet}{a} \xrightarrow{f} \stackrel{\bullet}{b} \qquad \stackrel{\leadsto}{\underset{\text{dual}}{\longrightarrow}} \qquad \stackrel{f}{\underset{a}{\longrightarrow}} \qquad \stackrel{\leadsto}{\underset{\text{node to coupon}}{\longrightarrow}} \qquad \stackrel{\overline{a}}{\overbrace{f}} \xrightarrow{b} \qquad \stackrel{\leadsto}{\underset{\text{rotate}}{\longrightarrow}} \qquad \stackrel{\downarrow}{\overbrace{f}} \xrightarrow{b}$$

In the string diagrammatic calculus, we dualize these pictures, representing the objects as 1D strings and morphisms as 0D coupons. Strings are always *oriented*, but by convention, we will suppress this orientation using the convention that we always read either *left to right* or *bottom to top*. Composition is given by stacking coupons.

$$\begin{array}{cccccccccccccccccccccccccccccccccccc$$

In a monoidal category, we represent identity morphisms as strands without coupons, and we represent the monoidal product by horizontal juxtaposition. Observe that the exchange relation means we can perform vertical isotopy without changing the morphism. Typically we will write a doubled strand to indicate a product of two objects. For example, for  $f \in \mathcal{C}(a \to c)$  and  $g \in \mathcal{C}(b \to d)$ ,

$$\underbrace{f \otimes g}_{\parallel a \otimes b} = \underbrace{f \otimes g}_{\mid a \mid b} = \underbrace{f}_{\mid a} \underbrace{g}_{\mid b} = \underbrace{f}_{\mid a} \underbrace{g}_{\mid b} = \underbrace{f}_{\mid a} \underbrace{g}_{\mid b}.$$

**Remark 3.4.1.** Later on, we will see that monoidal categories are really 2-categories with one object. Thus dualizing a 2D pasting diagram yields a 2D string diagram, where 0-morphisms are presented by regions, 1-morphisms are represented by 1D strands, and 2-morphisms are represented by 0D coupons.

Associators can then be represented by: coupons with three strands, three strands with no coupons where we change the horizontal position of the middle strand, or my personal favorite: omitted entirely!

$$\begin{array}{c|c}
a \otimes b & c \\
\hline
\alpha_{a,b,c} & c \\
\hline
a & b & c
\end{array}, \quad \text{or} \quad \begin{vmatrix} c \\ a & b \\ c \end{vmatrix}.$$

Similarly, we may represent a unitor by coupon with a dashed strand labelled for  $1_{\mathcal{C}}$ , a dashed strand which terminates on another strand, or we may simply choose to never draw the unit object  $1_{\mathcal{C}}$  and suppress all unitors, e.g.,

$$\begin{bmatrix} a \\ \lambda_a \\ 1_{\mathcal{C}} \end{bmatrix} = \begin{bmatrix} a \\ 1_{\mathcal{C}} \end{bmatrix} = \begin{bmatrix} a \\ a \end{bmatrix}$$
, or  $\begin{bmatrix} a \\ a \end{bmatrix}$ 

While the reader may worry that omitting associators and unitors could lead to some kind of problem, in fact, it is not by the following theorem.

**Theorem 3.4.2** (Correctness of graphical calculus [HV19, Thm. 1.8]). A well-typed equation between morphisms in a monoidal category follows from the axioms if and only if it holds in the graphical calculus up to isotopy. (Here, isotopy must fix lower and upper boundaries, and may not create any local maxima/minima of strands.)

Basically, this theorem tells us that every string diagram can be interpreted in *infinitely* many ways as an algebraic expression in the morphisms of  $\mathcal{C}$  (e.g., we may put in an arbitrary number of copies of  $1_{\mathcal{C}}$ , and an arbitrary number of  $\alpha$  and  $\alpha^{-1}$  which cancel), but given particular parenthesizations for the source and target objects, any one of these infinite algebraic expressions yields the same morphism in  $\mathcal{C}$ . Using this convention, we will suppress the associator whenever possible; the reader who is uncomfortable with this is welcome to work in an equivalent strict monoidal category.

**Definition 3.4.3.** Suppose  $\mathcal{C}$  is a monoidal category. A dual of an object  $c \in \mathcal{C}$  consists of:

- an object  $c^{\vee} \in \mathcal{C}$  called a dual of c, and
- evaluation and coevaluation morphisms  $\operatorname{ev}_c: c^{\vee} \otimes c \to 1_{\mathcal{C}}$  and  $\operatorname{coev}_c: 1_{\mathcal{C}} \to c \otimes c^{\vee}$  which we represent graphically by a cap and a cup respectively

$$\operatorname{ev}_c = \bigcap_{c^{\vee} c} \operatorname{coev}_c = \bigcup_{1c}^{c c^{\vee}}$$

satisfying the snake/zig-zag equations, which are best expressed graphically:

<span id="page-11-0"></span>
$$\begin{array}{c|c}
c \\
c
\end{array} = \begin{array}{c|c}
c
\end{array} = \begin{array}{c|c}
c
\end{array} = \begin{array}{c|c}
c
\end{array} (3.4.4)$$

The object  $c \in \mathcal{C}$  is called *dualizable* if c has a dual, and there is a *predual* object  $c_{\vee} \in \mathcal{C}$  which has a dual  $(c_{\vee})^{\vee}$  such that there exists an isomorphism  $c \cong (c_{\vee})^{\vee}$ .

**Example 3.4.5.** Consider the linear monoidal category Vec of complex vector spaces. Prove that  $V \in \text{Vec}$  is dualizable if and only if V is finite dimensional. Repeat this exercise for Vec(G), Hilb, and Hilb(G).

**Exercise 3.4.6.** Suppose  $(c^{\vee}, \operatorname{ev}_c, \operatorname{coev}_c)$  is a dual of  $c \in \mathcal{C}$ . Prove that if  $\operatorname{coev}'_c : 1_{\mathcal{C}} \to c \otimes c^{\vee}$  satisfies (3.4.4), then  $\operatorname{coev}'_c = \operatorname{coev}_c$ . In this sense, we say  $\operatorname{coev}_c$  is completely determined by  $\operatorname{ev}_c$ . Finally, prove  $\operatorname{ev}_c$  is completely determined by  $\operatorname{coev}_c$ .

**Exercise 3.4.7** (Frobenius reciprocity). Suppose  $b \in \mathcal{C}$  is dualizable. Construct a natural isomorphism

<span id="page-11-1"></span>
$$C(a \otimes b \to c) \cong C(a \to c \otimes b^{\vee}). \tag{3.4.8}$$

**Exercise 3.4.9.** Suppose C is an idempotent complete monoidal category,  $c, d \in C$ , and  $f: 1_{\mathcal{C}} \to c \otimes d$  and  $g: d \otimes c \to 1_{\mathcal{C}}$  such that

$$\begin{array}{c|c}
c & g \\
\hline
d & c
\end{array} = (\mathrm{id}_c \otimes g) \circ (f \otimes \mathrm{id}_c) = \mathrm{id}_c = c .$$

Find an object  $c^{\vee} \in \mathcal{C}$  and maps  $\operatorname{coev}_c : 1_{\mathcal{C}} \to c \otimes c^{\vee}$  and  $\operatorname{ev}_c : c^{\vee} \otimes c \to 1_{\mathcal{C}}$  satisfying both zig-zag equations (3.4.4).

Definition 3.4.10. A multitensor category is a linear monoidal category whose underlying linear category is Cauchy complete in which all objects are dualizable.[a](#page-12-0) A multitensor category is called a tensor category if 1<sup>C</sup> is simple, i.e., dim(End(1C)) = 1.

Exercise 3.4.11. Suppose C is a tensor category.

(1) Show that for every simple c ∈ C and non-zero maps : c <sup>∨</sup>⊗c → 1<sup>C</sup> and δ : 1<sup>C</sup> → c <sup>∨</sup>⊗c, ◦ δ 6= 0.

Hint: see [\[HPT16,](#page-26-3) Lem. A.5].

(2) Suppose D is a linear monoidal category and F : C → D is a tensor functor. Prove that F is faithful.

Hint: Use dualizability to prove that for every simple object c, F(idc) is non-zero.

Remark 3.4.12. Multitensor categories admit a graphical calculus where strings may have local maxima and minima, and we may perform isotopies which create or annihilate finitely many of such minima.

Definition 3.4.13. A multifusion category is a finitely semisimple multitensor category. A multifusion category is called a fusion category if 1<sup>C</sup> is simple.

<span id="page-12-0"></span>Definition 3.4.14. A unitary monoidal category C is called a unitary (multi)tensor category if C \ is a (multi)tensor category. A unitary (multi)tensor category is called a unitary (mulit)fusion category if C \ is (multi)fusion. (Recall that \ denotes forgetting the † structure.)

## Tensor category adjectives and prefixes.

| tensor  | linear Cauchy complete,a<br>all objects dualizable |
|---------|----------------------------------------------------|
| multi   | 1C<br>is not simple                                |
| fusion  | finitely semisimple                                |
| unitary | all endomorphism<br>∗-algebras unitary             |

<span id="page-12-1"></span>a In [\[EGNO15\]](#page-25-1), Cauchy complete is replaced with locally finite abelian.

3.5. F-matrices and 6j-symbols. We now discuss the way that physicists think about unitary fusion categories via F-matrices and 6j-symbols, which we believe goes back to [\[MS89\]](#page-26-4). As we saw in Exercise [3.1.24,](#page-3-5) a finitely semisimple category C is equivalent as a category to Vecfd ⊕r , where r is the rank of C, which is the number of isomorphism classes of simple objects. Thus the only interesting part of a fusion category is the tensor product, which tells us how simple objects (thought of as elementary particles) merge and split.

Suppose C is a fusion category, and let Irr(C) be a set of representatives for the simple objects of C. Typically, physicists will use the indices 0, 1, . . . , r − 1 instead of the set Irr(C) to index the simple objects, where 0 corresponds to 1C.

Definition 3.5.1 (Fusion rules). Suppose C is a semisimple linear monoidal category. Let Irr(C) be a set of representatives for the isomorphism classes of simple objects of C. For a, b, c ∈ Irr(C), we define the fusion rules as the non-negative integers

$$N^c_{ab} := \dim(\operatorname{Hom}(a \otimes b \to c)).$$

The fusion graph of c ∈ C has vertices the set Irr(C) and dim(Hom(a ⊗ c → b)) oriented edges between the vertices a, b ∈ Irr(C).

We call C multiplicity free if  $N_{ab}^c \in \{0, 1\}$  for all  $a, b, c \in Irr(C)$ .

<span id="page-13-0"></span>**Exercise 3.5.2.** Let  $Irr(\mathcal{C})$  be a set of representatives of the simple objects of  $\mathcal{C}$ , where we assume  $1_{\mathcal{C}} \in Irr(\mathcal{C})$ . Prove the following relations amongst the fusion rules of  $\mathcal{C}$ . The proof is much easier if you assume  $\mathcal{C}$  is unitary, but these results hold nonetheless.

- (FR1) For all  $a, b, c, d \in Irr(\mathcal{C})$ ,  $\sum_{e \in Irr(\mathcal{C})} N_{a,b}^e N_{e,c}^d = \sum_{f \in Irr(\mathcal{C})} N_{a,f}^d N_{b,c}^f$ .
- <span id="page-13-1"></span>(FR2) For each  $c \in \operatorname{Irr}(\mathcal{C})$ , there is a unique  $c^*$  such that  $N_{cc^*}^{1c} = 1 = N_{c^*c}^{1c}$ . Hint: When  $\mathcal{C}$  is unitary, prove that  $(c, \operatorname{coev}_c^{\dagger}, \operatorname{ev}_c^{\dagger})$  is a dual of  $c^{\vee}$ . Question: Why do we use \* here instead of  $\vee$ ?
- (FR3)  $1_{\mathcal{C}}^* = 1_{\mathcal{C}}$  and  $c^{**} = c$  for all  $c \in \operatorname{Irr}(\mathcal{C})$ .
- (FR4) For each  $a, b, c \in Irr(\mathcal{C})$ ,  $N_{ab}^c = N_{bc^*}^{a^*} = N_{c^*a}^{b^*} = N_{cb^*}^a = N_{a^*c}^b = N_{b^*,a^*}^{c^*}$ . *Hint:* Use  $\dagger$  and (3.4.8).

**Definition 3.5.3.** A non-empty finite set  $S = \{1, ...\}$  and a collection of non-negative integers  $N_{ab}^c$  for  $a, b, c \in S$  satisfying the relations of Exercise 3.5.2 is called a *fusion rule*. The rank of a fusion rule is r := |S|.

Exercise 3.5.4. Find all rank 2 fusion rules.

**Definition 3.5.5.** Given a fusion rule  $(S, N_{\bullet \bullet}^{\bullet})$ , the associated *fusion algebra* is the unital complex \*-algebra  $\mathcal{F}\mathcal{A}(S) := \bigoplus_{a \in S} \mathbb{C}a$  with component-wise addition, multiplication given by the bilinear extension of  $a \cdot b := N_{ab}^c c$ , and \*-structure given by the anti-linear extension of \* from (FR2).

<span id="page-13-2"></span>**Exercise 3.5.6.** Suppose  $(S, N_{\bullet \bullet})$  is a rank r fusion rule.

- (1) For  $a \in S$ , let  $N_a \in M_S(\mathbb{C})$  be the matrix whose (c, b)-th entry is given by  $N_{ab}^c$ . Prove that  $N_a$  is the adjacency matrix for the fusion graph  $\Gamma_a$ .
- (2) Prove that  $\mathcal{F}\mathcal{A}(S)$  is \*-isomorphic to the unital complex \*-subalgebra of  $M_S(\mathbb{C})$  generated by the matrices  $N_a$  for  $a \in S$ .
- (3) Deduce that  $\mathcal{F}\mathcal{A}(S)$  is semisimple, i.e., a multimatrix algebra.

**Exercise 3.5.7.** Suppose C is a fusion category.

- (1) Show that  $c \mapsto \dim(\mathcal{C}(1_{\mathcal{C}} \to c))$  extends to a positive trace on  $\mathcal{F}\mathcal{A}(\operatorname{Irr}(\mathcal{C}))$ .
- (2) Suppose tr is a positive trace on a unitary algebra A and  $a \in A$  such that  $tr(a^n) = 0$  for all  $n \in \mathbb{N}$ . Show a is nilpotent, i.e.,  $a^n = 0$  for some  $n \in \mathbb{N}$ .
- (3) Deduce that if  $c \in Irr(\mathcal{C})$ , there is some  $n \in \mathbb{N}$  such that  $1_{\mathcal{C}}$  is a subobject of  $c^{\otimes n}$ .

**Definition 3.5.8.** Suppose  $(S, N_{\bullet\bullet})$  is a fusion rule. The *(Frobenius Perron) dimension*  $d_c = \dim(c)$  of  $c \in S$  is the largest eigenvalue of the fusion matrix  $N_c$  defined in Exercise 3.5.6 above.

<span id="page-13-3"></span>**Exercise 3.5.9** (\*). Suppose  $(S, N_{\bullet \bullet})$  is a fusion rule, and identify  $\mathcal{FA}(S) \subset M_S(\mathbb{C})$  as in Exercise 3.5.6.

- (1) Prove that  $d: S \to \mathbb{C}$  extends to a \*-algebra homomorphism  $\mathcal{FA}(S) \to \mathbb{C}$ .
- (2) Prove that the vector  $d \in \mathbb{C}^{\operatorname{Irr}(\mathcal{C})}$  whose c-th entry is  $d_c$  is an eigenvector for every fusion matrix  $N_a$  for  $a \in \operatorname{Irr}(\mathcal{C})$ .

*Hint: Look at* [EGNO15, Prop. .3.3.6].

**Exercise 3.5.10.** A fusion rule  $(S, N_{\bullet \bullet})$  is *commutative* if  $N_{ab}^c = N_{ba}^c$  for all  $a, b, c \in S$ . Prove that all fusion rules of rank at most 4 are commutative.

Hint: By Exercise 3.5.6,  $\mathcal{F}\mathcal{A}(S)$  is semisimple. By Exercise 3.5.9,  $\mathcal{F}\mathcal{A}(S)$  admits a non-trivial \*-algebra homomorphism to  $\mathbb{C}$ .

**Remark 3.5.11.** A big area of research is to determine when a given fusion rule is *categori-fiable*, i.e., when does there exist a fusion category whose fusion rules reproduce the given fusion rule. This questions is surprisingly hard, whose answer is only known for r = 1, 2 [Ost03]. For unitary fusion categories, the answer is also known for n = 3 [Ost13]. There is some progress on rank 4 [Lar14], but for now, it remains out of reach. Categorifiable multiplicity free fusion rules have been classified up to rank 6 [LPR20].

**Exercise 3.5.12.** Suppose G is a finite group. Show that the fusion graph of  $\mathbb{C}[G] \in \mathsf{Vec}_{\mathsf{fd}}(G)$  is the graph with vertices labelled by  $g \in G$  and one edge from g to h for every  $g, h \in G$ .

**Exercise 3.5.13.** Consider the semisimple linear monoidal category  $Rep(S_3)$ . Compute the fusion graph for the standard 2-dimensional representation of  $S_3$ .

We now show how to find the F-symbols given a unitary fusion category  $\mathcal{C}$  with fusion rule  $(\operatorname{Irr}(\mathcal{C}), N_{\bullet\bullet}^{\bullet})$ . There are many conventions one can choose; we follow [BBCW19, II].

For each  $a \in Irr(\mathcal{C})$  and  $b \in \mathcal{C}$ , we endow the hom space  $\mathcal{C}(a \to b)$  with the isometry inner product determined by the formula

$$\langle \phi | \varphi \rangle_{\text{Isom}} \cdot \text{id}_a = \phi^{\dagger} \circ \varphi = \bigcup_{a}^{a} b \in \mathcal{C}(a \to a) \cong \mathbb{C} \quad \text{via} \quad \text{id}_a \mapsto 1_{\mathbb{C}}.$$

For each triple  $a, b, c \in Irr(\mathcal{C})$ , we fix an orthogonal basis  $\mathcal{B}_c^{ab}$  (which has size  $N_{ab}^c$ ) of the hom space  $\mathcal{C}(c \to a \otimes b)$  normalized so that

<span id="page-14-1"></span>
$$\langle \phi | \varphi \rangle_{\text{Isom}} = \delta_{\phi = \varphi} \sqrt{\frac{d_a d_b}{d_c}}.$$
 (3.5.14)

**Remark 3.5.15.** This is one such normalization for bases that one can choose. We will see in the next section once we introduce the canonical spherical structure on  $\mathcal{C}$  that this choice of normalization behaves well under rotations.

#### <span id="page-14-0"></span>Exercise 3.5.16.

(1) Prove the following fusion relation for  $a, b \in \mathcal{C}$ :

<span id="page-14-2"></span>
$$id_{a\otimes b} = \left| \begin{array}{c} \\ \\ \\ \\ \end{array} \right| = \sum_{c\in Irr(\mathcal{C})} \sqrt{\frac{d_c}{d_a d_b}} \sum_{\phi \in \mathcal{B}_c^{ab}} \underbrace{\begin{array}{c} \\ \\ \\ \phi \\ \end{array}}_{a \mid b}$$

$$(3.5.17)$$

(2) Show that for each  $a, b, c, d \in Irr(\mathcal{C})$ , we get two orthogonal *tree bases* of the Hilbert space  $\mathcal{C}(a \to b \otimes c \otimes d)$ :

$$\left\{ \begin{array}{c|c} b & c & d \\ \hline \varphi & e \in \mathcal{C} \\ \hline \varphi & \varphi \in \mathcal{B}_e^{cd} \\ \hline \phi & \phi \in \mathcal{B}_a^{be} \end{array} \right\} \quad \text{and} \quad \left\{ \begin{array}{c|c} b & c & d \\ \hline \tau & e & f \in \mathcal{C} \\ \hline \varphi & \sigma & \sigma \in \mathcal{B}_a^{fd} \\ \hline \sigma & \tau \in \mathcal{B}_f^{bc} \\ \hline \end{array} \right\}.$$

Since the two tree bases from Exercise 3.5.16(2) are two orthogonal bases of the same Hilbert space where all vectors have the same norm squared, namely  $\sqrt{d_b d_c d_d d_a^{-1}}$ , there is a unitary matrix  $F_a^{bcd}$  which maps between them. That is,  $F_a^{bcd}$  is a unitary transformation between the Hilbert spaces

$$F_a^{bcd}: \bigoplus_{e \in Irr(\mathcal{C})} \mathcal{C}(a \to b \otimes e) \otimes \mathcal{C}(e \to c \otimes d) \longrightarrow \bigoplus_{f \in Irr(\mathcal{C})} \mathcal{C}(a \to f \otimes d) \otimes \mathcal{C}(f \to b \otimes c).$$

The entries of the *F*-matrix are called 6j-symbols, since in the multiplicity free case, they are determined by the 6 parameters a, b, c, d, e, f. In general, they are determined by 10 parameters, where we include the 4 basis elements  $\phi, \varphi, \sigma, \tau$ . The 6j-symbols are determined by the following formula:

$$\begin{array}{c|c}
 b & c & d \\
\hline
\tau & & \\
f & & \\
\hline
\sigma & & \\
a & & \\
\end{array} = \sum_{\substack{e \in \operatorname{Irr}(\mathcal{C}) \\ \phi \in \mathcal{B}_a^{be} \\ \varphi \in \mathcal{B}_e^{cd}}} [F_a^{bcd}]_{(e,\phi,\varphi)}^{(f,\sigma,\tau)} \xrightarrow{b} \begin{bmatrix} c & d \\ \varphi \\ & \\ & \\
\end{array} .$$

Taking inner products with the tree basis diagram on the right hand side in the linear combination yields the following formula for the 6j-symbols:

<span id="page-15-0"></span>
$$[F_a^{bcd}]_{(e,\phi,\varphi)}^{(f,\sigma,\tau)} \cdot id_a = \sqrt{\frac{d_a}{d_b d_c d_d}} b \begin{vmatrix} a \\ \varphi^{\dagger} \\ \varphi^{\dagger} \end{vmatrix}$$

$$(3.5.18)$$

We can now express the associativity axiom as a relation between the F-matrices:

**Remark 3.5.19.** It is worth noting that in the F-matrix formalism, the order of two hom spaces swaps in the associativity axiom by applying the symmetric swap in the fusion category  $\mathsf{Hilb}_{\mathsf{fd}}$ . When we study higher categories, namely  $\mathsf{Gray}$ -categories, this swap operation will no longer be symmetric and can no longer be ignored.

We can now express the associativity axiom above in terms of the 6j-symols:

<span id="page-16-0"></span>
$$\sum_{h,\rho} \left[ F_a^{hde} \right]_{(g,\rho,\tau)}^{(k,\mu,\nu)} \left[ F_a^{bcg} \right]_{(f,\phi,\varphi)}^{(h,\rho,\sigma)} = \sum_{k,\lambda} \left[ F_k^{bcd} \right]_{(j,\lambda,\delta)}^{(h,\nu,\sigma)} \sum_{j,\gamma} \left[ F_a^{bje} \right]_{(f,\phi,\gamma)}^{(k,\mu,\lambda)} \left[ F_f^{cde} \right]_{(g,\varphi,\psi)}^{(j,\gamma,\delta)}$$
(3.5.20)

TODO: Verify I did not make a mistake with this formula.

**Remark 3.5.21.** One might be concerned that in order to obtain the F-matrices and associated 6j-symbols, we made choices of simples and orthogonal bases. However, different choices lead to what are called *gauge equivalent* F-matrices. We will not discuss this further.

**Exercise 3.5.22.** Given a set of fusion rules  $(S, N_{\bullet\bullet})$  and F-matrices satisfying (3.5.20), explain how to construct a corresponding *skeletal* fusion category.

3.6. Examples of unitary fusion categories. We give some important examples and exercises. Some of them are from the perspective of someone who knows algebraic fusion categories but does not think about them in terms of F-matrices. Others are from the F-matrix/6j-symbol perspective.

<span id="page-16-1"></span>**Exercise 3.6.1.** Compute the *F*-matrices for  $\mathsf{Hilb}_{\mathsf{fd}}(G,\omega)$  where  $G \in Z^3(G,U(1))$ . Hint: The *F*-matrices are all  $1 \times 1$  and equal to values of the cocycle  $\omega$ .

<span id="page-16-2"></span>Exercise 3.6.2. There is a non-trivial 3-cocycle on  $\mathbb{Z}/2 = \{1, g\}$  such that  $\omega(g, g, g) = -1$  and all other values +1. Observe there is a unique normalized basis element  $v \in \mathcal{B}_1^{gg}$  up to

phase in. (Here we use v to evoke the image of a cup/coevaluation.) Calculate the scalar  $\lambda$ such that

$$\lambda \operatorname{id}_g = (v^{\dagger} \otimes \operatorname{id}_g) \circ (\operatorname{id}_g \otimes v) = g \left[ \begin{array}{c} v^{\dagger} \\ v \end{array} \right]^g.$$

Why is it dangerous to represent  $v^{\dagger}$  by a cap?

**Exercise 3.6.3.** Suppose G is a finite group.

- (1) Show that  $N_{gh}^k = \delta_{gh=k}$  defines a fusion rule on the set G where fusion is multiplication in G.
- (2) Classify all unitary fusion categories with these fusion rules. Hint: As in Exercise 3.6.1, the  $F_g^{hk\ell}$  for  $g = hk\ell$  are all  $1 \times 1$  unitary matrices. Observe they are really indexed by the three indices  $h, k, \ell$ . Denote  $F_g^{hk\ell} = \omega(h, k, \ell)$ , and compute (3.5.20).

**Example 3.6.4** (Fibonacci/Golden category). There is a unitary fusion category Fib with two simple objects 1,  $\tau$  with fusion rule determined by  $\tau \otimes \tau = 1 \oplus \tau$ . Since Frobenius-Perron dimension d is a \*-algebra homomorphism  $\mathcal{FA}(\operatorname{Irr}(\mathcal{C})) \to \mathbb{C}$  by Exercise 3.5.9, we have

$$d_{\tau}^2 = 1 + d_{\tau} \qquad \Longrightarrow \qquad d_{\tau} = \frac{1 \pm \sqrt{5}}{2}.$$

Since Fib is unitary, it turns out that  $d_{\tau} = \frac{1+\sqrt{5}}{2} =: \phi$ , the golden ratio. Denote by  $v \in \mathsf{Fib}(1 \to \tau \otimes \tau)$  and  $\Delta \in \mathsf{Fib}(\tau \to \tau \otimes \tau)$  the unique normalized basis elements up to phase. We represent them graphically by

$$v = \bigcirc$$
  $\Delta = \bigcirc$ .

In contrast to Exercise 3.6.2, v and  $v^{\dagger}$  satisfy the zig-zag relations (3.4.4), and thus we may represent  $v^{\dagger}$  by a cap. We also denote  $\Delta^{\dagger}$  by the reflection of  $\Delta$  about the x-axis. Our normalization for basis elements (3.5.14) yields the relations

$$v^{\dagger}v = \bigcirc = \phi \operatorname{id}_{1} \qquad \Delta^{\dagger}\Delta = \bigcirc = \sqrt{\phi} \bigcirc.$$

Since 1 and  $\tau$  are distinct simple objects, we have the relation

$$v^{\dagger}\Delta = \bigcirc = 0.$$

The fusion relation (3.5.17) is then given by

<span id="page-17-0"></span>

which is easily seen to be a decomposition of  $id_{\tau \otimes \tau}$  into a sum of minimal central projections in  $\operatorname{End}(\tau \otimes \tau) \cong \mathbb{C}^2$ . It turns out we also have the following additional relations in Fib:

Observe that Fib(τ → τ ⊗ τ ⊗ τ ) is also 2-dimensional and spanned by the two tree bases

$$\{ \bigcup, \bigcup, \bigcup \}$$
 and  $\{ \bigcup, \bigcup \}$ .

Exercise 3.6.6. Use [\(3.5.18\)](#page-15-0) to compute the 6j-symbols for Fib, in particular, F τττ τ .

Exercise 3.6.7. One can also use skein theory to compute F τττ τ .

- (1) Use the Fib relations to prove that = − 1 √ φ .
- (2) Apply the fusion relation [\(3.6.5\)](#page-17-0) to the top two left τ strands in the right associated tree basis and simplify to express them in the left associated tree basis.

The matrix of coefficients exactly give F τττ τ .

Example 3.6.8. There is a unitary fusion category Ising with three simple objects 1, σ, ψ with fusion rules determined by

$$\sigma \otimes \sigma \cong 1 \oplus \psi \qquad \qquad \psi \otimes \psi \cong 1.$$

The subcategory generated by 1, ψ is equivalent to Hilbfd(Z/2). The simple particle/anyon ψ is sometimes called a Majorana fermion. A simple dimension calculation shows

$$d_{\sigma}^2 = 1 + d_{\psi} = 2$$
  $\Longrightarrow$   $d_{\sigma} = \sqrt{2}$ .

We denote σ by a red string and ψ by a blue string. We denote the unique normalized basis elements up to phase by

$$v_{\sigma} = \bigcup \in \mathsf{lsing}(1 \to \sigma \otimes \sigma) \qquad \qquad \bigcup = \sqrt{2} \, \mathrm{id}_1$$

$$v_{\psi} = \bigcup \in \mathsf{lsing}(1 \to \psi \otimes \psi) \qquad \qquad \bigcup = \mathrm{id}_1$$

$$\gamma_{\sigma}^{\sigma\psi} = \bigvee \in \mathsf{lsing}(\sigma \to \sigma \otimes \psi) \qquad \qquad \bigcup = \bigcup.$$

$$\gamma_{\sigma}^{\psi\sigma} = \bigvee \in \mathsf{lsing}(\sigma \to \psi \otimes \sigma) \qquad \qquad \bigcup = \bigcup.$$

$$\gamma_{\psi}^{\sigma\sigma} = \bigvee \in \mathsf{lsing}(\psi \to \sigma \otimes \sigma) \qquad \qquad \bigcup = \sqrt{2} \bigcup.$$

We denote their daggers by their vertical reflections, and we have the normalizations on the right hand side above. We warn the reader that while the blue cup satisfies the zig-zag relation [\(3.4.4\)](#page-11-0), the red cap does not; rather the red cup satisfies zig-zag up to a minus sign as in Exercise [3.6.2.](#page-16-2)

Since 1 and ψ are distinct simple objects, we have the relation

$$\upsilon_{\sigma}^{\dagger}\gamma_{\psi}^{\sigma\sigma} = \bigcirc \bigcirc = 0.$$

The fusion relation [\(3.5.17\)](#page-14-2) is then given by

$$\boxed{ } = \frac{1}{\sqrt{2}} \boxed{ } + \frac{1}{\sqrt{2}} \boxed{ }.$$

Exercise 3.6.9. Use [\(3.5.18\)](#page-15-0) to compute the 6j-symbols for Ising, in particular, F σσσ σ . Then compute the 6j-symbols using skein theory.

# 3.7. Dual functors and pivotal structures on semisimple multitensor categories. For this section, C will always denote a semisimple multitensor category.

A choice of dual (c ∨ , evc, coevc) for every object c ∈ C assembles into an anti-monoidal contravariant functor ∨ : C → C. For f ∈ C(a → b), we define

$$f^{\vee} := \int_{b^{\vee}} \left[ f \right]^{a^{\vee}} = (\operatorname{ev}_b \otimes \operatorname{id}_{a^{\vee}}) \circ (\operatorname{id}_{b^{\vee}} \otimes f \otimes \operatorname{id}_{a^{\vee}}) \circ (\operatorname{id}_{b^{\vee}} \otimes \operatorname{coev}_a),$$

<span id="page-19-0"></span>and ∨ has canonical tensorator given by

$$\nu_{a,b} := \int_{b^{\vee} a^{\vee}} |a \otimes b|^{\vee} \\
= (\operatorname{ev}_{b} \otimes \operatorname{id}_{(a \otimes b)^{\vee}}) \circ (\operatorname{id}_{b^{\vee}} \otimes \operatorname{ev}_{a} \otimes \operatorname{id}_{b} \otimes \operatorname{id}_{(a \otimes b)^{\vee}}) \circ (\operatorname{id}_{b^{\vee} \otimes a^{\vee}} \otimes \operatorname{coev}_{a \otimes b})$$
(3.7.1)

Following [\[DSPS13\]](#page-25-3), we define:

- C op is the arrow opposite tensor category with the opposite morphisms, i.e., C op(a → b) = C(b → a),
- C mp is the monoidal opposite tensor category with the opposite monoidal product, i.e., a ⊗mp b = b ⊗ a, and
- C mop is the opposite tensor category with both the opposite morphisms and the opposite monoidal product.

We now view ∨ as a monoidal equivalence C → Cmop called a dual functor.

Exercise 3.7.2. Prove that any other choices of duals yields a canonically naturally isomorphic monoidal equivalence C → Cmop. That is, while we made choices of duals to get a dual functor, there is a contractible choice of dual functors. In this sense, the existence of a dual functor on a tensor category is a property and not extra structure.

Hint: For c ∈ C with duals (c ∨ i , coev<sup>i</sup> , evi) for i = 1, 2 consider the isomorphism

$$\zeta_c := {\atop c^{\vee_2}} \bigcap^{c^{\vee_1}} = (\operatorname{ev}_2 \otimes \operatorname{id}_{c^{\vee_1}}) \circ (\operatorname{id}_{c^{\vee_2}} \otimes \operatorname{coev}_1).$$

In Vecfd, the double dual of a space is canonically isomorphic to the original space. These canonical isomorphisms assemble into a monoidal natural isomorphism ϕ : id<sup>C</sup> ⇒ ∨ ◦ ∨.

Definition 3.7.3. A pivotal structure is a choice of dual functor together with a monoidal natural isomorphism ϕ : id<sup>C</sup> ⇒ ∨ ⊗ ∨. Naturality means that

$$\begin{array}{c|c}
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\
 & \downarrow & \downarrow \\$$

Two pivotal structures  $(\vee_1, \varphi^1)$  and  $(\vee_2, \varphi^2)$  on  $\mathcal{C}$  are equivalent if for every  $c \in \mathcal{C}$ , the following diagram commutes:

$$c \xrightarrow{\varphi_c^1} c_1^{\vee\vee} \xrightarrow{c_2^{\vee\vee}} c_2^{\vee\vee} c_1^{\vee\vee}$$

$$c_2^{\vee\vee} c_1^{\vee\vee}$$

$$c_2^{\vee\vee} c_1^{\vee\vee}$$

$$(3.7.4)$$

**Remark 3.7.5.** A pivotal multitensor category  $\mathcal{C}$  admits a graphical calculus where we may freely perform isotopies which rotate coupons by  $2\pi$ . Again, one may suppress the pivotal isomorphisms  $\varphi$  with the understanding that given any complete labelling of the source and target objects, any algebraic expression for the diagram yields the same morphism in  $\mathcal{C}$ .

**Remark 3.7.6.** At this time, it is an open question whether every fusion category admits a pivotal structure.

**Exercise 3.7.7.** Prove that the set of pivotal structures on  $\mathcal{C}$  is isomorphic to the group  $\operatorname{Aut}_{\otimes}(\operatorname{id}_{\mathcal{C}})$  of monoidal natural isomorphisms of the identity functor.

Two equivalent/non-equivalent pivotal structures can look very different/similar given the choice of dual functor. The next exercise illustrates exactly this phenomenon.

**Exercise 3.7.8.** Show there are three equivalence classes of pivotal structures on  $\mathsf{Vec}_{\mathsf{fd}}(\mathbb{Z}/3)$ . Show that if we choose our duals appropriately by incorporating various cube roots of unity, we may arrange so that each equivalence class of pivotal structure has a representative where  $\vee \circ \vee = \mathrm{id}_{\mathcal{C}}$  and  $\varphi = \mathrm{id}$ .

**Definition 3.7.9.** Suppose C is a semisimple multitensor category. A *self-duality* for an object  $c \in C$  is an isomorphism  $\psi_c : c \to c^{\vee}$ . (A self-duality need not exist.) An object is called *self-dual* if it has a self-duality.

Suppose now  $\mathcal{C}$  has pivotal structure  $(\vee, \varphi)$ . Suppose  $c \in \mathcal{C}$  is simple with self-duality  $\psi_c : c \to c^{\vee}$ . Observe that  $\mathcal{C}(c \to c^{\vee}) \cong \mathcal{C}(c \to c) = \mathbb{C} \operatorname{id}_c$ , so  $\mathcal{C}(c \to c^{\vee}) = \mathbb{C} \psi_c$ , i.e., any other choice of self-duality differs from  $\psi_c$  by a scalar.

Consider the  $\pi$ -rotation operator on  $\mathcal{C}(c \to c^{\vee})$ :

$$\rho(\psi_c) := \begin{array}{c|c} c^{\vee\vee} & c^{\vee} \\ \varphi_c & c \end{array} \quad \in \mathcal{C}(c \to c^{\vee}) = \mathbb{C}\psi_c.$$

We see there is some  $\lambda \in \mathbb{C}^{\times}$  such that  $\rho(\psi_c) = \lambda \psi_c$ . Since  $(\mathcal{C}, \vee, \varphi)$  is pivotal,

$$\psi_c = \rho^2(\psi_c) = \lambda \rho(\psi_c) = \lambda^2 \psi_c \implies \lambda^2 = 1.$$

Observe that the scalar  $\lambda$  is independent of the choice of  $\psi_c$ . If  $\lambda = 1$ , we call  $\psi_c$  a symmetric self-duality or a real structure; if  $\lambda = -1$ , we call  $\psi_c$  an anti-symmetric self-duality or a pseudo-real structure. We call the object symmetrically self-dual/real or anti-symmetrically self-dual/pseudoreal accordingly.

**Exercise 3.7.10.** Prove that  $g \in \mathsf{Hilb}_{\mathsf{fd}}(\mathbb{Z}/2, \omega)$  from Exercise 3.6.2 is pseudoreal.

**Remark 3.7.11.** We can generalize symmetric self-duality to non-simple objects, but in this case  $\lambda$  is no longer a scalar, but rather a matrix which squares to the identity.

**Exercise 3.7.12.** Show that in any pivotal fusion category  $(\mathcal{C}, \vee, \varphi)$ , the object  $c \oplus c^{\vee}$  has a canonical real structure.

**Definition 3.7.13.** A pivotal structure on C yields two  $\mathbb{C}$ -valued *traces* on every endomorphism algebra:

<span id="page-21-1"></span>
$$\operatorname{tr}_{L}^{\varphi}(f) := c^{\vee} \underbrace{\begin{pmatrix} c \\ f \\ \varphi_{c} \\ c^{\vee} \end{pmatrix}}_{c} \operatorname{tr}_{R}^{\varphi}(f) := \underbrace{\begin{pmatrix} c^{\vee \vee} \\ \varphi_{c} \\ f \\ c \end{pmatrix}}_{c} c^{\vee} \qquad \forall f \in \mathcal{C}(c \to c). \tag{3.7.14}$$

Let  $1_{\mathcal{C}} = \bigoplus_{i=1}^{n} 1_i$  be a decompostion into simples, and let  $p_i \in \mathcal{C}(1_{\mathcal{C}} \to 1_{\mathcal{C}})$  be the minimal idempotent onto  $1_i$ . We get  $M_r(\mathbb{C})$ -valued traces  $\mathrm{Tr}_{L/R}^{\varphi}$  on each endomorphism algebra determined by the formulas

<span id="page-21-0"></span>
$$(\operatorname{Tr}_{L/R}^{\varphi}(f))_{ij}\operatorname{id}_{1_j} = \operatorname{tr}_{L/R}^{\varphi}(p_i \otimes f \otimes p_j) \qquad \forall f \in \mathcal{C}(c \to c). \tag{3.7.15}$$

We say  $(\vee, \varphi)$  is *spherical* if  $\operatorname{Tr}_L^{\varphi} = \operatorname{Tr}_R^{\varphi}$  on each endomorphism algebra. If we shade regions in our diagrams to denote simple summands of  $1_{\mathcal{C}}$ , (3.7.15) can be represented graphically by

$$c^{\vee} \underbrace{\begin{bmatrix} c \\ f \\ \varphi_c^{-1} \end{bmatrix}}_{c} = \operatorname{Tr}_L^{\varphi}(f)_{ij} = \operatorname{Tr}_R^{\varphi}(f)_{ij} = \underbrace{\begin{bmatrix} c^{\vee\vee} \\ \varphi_c \\ e \\ f \end{bmatrix}}_{c} c^{\vee}$$

**Exercise 3.7.16.** Prove that  $\operatorname{tr}_{L/R}^{\varphi}$  are  $\operatorname{tracial}$ , i.e.,  $\operatorname{tr}_{L/R}^{\varphi}(f \circ g) = \operatorname{tr}_{L/R}^{\varphi}(g \circ f)$  for all  $f \in \mathcal{C}(a \to b)$  and  $g \in \mathcal{C}(b \to a)$ . Deduce that  $\operatorname{Tr}_{L/R}^{\varphi}$  are tracial.

**Definition 3.7.17.** Given a pivotal structure  $(\vee, \varphi)$  on  $\mathcal{C}$ , we get left and right quantum dimensions for each simple object  $c \in \mathcal{C}$  by  $\dim_{L/R}^{\varphi}(c) := \operatorname{tr}_{L/R}^{\varphi}(\operatorname{id}_c)$ . If these dimensions are always positive, we call  $(\vee, \varphi)$  pseudounitary.

**Exercise 3.7.18.** Suppose C is a semisimple multitensor category.

- (1) Show that for every simple object  $c \in \mathcal{C}$ , if  $f \in \mathcal{C}(1_{\mathcal{C}} \to c \otimes c^{\vee})$  and  $g \in \mathcal{C}(c \otimes c^{\vee} \to 1_{\mathcal{C}})$  are non-zero, then so is  $g \circ f$ . [HPT16, Lem. A.5]
- (2) Suppose  $(\vee, \varphi)$  is a pivotal structure on  $\mathcal{C}$ . Prove that  $\operatorname{tr}_{L/R}^{\varphi}$  is nondegenerate, i.e., for every non-zero  $f \in \mathcal{C}(a \to b)$ , there is a  $g \in \mathcal{C}(b \to a)$  such that  $\operatorname{tr}_{L/R}^{\varphi}(g \circ f) \neq 0$ .
- (3) Deduce that quantum dimensions of simple objects are always non-zero.

**Exercise 3.7.19.** Suppose  $\mathcal{C}$  is a fusion category with a pivotal structure  $(\vee, \varphi)$ . Prove that the quantum dimensions  $\dim_{L/R}^{\varphi}$  give algebra homomorphisms  $\mathcal{FA}(\operatorname{Irr}(\mathcal{C})) \to \mathbb{C}$ . Deduce that if  $(\vee, \varphi)$  is pseudounitary, then  $(\vee, \varphi)$  is spherical.

Hint: Use the uniqueness of the Frebenius-Perron eigenvector (up to scaling).

Remark 3.7.20. Our definition of psedunitarity differs from [\[EGNO15,](#page-25-1) §9.4] for a fusion category, as we wish to use this adjective for non-finitely semisimple tensor categories. However, in the case of fusion categories, our definitions can be shown to be equivalent.

Without a pivotal structure, one can define the quantum dimension of a fusion category as follows. Let Irr(C) be a set of representatives for the isomorphism classes of simple objects of C. Using Frobenius reciprocity [\(3.4.8\)](#page-11-1) and semisimplicity, there is a non-canonical isomorphism ψ<sup>c</sup> ∈ C(c → c ∨∨) for each c ∈ Irr(C). Indeed, c <sup>∨</sup> ∈ Irr(C) is determined by dim(C(1<sup>C</sup> → c ⊗ c ∨ )) = 1. But then

$$\dim(\mathcal{C}(1_{\mathcal{C}} \to c \otimes c^{\vee})) = \dim(\mathcal{C}(c \otimes c^{\vee} \to 1_{\mathcal{C}})) = \dim(\mathcal{C}(c \to c^{\vee\vee})),$$

and we have the existence of our isomorphism. Note, however, that choosing such isomorphisms for all c ∈ Irr(C) may not assemble into a pivotal structure. With such a choice for each c ∈ Irr(C), we get a categorical dimension

$$\dim(\mathcal{C}) := \sum_{c \in \operatorname{Irr}(\mathcal{C})} \ c^{\vee} \underbrace{ \left( \psi_c^{-1} \right)^c}_{c^{\vee\vee}} \ \cdot \ \underbrace{ \left( \psi_c^{\vee\vee} \right)^c}_{c} c^{\vee} \right)}_{c}$$

which is independent of the choices of ψc, as we are summing over ψ<sup>c</sup> and their inverses. (One should view this as summing over a basis and a dual basis.)

Following [\[EGNO15,](#page-25-1) Def. 9.4.4] a fusion category is pseudounitary if

$$\dim(\mathcal{C}) = \operatorname{FPdim}(\mathcal{C}) := \sum_{c \in \operatorname{Irr}(\mathcal{C})} \operatorname{FPdim}(c)^2$$

where FPdim(c) is the largest eigenvalue of the fusion matrix Nc. It can be shown that in this case, C has a canonical spherical structure where all quantum dimensions are strictly positive.

3.8. Unitary dual functors on unitary multitensor categories. While all dual functors on a semisimple multitensor category are canonically monoidal naturally isomorphic, this natural isomorphism need not be unitary. Thus, these non-unitary isomorphisms violate the principle of equivalence, as the natural notion of isomorphism in a unitary category is unitary isomorphism.

Example 3.8.1 (Examples of non-unitary equivalence). Here are some pathologies which arise from non-unitary equivalence in unitary categories.

- (1) Conjugating a self-adjoint operator by a bounded linear isomorphism need not produce a self-adjoint operator unless the isomorphism is unitary.
- (2) In finite dimensions, taking coordinates for a self-adjoint operator with respect to a basis need not produce a self-adjoint matrix unless the basis is orthonormal.

From this point onward in this section, C will denote a unitary multitensor category.

Exercise 3.8.2 ([\[Sel11,](#page-26-9) Lem. 7.5] and [\[Pen20,](#page-26-10) §3.2]). Fix a dual functor ∨ : C → Cmop with its canonical tensorator ν from [\(3.7.1\)](#page-19-0).

- (1) Prove the following are equivalent.
  - (a) ∨ is a dagger tensor functor, i.e., for all a, b ∈ C and f ∈ C(a → b), νa,b is unitary and f ∨† = f †∨ .

(b) Defining  $\varphi_c := (\operatorname{coev}_c^{\dagger} \otimes \operatorname{id}_{c^{\vee\vee}}) \circ (\operatorname{id}_c \otimes \operatorname{coev}_{c^{\vee}})$  gives a pivotal structure  $\varphi : \operatorname{id} \Rightarrow \vee \circ \vee$ .

A dual functor satisfying these equivalent conditions is called a *unitary dual functor*.

(2) Suppose  $\vee$  is a unitary dual functor. Show that for all  $c \in \mathcal{C}$ ,

<span id="page-23-0"></span>
$$(\operatorname{coev}_{c}^{\dagger} \otimes \operatorname{id}_{c^{\vee\vee}}) \circ (\operatorname{id}_{c} \otimes \operatorname{coev}_{c^{\vee}}) =: \varphi_{c} = (\operatorname{id}_{c^{\vee\vee}} \otimes \operatorname{ev}_{c}) \circ (\operatorname{ev}_{c^{\vee}}^{\dagger} \otimes \operatorname{id}_{c}), \tag{3.8.3}$$

*Hint:* By (a),  $\operatorname{coev}_c^{\dagger \vee} = \operatorname{coev}_c^{\vee \dagger} = \operatorname{ev}_{c_{\vee}}^{\dagger}$ .

(3) Prove (3.8.3) is equivalent to  $\varphi_c$  being unitary for all  $c \in \mathcal{C}$ .

**Exercise 3.8.4.** Suppose  $\vee$  is a unitary dual functor on  $\mathcal{C}$ . Show we have the following formulas for the left and right pivotal traces on  $\mathcal{C}$ :

$$\operatorname{tr}_L^{\varphi}(f) \underset{(3.7.14)}{=} \operatorname{ev}_c \circ (\operatorname{id}_{c^{\vee}} \otimes f) \circ (\operatorname{id}_{c^{\vee}} \otimes \varphi_c^{-1}) \circ \operatorname{coev}_{c^{\vee}} \underset{(3.8.3)}{=} \operatorname{ev}_c \circ (\operatorname{id}_{\bar{c}^{\vee}} \otimes f) \circ \operatorname{ev}_c^{\dagger}$$
$$\operatorname{tr}_R^{\varphi}(f) \underset{(3.7.14)}{=} \operatorname{ev}_c \circ (\varphi_c \otimes \operatorname{id}_{c^{\vee}}) \circ (f \otimes \operatorname{id}_{c^{\vee}}) \circ \operatorname{coev}_{c^{\vee}} \underset{(3.8.3)}{=} \operatorname{coev}_c^{\dagger} \circ (f \otimes \operatorname{id}_{c^{\vee}}) \circ \operatorname{coev}_c.$$

Deduce that the left and right pivotal traces are positive linear functionals on endomorphism \*-algebras of  $\mathcal{C}$ , and that the corresponding quantum dimensions are always strictly positive.

Remark 3.8.5. While all dual functors are uniquely monoidally naturally isomorphism, this isomorphism need not be unitary. Indeed, not all unitary dual functors are unitarily isomorphic. The main result of [Pen20, §3.2] gives a classification of unitary dual functors in terms of homomorphisms to  $\mathbb{R}_{>0}$  from the *universal grading groupoid* of  $\mathcal{C}$ . For our purposes here, we will need only the unique unitary spherical structure due to [LR97, Yam04, BDH14]. This is the next exercise.

<span id="page-23-1"></span>**Exercise 3.8.6.** Suppose C is a unitary multitensor category. Show there is a unique unitary dual functor  $\vee$  up to unique unitary monoidal natural isomorphism such that the associated canonical pivotal structure (3.8.3) is spherical.

Hint: You could proceed as follows following [NT13, Prop. 2.2.15].

(1) Suppose that  $c \in C_{ij}$  is simple. Scale arbitrarily chosen  $ev_c$ ,  $coev_c$  by inverse scalars so that

$$\dim_L^{\varphi}(c) = \bigcirc_{\mathbf{ev}_c^{\dagger}}^{\mathbf{ev}_c} = \bigcirc_{\mathbf{coev}_c^{\dagger}}^{\mathbf{coev}_c^{\dagger}} = \dim_R^{\varphi}(c) \qquad = p_i, \qquad = p_j.$$

Show that these normalized  $ev_c$ ,  $coev_c$  are unique up to a unique phase in U(1).

- (2) Suppose that c ∈ C is isotypic, i.e., isomorphic to the orthogonal direct sum of n copies of the simple object a ∈ C. Build ev<sub>c</sub> and coev<sub>c</sub> from the isometries in the orthogonal direct sum decomposition and the unique spherical solutions for a from (1). Show that any other choice of spherical solutions for a or orthogonal direct sum decomposition of c yields a uniquely unitarily isomorphic choice.
- (3) For  $c \in \mathcal{C}$  arbitrary, decompose c into isotypic components and repeat (2).

**Exercise 3.8.7.** Suppose  $\mathcal{C}$  is a unitary fusion category and  $c \in \operatorname{Irr}(\mathcal{C})$  is self-dual. Let  $v \in \mathcal{B}_1^{cc}$  be the unique normalized basis element up to phase. Prove the following assertions.

(1) The scalar λ determined by

<span id="page-24-0"></span>
$$\lambda \operatorname{id}_{c} = (v^{\dagger} \otimes \operatorname{id}_{g}) \circ (\operatorname{id}_{g} \otimes v) = c \begin{vmatrix} v^{\dagger} \\ c \end{vmatrix} c$$

$$(3.8.8)$$

must equal ±1.

Hint: Choosing c <sup>∨</sup> = c and coev<sup>c</sup> := υ, the uniqueness of the unitary dual functor implies that the right hand side of [\(3.8.8\)](#page-24-0) is exactly ϕ<sup>c</sup> by [\(3.8.3\)](#page-23-0).

(2) c is real if and only if λ = +1 and pseudoreal if and only if λ = −1.

Remark 3.8.9. Physicists typically denote υ by a cup and υ † by a cap so that the zigzag relation [\(3.4.4\)](#page-11-0) only holds up to scalar. They are then able to completely suppress the existence of a pivotal structure for their unitary fusion category. As a unitary fusion category has a unique unitary spherical structure by Exercise [3.8.6,](#page-23-1) this seems like a very reasonable thing to do.

We conclude this section with the following chart of which diagrams we may draw in various notions of monoidal category. Some diagrams below come from [\[HPT16,](#page-26-3) §2.1].

#### References

- <span id="page-25-2"></span>[BBCW19] Maissam Barkeshli, Parsa Bonderson, Meng Cheng, and Zhenghan Wang, Symmetry fractionalization, defects, and gauging of topological phases, PHYSICAL REVIEW B 100 (2019), 115147, [arXiv:1410.4540](http://arxiv.org/abs/1410.4540) [DOI:10.1103/PhysRevB.100.115147](http://dx.doi.org/10.1103/PhysRevB.100.115147).
- <span id="page-25-4"></span>[BDH14] Arthur Bartels, Christopher L. Douglas, and Andr´e Henriques, Dualizability and index of subfactors, Quantum Topol. 5 (2014), no. 3, 289–345, [MR3342166](http://www.ams.org/mathscinet-getitem?mr=MR3342166) [DOI:10.4171/QT/53](http://dx.doi.org/10.4171/QT/53) [arXiv:1110.](http://arxiv.org/abs/1110.5671) [5671](http://arxiv.org/abs/1110.5671). MR 3342166
- <span id="page-25-0"></span>[BW96] John W. Barrett and Bruce W. Westbury, Invariants of piecewise-linear 3-manifolds, Trans. Amer. Math. Soc. 348 (1996), no. 10, 3997–4022. MR 1357878
- <span id="page-25-3"></span>[DSPS13] Chris Douglas, Chris Schommer-Pries, and Noah Snyder, Dualizable tensor categories, 2013, [arXiv:1312.7188](http://arxiv.org/abs/1312.7188).
- <span id="page-25-1"></span>[EGNO15] Pavel Etingof, Shlomo Gelaki, Dmitri Nikshych, and Victor Ostrik, Tensor categories, Mathematical Surveys and Monographs, vol. 205, American Mathematical Society, Providence, RI, 2015, [MR3242743](http://www.ams.org/mathscinet-getitem?mr=MR3242743) [DOI:10.1090/surv/205](http://dx.doi.org/10.1090/surv/205). MR 3242743

- <span id="page-26-3"></span>[HPT16] Andr´e Henriques, David Penneys, and James Tener, Categorified trace for module tensor categories over braided tensor categories, Doc. Math. 21 (2016), 1089–1149, [MR3578212](http://www.ams.org/mathscinet-getitem?mr=MR3578212) [arXiv:1509.](http://arxiv.org/abs/1509.02937) [02937](http://arxiv.org/abs/1509.02937). MR 3578212
- <span id="page-26-2"></span>[HV19] Chris Heunen and Jamie Vicary, Categories for quantum theory, Oxford Graduate Texts in Mathematics, vol. 28, Oxford University Press, Oxford, 2019, An introduction, [MR3971584](http://www.ams.org/mathscinet-getitem?mr=MR3971584) [DOI:10.1093/oso/9780198739623.001.0001](http://dx.doi.org/10.1093/oso/9780198739623.001.0001). MR 3971584
- <span id="page-26-7"></span>[Lar14] Hannah K. Larson, Pseudo-unitary non-self-dual fusion categories of rank 4, J. Algebra 415 (2014), 184–213, [MR3229513](http://www.ams.org/mathscinet-getitem?mr=MR3229513), [DOI:10.1016/j.jalgebra.2014.05.032](http://dx.doi.org/10.1016/j.jalgebra.2014.05.032). MR 3229513
- <span id="page-26-8"></span>[LPR20] Zhengwei Liu, Sebastien Palcoux, and Yunxiang Ren, Classification of Grothendieck rings of complex fusion categories of multiplicity one up to rank six, 2020, [arXiv:2010.10264](http://arxiv.org/abs/2010.10264).
- <span id="page-26-11"></span>[LR97] R. Longo and J. E. Roberts, A theory of dimension, K-Theory 11 (1997), no. 2, 103–159, [MR1444286](http://www.ams.org/mathscinet-getitem?mr=MR1444286) [DOI:10.1023/A:1007714415067](http://dx.doi.org/10.1023/A:1007714415067). MR 1444286
- <span id="page-26-4"></span>[MS89] Gregory Moore and Nathan Seiberg, Classical and quantum conformal field theory, Comm. Math. Phys. 123 (1989), no. 2, 177–254, [MR1002038](http://www.ams.org/mathscinet-getitem?mr=MR1002038). MR 1002038
- <span id="page-26-0"></span>[M¨ug03] Michael M¨uger, From subfactors to categories and topology. I. Frobenius algebras in and Morita equivalence of tensor categories, J. Pure Appl. Algebra 180 (2003), no. 1-2, 81–157, [MR1966524](http://www.ams.org/mathscinet-getitem?mr=MR1966524) [DOI:10.1016/S0022-4049\(02\)00247-5](http://dx.doi.org/10.1016/S0022-4049(02)00247-5) [arXiv:math.CT/0111204](http://arxiv.org/abs/math.CT/0111204).
- <span id="page-26-13"></span>[NT13] Sergey Neshveyev and Lars Tuset, Compact quantum groups and their representation categories, Cours Sp´ecialis´es [Specialized Courses], vol. 20, Soci´et´e Math´ematique de France, Paris, 2013, [MR3204665](http://www.ams.org/mathscinet-getitem?mr=MR3204665). MR 3204665
- <span id="page-26-5"></span>[Ost03] Viktor Ostrik, Fusion categories of rank 2, Math. Res. Lett. 10 (2003), no. 2-3, 177–183, [MR1981895](http://www.ams.org/mathscinet-getitem?mr=MR1981895) [arXiv:math.QA/0203255](http://arxiv.org/abs/math.QA/0203255). MR MR1981895 (2004c:18015)
- <span id="page-26-6"></span>[Ost13] Victor Ostrik, Pivotal fusion categories of rank 3, 2013, (with an Appendix written jointly with Dmitri Nikshych), [arXiv:1309.4822](http://arxiv.org/abs/1309.4822).
- <span id="page-26-1"></span>[Pal01] Theodore W. Palmer, Banach algebras and the general theory of ∗-algebras. Vol. 2, Encyclopedia of Mathematics and its Applications, vol. 79, Cambridge University Press, Cambridge, 2001, ∗ algebras, [MR1819503](http://www.ams.org/mathscinet-getitem?mr=MR1819503) [DOI:10.1017/CBO9780511574757.003](http://dx.doi.org/10.1017/CBO9780511574757.003). MR 1819503
- <span id="page-26-10"></span>[Pen20] David Penneys, Unitary dual functors for unitary multitensor categories, High. Struct. 4 (2020), no. 2, 22–56, [MR4133163](http://www.ams.org/mathscinet-getitem?mr=MR4133163) [arXiv:1808.00323](http://arxiv.org/abs/1808.00323). MR 4133163
- <span id="page-26-9"></span>[Sel11] P. Selinger, A survey of graphical languages for monoidal categories, New structures for physics, Lecture Notes in Phys., vol. 813, Springer, Heidelberg, 2011, [MR2767048](http://www.ams.org/mathscinet-getitem?mr=MR2767048) [DOI:10.1007/978-3-642-12821-9\\_4](http://dx.doi.org/10.1007/978-3-642-12821-9_4), pp. 289–355. MR 2767048 (2012j:18011)
- <span id="page-26-12"></span>[Yam04] Shigeru Yamagami, Frobenius duality in C ∗ -tensor categories, J. Operator Theory 52 (2004), no. 1, 3–20, [MR2091457](http://www.ams.org/mathscinet-getitem?mr=MR2091457). MR 2091457 (2005f:46109)