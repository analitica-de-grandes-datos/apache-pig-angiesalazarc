/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lineas = LOAD 'data.csv' USING PigStorage (',') AS (numero:INT, nombre:CHARARRAY, apellido:CHARARRAY, fecha:CHARARRAY, color:CHARARRAY, num:INT);

fec1 = FOREACH lineas GENERATE SUBSTRING(fecha, 0, 4) AS ano;

grouped = GROUP val BY ano;

cuenta = FOREACH grouped GENERATE group, COUNT (val);

STORE cuenta INTO 'output' USING PigStorage(',');
