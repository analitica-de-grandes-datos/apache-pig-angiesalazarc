/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
lineas = LOAD 'data.csv' USING PigStorage(',') AS (id:INT, nombre:CHARARRAY, apellido:CHARARRAY, fecha:CHARARRAY, color:CHARARRAY, num:INT);

column = FOREACH lineas GENERATE nombre, color;

filtro = FILTER column BY ($0 MATCHES '.*Z.*') AND ($1 MATCHES '.*blue.*');

STORE filtro INTO 'output' USING PigStorage(' ');
