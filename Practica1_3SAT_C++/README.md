# Pràctica 1: SAT solver
Ignasi Fibla Figuerola ( ignasi.fibla@estudiantat.upc.edu )

Last Modification: 28/09/22

## Enunciat

Modifica el SAT solver SAT-alumnes.cpp per a tractar de la manera més eficient que puguis els exemples de random3SAT.tar.gz. Teniu una presentació descrivint l’algorisme aquí. Per a aconseguir això, millora l’heurística de decisió i la velocitat de propagació. Adjuntem un script que compara l’eficiència del teu solver amb un altre, PicoSAT, executant tots dos en la mateixa màquina. Sobre els problemes insatisfactibles de 300 variables, PicoSAT mai hauria de ser més de 20 vegades més ràpid que el teu solver, i és perfectament possible aconseguir ràtios de 10 vegades, 5 vegades, o fins i tot millors (fes make usant el Makefile per a compilar).

Has de lliurar dos arxius: SAT-alumnes.cpp i temps.txt, la sortida que genera l’script.

## Modificacions del codi original

## Resultats

|         | **PicoSAT** | **MisatSAT** | **Average difference** | **Max difference** | **Max difference Times** |
|---------|-------------|--------------|------------------------|--------------------|--------------------------|
| **100** | 0.005828213691711426 | 0.010530972480773925 | 0.0047027587890625 | 0.009502887725830078 | 2.4777547085866827 |
| **150** | 0.01270751953125 | 0.04727039337158203 | 0.034562873840332034 | 0.06439208984375 | 7.103364895708571 |
| **200** | 0.11938550472259521 | 0.5579519271850586 | 0.43856642246246336 | 1.4874937534332275 | 7.63601379746068 |
| **250** | 0.9053316593170166 | 5.257999062538147 | 4.3526674032211305 | 11.742029190063477 | 8.943978729864286 |
| **300** | 8.78090317249298 | 52.17420129776001 | 43.39329812526703 | 92.9823899269104 | 10.91452043219691 |
