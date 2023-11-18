
#Verifica si no se manda ningun proceso

if [ $# -eq 0 ]; then
	echo "error no se ingreso ningun proceso"
	echo "Uso correcto: $0 <nombreDelProceso>"
	exit 1
fi

#Variables

proceso=$1



#Verificacion

if pgrep -x "$proceso" > /dev/null; then
	echo "El Proceso: $proceso esta en ejecucion"
else
	echo "El Proceso: $proceso no esta en ejecucion, se mandara un mail al root"
	asunto="Alerta: El proceso: $proceso no esta en ejecucion"
	cuerpo="El proceso $proceso no se encuentra en ejecucion, verifique el error"
	echo "$cuerpo" | mutt -s "$asunto" -- root
fi

