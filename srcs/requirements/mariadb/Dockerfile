FROM alpine:3.15

WORKDIR /

RUN apk add mariadb mariadb-client
RUN mkdir -p /run/mysqld 
RUN chown -R mysql:mysql /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql
RUN rm /etc/my.cnf.d/mariadb-server.cnf
COPY ./my-mariadb-server.cnf /etc/my.cnf.d/
RUN mysql_install_db --user=mysql

ENTRYPOINT ["mysqld"]
CMD ["-u", "mysql"]
