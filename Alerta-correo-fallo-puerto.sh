#!/bin/bash
# Funcion de validacion de comandos
validar(){
if [ $? -eq 0 ]; then
	echo $1 OK 
else
	echo $1 Fail
	exit 
fi
}
puerto=$(netstat -ptnl | grep tcp6 | cut -d: -f4 | sort -u | grep "\<$1\>" | awk '{ print $1 }')
validar	
	if [[ $puerto -ne $1 ]]; then
		(echo helo mail.kauil.com.mx;
		 echo mail from: '<prueba@kauil.com.mx>';
		  echo rcpt to: '<prueba@kauil.com.mx>'; 
		  echo data; 
		  echo Subject: Alerta de puerto abierto;
		  echo;
		  echo Puerto el puert $d esta caido;
		  echo .;
		  echo quit ) | nc mail.kauil.com.mx 26 | grep 250
		  validar
	fi
