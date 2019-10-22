#FROM php:7.3.10-fpm
FROM php:7.3-alpine
  
RUN set -eux; \
	\
	apk add --no-cache --virtual .build-deps \
    coreutils \
    freetype-dev \
    mariadb-client \
    libpng-dev \
    libxml2-dev \
    zip \
    libzip-dev \
    jpegoptim optipng pngquant gifsicle \
    unzip \
    git \
    curl \
    ;
	
RUN apk add --no-cache --virtual \
    libjpeg62-turbo-dev
    
RUN apk add --no-cache --virtual \
    libfreetype6-dev
    
RUN apk add --no-cache --virtual \
    zlib1g-dev
    
RUN apk add --no-cache --virtual \
    libicu-dev
    
RUN apk add --no-cache --virtual \
    locales
    
RUN apk add --no-cache --virtual \
    cron
    
#RUN apt clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath xml opcache
#RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www
