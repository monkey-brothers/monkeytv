#!/bin/bash

sed -i 's%"enabled": false,%"enabled": true,%g' /config/input/satip/adapters/*

sed -i 's%"ota_epg": true,%"ota_epg": false,%g' /config/input/satip/adapters/*
sed -i 's%"initscan": true,%"initscan": false,%g' /config/input/satip/adapters/*
sed -i 's%"idlescan": true,%"idlescan": false,%g' /config/input/satip/adapters/*

sed -i '51s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '62s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '73s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '84s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '120s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '131s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '142s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '153s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '189s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '200s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '211s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '222s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '258s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '269s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '280s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '291s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '327s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '338s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '349s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '360s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '396s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '407s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '418s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '429s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '465s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '476s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '487s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '498s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '534s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '545s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '556s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
sed -i '567s&]&"b59c72f4642de11bd4cda3c62fe080a8" ]&g' /config/input/satip/adapters/*
