FROM wordpress:6.4.2-php8.1-apache
#RUN docker-php-ext-install mysqli pdo pdo_mysql soap
# install the PHP extensions we need
RUN apt-get update && apt-get install -y libxml2-dev \
    && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install soap
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
&&  docker-php-ext-enable redis soap
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
