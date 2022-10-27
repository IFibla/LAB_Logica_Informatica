# Resumen de Teoria.

## Capítulo 2. Definición de la lógica proposicional.

### 2.1. ¿Qué es una lógica?

Una lógica constará siempre de dos partes. De primeras una <b>sintaxis</b>, que especifica los símbolos de los que dispone el lenguaje y la manera en la que podemos combinar dichos símbolos para construir fórmulas. Por otra parte, encontramos la <b>semántica</b> que incluye los elementos necesarios para asignar significados a los símbolos y a las fórmulas de dicha lógica. Concretamente, debe contener una definición del concepto de interpretación $I$, que especifica el significado que puede asignarse a cada símbolo y una definición de concepto de satisfacción, que establece las condiciones que deben cumplirse para que una interpretación I satisfaga una formula F, esto es, para que podamos afirmar que la formula F es cierta interpretación I. 

### 2.2. Lógica proposicional.

Si el concepto que se acaba de describir lo llevamos a la definición de lógica proposicional, describiremos los siguientes conceptos:
- <b>Sintaxis</b>. En esta lógica, el vocabulario es un conjunto de símbolos de predicados P ( cuyos elementos escribiremos normalmente como p, q, r, ... ). Una fórmula de la lógica proposicional sobre P se debine como:
  - Todo símbolo de predicado P es una fórmula.
  - Si F y G son fórmulas, entonces ( F ^ G ) y ( F v G ) son fórmulas.
  - Si F es una fórmula, entonces -F es una fórmula.
  - Nada más es una fórmula
- <b>Interpretación</b>. Una interpretación I sobre el vocabulario P es una función I: $P \rightarrow \{0, 1\}$, es decir, I es una función que, para cada símbolo de predicado, nos dice si es 1 ( cierto ) o 0 ( falso ).
- <b>Satisfacción</b>. Sean I una interpretación y F una fórmula, ambas sobre el vocabulario P. La evaluación en I de F, denotada como $eval_I(F)$, es una función que por cada fórmula da un valor 0 o 1. Por lo tanto, si $eval_I(F) = 1$ entonces I satisface F, denotado $I |= F$. En este caso también se deice que F es cierta en I, o que I es un modelo de F. 

Ahora, se introducen unos conceptos que se definen de manera idéntica en otras lógicas distintas a la proposicional, como en la lógica de primer orden. 

1. Una fórmula $F$ es satisfactible si tiene algún modelo, es decir, si existe alguna interpretación $I$ tal que $I \models F$. Una fórmula $F$ es insatisfactible (o es una contradicción) si no es satisfactible. 
2. Una fórmula $F$ es una tautología ( o es válida ), si toda interpretación es un modelo de $F$, es decir, si para toda interpretación $I$ tenemos $I \models F$.
3. Sean $F$ y $G$ fórmulas contruidas sobre un vocabulario P. $F$ es consecuencia lógica de $G$ si todo modelo de $G$ también es modelo de $F$, es decir, si para toda interpretación $I$ sobre P tal que $I \models G$ se tiene que $I \models F$. Sobre cargando el operador $\models$, esto se denotara como $G \models F$.
4. Sean $F$ y $G$ fórmulas construidas sobre un vocabulario P. $F$ y $G$ son lógicamente equivalentes si tienen los mismos modelos, es decir, si para toda interpretación I sobre P se tiene que $I \models G$ si y solo si $I \models F$. Esto se denotará por $F \equiv G$.

### Ejercicios

1. Dado un vocabulario P, ¿cuántas interpretaciones posibles hay en función de $|P|$?
   
   Para definir una interpretación $I$ para el vocabulario P, podemos escoger para cada $p \in P$ si $I(p) = 0$ o $I(p) = 1$. Por lo tanto, hay en total $2^{|P|}$ interpretaciones.

2. Demuestra que $p \wedge -p$ es insatisfactible.

    Por definición de satisfactibilidad, la formula $p \wedge -p$ es insatisfactible si y sólo si no hay ninguna interpretación que la satisfaga. Tomemos una interpretación $I$ para cualquiera y veamos que $eval_I(p \wedge -p) = 0$.

    $eval_I(p \wedge -p) = min(eval_I(p), eval_i(-p)) = min(eval_I(p), 1-eval_i(p))$

    Como $eval_I(p) \in \{0, 1\}$ se da uno de los siguientes dos casos.
    
    1. $eval_I(p) = 0$. Entonces $eval_I(p \wedge -p) = min(eval_I(p), 1-eval_i(p)) = min(eval_I(0), 1-eval_i(0)) = min(0, 1) = 0$.
    2. $eval_I(p) = 1$. Entonces $eval_I(p \wedge -p) = min(eval_I(p), 1-eval_i(p)) = min(eval_I(1), 1-eval_i(1)) = min(1, 0) = 0$.

    Se puede ver como en ambos casos se cumple que $eval_I(p \wedge -p) = 0$, que es equivalente a decir para toda $I$.

