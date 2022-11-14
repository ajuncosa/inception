#!/bin/sh

./usr/share/mariadb/mysql.server start
mariadb -e "SET PASSWORD FOR root@localhost=PASSWORD('$MYSQL_ROOT_PASSWORD');"
mariadb -e "SET PASSWORD FOR mysql@localhost=PASSWORD('$MYSQL_PASSWORD');"
mariadb -e "CREATE USER 'wp'@'%' IDENTIFIED BY '$WP_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON ajuncosadb.* TO 'wp'@'%' WITH GRANT OPTION;"
