FROM wordpress:6.4.2-php8.2-apache
#RUN docker-php-ext-install mysqli pdo pdo_mysql soap
# install the PHP extensions we need
RUN apt-get update && apt-get install -y libxml2-dev libldap2-dev \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && rm -rf /var/lib/apt/lists/*
RUN docker-php-ext-install soap ldap
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini \
&& echo "extension=ldap.so" > /usr/local/etc/php/conf.d/ldap.ini \
&&  docker-php-ext-enable redis soap ldap
COPY ./conf.d/php.ini /usr/local/etc/php/conf.d