3. Demuestra que $p \vee -p$ es una tautología.

    En los apuntes se define el concepto <b>tautología</b> como "Una fórmula F és una tautología, si toda interpretación es modelo de F, es decir, si para toda interpretación de I tenemos $I \models F$". Por lo tanto, tomemos una interpretación $I$ para cualquiera y veamos que $eval_I(p \vee -p) = 1$.

    $eval_I(p \vee -p) = max(eval_I(p), eval_I(-p)) = max(eval_I(p), 1-eval_I(p))$

    Como $eval_I(p) \in \{0, 1\}$ se da uno de los siguientes dos casos.

    1. $eval_I(p) = 0$. Entonces $eval_I(p \vee -p) = max(eval_I(p), 1-eval_i(p)) = max(eval_I(0), 1-eval_i(0)) = max(0, 1) = 1$.
    2. $eval_I(p) = 1$. Entonces $eval_I(p \wedge -p) = max(eval_I(p), 1-eval_i(p)) = max(eval_I(1), 1-eval_i(1)) = max(1, 0) = 1$

    Se puede ver como en ambos casos se cumple que $eval_I(p \vee -p) = 1$, que es equivalente a decri para toda $I$.

4. Sean $F$ y $G$ dos fórmulas. ¿Es cierto que $F \vee G$ es tautología si y solo si alguna de las dos fórmulas $F$ o $G$ lo es? Demuéstralo.

    Se afirma la propiedad con un <b>si y solo si</b>, por lo tanto, con ver que una de las dos implicaciones no es cierta ya quedará demostrada la falsedad de la afirmación. Tomaremos dos formulas $F := p$ y $G := -p$. En ninguno de los dos casos, las formulas són tautologias:
    
    1. $F := p$. Si $I(p)= 0 \rightarrow eval_I(p) = 0$
    2. $G := -p$. Si $I(p) = 1 \rightarrow eval_I(-p) = 0$

    Pero, como se puede ver la fórmula $F \vee G \equiv p \vee -p$ si es una tautología. Como se demuestra a continuación:

    $eval_I(F \vee G) = max(eval_I(F), eval_I(G)) = max(eval_I(p), eval_I(-p)) = max(eval_I(p), 1-eval_I(p))$


    1. Si $I(p)= 0 \rightarrow eval_I(F \vee G) = max(eval_I(p), 1-eval_I(p)) = max(0, 1) = 1$.
    2. Si $I(p)= 1 \rightarrow eval_I(F \vee G) = max(eval_I(p), 1-eval_I(p)) = max(1, 0) = 1$.

    Podemos ver como la implicación $\Leftarrow$ se ha visto que es falsa, por lo tanto, podemos afirmar que la implicación $\not\Leftrightarrow$.

5. Sea $F$ una fórmula. Demuestra que $F$ es una tautología si y solo si $-F$ es insatisfactible.

    En los apuntes, se define la propiedad $eval_I(-F)=1-eval_I(F)$, por lo tanto, como sabemos que $F$ es una tautología podemos afirmar que por todo valor del modelo $I$ la evaluación de $I$ en $F$ resultara cierta. Esto nos lleva a que, si negamos esta misma fórmula, el resultado que obtendremos sera $1-eval_I(F)$, y como el resultado de $eval_I(F)$ es siempre $1$, podemos afirmar que el resultado de $1-eval_I(F)$ siempre sera $0$, lo que equivale a decir que $-F$ es insatisfactible. 

