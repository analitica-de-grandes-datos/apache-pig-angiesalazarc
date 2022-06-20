/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, l_minus:BAG{dict:TUPLE(letter:CHARARRAY)}, lista:[]);

column = FOREACH lineas GENERATE FLATTEN (lista);

words = FOREACH column GENERATE $0 AS word;

grouped = GROUP words BY word;

cuenta = FOREACH grouped GENERATE group, COUNT (words);

STORE cuenta INTO 'output' USING PigStorage(',');