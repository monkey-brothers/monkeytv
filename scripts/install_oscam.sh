#!/bin/bash
 OSCAM_VERSION=""
 apk update
 apk add --no-cache --virtual=build-dependencies curl gcc g++ libusb-dev linux-headers make openssl-dev pcsc-lite-dev subversion tar && \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	ccid \
	libcrypto1.1 \
	libssl1.1 \
	libusb \
	pcsc-lite \
	pcsc-lite-libs && \
 echo "**** compile oscam ****" && \
 if [ -z ${OSCAM_VERSION+x} ]; then \
	OSCAM_VERSION=$(svn info --show-item revision https://svn.streamboard.tv/oscam/trunk ); \
 fi && \
 svn checkout http://www.streamboard.tv/svn/oscam/trunk@${OSCAM_VERSION} /tmp/oscam-svn && \
 cd /tmp/oscam-svn && \
 ./config.sh \
	--enable all \
	--disable \
	CARDREADER_DB2COM \
	CARDREADER_INTERNAL \
	CARDREADER_STINGER \
	CARDREADER_STAPI \
	CARDREADER_STAPI5 \
	IPV6SUPPORT \
	LCDSUPPORT \
	LEDSUPPORT \
	READ_SDT_CHARSETS && \
 make \
	CONF_DIR=/config \
	DEFAULT_PCSC_FLAGS="-I/usr/include/PCSC" \
	NO_PLUS_TARGET=1 \
	OSCAM_BIN=/usr/bin/oscam \
	pcsc-libusb && \
 echo "**** fix broken permissions from pcscd install ****" && \
 chown root:root \
	/usr/sbin/pcscd && \
 chmod 755 \
	/usr/sbin/pcscd && \
 echo "**** install PCSC drivers ****" && \
 mkdir -p \
	/tmp/omnikey && \
 curl -o \
 /tmp/omnikey.tar.gz -L \
	https://www.hidglobal.com/sites/default/files/drivers/ifdokccid_linux_x86_64-v4.2.8.tar.gz && \
 tar xzf \
 /tmp/omnikey.tar.gz -C \
	/tmp/omnikey --strip-components=2 && \
 cd /tmp/omnikey && \
 ./install && \
 echo "**** fix group for card readers and add abc to dialout group ****" && \
 groupmod -g 24 cron && \
 groupmod -g 16 dialout && \
 usermod -a -G 16 abc && \
 svn checkout https://github.com/linuxserver/docker-oscam/trunk/root /tmp/docker-oscam/root && \
 mv /tmp/docker-oscam/root/etc/cont-init.d/30-config /tmp/docker-oscam/root/etc/cont-init.d/33-config && \
 cp -r /tmp/docker-oscam/root/. / && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/tmp/*  && \
reboot
