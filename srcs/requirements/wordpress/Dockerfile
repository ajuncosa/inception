FROM alpine:3.15

WORKDIR /

RUN apk update
RUN apk add php8 php8-fpm php8-phar php8-openssl php8-mysqli php8-iconv mariadb-client
RUN ln -s /usr/bin/php8 /usr/bin/php
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/' /etc/php8/php-fpm.d/www.conf
COPY ./conf/startup.sh /

ENTRYPOINT ["sh", "startup.sh"]
