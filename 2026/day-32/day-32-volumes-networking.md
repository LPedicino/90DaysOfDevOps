# Day 32: Docker Volumes & Networking

## Task 1: The Problem (Ephemeral Containers)
* **Experiment:** Ran a database container, created a table/rows, then stopped and removed the container.
* **Result:** The data was completely lost.
* **Why?** Containers have an ephemeral lifecycle (UnionFS/Copy-on-Write). Any write operations made inside the container's writable layer disappear when the container instance is deleted.

---

## Task 2: Named Volumes
* **Commands used:** `docker volume create`, `-v`, `docker volume ls`, `docker volume inspect`.
* **Result:** By attaching a named volume to a directory inside the container (e.g., `/var/lib/mysql`), data persists even after destroying and recreating the container because Docker stores the volume safely in the host's storage area managed by Docker (`/var/lib/docker/volumes/...`).

---

## Task 3: Bind Mounts
* **Experiment:** Mounted a local host folder containing an `index.html` directly into Nginx's web directory (`/usr/share/nginx/html`).
* **Result:** Live updates! Editing the file on the host instantly reflected in the browser upon refresh.
* **Difference between Named Volumes and Bind Mounts:**
  * **Named Volumes:** Fully managed by Docker. Ideal for database storage, caching, and data that shouldn't be directly manipulated on the host file system.
  * **Bind Mounts:** Maps a specific absolute path from your host machine directly into the container. Ideal for local development (live-reload of source code).

---

## Task 4: Docker Networking Basics
* **Default Bridge Network:** Containers can communicate by IP address, but **not** reliably by container name out-of-the-box because automatic DNS resolution is disabled on the default bridge network.

---

## Task 5: Custom Networks
* **Experiment:** Created a custom bridge network (`docker network create my-app-net`) and attached containers to it.
* **Result:** Containers could successfully ping and resolve each other by their container names.
* **Why?** Custom bridge networks include **automatic built-in DNS resolution** (embedded DNS server), allowing containers to resolve each other by name, whereas the default bridge network lacks this feature for backwards compatibility.

---

## Task 6: Put It Together
* Successfully combined a custom network, a persistent named volume for the database, and application communication by container name in a multi-container architecture.
