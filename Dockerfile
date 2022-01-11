FROM php:7.3-apache
LABEL maintainer="vladsanyuk@gmail.com"

RUN apt-get update && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.2 \
    && docker-php-ext-enable mcrypt

COPY DocumentRoot/. /var/www/html