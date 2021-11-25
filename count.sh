for arg in "$@"
do
  if [ "$arg" == "--help" ] || [ "$arg" == "-h" ] || [ "$arg" == "--h" ]
  then
    echo " Agregar el numero de linea que desea ver el contenido."
    echo " ejemplo: 3  o 33343"
    echo " dependiendo el tamaño de tu archivo"
exit
fi
done
validar(){
  if [ $? -ne 0 ]; then
    echo $1 Fail
    exit 
  fi
}
i=$1
let i--
echo $i
mapfile -t lag < <(cat findme.txt)
validar
echo  "${lag[$i]}"
validar
