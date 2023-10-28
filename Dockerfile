FROM wordpress:6.3.2-php8.1-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql soap
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
&&  docker-php-ext-enable redis soap
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
