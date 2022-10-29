%% Write a Prolog predicate eqSplit(L,S1,S2) that, given a list of
%% integers L, splits it into two disjoint subsets S1 and S2 such that
%% the sum of the numbers in S1 is equal to the sum of S2. It should
%% behave as follows:
%%
%% ?- eqSplit2([1,5,2,3,4,7],S1,S2), write(S1), write('    '), write(S2), nl, fail.
%%
%% [1,5,2,3]    [4,7]
%% [1,3,7]    [5,2,4]
%% [5,2,4]    [1,3,7]
%% [4,7]    [1,5,2,3]

listSum([], 0).
listSum([X|L], R) :-
    listSum(L, M),
    R is M + X.

createAllPossibleSubsets([], [], []).
createAllPossibleSubsets([X|L], [X|S1], S2) :- createAllPossibleSubsets(L, S1, S2).
createAllPossibleSubsets([X|L], S1, [X|S2]) :- createAllPossibleSubsets(L, S1, S2).

eqSplit(L, S1, S2) :-
    createAllPossibleSubsets(L, S1, S2),
    listSum(S1, R1),
    listSum(S2, R2),
    R1 = R2.