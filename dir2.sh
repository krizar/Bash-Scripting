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
dir
validar dir
ls -la
validar ls
