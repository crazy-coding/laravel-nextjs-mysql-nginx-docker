FROM php:7.4-fpm

# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    curl

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy the Laravel project files
COPY . .

# Install Laravel dependencies
RUN composer install --optimize-autoloader --no-dev

# Generate the Laravel application key
RUN php artisan key:generate

RUN composer require laravel/breeze --dev

RUN php artisan breeze:install api
 
RUN php artisan migrate