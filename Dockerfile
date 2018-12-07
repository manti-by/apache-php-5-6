FROM debian:jessie-slim

RUN apt-get update --fix-missing
RUN apt-get install -y vim apache2 php5 libapache2-mod-php5 \
    php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap \
    php5-mcrypt php5-memcache php5-pspell php5-recode \
    php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl

RUN apt-get autoremove --purge && apt-get clean

RUN a2enmod rewrite
COPY apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

COPY php.ini /etc/php5/php.ini

COPY bashrc /root/.bashrc

WORKDIR /var/www/html

COPY apache2-foreground.sh /bin/apache2-foreground
CMD ["apache2-foreground"]
