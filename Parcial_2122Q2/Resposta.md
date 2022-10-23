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

> Let F and G be propositional formulas such that $G |= F$.  Is it true that then always  $F |= G$  or  $F |= -G$ ? Prove it as simply as you can using only the definitions of propositional logic.

La afirmación hecha en el enunciado es FALSA. Lo demostraremos definiendo que:
- F = p v -p 
- G = p. 

Entonces, G |= F porque por el único modelo I de G, la interpretación de I, donde I(p) = 1, tenemos que I |= F. Por otra parte, la afirmación F |= G, no es cierta, ya que con I(p) = 0 tenemos I |= F, pero I not|= G. Y, ademas, para la afirmación F |= -G, tenemos que por un I(p) = 1 el modelo I |= F pero el modelo I not|= -G

> Let F and G be propositional formulas. Is it true that F |= G iff F & -G  is unsatisfiable? Prove it using only the definitions of propositional logic.

F |= G 

F |= G                                                 iff   [by definition of logical consequence]   
for all I,       I not|= F     or    I |= G            iff   [by definition of satisfaction]          
for all I,       eval_I(F)=0   or    eval_I( G)=1      iff   [by property of -]                       
for all I,       eval_I(F)=0   or  1-eval_I( G)=0      iff   [by definition of eval]                 
for all I,       eval_I(F)=0   or    eval_I(-G)=0      iff   [by definition of min]                  
for all I,  min( eval_I(F),          eval_I(-G)  ) = 0 iff   [by definition of eval]                 
for all I,  eval_I(F & -G)=0                           iff   [by definition of satisfaction]         
for all I,  I not|= F & -G                             iff   [by definition of satisfiable]          
F land -G is unsatisfiable   






## Problema 2

> Explain in a few words why propositional SAT is in NP.


> Explain in a few words why 3-SAT is NP-complete. You may assume that SAT is NP-hard.


> Let F be an UNsatisfiable propositional formula built over n different predicate symbols. Give the name of some method to express a proof (or certificate) of unsatisfiability (like a model is a  certificate of satisfiability). Do you think that every unsatisfiable F has such an unsatisfiability proof of size polynomial in n?

