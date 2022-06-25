/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, l_minus:BAG{dict:TUPLE(letter:CHARARRAY)}, lista:CHARARRAY);

column = FOREACH lineas GENERATE l_minus;

words = FOREACH column GENERATE FLATTEN(l_minus) AS word;

grouped = GROUP words BY word;

cuenta = FOREACH grouped GENERATE group, COUNT (words);

STORE cuenta INTO 'output' USING PigStorage(',');