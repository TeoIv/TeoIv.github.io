# Use the official PHP-Apache image as the base image
FROM php:apache

# Enable necessary Apache modules
RUN a2enmod rewrite

# Install PHP extensions and other dependencies
RUN docker-php-ext-install pdo_mysql

# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy the contents of your Laravel project to the container
COPY . /var/www/html

# Set the document root to /var/www/html/public
RUN sed -i -e 's/DocumentRoot\ \/var\/www\/html/DocumentRoot\ \/var\/www\/html\/public/g' /etc/apache2/sites-available/000-default.conf

# Expose port 80 for Apache
EXPOSE 80
