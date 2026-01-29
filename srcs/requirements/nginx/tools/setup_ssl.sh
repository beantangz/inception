#!/bin/bash

# Variables pour le certificat
DOMAIN="mleineku.42.fr"
CERT_PATH="/etc/nginx/ssl/nginx-selfsigned.crt"
KEY_PATH="/etc/nginx/ssl/nginx-selfsigned.key"

if [ ! -f "$CERT_PATH" ] || [ ! -f "$KEY_PATH" ]; then
	openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout "$KEY_PATH" \
		-out "$CERT_PATH" \
		-subj "/C=FR/ST=Ile-de-France/L=Paris/O=42/OU=mleineku42/CN=$DOMAIN"
	echo "Certificat SSL généré pour $DOMAIN"
else
	echo "Certificat SSL déjà existant"
fi
