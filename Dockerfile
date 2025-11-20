# Use official PHP image with Apache
FROM php:8.2-apache

# Install mysqli extension for MySQL connectivity
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Copy application files to Apache document root
COPY app/ /var/www/html/

# Create config.php from template using environment variables
# This happens at build time, but can be overridden at runtime
RUN cp /var/www/html/config.php.template /var/www/html/config.php

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Apache runs on port 80 by default
EXPOSE 80

# Apache automatically starts via the base image's CMD

