# Bash-Scripting
Actividades de aprendizaje de Bash para actividades de administración.

#!/bin/bash

<command>

if [ $? -eq 0 ]; then

	echo OK

else

	echo FAIL

fi



$$. Muestra el número de proceso del sistema que tiene el shell, es decir el PID.
$0. Muestra el nombre del script que se está ejecutando.
$n. El valor de n es el número de argumento que le pasamos al script, de forma que si hay varios parámetros lo definiríamos como $1, $2, $3, en el caso de que haya 3 parámetros.
$#. Muestra el número total de parámetros que le pasamos en el script.
$*. Muestra el valor de todos los parámetros que le pasamos al script.
$@. Muestra el valor de todos los parámetros que le pasamos al script.
$?. El estado de salida del último comando ejecutado. Shell devuelve un estado para saber si es correcto la ejecución o no, es decir, mostrará un 0 si ha ido todo bien y un 1 si ha fallado o ha tenido errores
$!. El número de proceso del último comando que está en segundo plano.

$1 es el primer parámetro.
$2 es el segundo parámetro.
Hasta el noveno parámetro, que es $ 9


Condicionales con números
operador	significado

-lt			menor que (<)
-gt			mayor que (>)
-le			menor o igual que (<=)
-ge			mayor o igual que (>=)
-eq			igual (==)
-ne			no igual (!=)

if [[ $num1 -gt $num2 ]];
then
  echo $num1 es mayor que $num2
else
  echo $num2 es mayor que $num1
fi


Condicionales con cadenas de texto
operador		significado

=				igual, las dos cadenas de texto son exactamente idénticas
!=				no igual, las cadenas de texto no son exactamente idénticas
<				es menor que (en orden alfabético ASCII)
>				es mayor que (en orden alfabético ASCII)
-n				la cadena no está vacía
-z				la cadena está vacía

#!/bin/bash
string1='reo'
string2='teo'
if [[ $string1 > $string2 ]];
then
  echo Eso es verdad
else
  echo Eso es mentira
fi

#!/bin/bash
string1='reo'
if [[ $string1 = *e* ]];
then
  echo Eso es verdad
else
  echo Eso es mentira
fi

Condicionales con archivos


operador		Devuelve true si

-e name			name existe
-f name			name es un archivo normal (no es un directorio)
-s name			name NO tiene tamaño cero
-d name			name es un directorio
-r name			name tiene permiso de lectura para el user que corre el script
-w name			name tiene permiso de escritura para el user que corre el script
-x name			name tiene permiso de ejecución para el user que corre el script

#!/bin/bash
for file in $(ls);
do
  if [[ -d $file ]];
  then
    echo directorio: $file
  else
    if [[ -x $file ]];
    then
      echo archivo ejecutable: $file
    else
      echo archivo no ejecutable: $file
    fi
  fi
done

Manipulación de cadenas de texto

Mediante ${cadena:posicion:longitud} podemos extraer una subcadena de otra cadena. Si omitimos :longitud, entonces extraerá todos los caracteres hasta el final de cadena.
Por ejemplo en la cadena string=abcABC123ABCabc:
echo ${string:0} : abcABC123ABCabc
echo ${string:0:1} : a (primer caracter)
echo ${string:7} : 23ABCabc
echo ${string:7:3} : 23A (3 caracteres desde posición 7)
echo ${string:7:-3} : 23ABCabc (desde posición 7 hasta el final)
echo ${string: -4} : Cabc (atención al espacio antes del menos)
echo ${string: -4:2} : Ca (atención al espacio antes del menos)

Borrar subcadena
Hay diferentes formas de borrar subcadenas de una cadena:

${cadena#subcadena} : borra la coincidencia más corta de subcadena desde el principio de cadena
${cadena##subcadena} : borra la coincidencia más larga de subcadena desde el principio de cadena

Por ejemplo, en la cadena string=abcABC123ABCabc:

echo ${string#a*C} : 123ABCabc
echo ${string##a*C} : abc

Reemplazar subcadena
También existen diferentes formas de reemplazar subcadenas de una cadena:

${cadena/buscar/reemplazar} : Sustituye la primera coincidencia de buscar con reemplazar
${cadena//buscar/reemplazar} : Sustituye todas las coincidencias de buscar con reemplazar

Por ejemplo, en la cadena string=abcABC123ABCabc:

echo ${string/abc/xyz} : xyzABC123ABCabc.
echo ${string//abc/xyz} : xyzABC123ABCxyz.

IF

if [[ CONDICIÓN ]];
then
  COMANDO 1 si se cumple la condición
fi

if [[ CONDICIÓN ]];
then
  COMANDO 1 si se cumple la condición
else
  COMANDO 2 si no se cumple la condición
fi

if [[ CONDICIÓN 1 ]];
then
  COMANDO 1 si se cumple la condición 1
elif [[ CONDICIÓN 2 ]];
then
  COMANDO 2 si se cumple la condición 2
else
  COMANDO 3 si no se cumple la condición 2
fi


FOR

for VARIABLE in LISTA_VALORES;
do
    COMANDO 1
    COMANDO 2
    ...
    COMANDO N
done

for VARIABLE in 1 2 3 4 5 6 7 8 9 10;
for VARIABLE in {1..10};

for VARIABLE in file1 file2 file3;
for VARIABLE in $(ls /bin | grep -E 'c.[aeiou]');
for VARIABLE in "file1 file2 file3";

WHILE

while condicion
do
  comandos
done

#!/bin/bash

NUM=0

while [ $NUM -le 10 ]; do
    echo "\$NUM: $NUM"
    let NUM=$NUM+1
done

Case
case expresion in
     caso_1 )
        comandos;;
     caso_2 ) 
	comandos;;
     ......
esac  

#!/bin/bash

for NUM in 0 1 2 3
do
  case $NUM in
      0)
	  echo "\$NUM es igual a cero";;
      1)
	  echo "\$NUM es igual a uno";;
      2)
	  echo "\$NUM es igual a dos";;
      3)
	  echo "\$NUM es igual a tres";;
  esac
done

#!/bin/bash
testfunction(){
   echo "My first function"
}
testfunction

testfunction(){
   echo $1
   echo $2
}



