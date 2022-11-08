FROM alpine:3.15

WORKDIR /

RUN apk update
RUN apk add mariadb mariadb-client

RUN mkdir -p /run/mysqld 
RUN chown -R mysql:mysql /run/mysqld

#COPY ./conf/my_init_file.sql /var/lib/mysql/
#RUN chown -R mysql:mysql /var/lib/mysql
#RUN sed -i 's/${MYSQL_ROOT_PASSWORD}/'"$MYSQL_ROOT_PASSWORD"'/g' /var/lib/mysql/my_init_file.sql
#RUN sed -i 's/${MYSQL_PASSWORD}/'"$MYSQL_PASSWORD"'/g' /var/lib/mysql/my_init_file.sql

RUN rm /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/my-mariadb-server.cnf /etc/my.cnf.d/

RUN mysql_install_db --user=mysql
COPY ./conf/startup.sh /
RUN sh startup.sh

ENTRYPOINT ["mysqld"]
CMD ["-u", "mysql"]
