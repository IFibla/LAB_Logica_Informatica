/*
Escribe un predicado dados(P,N,L) que signifique: “la lista L expresa una manera de sumar P puntos lanzando N dados”.
Por ejemplo: si P es 5 y N es 2, una solucíon serıa [1,4] (notese que la longitud de L es N). Tanto P como N
vienen instanciados. El predicado debe ser capaz de generar todas las soluciones posibles.
*/

pert(X, [X|_]).
pert(X, [_|L]) :- pert(X, L).

dados(0,0,[]).
dados(P,N,[X|L]) :- N > 0,
                    pert(X, [1,2,3,4,5,6]),
                    Q is P - X,
                    O is N - 1,
                    dados(Q, O, L).