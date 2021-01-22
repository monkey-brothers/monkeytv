#!/bin/bash

if
[ "`cat /app/NormandyEPG/Normandy_EPG.ver 2>/dev/null`" != "`curl -L https://raw.githubusercontent.com/NormandyEPG/NEPG/master/Normandy_EPG.ver 2>/dev/null`" ];
then
echo "Comenzamos la instalacion"
NOMBRE_APP="NormandyEPG"
CARPETA_TVH="/config"
carpeta_channel="$CARPETA_TVH/channel/config/*"
carpeta_tag="$CARPETA_TVH/channel/tag/*"


# Borramos configuración actual de TVH
	rm -rf /app/NormandyEPG/picons
	rm -rf /app/NormandyEPG/Normandy_EPG.ver
	cd $CARPETA_TVH
	rm -f config
	rm -rf bouquet/
	rm -rf epggrab/
	rm -rf profile/
	rm -rf service_mapper/
	rm -rf input/dvb/networks/b59c72f4642de11bd4cda3c62fe080a8/
	rm -rf xmltv/


# Borramos configuración vieja de TVH de NormandyEPG, conservando redes y canales mapeados por los usuarios
	rm -f

	if [ "$1" != "ALL" ];then
		# Recorremos los ficheros de estas carpetas para borrar solo los que tengan la marca
		for fichero in $carpeta_channel $carpeta_tag
		do
		   if [ -f "$fichero" ]; then
			 ultima=$(tail -n 1 $fichero)
			 if [[ "$ultima" = $NOMBRE_APP ]]; then
			   rm -f $fichero
			 fi
		   fi
		done
	else
		# Borramos todos los canales, tags y redes
		rm -rf $carpeta_channel
		rm -rf $carpeta_tag
		rm -rf input/
	fi

#Descargarmos NormandyEPG
wget -P /tmp/ https://raw.githubusercontent.com/NormandyEPG/NEPG/master/Normandy_EPG.zip
mkdir -p /app/NormandyEPG /app/NormandyEPG/tmp
unzip -o -P "p~a6T<%}bwX<GwHQ" /tmp/Normandy_EPG.zip 'picons/*' -d /app/NormandyEPG/tmp  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /tmp/Normandy_EPG.zip 'bindocker/*' -d /app/NormandyEPG/tmp  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /tmp/Normandy_EPG.zip 'data/*' -d /app/NormandyEPG/tmp  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /tmp/Normandy_EPG.zip 'datadocker/*' -d /app/NormandyEPG/tmp  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /tmp/Normandy_EPG.zip 'Normandy_EPG.ver' -d /app/NormandyEPG/tmp  > /dev/null 2>&1
chmod +x /app/NormandyEPG/tmp/bindocker/*
chmod +x /app/NormandyEPG/tmp/datadocker/*
cp -r /app/NormandyEPG/tmp/picons/. /picons/
cp -r /app/NormandyEPG/tmp/bindocker/. /usr/bin/
cp -r /app/NormandyEPG/tmp/data/. /config/
cp -r /app/NormandyEPG/tmp/datadocker/. /config/
cp -r /app/NormandyEPG/tmp/Normandy_EPG.ver /app/NormandyEPG
rm -rf /app/NormandyEPG/tmp
rm -rf /tmp/Normandy_EPG.zip
reboot
else
echo "NormandyEPG actualizada"
sleep 2
fi
