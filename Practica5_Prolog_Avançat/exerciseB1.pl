main :-
    EstadoInicial = [3, 3, 0, 0, true],
    EstadoFinal = [0, 0, 3, 3, false],
    between(1, 1000, CosteMax),
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

unPaso(1, E1, E2):- unPaso1(E1, E2), esCorrecte(E2).

esCorrecte([ML, CL, MR, CR, _]):- 
    ML >= 0, ML=<3, CL >= 0, CL=<3, 
    MR >= 0, MR=<3, CR >= 0, CR=<3, 
    noMengen(ML,CL), 
    noMengen(MR,CR),!.

noMengen(0,_).
noMengen(M,C) :- M >= C.

unPaso1([ML,CL,MR,CR,true], [MLN,CLN,MRN,CRN,false]) :-
    MLN is ML - 1,
    CLN is CL - 1,
    MRN is MR + 1,
    CRN is CR + 1.
unPaso1([ML,CL,MR,CR,true], [ML,CLN,MR,CRN,false]) :-
    member(N,[1,2]),
    CLN is CL - N,
    CRN is CR + N.
unPaso1([ML,CL,MR,CR,true], [MLN,CL,MRN,CR,false]) :-
    member(N,[1,2]),
    MLN is ML - N,
    MRN is MR + N.
    
% Tornada
unPaso1([ML,CL,MR,CR,false], [MLN,CLN,MRN,CRN,true]) :-
    MLN is ML + 1,
    CLN is CL + 1,
    MRN is MR - 1,
    CRN is CR - 1.
    
unPaso1([ML,CL,MR,CR,false], [ML,CLN,MR,CRN,true]) :-
    member(N,[1,2]),
    CRN is CR - N,
    CLN is CL + N.
    
unPaso1([ML,CL,MR,CR,false], [MLN,CL,MRN,CR,true]) :-
    member(N,[1,2]),
    MRN is MR - N,
    MLN is ML + N.