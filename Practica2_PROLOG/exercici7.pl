/*
Escribe un predicado suma_demas(L) que, dada una lista de enteros L, se satisface si existe algun
elemento en L que es igual a la suma de los dem ́as elementos de L, y falla en caso contrario.
*/

add_list([], 0).
add_list([X|L], R) :- add_list(L, S), R is S + X.

suma_demas([X|L]) :- add_list(L, F), X = F ; suma_demas(L).