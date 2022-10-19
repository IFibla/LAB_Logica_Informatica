/*
Encuentra mediante un programa Prolog, usando el predicado permutacion, que 8 digitos diferentes tenemos que asignar a las
letras S, E, N, D, M, O, R, Y, de manera que se cumpla la suma siguiente:
    SEND + MORE = MONEY
*/

suma([],[],[],C,C).
suma([X1|L1],[X2|L2],[X3|L3],Cin,Cout) :-
    X3 is (X1 + X2 + Cin) mod 10,
    C  is (X1 + X2 + Cin) //  10,
    suma(L1,L2,L3,C,Cout).


send_more_money1 :-
    L = [S, E, N, D, M, O, R, Y, _, _],
    permutation(L, [0,1,2,3,4,5,6,7,8,9]),
    suma([D, N, E, S], [E, R, O, M], [Y, E, N, O], 0, M),

    write('S = '), write(S), nl,
    write('E = '), write(E), nl,
    write('N = '), write(N), nl,
    write('D = '), write(D), nl,
    write('M = '), write(M), nl,
    write('O = '), write(O), nl,
    write('R = '), write(R), nl,
    write('Y = '), write(Y), nl,
    write('  '), write([S,E,N,D]), nl,
    write('  '), write([M,O,R,E]), nl,
    write('-------------------'), nl,
    write([M,O,N,E,Y]), nl.