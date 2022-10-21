# Olympiad.pl

## Statement

For the next Catalan Computer Science Olympiad, we want to make the best possible team by selecting a set of students. For each student, we have the following information:
1. Her ID
2. The list of other students which she considers friends. Note that S1 could consider S2 as a friend, but the converse is not necessarily true.
3. The programming topic she is most expert on.
   
The goal is to form a team with exactly K students such that each one of them considers all other team members a friend and all chosen students haver different expertise topics. Complete the writeClauses part below to find out one possible team.

## Team with exactly K students
Per tal de complir la restricció demanada, començem guardant el nombre maxim d'estudiants a la variable K. Despres, fent us de la funcio `findall` podem extreure el seguent resultat:

```Prolog
C = [chosen(1), chosen(2), chosen(3), chosen(4), chosen(5), chosen(6), chosen(7), chosen(8), chosen(...)|...].
```

> `findall(X, G, L)` és cert quan L és la llista del X per als que (hi ha manera d'instanciar les altres variables, si n'hi ha) l'objectiu G és cert

Tot seguit, es comprova que el resultat de la crida `findall` és equivalent a K, és a dir, que hi hagi unicament K seleccionats. 

```Prolog
exactlyKStudents :-
      numMembersTeam(K),
      findall(chosen(S), student(S), C),
      exactly(K, C),
      fail.
exactlyKStudents.
```

## Team with just friends
En aquest primer fragment de codi, s'instancien dos estudiants S1 i S2 i, no es permet que siguin el mateix estudiant. A partir d'aqui es creen totes les restriccions associades. 
```Prolog
friendsClause :-
      student(S1),
      student(S2),
      S1 \= S2,
      createFriendsClause(S1, S2),
      fail.
friendsClause.      
```

Aquesta funció, la qual conte la logica d'amistat, creara una clausula que no permetra que dos estudiants estiguin en el mateix equip si, no tenen una relacio d'amistat reciproca. 

```Prolog
createFriendsClause(S1, S2) :-
      not(friends(S1, S2)),
      friends(S1, S2),
      writeClause([-chosen(E1),-chosen(E2)]), 
      fail.

createFriendsClause(S1, S2) :-
      friends(S1, S2),
      not(friends(S1, S2)),
      writeClause([-chosen(E1),-chosen(E2)]), 
      fail.

createFriendsClause(S1, S2) :-
      not(friends(S1, S2)),
      not(friends(S1, S2)),
      writeClause([-chosen(E1),-chosen(E2)]), 
      fail.
createFriendsClause(_, _).
```

## Do not repeat expertise
En el fragment que s'adjunta a continuació, es important destacar el predicat `atMost`, que segueix la seguent logica.
> If List is a list of domain variables and/or integers, this constraint takes care that at most N element of this list have the value V. As soon as some domain variable from the list is updated, this constraint is woken and it checks if the constraint is still satisfiable and if so, if it is already satisfied or not.
```Prolog
notRepeateExpert :-
      student(S),
      expertise(S, E),
      findall(chosen(T), (expertise(T, E), S \= T), C),
      C \= [],
      atMost(1, [chosen(S)|C]),
      fail.
notRepeateExpert.
```
