%   1.- [3 points] A domino piece can be represented as a pair of integers
%       [X,Y].  A valid domino chain is a list of pieces of the form
%                   [ [X1,X2], [X2,X3], [X3,X4], ..., [XN, XN1] ]
%   Given a list of domino pieces L, write a Prolog predicate chain(L,R)
%   that succeeds if R is a valid domino chain that can be obtained from L
%   by only flipping its pieces (i.e. converting a piece [X,Y] into [Y,X]
%   if necessary). Note that we cannot reorder the pieces. Given L, the
%   predicate should be able to compute all possible R upon backtrack.
%   
%   Example:
%       ?- chain([[1,2],[2,1]],R), write(R), nl, fail.
%           [[1,2],[2,1]]
%           [[2,1],[1,2]]
%       false.
%   
%       ?- chain([[2,1],[2,1],[3,1],[3,4],[2,4]],R), write(R), nl, fail.
%           [[1,2],[2,1],[1,3],[3,4],[4,2]]
%       false.
%   
%       ?- chain([[1,2],[3,4],[2,3]],R), write(R), nl, fail.
%       false.

listFlatten([], []).
listFlatten([[F|S]|P], [F|X]) :- listFlatten(P, L), append([S],L,X).
listFlatten([[F|S]|P], [S|X]) :- listFlatten(P, L), append([F],L,X).

deleteHead([X|L], L).

head([X|L], X).

reverse([X],[X]).
reverse(L,[X|R]):- append(L2,[X],L), reverse(L2,R).

isChain([]).
isChain([X|L]) :-
    head(L, Y),
    X = Y,
    deleteHead(L, A),
    isChain(A).

splitIntoPieces([], []).
splitIntoPieces([A|L], [[A,B]|C]) :-
    head(L, B),
    deleteHead(L, M),
    splitIntoPieces(M, C).

chain(L, R) :-
    listFlatten(L, Q),
    flatten(Q, Z),
    deleteHead(Z, M),
    reverse(M, N),
    deleteHead(N, P),
    isChain(P),
    splitIntoPieces(Z, R).

% 2.- [2 points] Write a Prolog predicate all_chains(L) that, given
% a list L of domino pieces, writes all possible chains that can be obtained
% using the domino pieces from L.
% Example:
% ?- all_chains([[1,2],[3,2],[3,1]]).
% []
% [[3,1]]
% [[1,3]]
% [[3,2]]
% [[2,3]]
% [[2,3],[3,1]]
% [[1,3],[3,2]]
% [[1,2]]
% [[2,1]]
% [[2,1],[1,3]]
% [[3,1],[1,2]]
% [[1,2],[2,3]]
% [[3,2],[2,1]]
% [[1,2],[2,3],[3,1]]
% [[2,1],[1,3],[3,2]]
% [[3,2],[2,1],[1,3]]
% [[2,3],[3,1],[1,2]]
% [[3,1],[1,2],[2,3]]
% [[1,3],[3,2],[2,1]]
% true.
% Submit a single file named p2.pl (other names will not be accepted!)% 

perms([],[]).
perms([_|L],R):- perms(L,R).
perms([H|L],[H|R]):- perms(L,R).


all_chains(R) :-
    perms(R, S1),
    permutation(S1, S),
    %createAllPossibleSubsets(S, R1, R2),
    chain(S, B),
    write(B).
