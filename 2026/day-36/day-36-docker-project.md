# Day 36: Docker Project - Full Application End-to-End

## 1. Project Overview & Choice
* **App Chosen:** Node.js Express backend integrated with a PostgreSQL database.
* **Reasoning:** Simulates a production-grade multi-container architecture with persistent storage, environment separation, and automated health checks.

## 2. Dockerfile & Optimization
* **Multi-Stage Build:** Separated the build/dependency phase from the lightweight production runtime image.
* **Security:** Created and executed the app under a non-root user (`appuser`) to mitigate container breakout risks.
* **Clean Context:** Used `.dockerignore` to exclude `node_modules` and local artifacts.

## 3. Docker Compose Stack
* Integrated web and database services using a custom bridge network and an `.env` configuration file.
* Configured persistent volume storage mapped to `/var/lib/postgresql`.
* Implemented database `healthcheck` paired with `condition: service_healthy` to eliminate startup race conditions.

## 4. Docker Hub Repository
* **Docker Hub Link:** [https://hub.docker.com/r/leapedicino/day36-full-app](https://hub.docker.com/r/leapedicino/day36-full-app)

## 5. Challenges & Solutions
* **Postgres 18+ Volume Mapping:** Resolved volume path initialization errors by mounting directly to `/var/lib/postgresql`.
* **Database Startup Race Condition:** Ensured reliable service orchestration using healthcheck dependency constraints.
