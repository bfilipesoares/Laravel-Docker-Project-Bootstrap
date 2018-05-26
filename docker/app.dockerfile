FROM php:7.2.3-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure mysqli \
    && docker-php-ext-install mysqli mbstring tokenizer xml ctype json pdo pdo_mysql \
    && docker-php-ext-enable  mysqli mbstring tokenizer xml ctype json pdo pdo_mysql
ADD . /var/www
RUN chown -R www-data:www-data /var/www/
RUN chmod 755 /var/www
