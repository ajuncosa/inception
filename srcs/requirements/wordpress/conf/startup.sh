#!/bin/sh

wp config create --dbname=ajuncosadb --dbuser=wp --dbpass=wp-pass --dbhost=mariadb
wp db create
wp core install --url=ajuncosa.42.fr --title="PRUEBA" --admin_user=ajuncosa --admin_password=hola --admin_email=ajuncosa@hola.adios --skip-email
