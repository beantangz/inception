FROM debian:bookworm

RUN apt update && apt install -y \
	nginx \
	openssl \
	curl \
	vim \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/setup_ssl.sh /usr/local/bin/setup_ssl.sh

EXPOSE 443

CMD ["/bin/bash", "-c", "/usr/local/bin/setup_ssl.sh && nginx -g 'daemon off;'"]
