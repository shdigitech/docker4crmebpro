#!/bin/bash
# Supervisor daemon for swoole
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
echo "supervisord started"

php-fpm
echo "php-fpm started"
