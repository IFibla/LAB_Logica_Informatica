:- use_module(library(clpfd)).

ejemplo(0,   26, [1,2,5,10] ).  % Solution: [1,0,1,2]
ejemplo(1,  361, [1,2,5,13,17,35,157]).

main:- 
    ejemplo(1, Amount, Coins),
    nl, write('Paying amount '), write(Amount), write(' using the minimal number of coins of values '), write(Coins), nl,nl,
    length(Coins,N), 
    length(Vars,N), % get list of N prolog vars  

    Vars ins 0..Amount,
    expr( Vars, Coins, Expr ),
    Expr #= Amount,
    exprSuma( Vars, ExprSum ),
    labeling( [min(ExprSum)], Vars  ),
    NumCoins is ExprSum,
    write('We need '), write(NumCoins), write(' coins: '), write(Vars), nl, nl, halt.

expr( [], [], 0 ).
expr( [X|Vars], [K|Coins], Expr + X*K ):- expr( Vars, Coins, Expr ).

exprSuma( [X],  X ):- !.
exprSuma( [X|Vars], X+Expr ):- exprSuma( Vars, Expr).
