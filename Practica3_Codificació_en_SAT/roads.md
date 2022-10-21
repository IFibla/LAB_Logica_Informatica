# Roads.pl

## Statement
The government of a country with very few but very large roads needs to decide where to place gas stations.  It has been decided that if a road connects cities C1 and C2, a gas station should be placed in C1, C2, or both.  The government budget limits the number of stations that can be built (maxStations). Complete the following program to do this.

## Restriccions
- El numero de gasolineres no pot ser superior a `maxStations`.
- Entre dos ciutats, connectades per una carretera `road` ha d'haver-hi, com a minim, una gasolinera. 

## No superar maxStations
Amb el codi que s'adjunta a continuacio, forcem a l'aplicació a no sobre passar el numero de gasolineras instal·lades. 
```Prolog
assertMaxStations :-
    maxStations(S),
    findall(install(C), city(C), List),
    List \= [],
    atMost(S, List),
    fail.
assertMaxStations.
```

## Minim una gasolinera entre cada parella de ciutats

```Prolog
assertMinimumOneStationBetweenCities :-
    city(C1),
    city(C2),
    C1 \= C2,
    road(C1, C2),
    Lits = [install(C1), install(C2)],
    atLeast(1, Lits),
    fail.
assertMinimumOneStationBetweenCities.
```

## Escriure la solucio

```Prolog
displaySol(M):- 
    city(C),
    member(install(C), M),
    write('City '),
    write(C),
    findall(city(C1), (road(C, C1), road(C1, C), C1 \= C), R)
    write(R),
    fail.
displaySol(_) :- nl.
```

## Solution

```Prolog
City 1
    [city(12),city(10),city(11),city(4),city(18),city(19)]
City 2
    [city(15),city(4),city(8),city(14),city(9),city(12),city(11),city(8),city(13)]
City 5
    [city(14),city(13),city(6)]
City 6
    [city(18),city(10),city(11),city(20),city(12)]
City 7
    [city(9),city(9),city(12),city(18),city(17)]
City 8
    [city(19),city(20),city(18)]
City 9
    [city(12),city(14),city(18),city(15),city(19),city(14)]
City 10
    [city(15),city(13),city(14),city(18),city(17),city(16),city(20)]
City 11
    [city(19),city(18),city(12),city(16),city(16),city(13)]
City 13
    [city(20),city(14),city(18)]
City 15
    [city(17),city(16),city(18)]
City 16
    [city(18),city(17)]
City 18
    [city(19)]
City 20
    []
```