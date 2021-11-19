#! /bin/bash
#Funcion 
validar(){
if [ $? -eq 0 ]; then
	echo OK $1
else
	echo Fail $1
	exit 
fi
}
mapfile -t hostexist < <(cat /etc/bind/reverse.db.kauil | cut -d' ' -f1 | sort -u | awk '{print $4}')
for d in "${hostexist[@]}"; do
	if [ "${d%.*}" = $1 ]; then
	echo "Existe $d se cancela la operacion"
	exit
	fi
done
echo "segunda variable $2"
sudo named-checkzone 1.168.192.in-addr.arpa /etc/bind/reverse.db.kauil
sudo named-checkzone kauil /etc/bind/Fordward.db.kauil
systemctl restart bind9
validar "el reinico" $1
