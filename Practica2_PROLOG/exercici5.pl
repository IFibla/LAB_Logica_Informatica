/*
Escribe un predicado fib(N,F) que signifique: “F es el N-esimo numero de Fibonacci para la N dada”.
Estos números se definen asi:
                        fib(1) = 1,
                        fib(2) = 1,
    y si N > 2 entonces fib(N) = fib(N−1)+fib(N−2).
*/

sum(X, Y, Z) :- Z is X + Y.

fib(1, 1).
fib(2, 1).
fib(N, F) :-    A is N - 1,
                B is N - 2,
                fib(A, X),
                fib(B, Y),
                sum(X, Y, F).