/*
Escribe un predicado ord(L1,L2) que signifique: “L2 es la lista de enteros L1 ordenada de menor a mayor”.
Por ejemplo: si L1 es [4,5,3,3,2] entonces L2 ser ́a [2,3,3,4,5]. Hazlo en una lınea, usando solo los predicados permutacion y esta ordenada.
*/

esta_ordenada([]).
esta_ordenada([X]) :- !.
esta_ordenada([X,Y|L]) :- X =< Y, append([Y], L, Z), esta_ordenada(Z).

ord(L1, L2) :- permutation(L1, L2), esta_ordenada(L2), !.