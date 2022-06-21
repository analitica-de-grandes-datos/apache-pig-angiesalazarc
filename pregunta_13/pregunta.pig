/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
*/
lineas = LOAD 'data.csv' USING PigStorage(',') AS (id:INT, nombre:CHARARRAY, apellido:CHARARRAY, fecha:CHARARRAY, color:CHARARRAY, num:INT);

select = FOREACH lineas GENERATE color;

filtro = FILTER select BY ($0 matches '.*b.*');

STORE filtro INTO 'output';