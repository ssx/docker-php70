FROM php:7.0
MAINTAINER Scott Wilcox <scott@dor.ky>

# stop upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
ENV DEBIAN_FRONTEND noninteractive

# add php7 repo
RUN apt-get update -yqq
RUN apt-get install git libcurl4-gnutls-dev libicu-dev libmcrypt-dev libvpx-dev libjpeg-dev libpng-dev libxpm-dev zlib1g-dev libfreetype6-dev libxml2-dev libexpat1-dev libbz2-dev libgmp3-dev libldap2-dev unixodbc-dev libpq-dev libsqlite3-dev libaspell-dev libsnmp-dev libpcre3-dev libtidy-dev libxrender-dev -yqq

RUN docker-php-ext-install mbstring mcrypt pdo_mysql curl json intl gd xml zip bz2 opcache
CMD curl -sS https://getcomposer.org/installer | php
CMD mv composer.phar /usr/local/bin/composer
CMD chmod +x /usr/local/bin/composer
