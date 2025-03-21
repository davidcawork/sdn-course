#!/bin/bash

###################
# Install Mininet #
###################

set -e  # Detener la ejecución en caso de error

# Verificar si el script se ejecuta como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, ejecuta este script como root o con sudo."
  exit 1
fi

# Actualizar paquetes e instalar dependencias necesarias
echo "Actualizando paquetes e instalando dependencias..."
apt-get update && apt-get install -y git curl python3-pip

# Verificar si el directorio de Mininet ya existe
if [ -d "mininet" ]; then
  echo "El repositorio de Mininet ya existe. Eliminándolo..."
  rm -rf mininet
fi

# Clonar el repositorio de Mininet
echo "Clonando el repositorio de Mininet..."
git clone https://github.com/mininet/mininet.git

# Navegar al directorio de Mininet y lanzar el script de instalación
cd mininet || { echo "Error al acceder al directorio de Mininet"; exit 1; }

echo "Ejecutando el script de instalación de Mininet..."
./util/install.sh -0fmnyv

# Verificar la instalación con un test básico
echo "Verificando la instalación de Mininet..."
mn --test ping

echo "Instalación completada con éxito."

