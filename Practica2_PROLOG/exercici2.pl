/*
Escribe un predicado pescalar(L1, L2, P) que signifique:
    "P es el producto escalar de los vectores L1 y L2"
donde los vectores se representan como listas de enteros. 
El predicado debe fallar si los dos vectores tienen longitudes distintas.
*/

pescalar([], [], 0).
pescalar([X|L1], [Y|L2], P):- pescalar(L1, L2, N), P is N + (X*Y).