FROM alpine:3.15

WORKDIR /

RUN apk add php8 php8-fpm php8-phar php8-openssl php8-mysqli php8-iconv
RUN ln -s /usr/bin/php8 /usr/bin/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download
RUN apk add mariadb-client
COPY ./conf/startup.sh /
CMD sh startup.sh
