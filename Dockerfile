FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev zip unzip git \
    libonig-dev libxml2-dev libzip-dev sendmail \
    && docker-php-ext-install pdo pdo_mysql gd zip mbstring xml

RUN a2enmod rewrite

COPY ./ebrigade /var/www/html
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html
