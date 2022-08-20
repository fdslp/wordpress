FROM wordpress:5.9.3-php8.0-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
