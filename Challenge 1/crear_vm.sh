#!/bin/bash

# Verificar que los datos sean correctos
if [ $# -ne 8 ]; then
    echo "Uso: $0 <NombreVM> <SO> <CPUs> <RAM (GB)> <VRAM (MB)> <TamañoDisco (GB)> <SATAController> <IDEController>"
    exit 1
fi

# Dar valores a las variables
nombreMV=$1
SO=$2
cpus=$3
ramGB=$4
vramMB=$5
discoTamanoGB=$6
controladorSATA=$7
controladorIDE=$8

# Crear carpeta para la Maquina Virtual
directorioVM="$HOME/VMs/$nombreMV"
mkdir -p "$directorioVM"

# Direcció del archivo del disco virtual
discoVMDK="$directorioVM/$nombreMV.vmdk"

# Crear archivo de configuración de la máquina virtual
echo "Creando archivo de configuración de la máquina virtual..."
cat <<EOL > "$directorioVM/$nombreMV.vmx"
config.version = "8"
virtualHW.version = "14"
displayName = "$nombreMV"
guestOS = "$SO"
memsize = "$((ramGB * 1024))"  # Convertir RAM a MB
numvcpus = "$cpus"
vramSize = "$vramMB"
scsi0.present = "TRUE"
scsi0.virtualDev = "lsisas1068"
scsi0:0.present = "TRUE"
scsi0:0.fileName = "$discoVMDK"
scsi0:0.deviceType = "scsi-hardDisk"
ide1:0.present = "TRUE"
ide1:0.deviceType = "cdrom-raw"
EOL

# Crear el disco duro virtual
echo "Creando disco virtual de ${discoTamanoGB} GB..."
fallocate -l "${discoTamanoGB}G" "$discoVMDK" 2>/dev/null || touch "$discoVMDK"

# Imprimir la configuración final
echo "Máquina virtual '$nombreMV' creada y configurada con:"
echo "  - SO: $SO"
echo "  - $cpus CPUs"
echo "  - $ramGB GB de RAM"
echo "  - $vramMB MB de VRAM"
echo "  - Disco de ${discoTamanoGB} GB"
echo "  - Controlador SATA: $controladorSATA (asociado al disco duro)"
echo "  - Controlador IDE: $controladorIDE (asociado al lector CD/DVD)"

