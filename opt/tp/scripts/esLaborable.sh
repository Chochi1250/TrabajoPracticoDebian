#!/bin/bash

#Diferentes feriados del 2023:

EsLaborable(){

fecha=$1
feriados=("2023-01-01" "2023-03-24" "2023-04-02" "2023-05-01" "2023-05-25" "2023-06-20" "2023-07-09" "2023-08-17" "2023-10-12" "2023-10-16" "2023-12-8" "2023-25-12")
diaDeLaSemana=$(date -d "$fecha" +%u)
Indice=0
sizeDelArreglo=${#feriados[@]}

#Comprobar si la fecha es dentro del fin de semana

if [ "$diaDeLaSemana" -eq 6 ] || [ "$diaDeLaSemana" -eq 7 ]; then
	echo "La fecha $fecha no es laborable, es un fin de semana"
	return 1
fi

#Comprueba si la fecha ingresada es feriada a traves de un do While

encontrado=false
i=0

while [ $i -lt ${#feriados[@]} ]; do
	if [ "$fecha" == "${feriados[i]}"  ]; then
		encontrado=true
		break
	fi
	((i++))
done

#Comprueba los resultados obtenidos en el while

if [ "$encontrado" == true ]; then
	echo "La fecha ingresada: $fecha no es laborable, es un feriado"
	return 1
else
	echo "La fecha ingresada: $fecha es laborable"
	return 0
fi
}


