#!/bin/bash
# Crear un archivo con el contenido
echo "Hola Mundo" > mytext.txt
echo "Archivo mytext.txt creado."
# Mostrar el contenido
cat mytext.txt
echo "Contenido de mytext.txt mostrado."
# Crear carpeta
mkdir backup
echo "Carpeta backup creada."
# Mover el archivo mytext a la carpeta backup
mv mytext.txt backup/
echo "Archivo mytext.txt movido a la carpeta backup."
# Mostrar el contenido de la carpeta backup
ls backup
echo "Contenido de la carpeta backup listado."

# Eliminar el archivo mytext del directorio backup
rm backup/mytext.txt
echo "Archivo mytext.txt eliminado de la carpeta backup."

# Eliminar la carpeta backup
rmdir backup
echo "Carpeta backup eliminada."

echo "Operación completada."
