/*
Escribe un predicado palindromos(L) que, dada una lista de letras L, escriba todas las permutaciones de sus elementos que
sean palindromos (capicuas). Por ejemplo, con la consulta palindromos([a,a,c,c]) se escribe [a,c,c,a] y [c,a,a,c].
*/

reverse([X],[X]).
reverse(L,[X|R]):- append(L2,[X],L), reverse(L2,R).

palindromos(A) :- permutation(A, O), reverse(O, R), O = R, write(O).