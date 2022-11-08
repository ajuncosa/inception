#!/bin/sh

./usr/share/mariadb/mysql.server start
mariadb -e "SET PASSWORD FOR root@localhost=PASSWORD('root-pass');"
mariadb -e "SET PASSWORD FOR mysql@localhost=PASSWORD('mysql-pass');"
mariadb -e "CREATE USER 'wp'@'%' IDENTIFIED BY 'wp-pass';"
mariadb -e "GRANT ALL PRIVILEGES ON ajuncosadb.* TO 'wp'@'%' WITH GRANT OPTION;"
