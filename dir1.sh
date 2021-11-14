#! /bin/bash
#validar un dir
#comando
dir /root
if [ $? -eq 0 ]; then
	echo OK
else
	echo Fail
	exit 
fi
ls -la
