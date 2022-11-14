FROM alpine:3.15

WORKDIR /

RUN apk update
RUN apk add openssl curl ca-certificates
RUN printf "%s%s%s\n" "http://nginx.org/packages/alpine/v" \
`egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` "/main" \
| tee -a /etc/apk/repositories
RUN curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
RUN mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/
RUN apk add nginx

COPY ./conf/ajuncosa.42.fr.conf /etc/nginx/conf.d/ 

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj '/CN=ajuncosa.42.fr' -newkey rsa:2048 -keyout /etc/nginx/ssl/my-selfsigned.key -out /etc/nginx/ssl/my-selfsigned.crt

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]

EXPOSE 443
