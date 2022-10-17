/*
Usando append, escribe un predicado para calcular el ultimo elemento
de una lista dada, y otro para calcular la lista inversa de una lista dada.
*/


/*
append(?List1, ?List2, ?List1AndList2)
List1AndList2 is the concatenation of List1 and List2
?- append([a,b], [c], X).
X = [a,b,c].

?- append(X, [Last], [a,b,c]).
X = [a,b],
Last = c.

?- append([a,b], More, List).
List = [a,b|More].
*/

last([],[]).
last([X],[X]).
last([_|L], X):- last(L, X).

custom_last(L, X):- append(_, [X], L).

reverse([], []).
reverse([X],[X]).
reverse(L,[X|R]):- append(L2,[X],L), reverse(L2,R).