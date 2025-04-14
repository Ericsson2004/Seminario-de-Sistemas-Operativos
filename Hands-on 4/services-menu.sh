#!/bin/bash

while true; do

    echo "Menu de servicios"
    echo "1) Listar el contenido de la carpeta"
    echo "2) Crear un archivo de texto con una línea de texto"
    echo "3) Comparar dos archivos de texto"
    echo "4) Mostrar uso de 'awk'"
    echo "5) Mostrar uso de 'grep'"
    echo "6) Salir"
    read -p "Elija una opción: " opcion

    case $opcion in

        1)
            read -p "Ingrese la ruta completa: " dir
            if [ -d "$dir" ]; then
                ls -l "$dir"
            else
                echo "Error: La carpeta no existe."
            fi
            ;;
        2)
            read -p "Cuál es nombre del archivo a crear: " archivo
            read -p "Escriba el texto a guardar: " texto
            archivo_path="$(dirname "$0")/$archivo"
            echo "$texto" > "$archivo_path"
            echo "Archivo '$archivo' creado de manera correcta en $(dirname "$0")."
            ;;
        3)
            read -p "Ingrese el primer archivo a comparar: " file1
            read -p "Ingrese el segundo archivo a comparar: " file2

            # Los archivos deben estar en el mismo directorio que el script
            file1_path="$(dirname "$0")/$file1"
            file2_path="$(dirname "$0")/$file2"

            if [ -f "$file1_path" ] && [ -f "$file2_path" ]; then
                diff "$file1_path" "$file2_path"
            else
                echo "Error: Uno o los dos archivos no existen en $(dirname "$0")."
            fi
            ;;
        4)
            echo "Uso de awk:"
            echo "Mostrando la primera columna de un archivo:"
            ejemplo_file="$(dirname "$0")/ejemplo.txt"
            echo -e "Nombre\tEdad\nErick\t21\nFrancisco\t22" > "$ejemplo_file"
            awk '{print $1}' "$ejemplo_file"
            ;;
        5)
            echo "Ejemplo de uso de 'grep':"
            echo "Buscando la palabra 'error' en un archivo de ejemplo:"
            log_file="$(dirname "$0")/log.txt"
            echo -e "Info: Todo está bien\nError: Se produjo un problema" > "$log_file"
            grep "Error" "$log_file"
            ;;
        6)
            echo "Saliendo del script."
            exit 0
            ;;
        *)
            echo "Opción no válida, intente de nuevo."
            ;;
    esac
    echo ""
done


