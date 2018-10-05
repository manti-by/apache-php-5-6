FROM debian:jessie-slim

RUN apt-get update --fix-missing
RUN apt-get install -y apache2 php5 libapache2-mod-php5 \
    php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap \
    php5-mcrypt php5-memcache php5-pspell php5-recode \
    php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

RUN apt-get autoremove --purge && apt-get clean

RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-enabled/

COPY php.ini /etc/php5/php.ini

WORKDIR /var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]
