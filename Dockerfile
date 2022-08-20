FROM wordpress:5.5.3-php7.4-apache
#RUN docker-php-ext-install mysqli pdo pdo_mysql
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
