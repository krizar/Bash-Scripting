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
telnet mail.kauil.com.mx 26 -l pruebas@kauil.com.mx <<EOF
MAIL FROM: prueba@kauil.com.mx
RCPT TO: $1
DATA
SUBJECT: $2
$3
.
quit
EOF
validar
