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
#mapfile -t hostexist < <(sshpass -p "Kauil123." ssh -o "StrictHostKeyChecking no" kauil@dns1.kauil cat /etc/bind/reverse.db.kauil | cut -d' ' -f1 | sort -u | awk '{print $4}')
servidores=$(sshpass -p "Kauil123." ssh -o "StrictHostKeyChecking no" kauil@dns1.kauil cat /etc/bind/reverse.db.kauil | cut -d' ' -f1 | sort -u | awk '{print $4}')
for host in $servidores; do 
	echo $host
	sshpass -p "Kauil123." ssh -o "StrictHostKeyChecking no" kauil@"${host%.*}" 'bash' < updateserver.sh
	validar "en el servidor $host salio" $1 
done 
echo "exitoso"
