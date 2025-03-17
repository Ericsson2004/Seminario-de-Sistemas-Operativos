@echo off

echo Hola Mundo > mytext.txt

type mytext.txt

mkdir backup

echo Carpeta "backup" creada exitosamente.

copy mytext.txt backup\


echo Contenido del directorio "backup":
dir backup

del backup\mytext.txt

echo Eliminando carpeta "backup"...

rd backup

echo Carpeta "backup" eliminada exitosamente.

pause