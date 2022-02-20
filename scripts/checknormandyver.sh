#!/bin/bash
if
[ "`cat /config/NormandyEPG/Normandy_EPG.ver 2>/dev/null`" != "`curl -L https://raw.githubusercontent.com/NormandyEPG/NEPG/master/Normandy_EPG.ver 2>/dev/null`" ];
then
echo "Comenzamos la instalacion"
NOMBRE_APP="NormandyEPG"
CARPETA_TVH="/config"
carpeta_channel="$CARPETA_TVH/channel/config/*"
carpeta_tag="$CARPETA_TVH/channel/tag/*"


# Borramos configuración actual de TVH
	rm -rf /picons
	rm -rf /config/NormandyEPG/Normandy_EPG.ver
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
apk add --no-cache unzip
wget -P /config/tmp/ https://raw.githubusercontent.com/NormandyEPG/NEPG/master/Normandy_EPG.zip
mkdir -p /NormandyEPG /config/tmp/NormandyEPG
unzip -o -P "p~a6T<%}bwX<GwHQ" /config/tmp/Normandy_EPG.zip 'picons/*' -d /config/tmp/NormandyEPG  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /config/tmp/Normandy_EPG.zip 'bindocker/*' -d /config/tmp/NormandyEPG  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /config/tmp/Normandy_EPG.zip 'data/*' -d /config/tmp/NormandyEPG  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /config/tmp/Normandy_EPG.zip 'datadocker/*' -d /config/tmp/NormandyEPG  > /dev/null 2>&1
unzip -o -P "p~a6T<%}bwX<GwHQ" /config/tmp/Normandy_EPG.zip 'Normandy_EPG.ver' -d /config/tmp/NormandyEPG  > /dev/null 2>&1
chmod +x /config/tmp/NormandyEPG/bindocker/*
chmod +x /config/tmp/NormandyEPG/datadocker/*
cp -r /config/tmp/NormandyEPG/picons/. /picons/
cp -r /config/tmp/NormandyEPG/bindocker/. /usr/bin/
cp -r /config/tmp/NormandyEPG/data/. /config/
cp -r /config/tmp/NormandyEPG/datadocker/. /config/
cp -r /config/tmp/NormandyEPG/Normandy_EPG.ver /NormandyEPG
rm -rf /config/tmp/NormandyEPG/
rm -rf /config/tmp/Normandy_EPG.zip
reboot
else
echo "NormandyEPG actualizada"
fi