6. Sean $F$ y $G$ dos fórmulas. Demuestra que $F$ es consecuencia lógica de $G$ si y sólo si $G \wedge -F$ es insatisfactible.

    $F$ es <b>consecuencia lógica</b> de $G$ si todo modelo de $G$ también es modelo de $F$, es decir, si para toda interpretación $I$ sobre $P$ tal que $I \models G$ se tiene que $I \models F$. Entonces, vamos a ver que $eval_I(G \wedge -F) = 0$:
    
    $eval_I(G \wedge -F) = min(eval_I(G), eval_I(-F)) = min(eval_I(G), 1-eval_I(F))$

    Ademas sabemos que el resultado de $eval_I(G) = eval_I(F)$ por toda interpretación $I$ sobre $P$. Por lo tanto, supongamos que $P \rightarrow \{0,1\}$, veremos:

    1. Si $I(p)= 1$ sabemos que $eval_I(F) = eval_I(G)$. Entonces si $eval_I(G \wedge -F) = min(eval_I(G), 1-eval_I(F)) = min(1, 0) = 0$
    2. Si $I(p)= 0$ sabemos que $eval_I(F) = eval_I(G)$. Entonces si $eval_I(G \wedge -F) = min(eval_I(G), 1-eval_I(F)) = min(0, 1) = 0$

7. Da un ejemplo de tres fórmulas $F_1$, $F_2$, y $F_3$ tales que $F_1 \wedge F_2 \wedge F_3$ sea insatisfactible y donde cualquier conjunció de todas ellas menos una sea satisfactible. Generalízalo a $n$ fórmulas.

    Consideremos por ejemplo el vocabulario $P = \{p, q\}$, y las formulas $F_1 = p$, $F_2 = q$, $F_3 = \neg p \vee \neg q$.

    La única interpretación $I$ que satisface tanto $F_1$ como $F_2$ cumple $I(p)=I(q)=1$, por lo que no satisface $F_3$, es decir la formula $F_1 \wedge F_2 \wedge F_3$ es insatisfactible. 

    Sin embargo, vemos que cualquier conjunción de todas ellas menso una es satisfactible con las siguientes interpretaciones: 

    $I_{12}(p)=1, I_{12}(q)=1$

    $I_{13}(p)=1, I_{13}(q)=0$ 

    $I_{23}(p)=0, I_{23}(q)=1$ 

    Se puede ver fácilmente que $I_{12} \models F_1 \wedge F_2$, que $I_{13} \models F_1 \wedge F_3$, y que $I_{23} \models F_2 \wedge F_3$.

8. Demuestra de la forma más sencilla que encuentres: $(\neg q \vee \neg r \vee p) \wedge (p \vee q) \wedge (r \vee p) \not\equiv (p \vee q)$.

    Para demostrar que no son equivalentes encontraremos un ejemplo en el que no se cumpla la equivalencia. Tomaremos una interpretación $I$ de las fórmulas con los siguientes valores. $I(p) = 0$, $I(r) = 0$, $I(q) = 1$. Entonces si hacemos la evaluación de la interpretación $I$ en las dos formulas obtendremos:

    $(0 \vee 1 \vee 0) \wedge (0 \vee 1) \wedge (0 \vee 0) = 0$. Por otra parte, $(0 \vee 1) = 1$. Se puede ver como $0 \not\equiv 1$, por lo que vemos que estas dos formulas no son logicamente equivalentes. 

9. Demuestra de la forma más sencilla que encuentres: $(p \vee q) \wedge (r \vee p) \wedge (\neg q \vee \neg r \vee p) \equiv p$.

    Lo demostraremos haciendo la tabla de verdad. 

    |   p   |   q   |   r   | $(p \vee q) \wedge (r \vee p) \wedge (\neg q \vee \neg r \vee p)$ |  $p$  |
    | :---: | :---: | :---: | :---------------------------------------------------------------: | :---: |
    |   0   |   0   |   0   |                                 0                                 |   0   |
    |   0   |   0   |   1   |                                 0                                 |   0   |
    |   0   |   1   |   0   |                                 0                                 |   0   |
    |   0   |   1   |   1   |                                 0                                 |   0   |
    |   1   |   0   |   0   |                                 1                                 |   1   |
    |   1   |   0   |   1   |                                 1                                 |   1   |
    |   1   |   1   |   0   |                                 1                                 |   1   |
    |   1   |   1   |   1   |                                 1                                 |   1   |

