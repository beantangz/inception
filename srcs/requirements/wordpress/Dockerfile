FROM debian:bookworm

RUN apt update && apt install -y \
	php8.2 \
	php8.2-fpm \
	php8.2-mysql \
	wget \
	curl \
	mariadb-client \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*
	
RUN sed -i 's|listen = .*|listen = 9000|' /etc/php/8.2/fpm/pool.d/www.conf

RUN mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY tools/setup_wordpress.sh /usr/local/bin/setup_wordpress.sh

RUN chmod +x /usr/local/bin/setup_wordpress.sh

RUN mkdir -p /var/www/html

EXPOSE 9000

CMD ["bash", "/usr/local/bin/setup_wordpress.sh"]