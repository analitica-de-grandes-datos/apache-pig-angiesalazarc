/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
salida.

   1971-07-08,08,8,jue,jueves
   1974-05-23,23,23,jue,jueves
   1973-04-22,22,22,dom,domingo
   1975-01-29,29,29,mie,miercoles
   1974-07-03,03,3,mie,miercoles
   1974-10-18,18,18,vie,viernes
   1970-10-05,05,5,lun,lunes
   1969-02-24,24,24,lun,lunes
   1974-10-17,17,17,jue,jueves
   1975-02-28,28,28,vie,viernes
   1969-12-07,07,7,dom,domingo
   1973-12-24,24,24,lun,lunes
   1970-08-27,27,27,jue,jueves
   1972-12-12,12,12,mar,martes
   1970-07-01,01,1,mie,miercoles
   1974-02-11,11,11,lun,lunes
   1973-04-01,01,1,dom,domingo
   1973-04-29,29,29,dom,domingo

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.csv' USING PigStorage(',') AS (f1:int, f2:chararray, f3:chararray, f4:datetime, f5:chararray, f6:int);

A = FOREACH lines GENERATE f4, ToString(f4, 'yyyy-MM-dd') AS fecha;
B = FOREACH A GENERATE fecha, SUBSTRING (fecha, 8, 10), SUBSTRING (fecha, 8, 10) AS (dia:int), REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER (ToString(f4, 'EEE')), 'mon', 'lun' ), 'tue','mar'), 'wed','mie'),'thu','jue'),'fri','vie'),'sun','dom'),REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER (ToString(f4, 'EEEE')), 'monday', 'lunes' ), 'tuesday','martes'), 'wednesday','miercoles'),'thursday','jueves'),'friday','viernes'),'sunday','domingo');
STORE B INTO 'output' USING PigStorage(',');
