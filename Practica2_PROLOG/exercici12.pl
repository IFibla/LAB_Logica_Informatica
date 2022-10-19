/*
Escribe un predicado diccionario(A,N) que, dado un alfabeto A de simbolos y un natural N, escriba todas las palabras de N simbolos,
por orden alfabetico (el orden alfabetico es segun el alfabeto A dado). Por ejemplo, diccionario( [ga,chu,le],2) escribira:
gaga gachu gale chuga chuchu chule lega lechu lele.
*/

make_permutation(_, 0, []) :- !.
make_permutation(A, N, [X|R]) :- member(X, A), M is N - 1, make_permutation(A, M, R).

write_words([]) :- write(' '), nl, !.
write_words([R|A]) :- write(R), write_words(A).

diccionario(A, N) :- make_permutation(A, N, R), write_words(R).