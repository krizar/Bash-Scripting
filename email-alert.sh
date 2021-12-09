#! /bin/bash
#validar un dir
#Funcion 
validar(){
if [ $? -eq 0 ]; then
	echo OK $1
else
	echo fallo $1
	exit 
fi
}
#comando
mapfile -t puerto < <(netstat -natu | grep tcp6 | grep LISTEN | cut -d: -f4 | sort -u | awk '{ print $1 }')
for d in "${puerto[@]}"; do
	if [ "$d" == "9090" ]; then 
		echo $d
		echo -e "To: alerta@kauil.com.mx\nFrom: alerta@kauil.com.mx\nSubject: El puerto 9090 esta caido \n\n\n Se aprecentado un porblema con el servicio en el puerto 9090 tomar medidas necesarias  " | msmtp -C ~/.msmtprc "alerta@kauil.com.mx"
		validar
	fi
done
validar
