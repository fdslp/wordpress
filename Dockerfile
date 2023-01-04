FROM wordpress:6.0.1-php7.4-apache
#RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
