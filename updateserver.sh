#! /bin/bash
#validar un dir
#Proporciona ayuda al usuario
# Funcion de validacion de comandos
validar(){
if [ $? -eq 0 ]; then
	echo $1 OK 
else
	echo $1 Fallo
	exit 
fi
}
echo "Kauil123."| sudo -S apt -y update
validar "el update" $1
echo "Kauil123."| sudo -S apt -y upgrade 
validar "el upgarde" $1

