#
#  LAB: Transformación de archivos con `sed`
#  ================================================
#
#  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
#  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
#  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
#  la aplicación de procedimientos manuales no es práctica.
#  
#  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
#  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
#  para los campos son los siguientes:
#  
#  * Columna 1: `DD/MM/AA`.
#  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
#  * Columna 3: Número entero. `\N` indica NULL.
#  * Columna 4: Número decimal. `\N` indica NULL.
#  
#  
#  Usted debe escribir un script en bash que use sed para que realice 
#  las siguientes acciones:
#    
#  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
#  
#  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
#  
#  * Reemplace los `;` por `,`.
#  
#  * Use el `.` para indicar decimales.
#
#  El resultado del script se escribe en pantalla.
#
#  El programa se llamara por el evaluador tal como se indica a continuación:
#
#  $ bash question.sh data.csv > output.csv
#  
#  Rta/
#  2013-03-12,A,1,100.0
#  ...
#  2014-09-01,A,3,100.4
#
#  >>> Escriba su codigo a partir de este punto <<<
#
sed 's/,\([0-9]\)/.\1/' data.csv > datos1
sed 's/;/,/g' datos1 > datos2
sed 's-\\n-\\N-g' datos2 > datos3
sed 's-,N-,\\N-g' datos3 > datos4
sed 's-,,-,\\N,-g' datos4 > datos5
sed 's-n-\\N-g' datos5 > datos6
sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/g' datos6 > datos7
sed 's/\([0-9]\)\/\([0-9]\)\/\([0-9][0-9]*\)/\3-0\2-0\1/g' datos7 > datos8
sed 's/,\\N,\\N,/,\\N,\\N,\\N/g' datos8 > datos9
sed 's/,C,\\N,/,C,\\N,\\N/g' datos9 > datos10
sed 's/a/A/g' datos10 > datos11
sed 's/c/C/g´' datos11 > output.csv
sed -n '1,12p´output.csv
