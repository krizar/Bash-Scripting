#! /bin/bash
#validar un dir
#Funcion 

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"

validar(){
if [ $? -eq 0 ]; then
	echo -e "\t\t${greenColour}Ok${endColour}" $1
else
	echo -e "\t\t${redColour}Fail${endColour}" $1
	exit 
fi
}
#comando
dir /root
validar dir
ls -la /root
validar ls 
