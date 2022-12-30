# Parcial 21/22 Q1 

- Insert your answers on the dotted lines ... below, and only there.
- Do NOT modify the problems or the @nota lines.
- When finished, upload this file with the same name: exam.txt
- Use the text symbols:     
  - &. And
  - v. Or
  - -. Not   
  - ->. Implies      
  - |=. Satisfies
  - A. Forall
  - E. Exists

You can write subindices using "_". For example write x_i to denote x-sub-i.

## Problema 1.

> Let F and G be propositional formulas such that $F$ is satisfiable and $F \rightarrow G$ is also satisfiable. Is it true that $G$ is satisfiable? Prove it using only the definitions of propositional logic.

Fals. Es demostrara amb un contraexemple. Suposem que $F = p$ i $G = p \wedge \neg p$. Existeix una interpretació $I(p)=1$, que satisfà $F$. 

Si traduim $F \rightarrow G$ a $(\neg F \vee G)$, podem veure com la interpretació $I(p) = 0$ ho satisfa. En canvi, podem veure que $I(p) = 0$ no satisfà a $G$. 

> Let F and G be propositional formulas such that F is a tautology. Is it true that $F \wedge G$ is logically equivalent to G? Prove it using only the definitions of propositional logic.

|   |   |   |
|:-:|:-:|:-:|
| $F \wedge G \equiv G$  | iff | [Per definició d'equivalencia] |
| $F \wedge G \models G$ | iff | [Per definició de model] |
| $\forall I, I \models (F\wedge G) \leftrightarrow I \models G$ | iff | [Per definició de model] |
| $\forall I, \texttt{eval}_I(F\wedge G) = \texttt{eval}_I(G)$ | iff | [Per definició de AND] |
| $\forall I, min(\texttt{eval}_I(F), \texttt{eval}_I(G)) = \texttt{eval}_I(G)$ | iff | [Per definició de tautologia] |
| $\forall I, min(1, \texttt{eval}_I(G)) = \texttt{eval}_I(G)$ | iff | [min(1, a) = a] |
| $\forall I, \texttt{eval}_I(G) = \texttt{eval}_I(G)$ | iff | [True] |

## Problema 2.

> Is 1in3-SAT in NP? Explain in a few words why.

Es NP ja que comprovar si una solució satisfa el problema te cost "polinomic". En canvi, per trobar la solució ideal no existiex cap algorisme per trobar una solució valida en un temps "polinomic". 

> Let C be a normal 3-SAT clause l1 v l2 v l3, where l1,l2,l3 are literals over variables x,y,z. Let F be: 1in3(-l1,a,b) & 1in3(l2,b,c) & 1in3(-l3,c,d) (here a,b,c,d are variables). Check for each one of the 7 possible models I of C that then F has a model I' such that I' "extends" I, that is I(x)=I'(x), I(y)=I'(y), I(z)=I'(z). Similarly, check that for the (unique) I that is NOT a model of C, there is no model I' of F extending I (and therefore every model I' of F extends a model I of C).

Les set interpretacións I sobre C son les seguents. En cada cas, s'extendrà la interpretació del model.

    l1 l2 l3     abcd
    0  0  1     0010 
    0  1  0     0000
    0  1  1     0001
    1  0  0     0100
    1  0  1     0101
    1  1  0     1000
    1  1  1     1001

If I is not a model of C, then we have I(l1)=I(l2)=I(l3)=0 and by the first and last constraints of F, abcd must all be false in I', contradicting the second constraint, so there is no model I' of F.

> Is 1in3-SAT NP-complete? Explain very briefly why. Hint: use 2a) and 2b).

Com s'ha demostrat en l'apartat a), el problema es NP. A més, tal i com s'ha fet en l'apartat b), s'ha pogut veure que el problema 1in3 es pot reduïr a un problema SAT, el qual, se sap que es un problema NP-Complert.

## Problema 3.

> 2-coloring: given an undirected graph G and 2 colors, can we assign a color to each node of G such that adyacent nodes get different colors?

    adjacent(N1, N2) --> Returns if N1 and N2 are adjacents.
    nodeColor(N, C) --> Returns the color of a node.
    (nodeColor(N1, C) & nodeColor(N2, C) & -adjacent(N1, N2))

---

    nodeHasColor(N) --> Returns true if N has a color.
    for all nodes N1, N2 that are adjacents (nodeHasColor(N1) & -nodeHasColor(N2))
    Is a 2-SAT problem

> 3-coloring.

"Not possible"

> Amazon. Assume M is a list of Amazon products we MUST buy. P is a list of pairs (p,p') of products that are incompatible: we cannot buy p and also p'. R is a list of rules of the form "S needs p", indicating that, if we buy all products in the set of products S, then we must also buy the product p. Given M,P,R, can we buy a set of products satisfying the requirements of M,P,R?

    incompatible(p, q) --> Returns if p and q are incompatible
    requirements(p, r) --> Returns the requirements for buying a product.
    for all products (requirements(p, r), -incompatible(p, q))
    SAT problem

## Problema 4.
UNIQUE-SAT is the problem of determining whether a given set of clauses S has exactly one model. Explain very briefly how you would use a SAT solver to decide UNIQUE-SAT.

    Execute the problem by using a normal SAT
    if not result: return "false"
    else:
        Add the obtained result as a clause, for example this combinations must not be in the solution.
        if not result: return "true"
        else: return "false"
    
