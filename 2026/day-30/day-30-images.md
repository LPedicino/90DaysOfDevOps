# Day 30: Docker Images & Container Lifecycle

## Task 1: Docker Images & Comparison (Ubuntu vs. Alpine)
* **Images Pulled:** `nginx`, `ubuntu`, `alpine`.
* **Size Comparison:** 
  * `alpine` es extremadamente liviana porque utiliza una base mínima con la biblioteca `musl libc` y herramientas de BusyBox, eliminando cualquier paquete innecesario.
  * `ubuntu` incluye un sistema de archivos raíz de distribución completo con sus utilidades y librerías predeterminadas, lo que la hace significativamente más pesada.
* **Image Inspection:** Usando `docker image inspect <image>` se puede ver en detalle la metadata, variables de entorno por defecto, arquitectura, puntos de montaje y el historial de comandos.

---

## Task 2: Image Layers
* **What are layers?** Docker images are built in a stack of read-only, incremental file system changes (layers). Each instruction in a `Dockerfile` (like `RUN`, `COPY`, `ADD`) creates a new layer on top of the previous one.
* **Why does Docker use them?** 
  * **Efficiency & Caching:** If a layer hasn't changed, Docker reuses it from the local cache during builds or pulls, saving bandwidth and storage.
  * **Sharing:** Multiple containers can share the same underlying read-only image layers simultaneously.

---

## Task 3 & Task 4: Container Lifecycle & Practical Execution
* Practiced the full lifecycle of a container using `docker create`, `start`, `pause`, `unpause`, `stop`, `restart`, `kill`, and `rm`.
* Inspected logs with `docker logs` and verified container behavior on the Proliant server.
* Executed interactive shell commands inside a container using `docker exec -it <container> bash`.

---

## Task 5: Cleanup
* Stopped all running containers and cleared stopped ones using `docker container prune -f` and `docker system prune -f`.
