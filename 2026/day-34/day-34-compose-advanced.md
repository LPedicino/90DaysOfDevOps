# Day 34: Docker Compose - Advanced Multi-Container Apps

## Task 1: 3-Service Stack Architecture
* Designed a multi-container stack consisting of a custom web application, a database (MariaDB/Postgres), and Redis cache.

---

## Task 2: Healthchecks & `depends_on`
* Configured `depends_on` with `condition: service_healthy` so the web service waits until the database container is fully ready to accept connections, preventing race conditions.

---

## Task 3: Restart Policies
* Implemented `restart: always` on critical services (database/cache) to ensure high availability after crashes or host reboots.
* Analyzed differences against `restart: on-failure`.

---

## Task 4: Custom Dockerfiles in Compose
* Used the `build:` directive to build the web application image directly from a local Dockerfile rather than pulling a pre-built registry image.

---

## Task 5: Custom Networks, Volumes & Labels
* Declared explicit custom networks and named volumes in the compose file to segregate traffic and guarantee data persistence.
