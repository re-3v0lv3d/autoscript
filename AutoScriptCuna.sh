#!/bin/bash

clear && sleep 1
echo "                     Bienvenido al asistente de instalacion automatizada" && sleep 2
wget -q --spider https://google.com
if [ $? -eq 0 ]; then
	echo "                     Actualmente tienes conexión a internet."
else
	echo "                     No hay conexión a internet , cerrando el programa"
sleep 2
exit 0
fi
clear
echo "                     Por favor, ingresa la contraseña de sudo:"
read -s password

echo "$password" | sudo -S apt-get update
echo "$password" | sudo -S apt-get install xfreerdp

echo "Instalacion terminada sin errores" && sleep 5

clear

echo "Creando Script" && sleep 1

clear

echo "Introduce nombre de usuario. Ej:TPV2"
read usuario

touch /home/$usuario/Escritorio/ERP.sh
chmod 777 /home/$usuario/Escritorio/ERP.sh
echo "#!/bin/bash

clear

echo Por favor, espere mientras configuramos el puesto de trabajo

sleep 2

clear

echo Conectando a la sesión remota

xfreerdp /u:$usuario /p:123456 /v:129.100.21.1" > /home/$usuario/Escritorio/ERP.sh
echo "Script completado con éxito" && sleep 2

echo "Configurando el autoarranque"

echo "hola que tal"

touch /home/$usuario/.config/autostart/ERP.desktop

echo "[Desktop Entry]
Type=Application
Name=ERP
Exec=~/home/$usuario/Escritorio/ERP.sh
Icon=system-run
X-GNOME-Autostart-enabled=true" > /home/$usuario/.config/autostart/ERP.desktop

chmod 777 /home/$usuario/.config/autostart/ERP.desktop

echo "amoabe"

sleep 50
 
clear