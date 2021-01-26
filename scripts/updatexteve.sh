#!/bin/bash

   localip=$(ip route get 1.2.3.4 | awk '{print $7}') && \
   sed -i 's+"file.source": "http://.*:9981/playlist+"file.source": "http://newip:9981/playlist+g' /config/xteve/settings.json && \
   sed -i 's+"file.source": "http://.*:9981/xmltv+"file.source": "http://newip:9981/xmltv+g' /config/xteve/settings.json && \
   sed -i "s/newip/$localip/g" /config/xteve/settings.json && \
   sed -i 's+"tvg-logo": "http://.*:9981/imagecache/+"tvg-logo": "http://newip:9981/imagecache/+g' /config/xteve/xepg.json && \
   sed -i 's+"url": "http://.*:9981/stream+"url": "http://newip:9981/stream+g' /config/xteve/xepg.json && \
   sed -i "s/newip/$localip/g" /config/xteve/xepg.json
   echo "Xteve Actualizado"
