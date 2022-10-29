% 4 points.
% Given a graph declared as in the example below, write all its cliques of size at least minCliqueSize.
% Remember, a clique is a complete subgraph: a subset S of the vertices such that for all U,V in S there is an edge U-V.
% For the example below, a correct output would be the following (or in another order):
% [2,4,5,7,9]
% [2,4,5,7]
% [2,4,5,9]
% [2,4,7,9]
% [2,4,8,9]
% [2,5,7,9]
% [4,5,7,9]

% false [4,5,7]

%%==== Example: ========================================================
numVertices(10).
minCliqueSize(4).
vertices(Vs):- numVertices(N), findall(I,between(1,N,I),Vs).
vertex(V):- vertices(Vs), member(V,Vs).
edge(U,V):- edge1(U,V), !.
edge(U,V):- edge1(V,U), !.

edge1(9,8).
edge1(8,2).
edge1(7,4).
edge1(5,7).
edge1(4,2).
edge1(5,2). 
edge1(2,7).
edge1(7,9).
edge1(2,9).
edge1(4,8).
edge1(4,9).
edge1(9,5).
edge1(4,5).
%%==========================================================

createVertexList(0, []) :- !.
createVertexList(N, [N|S]) :- 
    M is N - 1,
    createVertexList(M, S).

reverse([], []).
reverse([X],[X]).
reverse(L,[X|R]):- append(L2,[X],L), reverse(L2,R).

createAllPossibleSubsets([], [], []).
createAllPossibleSubsets([X|L], [X|S1], S2) :- createAllPossibleSubsets(L, S1, S2).
createAllPossibleSubsets([X|L], S1, [X|S2]) :- createAllPossibleSubsets(L, S1, S2).

listSize([], 0).
listSize([X|L], N) :-
    listSize(L, M),
    N is M + 1.

hasAllEdges([], V).
hasAllEdges([X|L], X) :-
    hasAllEdges(L, X).
hasAllEdges([X|L], V) :-
    edge(X, V),
    hasAllEdges(L, V).

checkAllEdges(W, []).
checkAllEdges(W, [X|V]) :-
    hasAllEdges(W, X),
    checkAllEdges(W, V).

cliques :- 
    numVertices(N),
    minCliqueSize(M),
    createVertexList(N, RV),
    reverse(RV, V),
    createAllPossibleSubsets(V, V1, _),
    listSize(V1, S),
    M =< S,
    checkAllEdges(V1, V1),
    write(V1).