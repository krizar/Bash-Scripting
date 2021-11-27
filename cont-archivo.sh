for arg in "$@"
do
  if [ "$arg" == "--help" ] || [ "$arg" == "-h" ] || [ "$arg" == "--h" ]
  then
    echo " Agregar el numero de linea que desea ver el contenido."
    echo " ejemplo: 3  o 33343"
    echo " dependiendo el tamaño de tu archivo"
    echo " despyes del numero de linea debemos escribir el nombre del archivo a leer"
	exit
  fi
done
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"

validar(){
  if [ $? -ne 0 ]; then
    echo -e "\t\t${redColour}Fail${endColour}" $1
    exit 
  fi
}
if [ "$2" = "" ]; then
    echo -e "\t\t${redColour}Fail${endColour}" $2
    exit 
fi
i=$1
let i--
mapfile -t lag < <(cat $2)
validar
echo  "${lag[$i]}"
validar
