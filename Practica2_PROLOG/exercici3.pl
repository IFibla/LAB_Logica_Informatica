/*
Representando conjuntos con listas sin repeticiones, escribe predicados para 
las operaciones de intersección y unión de conjuntos dados. 
*/

/*
The cut, in Prolog, is a goal, written as !, which always succeeds, but cannot be backtracked. 
Cuts can be used to prevent unwanted backtracking, which could add unwanted solutions and\or space\time overhead to a query.
The cut should be used sparingly. While cuts can be inserted into codes containing errors, if a test is unnecessary because a cut has guaranteed that it is true, it is good practice to say so in a comment at the appropriate place.
*/

interseccion([], _, []).
interseccion([X|L1], [X|L2], [X|L]):- interseccion(L1, L2, L), !.
interseccion([_|L1], L2, L3):- interseccion(L1, L2, L3).



