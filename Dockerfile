FROM php:8.2-cli

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN pecl install redis-5.3.7 \
	&& pecl install xdebug-3.2.1 \
	&& docker-php-ext-enable redis xdebug


RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY . .

RUN composer install

CMD ["php", "artisan", "serve"]
