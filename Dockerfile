FROM php:7.3-alpine

RUN apk --update add --virtual .build-deps
RUN apk --update add --virtual zlib1g-dev
RUN apk --update add --virtual libicu
RUN apk --update add --virtual libicu-dev
#libfreetype6-dev zlib1g-dev libicu-dev locales cron
RUN apk --update add coreutils freetype-dev mariadb-client libpng-dev libxml2-dev zip libzip-dev jpegoptim optipng pngquant gifsicle unzip git curl gettext gettext-dev g++ libjpeg-turbo icu autoconf
#RUN apk --update add zlib1g-dev
#RUN apk --update add libjpeg62-turbo-dev g++ libfreetype6-dev zlib1g-dev libicu-dev locales cron
#RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath xml opcache
#RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd
#RUN docker-php-ext-configure intl
#RUN docker-php-ext-install intl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
