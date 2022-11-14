#!/bin/sh

wp config create --path=wordpress/ --dbname=ajuncosadb --dbuser=wp --dbpass=wp-pass --dbhost=mariadb
wp db create --path=wordpress/
wp core install --path=wordpress/ --url=ajuncosa.42.fr --title="La web de ajuncosa" --admin_user=ajuncosa --admin_password=hola --admin_email=ajuncosa@hola.adios --skip-email

exec ./usr/sbin/php-fpm8 --nodaemonize
