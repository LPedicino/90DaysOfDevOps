# Day 35: Multi-Stage Builds & Docker Hub

## Task 1: The Problem with Large Images
* Built a single-stage Dockerfile for a Node.js application.
* **Initial Size:** Recorded the size of the bloated image (including build dependencies and source code).

---

## Task 2: Multi-Stage Build Optimization
* Implemented a multi-stage `Dockerfile`:
  * **Stage 1 (Builder):** Installed dependencies and prepared the app.
  * **Stage 2 (Production):** Copied only the runtime production artifacts into a minimal base image.
* **Optimized Size:** Compared sizes and documented why multi-stage images are significantly smaller (excluding compilers, caches, and node_modules bloat).

---

## Task 3 & 4: Docker Hub Integration
* Logged in via terminal (`docker login`) and pushed the optimized custom image.
* **Repository Link:** `[https://hub.docker.com/r/leapedicino/day35-app]`

---

## Task 5: Image Security & Best Practices
* Swapped base images to minimal variants (alpine).
* Created a non-root system user to avoid running the container with root privileges.
* Used specific version tags instead of `latest`.
