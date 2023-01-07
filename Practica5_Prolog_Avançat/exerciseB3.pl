nat(0).
nat(N) :- nat(N1), N is N1 + 1.

getElements([], [], []).
getElements([X], [X], []).
getElements([X|Res], [X], Res).
getElements([X, Y|Res], [X, Y], Res).

sumList([], 0).
sumList([X|Res], Sum) :- sumList(Res, Y), Sum is X + Y.

main :-
    EstadoInicial = [[1, 3, 5, 7], [], 0],
    EstadoFinal = [[], [1, 3, 5, 7], 1],
    nat(CosteMax),
    camino(CosteMax, EstadoInicial, EstadoFinal, [EstadoInicial], Camino),
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

unPaso(_, [[], _, _], [_, _, _]).
unPaso(Coste, [[LI0], LR0, 0], [[], LR1, 1]) :-
    append(LR0, [LI0], LR1A),
    sort(LR1A, LR1),
    sumList([LI0], Coste).
unPaso(Coste, [LI0, LR0, 0], [LI1, LR1, 1]) :-
    LI0 \= [],
    sort(LI0, [X, Y|LI1]),
    append(LR0, [X, Y], LR1A),
    sort(LR1A, LR1),
    sumList([X, Y], Coste).
unPaso(Coste, [LI0, LR0, 1], [LI1, LR1, 0]) :-
    LR0 \= [],
    sort(LR0, [Coste|LR1]),
    append(LI0, [Coste], LI1A),
    sort(LI1A, LI1).

    