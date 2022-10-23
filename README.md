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