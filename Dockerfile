FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    unzip zip libicu-dev libonig-dev libxml2-dev libzip-dev git \
    && docker-php-ext-install intl mbstring pdo_mysql xml zip

RUN a2enmod rewrite

WORKDIR /var/www/html

COPY . /var/www/html

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 tmp logs

EXPOSE 80

