FROM php:7.2.3-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure mysqli \
    && docker-php-ext-install mysqli mbstring tokenizer xml ctype json pdo pdo_mysql \
    && docker-php-ext-enable  mysqli mbstring tokenizer xml ctype json pdo pdo_mysql

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
RUN apt-get update && apt-get -y --no-install-recommends install git \
    && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
    && rm -rf /var/lib/apt/lists/*
ADD . /var/www
RUN chown -R www-data:www-data /var/www/
