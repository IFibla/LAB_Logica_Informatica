/*
Escribe un predicado card(L) que, dada una lista de enteros L, escriba la lista que, para cada elemento de L,
dice cuantas veces aparece este elemento en L. Por ejemplo, si hacemos la consulta card( [1,2,1,5,1,3,3,7] )
el interprete escribira: [[1,3],[2,1],[5,1],[3,2],[7,1]].
*/

count([], V, 0).
count([V|L], V, C) :- count(L, V, A), C is A + 1.
count([X|L], V, C) :- count(L, V, C).

card_call(L, [], []).
card_call(L, [X|S], [[X, A]|R]) :- count(L, X, A), card_call(L, S, R).

card([]) :- print([]).
card(L) :-  sort(L, S),
            card_call(L, S, R),
            print(R).