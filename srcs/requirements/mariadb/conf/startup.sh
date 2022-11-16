#!/bin/sh

./usr/share/mariadb/mysql.server start
mariadb -e "SET PASSWORD FOR root@localhost=PASSWORD('$MYSQL_ROOT_PASSWORD');"
mariadb -e "SET PASSWORD FOR mysql@localhost=PASSWORD('$MYSQL_PASSWORD');"
mariadb -e "CREATE USER '$WP_DB_USER'@'%' IDENTIFIED BY '$WP_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO '$WP_DB_USER'@'%' WITH GRANT OPTION;"
mariadb -e "ALTER USER root@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('$MYSQL_ROOT_PASSWORD');"
