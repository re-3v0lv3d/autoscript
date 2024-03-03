#!/bin/bash

zenity --info --text="Bienvenido al asistente de instalación automatizada" --title="Instalador"

if ! wget -q --spider https://google.com; then
    zenity --error --text="No hay conexión a Internet. El programa se cerrará." --title="Error"
    exit 0
fi

password=$(zenity --password --title="Contraseña de sudo")

echo "$password" | sudo -S apt-get update
echo "$password" | sudo -S apt-get install xfreerdp

zenity --info --text="Instalación terminada sin errores" --title="Éxito"

usuario=$(zenity --entry --text="Introduce el nombre de usuario (Ej: TPV2):" --title="Nombre de usuario")
touch "/home/$usuario/Escritorio/ERP.sh"
chmod 777 "/home/$usuario/Escritorio/ERP.sh"
echo "#!/bin/bash

clear

echo Por favor, espere mientras configuramos el puesto de trabajo

sleep 2

clear

echo Conectando a la sesión remota

xfreerdp /u:$usuario /p:123456 /v:129.100.21.1" > "/home/$usuario/Escritorio/ERP.sh"

touch "/home/$usuario/.config/autostart/ERP.desktop"
echo "[Desktop Entry]
Type=Application
Name=ERP
Exec=/home/$usuario/Escritorio/ERP.sh
Icon=system-run
X-GNOME-Autostart-enabled=true" > "/home/$usuario/.config/autostart/ERP.desktop"
chmod 777 "/home/$usuario/.config/autostart/ERP.desktop"

zenity --info --text="Todo listo. ¡Disfruta!" --title="Éxito"

