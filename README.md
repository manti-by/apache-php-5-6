Docker image with Apache and PHP
================================

Versions
--------

- Debian 8 slim
- Apache 2.4.35
- PHP 5.6.38


PHP Extension
-------------

mysql, curl, gd, intl php-pear, imagick, imap, mcrypt, memcache, pspell, 
recode, snmp, sqlite, tidy, xmlrpc, xsl


Docker compose example
----------------------
```yaml
version: '3.3'
  services:
    example-mysql:
      image: mysql:5.5
      ports:
        - 3306:3306
      volumes:
        - ./:/docker-entrypoint-initdb.d
      environment:
        - MYSQL_DATABASE=example_db
        - MYSQL_USER=example_user
        - MYSQL_PASSWORD=pa55word
        - MYSQL_ROOT_PASSWORD=pa55word
    example-app:
      image: mantiby/apache-php-5-6:latest
      ports:
        - 80:80
      links:
        - example-mysql
      volumes:
        - ./:/var/www/html
```
