FROM wordpress:latest
#RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
&&  docker-php-ext-enable redis
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
