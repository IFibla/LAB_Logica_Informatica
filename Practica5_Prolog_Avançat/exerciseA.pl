% concat
concat([], L, L).
concat([X|L1], L2, [X|L3]) :- concat(L1, L2, L3).

% nat(N) es un generador de números naturales.
nat(0).
nat(N) :- 
    nat(N1),
    N is N1 + 1.

% pert_con_resto(X, L, Resto) se cumple cuando X es un elemento de L y Resto es el resto de los elementos.
pert_con_resto(X, L, Resto):-
    concat(L1, [X|L2], L),
    concat(L1, L2, Resto).

% long(L, N) instancia N a la longitud de la lista
long([], 0).
long([_|L], M):-
    long(L, N),
    M is N + 1.

% factores_primos(N, F) ...
factores_primos(1, []) :- !.
factores_primos(N, [F|L]) :-
    nat(F),
    F > 1,
    0 is N mod F,
    N1 is N // F,
    factores_primos(N1, L),
    !.

% permutacion(L, P)
permutacion([], []).
permutacion(L, [X|P]) :-
    pert_con_resto(X, L, R),
    permutacion(R, P).

% subcjto(L, S) es: S es un subconjunto de L.
subcjto([], []).
subcjto([X|C], [X|S]) :- subcjto(C, S).
subcjto([_|C], S) :- subcjto(C, S).

% expresion()
expresion([X], X).
expresion(L, E1 + E2) :-
    concat(L1, L2, L),
    L1 \= [],
    L2 \= [],
    expresion(L1, E1),
    expresion(L2, E2).
expresion(L, E1 - E2) :-
    concat(L1, L2, L),
    L1 \= [],
    L2 \= [],
    expresion(L1, E1),
    expresion(L2, E2).
expresion(L, E1 * E2) :-
    concat(L1, L2, L),
    L1 \= [],
    L2 \= [],
    expresion(L1, E1),
    expresion(L2, E2).
expresion(L, E1 / E2) :-
    concat(L1, L2, L),
    L1 \= [],
    L2 \= [],
    expresion(L1, E1),
    expresion(L2, E2),
    R2 is E2,
    R2 \= 0,
    0 is E1 mod E2.

cifras(L, N) :-
    subcjto(L, S),
    permutacion(S, P),
    expresion(P, E),
    N is E,
    write(E),
    nl, fail. 