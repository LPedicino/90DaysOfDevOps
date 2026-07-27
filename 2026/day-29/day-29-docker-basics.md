# Day 29: Introduction to Docker

## Task 1: What is Docker?

### 1. What is a container and why do we need them?
* **Container:** A lightweight, standalone, and executable software package that includes everything needed to run an application: code, runtime, system tools, libraries, and settings.
* **Why we need them:** They solve the classic *"it works on my machine"* problem. Containers isolate applications from their environment, ensuring they run uniformly and reliably regardless of whether they are deployed on a local laptop, a staging server, or the cloud.

### 2. Containers vs. Virtual Machines (VMs)
* **Virtual Machines:** Run on a physical server using a **Hypervisor** (like VMware or KVM). Each VM runs a full guest Operating System, making them heavy, resource-intensive, and slower to boot.
* **Containers:** Share the host machine's **Operating System kernel** and isolate application processes. They do not need a full OS for each instance, making them incredibly lightweight, blazing fast to start, and much more efficient with resources.

### 3. Docker Architecture
* **Docker Client (`docker`):** The primary user interface that accepts commands from the user (e.g., `docker run`) and communicates with the Docker daemon.
* **Docker Daemon (`dockerd`):** The background service running on the host machine that manages Docker containers, images, networks, and storage volumes.
* **Docker Images:** Read-only templates or blueprints containing instructions for building a container.
* **Containers:** Runnable instances of Docker images.
* **Registry:** A storage and distribution system for Docker images (e.g., Docker Hub).

### 4. Architecture in My Own Words
Think of the **Docker Client** as the remote control, and the **Docker Daemon** as the engine behind the wall doing the heavy lifting. When you ask for an app, the Daemon checks your local storage for the blueprint (**Image**). If it isn't there, it downloads it from the store (**Registry**). Once it has the blueprint, it builds a live, isolated running environment (**Container**) for your application.

## Task 2: Install Docker & Verification

* Verified Docker installation on the Proliant server:
  ```bash
  docker -v
  # Output: Docker version 26.1.5+dfsg1, build a72d7cd
  ```
* Ran the `hello-world` verification container to test the Docker daemon and client communication.

## Task 3 & Task 4: Running and Managing Real Containers

### 1. Nginx Web Server (Detached Mode & Port Mapping)
Ran Nginx in the background, mapping host port `8080` to container port `80`:

  ```bash
  docker run -d -p 8080:80 --name mi-web nginx
  ```

* Verified functionality internally via `curl`:

  ```bash
  curl localhost:8080
  ```
Successfully returned the "Welcome to nginx!" HTML response.

## 2. Interactive Ubuntu Container
Pulled and ran an interactive Ubuntu shell session:

  ```bash
  docker run -it ubuntu bash
  ```
Explored the minimal environment from inside the container (root@6eccf743567:/#) before exiting.
