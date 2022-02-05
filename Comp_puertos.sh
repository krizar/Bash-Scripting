#!/bin/bash

DBNAME="port_on" 
DBEXISTS=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" --batch --skip-column-names -e "SHOW DATABASES LIKE '"$DBNAME"';" | grep "$DBNAME" > /dev/null; echo "$?") 
if [ $DBEXISTS -eq 0 ]; then 
	echo "A database with the name $DBNAME already exists."
else 
	echo " database $DBNAME does not exist." 
fi
mapfile -t varip < <(cat /etc/hostname)
mapfile -t dirs < <(netstat -natu | grep LISTEN | grep tcp6 | cut -d: -f4 | sort -u | awk '{ print $1 }')
for d in "${dirs[@]}"; do 
	echo "purto: $d" 
	compro=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" port_on --batch --skip-column-names -e "SELECT * FROM port WHERE puerto='"$d"'AND host='"$varip"';" | grep "$varip" | grep "$d" > /dev/null; echo "$?")
	if [ $compro -eq 0 ]; then 
		echo "El Puerto con numero $d existe."
		actu=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" port_on --batch --skip-column-names -e "UPDATE port SET update_at = NULL WHERE puerto='"$d"'AND host='"$varip"';" | grep "$DBNAME" > /dev/null; echo "$?")	
		if [ $actu -eq 0 ]; then
			echo "El Puerto $d en el host $varip no se actualizo."
			else
			echo "El Puerto $d en el host $varip se actualizo"
		fi
	else
		echo " El puerto $d en el host $varip no existe." 
		regist=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" port_on --batch --skip-column-names -e "INSERT INTO port (id,host,puerto,update_at) VALUES (NULL,'"$varip"','"$d"',NULL);" | grep "$DBNAME" > /dev/null; echo "$?")	
	fi
done
