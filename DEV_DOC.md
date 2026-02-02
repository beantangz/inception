# DEV_DOC.md — Developer Documentation

## 1. Prerequisites

Before setting up the project, ensure the following are installed:

- **Docker** (v20+ recommended)
- **Docker Compose** (v1.29+)
- **Make**
- A modern browser (for testing the website)

---

## 2. Environment Setup

1. Clone the project repository:

git clone <repo_url>

cd inception

Copy the .env file

## 3. Building and Launching the Project

Start the stack with :

make up

Build or rebuild images:

make build      # Build images without starting containers
make rebuild    # Force rebuild all images

Stop containers and keep volumes :

make down

Stop and remove everything (including volumes):

make fclean

## 4. Managing Containers

Check running containers:

docker ps

Access a container shell:

docker exec -it wordpress bash
docker exec -it mariadb bash
docker exec -it nginx bash

## 5. Managing Volumes

List Docker volumes: 

docker volume ls

Inspect volume location:

docker volume inspect <volume_name>

Remove a volume:

docker volume rm <volume_name>