10. Se define la longitud de una fórmula $F$, denotada $|F|$, como el número de símbolos, conectivas, paréntesis y símbolos de predicado en la fórmula $F$ vista como cadena de símbolos. Sea $F$ una fórmula que no contiene la connectiva $\neg$. Demuestra que si $p(F)$ es el número de símbolos de predicado en $F$ ( contando repeticiones ), entonces $|F| = 4 \cdot p(F) - 3$.

    Si se quiere demostrar el concepto que se acaba de introducir, debemos hacer uso de inducción. Donde se define un caso base, una hipotesis de inducción y un paso inductivo. 

    <b>Caso Base.</b> 
    * $F = p \rightarrow |F| = 4 \cdot p(F) - 3 = (4 \cdot 1) - 3 = 1$ :white_check_mark:
    * $F = (p \vee q) \rightarrow |F| = 4 \cdot p(F) - 3 = (4 \cdot 2) - 3 = 5$ :white_check_mark:

    <b>Hipotesis de inducción.</b> Supondremos que $|F| > 1$ y que $\forall G \; \; |G| < |F|$ se cumple la propiedad.
    
    <b>Paso inductivo.</b> Supondremos que $F = (F_1 \vee F_2)$. Entonces veremos que 
    
    $|F| = 1 + |F_1| + 1 + |F_2| + 1$
    
    $|F| = 1 + (4 \cdot p(F_1) - 3) + 1 + (4 \cdot p(F_2) - 3) + 1$
    
    $|F| = 4 \cdot (p(F_1) + p(F_2)) - 3$ 
    
    $4 \cdot p(F) = 4 \cdot (p(F_1) + p(F_2))$ 

    $p(F) = (p(F_1) + p(F_2))$ 

    Lo que sabemos que es cierto, ya que $F$ és la fórmula que une $F_1$ i $F_2$ con un connectiva cualquiera. 

11. Si $F \rightarrow G$ és tautología y $F$ es tautología, entonces ¿G es tautología? Demuéstralo.

    Antes de nada definiremos que $F \rightarrow G \equiv \neg F \vee G$, por las propiedades de las connectivas logicas. Como sabemos que $F$ es una tautología podemos afirmar que por cualquier evaluación de la interpretación $I$ sobre $F$ el resultado sera satisfactible. Entonces,

    $F$ es tautología si y solo si $\neg F$ es insatisfactible.

    $\neg F \vee G$ es tautologia si y solo si por toda interpretación $I$ sobre $\neg F \vee G$ siempre es satisfactoria. Como sabemos que por cualquier interpretación possible $\neg F$ sera insatisfactible, podemos deducir que $G$ sera satisfactoria. Esto, al passar por cualquiera interpretación, nos deduce que $G$ también es una tautología.

## Capítulo 3. Deducción en la lógica proposicional.

### 3.1. Formas normales y cláusulas

* <b>Fórmulas como conjuntos</b>. Sea $F$ una fórmula construida sólo mediante la conectiva $\wedge$ a partir de subfórmulas $F_1, F_2...F_n$. Por las propiedades de asociatividad, commutatividad e idempotencia de $\wedge$ podemos escribir la misma fórmula $F$ de las siguientes maneras, siendo siempre equivalentes ( porque no importan los paréntesis ( <b>Asociatividad</b> ), ni el orden de los elementos ( <b>Conmutatividad</b> ), ni los elementos repetidos ( <b>Idempotencia</b> )). Destacar que lo mismo pasa con la conectiva $\vee$. 
  * $(F_1 \wedge (F_2 \wedge ( ... \wedge F_3 ) ) )$
  * $(F_1 \wedge F_2 \wedge F_3 )$
  * $\{F_1,...,F_n\}$
* <b>Literal</b>. Un literal es un símbolo de predicado $p$ ( literal positivo ) o un símbolo de predicado negado $\neg p$ ( literal negativo ).
* <b>Conjuctive Normal Form</b>. Una fórmula está en <b>CNF</b> si es una conjunción de disyunciones de literales, és decir, si es de la forma $(I_{1,1} \vee ... \vee I_{1,k_1} \wedge ... \wedge (I_{n,1} \vee ... \vee I_{n, k_n}))$ donde cada $I_{i,j}$ es un literal.
* <b>Disjuntive Normal Form</b>. Una fórmula está en <b>DNF</b> si es una disyunción de conjunciones de literales, es decir, si es de la forma $(I_{1,1} \wedge ... \wedge I_{1,k_1} \vee ... \vee (I_{n,1} \wedge ... \wedge I_{n, k_n}))$ donde cada $I_{i,j}$ es un literal.
* <b>Cláusula</b>. Una cláusula es una disyunción de literales, es decir, una fórmula de la forma $l_1 \vee ... \vee l_n$ donde cada $l_i$ es un literal, o, equivalentemente, una fórmula.
* <b>Conjunto de cláusulas</b>. Una fórmula en <b>CNF</b> es pues una conjunción de cláusulas que puede verse como un conjunto de cláusulas.
* <b>Cláusula vacía</b>. Es la disyunción de cero literales.
* <b>Cláusula de Horn</b>. Cláusula (disyunción de literales) con, como máximo, un literal positivo.