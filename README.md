*This project has been created as part of the 42 curriculum by mleineku.*

# Inception

## Description

Inception deploys a WordPress website using **Docker containers**:

- **WordPress + PHP-FPM**  
- **MariaDB**  
- **NGINX** 

Persistent data is stored in **named Docker volumes**, and containers communicate over a **custom bridge network**.  
Key choices:

- Docker vs VM: Docker provides lightweight, fast-starting containers that share the host kernel while remaining isolated. This approach reduces resource usage compared to full virtual machines and fits well with a micro-services architecture.

- Secrets vs .env: secure credentials without commiting in Git, This prevents accidental exposure and allows easy reconfiguration without rebuilding images.

- Bridge network: internal communication without exposing ports  

- Volumes: persist WordPress and MariaDB data independently of container lifecycles. This guarantees data durability across container restarts, rebuilds, or system reboots.

---

## Instructions

1. Clone the repository

2. Create .env and set credentials and domain

3. Use "make up" for compilation

## Resources

https://docs.docker.com/
https://mariadb.com/docs/
https://developer.wordpress.org/cli/commands/cli/
https://nginx.org/en/docs/

AI was used to explain Docker concepts, guide the setup, and help container issues. Helped me a lot to be able to change the port of a service.