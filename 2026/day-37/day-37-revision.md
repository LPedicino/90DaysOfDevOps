# Day 37: Docker Revision & Self-Check

## 1. Quick-Fire Questions & Answers
* **What is the difference between an image and a container?**
  An image is a read-only template containing application code, dependencies, and instructions. A container is a runnable, isolated instance of an image with a writable container layer on top.
* **What happens to data inside a container when you remove it?**
  It is permanently lost because it resides in the ephemeral writable layer of the container. Data persistence requires volumes or bind mounts.
* **How do two containers on the same custom network communicate?**
  They can communicate using their container names or service names as hostnames, resolved automatically by Docker's internal DNS.
* **What does `docker compose down -v` do differently from `docker compose down`?**
  `docker compose down` stops and removes containers and networks, while adding `-v` also deletes all named volumes defined in the compose file, wiping persistent database data.
* **Why are multi-stage builds useful?**
  They allow using heavy build tools and dependencies in early stages while copying only the minimal compiled/production artifacts into a tiny final runtime image.
* **What is the difference between `COPY` and `ADD`?**
  `COPY` only copies local files/directories into the image. `ADD` supports extra features like extracting local tar archives and downloading remote URLs (though `COPY` is preferred for standard files).
* **What does `-p 8080:80` mean?**
  It maps port 8080 on the host machine to port 80 inside the container, forwarding external traffic to the application.
* **How do you check how much disk space Docker is using?**
  Using `docker system df`.
