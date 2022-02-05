#!/bin/bash

DBNAME1="port_on" 
DBEXISTS1=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" --batch --skip-column-names -e "SHOW DATABASES LIKE '"$DBNAME1"';" | grep "$DBNAME1" > /dev/null; echo "$?") 
if [ $DBEXISTS1 -eq 0 ]; then 
	compro1=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" port_on --batch --skip-column-names -e "SELECT * FROM compar WHERE id_bas = 1 ;" | grep 1 > /dev/null; echo "$?")
	if [ $compro1 -eq 0 ]; then 
		echo "registro $d "
		actu=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" port_on --batch --skip-column-names -e "UPDATE compar SET update_bas = NULL WHERE id_bas = 1 ";)	
	else
		echo " El puerto $d en el host $varip no existe." 
		regist=$(mysql -h 192.168.100.206 -u Kauil -p"Kauil123" port_on --batch --skip-column-names -e "INSERT INTO compar (id_bas,update_bas) VALUES (NULL,NULL);")	
	fi
	echo "A database with the name $DBNAME already exists."
else 
	echo " database $DBNAME does not exist." 
fi
