/*
Escribe un predicado esta_ordenada(L) que signifique: ordenada de menor a mayor”. Por ejemplo, a la consulta:
    ?-esta_ordenada([3,45,67,83]).
el interprete responde yes, y a la consulta:
    ?-esta_ordenada([3,67,45]).
responde no.
*/

esta_ordenada([]).
esta_ordenada([X]) :- !.
esta_ordenada([X,Y|L]) :- X =< Y, append([Y], L, Z), esta_ordenada(Z).
