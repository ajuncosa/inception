#!/bin/sh

./usr/share/mariadb/mysql.server start
mariadb -e "SET PASSWORD FOR root@localhost=PASSWORD('root-pass');"
mariadb -e "SET PASSWORD FOR mysql@localhost=PASSWORD('mysql-pass');"
mariadb -e "CREATE USER 'root'@'%' IDENTIFIED BY 'my-new-password';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
