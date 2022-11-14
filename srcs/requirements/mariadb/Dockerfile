FROM alpine:3.15

WORKDIR /

RUN apk update
RUN apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld 
RUN chown -R mysql:mysql /run/mysqld

RUN rm /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/my-mariadb-server.cnf /etc/my.cnf.d/

RUN mysql_install_db --user=mysql
COPY ./conf/startup.sh /
RUN sh startup.sh

ENTRYPOINT ["mysqld"]
CMD ["-u", "mysql"]
