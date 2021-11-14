#! /bin/bash
#validar un dir
#Funcion 
validar(){
if [ $? -eq 0 ]; then
	echo OK $1
else
	echo Fail $1
	exit 
fi
}
#comando
ping -c 1 localhost
validar ping local host 
ping -c 1 192.168.1.254
validar ping ip no existe
