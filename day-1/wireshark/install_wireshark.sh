#!/bin/bash

# Actualizar los paquetes
echo "Actualizando los paquetes..."
sudo apt update -y

# Instalar Wireshark
echo "Instalando Wireshark..."
sudo apt install -y wireshark

# Añadir el usuario al grupo wireshark para permitir captura de paquetes sin sudo
echo "Añadiendo el usuario al grupo wireshark..."
sudo usermod -aG wireshark $USER

# Configurar los permisos para la captura de paquetes
echo "Configurando permisos para captura de paquetes..."
sudo dpkg-reconfigure wireshark-common

# Reiniciar la sesión para que los cambios en los grupos surtan efecto
echo "Por favor, cierra sesión y vuelve a entrar para aplicar los cambios."

echo "Instalación completada. ¡Wireshark debería estar listo para usarse!"

