# Day 31: Dockerfile - Build Your Own Images

## Task 1: Your First Dockerfile
* **Base Image:** `ubuntu:latest`
* **Package Installed:** `curl` using `apt-get`
* **Default Command:** Prints `"Hello from my custom image!"` via `CMD`.

---

## Task 2: Core Dockerfile Instructions
* `FROM`: Defines the base image to start the build process.
* `RUN`: Executes commands during the image build phase (creating layers).
* `COPY`: Copies files or directories from the host machine into the container image.
* `WORKDIR`: Sets the working directory for any subsequent `RUN`, `CMD`, `ENTRYPOINT`, or `COPY` instructions.
* `EXPOSE`: Documents which network ports the container listens on at runtime.
* `CMD`: Provides default arguments or commands for an executing container (can be easily overridden).

---

## Task 3: CMD vs ENTRYPOINT
* **`CMD`:** Defines default commands or parameters. If you pass arguments when running `docker run <image> <argument>`, it completely overrides the `CMD` instruction.
* **`ENTRYPOINT`:** Configures the container to run as an executable. Any arguments passed during `docker run` are appended as parameters to the entrypoint command rather than overwriting it.
* **When to use which?**
  * Use `CMD` when you want to provide a default command that can be easily changed by the user.
  * Use `ENTRYPOINT` when your container is meant to act as a specific executable/CLI tool where arguments should always be appended.

---

## Task 4: Build a Simple Web App Image
* Built a custom static website using `nginx:alpine` as the base image.
* Copied the local `index.html` file into Nginx's default web directory (`/usr/share/nginx/html/`).
* Successfully tested via port mapping (`-p 8085:80`).

---

## Task 5: .dockerignore
* Used to exclude files and folders (such as `node_modules`, `.git`, `*.md`, `.env`) from the build context.
* **Benefit:** Speeds up the build process and prevents sensitive or heavy unnecessary files from being sent to the Docker daemon.

---

## Task 6: Build Optimization & Layer Order
* **Why does layer order matter for build speed?** 
  * Docker caches each layer individually. If a layer doesn't change, Docker reuses it from the cache.
  * Instructions that change frequently (like copying source code) should be placed *at the bottom* of the Dockerfile, while instructions that change rarely (like installing dependencies or system packages) should go *at the top*. This maximizes cache utilization and speeds up subsequent builds.
