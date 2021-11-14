#! /bin/bash
#validar un dir
#Proporciona ayuda al usuario
for arg in "$@"
do
	if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]
	then
		echo " Despues del script debes poner el hotname mas dominio"
		echo " ejemplo: hola.kauil"
		exit
	fi
done	
#Validamos el usuario de ejecucion
quien=$(whoami)
if [ $quien != "kauil" ]; then
	echo "el usuario $quien no puede ejecutar este escipt"
	echo "favor de usar el usuario kauil"
	exit
	fi
# Funcion de validacion de comandos
validar(){
if [ $? -eq 0 ]; then
	echo $1 OK 
else
	echo $1 Fail
	exit 
fi
}
#imprime el valor agregado al script
echo $1
# valida si el host esta funcionando
ping -c 1 $1
validar "El servidor esta" 
#valida si el host ya cuenta con certificado
cd ~/easy-rsa/pki/issued/
validar 
mapfile -t certi < <(ls *.crt)
for d in "${certi[@]}"; do
	if [ ${d%.*} = $1 ]; then
	echo "Existe $d se cancela la operacion"
	exit
	fi
done
#vamos a carpeta inicial y valida si es correcta 
cd
validar "regresamos a carpeta inical"
# genera la llave para la solicitud y el Crt
openssl genrsa -out $1.key
validar "generacion de llave"
#genera la solicitud
openssl req -new -key $1.key -out $1.req -subj "/C=MX/ST=CDMX/L=Coyoacan/O=Kauil/OU=Kauil_LAB/CN="$1""
validar "generacion de solicitud"
#importa la solicitud al programa de firma de certificados
cd ~/easy-rsa
./easyrsa import-req ~/$1.req $1
validar "comando 1 de validacion"
#Firma el certificaod
./easyrsa sign-req server $1
validar "comando 2 de validacion"
#copia el certificado a la carpeta del usuario Kauil
cp ~/easy-rsa/pki/issued/$1.crt ~/
validar "comando 3 de validacion"
# regreso a carpeta de kauil para copia de certificado al servidor
cd 
# se conecta al servidor y envia los archivos del certificado
lftp -e "set sftp:auto-confirm yes" -u kauil,Kauil123. sftp://$1:22 <<EOF
put $1.key
put $1.crt
exit
EOF
validar "se entrega certificado al servidor"
#fin
