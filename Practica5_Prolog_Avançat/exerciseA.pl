% per_con_resto(X, L, Resto) se cumple cuando X es un elemento de L y Resto es el resto de los elementos.
per_con_resto(X, L, Resto):-
    concat(L1, [X|L2], L),
    concat(L1, L2, Resto).

% long(L, N) instancia N a la longitud de la lista