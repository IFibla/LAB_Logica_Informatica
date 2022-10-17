/*
Escribe un predicado suma_ants(L) que, dada una lista de enteros L, se satisface si existe algun elemento
en L que es igual a la suma de los elementos anteriores a el en L, y falla en caso contrario.
*/

reverse([X],[X]).
reverse(L,[X|R]):- append(L2,[X],L), reverse(L2,R).

add_list([], 0).
add_list([X|L], R) :- add_list(L, S), R is S + X.

suma_demas([X|L]) :- add_list(L, F), X = F ; suma_demas(L).

suma_ants(L) :- reverse(L, R), suma_demas(R).
