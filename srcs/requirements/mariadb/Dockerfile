FROM debian:bookworm

RUN apt update && apt install -y \
	mariadb-server \
	mariadb-client \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld

RUN sed -i 's/^bind-address\s*=.*$/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/init_db.sh /usr/local/bin/init_db.sh

EXPOSE 3306

CMD ["bash", "/usr/local/bin/init_db.sh"]
