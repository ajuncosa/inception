#!/bin/sh

wp config create --path=wordpress/ --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_PASSWORD --dbhost=$MARIADB_NET
wp db create --path=wordpress/
wp core install --path=wordpress/ --url=$DOMAIN_NAME --title="La web de ajuncosa" --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email
wp user create $WP_OTHER_USER $WP_OTHER_EMAIL --role=$WP_OTHER_ROLE --user_pass=$WP_OTHER_PWD --path=/wordpress

exec ./usr/sbin/php-fpm8 --nodaemonize
