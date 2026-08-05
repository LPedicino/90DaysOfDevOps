# Day 33: Docker Compose - Multi-Container Basics

## Task 1: Install & Verify
* Checked Docker Compose availability and verified version using `docker compose version` (v5.4.0).

---

## Task 2: Your First Compose File (Nginx)
* Created a `compose-basics/docker-compose.yml` defining a single Nginx service with port mapping (`8088:80`).
* Managed lifecycle using `docker compose up -d` and `docker compose down`.

---

## Task 3: Two-Container Setup (WordPress + MariaDB)
* Configured a multi-container stack with WordPress and MariaDB (`mariadb:latest`) inside a `wordpress-stack` folder.
* **Key Features:**
  * **Networking:** Compose automatically places services on a shared default network, allowing WordPress to communicate with MariaDB using the service name (`db`) as a hostname.
  * **Persistence:** Attached a named volume (`db_data`) to MariaDB (`/var/lib/mysql`) so posts, configuration, and data survive a `docker compose down`.

---

## Task 4: Essential Compose Commands
* `docker compose up -d`: Starts all services in the background (detached mode).
* `docker compose ps`: Lists running services.
* `docker compose logs -f`: Streams logs for all services.
* `docker compose logs <service-name>`: Views logs for a specific container.
* `docker compose stop`: Stops containers without removing them.
* `docker compose down`: Stops and removes containers and networks.

---

## Task 5: Environment Variables & .env Files
* Abstracted sensitive and configurable credentials into an external `.env` file containing database passwords and user variables.
* Referenced the variables inside the `docker-compose.yml` using syntax like `${VARIABLE_NAME}`.
