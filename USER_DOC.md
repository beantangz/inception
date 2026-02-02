# USER_DOC.md — User Documentation

## 1. Overview of the Project

This project deploys a small web infrastructure using Docker and Docker Compose.
The stack provides the following services:

- **Nginx**: Web server acting as the single entry point, serving the website over HTTPS (TLS 1.2 / 1.3).
- **WordPress**: PHP-based Content Management System (CMS) used to manage the website.
- **MariaDB**: Relational database used by WordPress to store data.
- **Docker volumes**: Ensure persistent storage for WordPress files and database data.
- **Docker bridge network**: Allows secure internal communication between containers.

Only Nginx is exposed to the host via port 443.

---

## 2. Starting and Stopping the Project

To start the infrastructure:

make up

To stop the containers without deleting data:

make down

To stop containers and remove all stored data:

make fclean

To rebuild the images after configuration changes:

make rebuild
make up


## 3. Accessing the Website

Open the following URL:

https://mleineku.42.fr

## 4. Accessing the WodPress Administration Panel

Open the following URL:

https://mleineku.42.fr/wp-login.php

And login with the Administrator infos from the .env

## 5. Credentials Management

All credentials are stored in the .env file at the root of the project.

This includes:

Database name, user, and passwords

WordPress administrator and user accounts

Domain name and database host

The .env file should never be pushed to a public repository.

## 6. Verifying Services Status

Go to the /srcs directory and use the command :

docker-compose ps