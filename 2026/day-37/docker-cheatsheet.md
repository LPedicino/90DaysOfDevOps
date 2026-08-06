# Docker Cheat Sheet

## Container Commands
* `docker run -d --name <name> -p <host>:<container> <image>` - Run container in background with port mapping.
* `docker run -it <image> sh` - Run container interactively with a shell.
* `docker ps -a` - List all containers (running and stopped).
* `docker stop <container>` - Stop a running container gracefully.
* `docker rm <container>` - Remove a stopped container.
* `docker exec -it <container> sh` - Open an interactive shell inside a running container.
* `docker logs -f <container>` - Stream container logs in real-time.

## Image Commands
* `docker build -t <image>:<tag> .` - Build a custom image from a Dockerfile.
* `docker pull <image>` - Download an image from Docker Hub.
* `docker push <username>/<image>:<tag>` - Push an image to Docker Hub.
* `docker tag <source> <target>` - Tag an existing local image.
* `docker images` - List local images.
* `docker rmi <image>` - Remove a local image.

## Volume Commands
* `docker volume create <name>` - Create a named volume.
* `docker volume ls` - List all volumes.
* `docker volume inspect <name>` - View volume details and mount path.
* `docker volume rm <name>` - Remove an unused volume.

## Network Commands
* `docker network create --driver bridge <name>` - Create a custom bridge network.
* `docker network ls` - List available networks.
* `docker network inspect <name>` - Inspect connected containers in a network.
* `docker network connect <network> <container>` - Connect a running container to a network.

## Compose Commands
* `docker compose up -d --build` - Build and start services in detached mode.
* `docker compose down -v` - Stop and remove containers, networks, and persistent volumes.
* `docker compose ps` - List status of compose services.
* `docker compose logs -f` - View aggregated logs of the stack.

## Cleanup Commands
* `docker system prune -a --volumes` - Remove all unused containers, networks, images, and volumes.
* `docker system df` - Display disk space usage by Docker.

## Dockerfile Instructions
* `FROM <image>` - Specifies the base image.
* `WORKDIR <path>` - Sets the working directory inside the container.
* `COPY <src> <dest>` - Copies local files into the image.
* `RUN <command>` - Executes commands during the build phase.
* `ENV <key>=<value>` - Sets environment variables.
* `EXPOSE <port>` - Documents the network port the container listens on.
* `USER <user>` - Sets the user context for subsequent instructions.
* `CMD ["exec", "param"]` - Default command executed when starting a container.
* `ENTRYPOINT ["executable"]` - Configures a container that will run as an executable.
