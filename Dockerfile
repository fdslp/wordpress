FROM wordpress:6.3.2-php8.1-apache
# install the PHP extensions we need
RUN apt-get update && apt-get install -y \
libpng12-dev \
            libjpeg-dev \
            php-pear \
            php-http-request \
            libxml12-dev \
    && rm -rf /var/lib/apt/lists/* \
#RUN docker-php-ext-install mysqli pdo pdo_mysql soap
RUN docker-php-ext-install soap
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
&&  docker-php-ext-enable redis soap
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
