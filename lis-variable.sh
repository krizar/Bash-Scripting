#! /bin/bash
mapfile -t certi < <(ls *.crt)
for d in "${certi[@]}"; do
	if [ $d = $1 ]; then
	echo "Existe ${d%.*}"
	break
	fi
	echo Existe $d
done
