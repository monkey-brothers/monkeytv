#!/bin/bash
# Comprobamos si existe configuracion de Xteve y lo iniciamos
if [ ! -e config/xteve/settings.json ]; then
  (mkdir -p /config/xteve && cp /defaults/xteve/settings.json /config/xteve/settings.json && \
   localip=$(ip route get 1.2.3.4 | awk '{print $7}') && sed -i "s/localhost/$localip/g" /config/xteve/settings.json && xteve -port="8080" -config=/config/xteve/)
else
  (xteve -port="8080" -config=/config/xteve/)
fi
exit

