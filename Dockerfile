FROM php:7.3.6-fpm-alpine3.9

RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache shadow
RUN usermod -u 1000 www-data

RUN apk add composer

COPY . /var/www
COPY .env.example /var/www/.env

RUN chown -R www-data:www-data /var/www

USER www-data

EXPOSE 9000
