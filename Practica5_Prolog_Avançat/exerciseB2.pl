main :-
    EstadoInicial = [0, 0],
    EstadoFinal = [7, 2],
    Pasos = 6,
    between(1, 1000, CosteMax),
    camino(CosteMax, EstadoInicial, EstadoFinal, [EstadoInicial], Camino),
    CosteMax = Pasos,
    reverse(Camino, Camino1),
    write(Camino1),
    write(' con coste '),
    write(CosteMax),
    nl,
    halt.

camino(0, E, E, C, C).
camino(CosteMax, EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal) :-
    CosteMax > 0,
    unPaso(CostePaso, EstadoActual, EstadoSiguiente),
    \+ member(EstadoSiguiente, CaminoHastaAhora),
    CosteMax1 is CosteMax - CostePaso,
    camino(CosteMax1, EstadoSiguiente, EstadoFinal, [EstadoSiguiente|CaminoHastaAhora], CaminoTotal).

unPaso(1, E1, E2):- unPaso1(E1, E2), esCorrecte(E2).

esCorrecte([X, Y]) :- 
    X >= 0, X < 8,
    Y >= 0, Y < 8, 
    !.

unPaso1([X0, Y0], [X1, Y1]) :-
    member(X, [-2, 2]),
    member(Y, [-1, 1]),
    X1 is X0 + X,
    Y1 is Y0 + Y.

unPaso1([X0, Y0], [X1, Y1]) :-
    member(Y, [-2, 2]),
    member(X, [-1, 1]),
    X1 is X0 + X,
    Y1 is Y0 + Y.