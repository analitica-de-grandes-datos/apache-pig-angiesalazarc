/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

lineas = LOAD 'data.tsv' AS (letra:CHARARRAY, l_minus:BAG{dict:TUPLE(letter:CHARARRAY)}, lista:[]);

column = FOREACH lineas GENERATE FLATTEN (l_minus) AS letra, FLATTEN (KEYSET(lista)) AS listas;

grouped = GROUP column BY (letra, listas);

cuenta = FOREACH grouped GENERATE group, COUNT (column);

STORE cuenta INTO 'output' USING PigStorage(',');