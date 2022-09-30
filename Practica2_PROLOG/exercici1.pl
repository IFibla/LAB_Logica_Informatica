/*
Escribe un predicado prod(L, P) que signifique:
    "P es el producto de los elementos de la lista de enteros dada L"
Debe poder generar la P y también comprobar una P dada. 
*/

/* 
Si usamos `P = P2* L1.` y ejecutamos `prod([1,2,3], P)` nos devuelve `P = 1*3*2*1`.

Si por contra usamos `P is P2*L1` y ejecutamos `prod([1,2,3], P)` nos devuelve `P = 6`.
*/

prod([],1).
prod([L1|L],P):- prod(L,P2), P is P2* L1. 