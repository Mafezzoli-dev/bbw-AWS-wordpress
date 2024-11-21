#!/bin/bash

# Exit on any error
set -e

# Abfrage der Infos
read -p "MySql host (Endpoint): " MYSQL_HOST
read -p "MySql User: " MYSQL_USER
read -s -p "Erstelle ein Passwort fuer den wordpress user " MYSQL_PASSWORD
echo
read -p "Gib ein sicheres Passwort für den WordPress Benutzer ein: " WORDPRESS_PASSWORD

echo "Exportieren von MySQL Host"
export MYSQL_HOST="$MYSQL_HOST"

# Verbindung zu MySQL herstellen und Konfiguration ausführen
echo "Verbinde zu MySQL und konfiguriere Datenbank und Benutzer..."
mysql --host="$MYSQL_HOST" --user="$MYSQL_USER" --password="$MYSQL_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'wordpress' IDENTIFIED BY '$WORDPRESS_PASSWORD';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress';
FLUSH PRIVILEGES;
EXIT;
EOF

echo "Konfiguration abgeschlossen"
