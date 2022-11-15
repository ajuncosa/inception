#!/bin/sh

wp config create --path=wordpress/ --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_PASSWORD --dbhost=$MARIADB_NET
wp db create --path=wordpress/
wp core install --path=wordpress/ --url=ajuncosa.42.fr --title="La web de ajuncosa" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=ajuncosa@hola.adios --skip-email

exec ./usr/sbin/php-fpm8 --nodaemonize
