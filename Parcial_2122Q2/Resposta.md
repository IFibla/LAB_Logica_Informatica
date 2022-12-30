# Parcial 21/22 Q2 

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

> Let F and G be propositional formulas such that $G \models F$. Is it true that then always  $F \models G$  or  $F \models -G$ ? Prove it as simply as you can using only the definitions of propositional logic.

  Abans de començar amb el exercici, es definiria el símbol $\models$. Direm que per tota interpretació I que satisfa a $G$, aquesta mateixa interpretació satisfara a $F$. Llavors, es amb aquest concepte en ment, es demostran la correctesa o no correctesa de les dos definicions.

  * <b>$F \models G$</b>. Direm que es falsa, i mitjançant l'ús de la definició de $\models$ i les definicions de logica proposicional es demostrarà. Començarem definint les funcions $G = p$ i $F = p \vee q$. Llavors, la interpretació $I \models G$ és $I(p) = 1$, i alhora també $I \models F$, i per tant, fent un abus del llenguatge podem dir que $G \models F$. En canvi, una possible interpretació $I \models F$ pot ser $I(p, q) = \{0,1\}$ fet que $I \models F$, pero en canvi, $I \not\models G$ i, per tant, no podem dir, fent un abus del llenguatge, que $F \models G$.
  * <b>$F \models \neg G$</b>. Direm que es falsa, i mitjançant l'ús de la definició de $\models$ i les definicions de logica proposicional es demostrarà. Començarem definint les funcions $G = p$ i $F = p \vee q$. Llavors, la interpretació $I \models G$ és $I(p) = 1$, i alhora també $I \models F$, i per tant, fent un abus del llenguatge podem dir que $G \models F$. En canvi, una possible interpretació $I \models F$ pot ser $I(p, q) = \{1,1\}$ fet que $I \models F$, pero en canvi, $I \not\models G$ i, per tant, no podem dir, fent un abus del llenguatge, que $F \models G$.

> Let F and G be propositional formulas. Is it true that $F \models G$ iff F & -G  is unsatisfiable? Prove it using only the definitions of propositional logic.

|   |   | |
|:-:|:-:|:-: |
| $F\models G \leftrightarrow \texttt{eval}_I(F \wedge \neg G) = 0$ | iff | [by definition of satisfaction] |
| $\texttt{eval}_I(F \wedge \neg G) = 0$ | iff | [by definition of eval] |
| $\min(\texttt{eval}_I(F), \texttt{eval}_I(\neg G)) = 0$ | iff | [by property of -] |
| $\min(\texttt{eval}_I(F), 1-\texttt{eval}_I(G)) = 0$ | iff | [by definition of min] |
| $\texttt{eval}_I(F) = 0 \vee \texttt{eval}_I(G)=1$ | iff | [by definition of satisfaction] |
| $\texttt{eval}_I(F) = 1 \rightarrow \texttt{eval}_I(G)=1$ | iff | [by definition of logical consequence] | 
| $F \models G$ | |  |

## Problema 2

> Explain in a few words why propositional SAT is in NP.

Com sabem, un problema NP  és aquell que es pot comprovar si una solució proposada compleix els requeriments del problema en un temps "polinomic", condició que el problema SAT compleix. A més, no existeix cap algorisme capaç de trobar una solució en temps "polinomic", fet que fa que es trobi en NP. 

> Explain in a few words why 3-SAT is NP-complete. You may assume that SAT is NP-hard.

Un problema per poder-se considerar NP-Complet ha de satisfer dos condicions.
* <b>Ha de ser NP.</b> S'ha demostrat en l'apartat anterior.
* <b>Ha de ser NP-Hard.</b> Mitjançant reducció, es pot dir que el problema 3-SAT es pot reduir al problema SAT, que es un problema NP-Hard.

> Let F be an UNsatisfiable propositional formula built over n different predicate symbols. Give the name of some method to express a proof (or certificate) of unsatisfiability (like a model is a certificate of satisfiability). Do you think that every unsatisfiable F has such an unsatisfiability proof of size polynomial in n?

A resolution proof. For example, if a set of clauses S includes (possibly among many others) the clauses $p \vee q$,  $\neg p \vee q$,  $p \vee \neg q$,  $\neg p \vee \neg q$, a resolution proof of unsatisfiability of S is a tree like this:

                          pvq  -pvq       pv-q   -pv-q
                          ---------       ------------
                              q               -q
                              ------------------
                                      []

Resolution proofs are not polynomial: there is no polynomial P such that every unsatisfiable F has a resolution proof of size P(|F|).
In fact, it is widely believed (but not known) that no kind of polynomial unsatisfiability certificates exists (i.e, that NP != co-NP  and hence P != NP ).

## Problema 3

> How many Boolean functions with n input bits $f: \{0,1\}^n \rightarrow \{0,1\}$ are there in terms of $n$?

Donada una formula, existeixen $2^n$ possibles solucions. Llavors, suposant que cada predicat pot prendre 2 valors, per exemple $p$ i $\neg p$, direm que existeixen $2^2^n$. 

> Any propositional formula represents a Boolean function. List the names of the other methods you know to represent Boolean functions.

Binary Decision Diagram, Boolean Circuits, Truth Tables.

> Is it true that two formulas F and G are logically equivalent iff they represent the same Boolean function?

Cert. Representar una funció booleana equival a dir que les seves taules de veritat són equivalents. 

## Problema 4

> The published Sudoku puzzles are usually designed in such a way that exactly one solution exists. Explain <b>very</b> briefly how you would use a SAT solver to decide if a given Sudoku has exactly one solution.

Com que suposem que ja tenim la solució al Sudoku proposat, es crea una clausula que prohibeixi aquell resultat i, s'executa el Sudoku. Si torna un resultat sabrem que el Sudoku te mes d'una solució, en canvi si retorna insatisfactible, voldrà dir que te una unica solució.
