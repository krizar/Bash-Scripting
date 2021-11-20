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
servidores=$(cat remote.txt)
for host in $servidores; do 
	sshpass -p "Kauil123." ssh -o "StrictHostKeyChecking no" kauil@$host 'bash' < updateserver.sh
	validar "en el servidor" $1 "  " $host
done 
echo "exitoso"
