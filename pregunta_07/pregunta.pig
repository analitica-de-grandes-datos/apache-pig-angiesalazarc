/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, l_minus:BAG{dict:TUPLE(letter:CHARARRAY)}, lista:[]);

column = FOREACH lineas GENERATE lista;

extraer = FOREACH column GENERATE COUNT(KEYSET($0));

cuenta = FOREACH lineas GENERATE letra, COUNT(l_minus) AS cuenta, COUNT(lista) AS listas;

orden = ORDER cuenta BY letra, cuenta, listas asc;

STORE orden INTO 'output' USING PigStorage(',');