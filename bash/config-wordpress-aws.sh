#!/bin/bash

read -p "Endpoint: " MYSQL_HOST
read -p "MySQL Benutzer: " MYSQL_USER
read -sp "MySQL Passwort: " MYSQL_PASSWORD
echo 
wordpress=DB_NAME
read -p "Benutzernamen neue Datenbank: " DB_USER
read -sp "Passwort neuen Benutzer: " DB_USER_PASSWORD

mysql --host="$MYSQL_HOST" --user="$MYSQL_USER" --password="$MYSQL_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EXIT;
EOF

# Pause nach der Ausführung der SQL-Befehle
echo "Datenbank und Benutzer wurden erfolgreich erstellt."
