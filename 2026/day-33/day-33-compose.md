# Day 33: Docker Compose - Multi-Container Basics

## Task 1: Install & Verify
* Checked Docker Compose availability using `docker compose version`.

---

## Task 2: Your First Compose File (Nginx)
* Created a `docker-compose.yml` defining a single Nginx service with port mapping (`80:80`).
* Managed lifecycle using `docker compose up -d` and `docker compose down`.

---

## Task 3: Two-Container Setup (WordPress + MySQL)
* Configured a multi-container stack with WordPress and MySQL.
* **Key Features:**
  * **Networking:** Compose automatically places services on a shared default network, allowing WordPress to communicate with MySQL using the service name (`mysql`) as a hostname.
  * **Persistence:** Attached a named volume to MySQL (`/var/lib/mysql`) so posts, configuration, and data survive a `docker compose down`.

---

## Task 4: Essential Compose Commands
* `docker compose up -d`: Starts all services in the background (detached mode).
* `docker compose ps`: Lists running services.
* `docker compose logs -f`: Streams logs for all services.
* `docker compose logs <service-name>`: Views logs for a specific container.
* `docker compose stop`: Stops containers without removing them.
* `docker compose down`: Stops and removes containers and networks.
* `docker compose up --d --build`: Rebuilds images if Dockerfiles are modified.

---

## Task 5: Environment Variables & .env Files
* Used direct environment variables under the `environment:` block in YAML.
* Abstracted sensitive or configurable values into an external `.env` file referenced via syntax like `${VARIABLE_NAME}`.
