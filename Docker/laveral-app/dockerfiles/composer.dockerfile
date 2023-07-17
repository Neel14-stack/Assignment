FROM composer:latest

WORKDIR /var/www/html

ENTRYPOINT [ "composer","--ignore-platfrom-reqs" ]