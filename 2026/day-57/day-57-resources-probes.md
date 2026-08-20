## Day 57 – Kubernetes Resource Requests, Limits, and Probes

## 1. Overview
Today's objective was to configure **Resource Requests and Limits** for smart scheduling and runtime enforcement, understand QoS classes, and implement **Liveness, Readiness, and Startup Probes** for automated application health management and self-healing.

---

## 2. Resource Requests vs. Limits & QoS Classes
* **Requests:** The minimum amount of CPU and memory guaranteed by Kubernetes. The scheduler uses requests to place pods onto nodes with sufficient capacity.
* **Limits:** The maximum limit allowed for a container. The runtime/kubelet enforces these limits.
* **QoS Classes:**
  * **Guaranteed:** When requests and limits are set and equal for all containers.
  * **Burstable:** When requests and limits differ (or only requests/limits are set).
  * **BestEffort:** When no requests or limits are set.

---

## 3. Exceeding Limits (OOMKilled & Pending States)
* **Memory Exceeded (OOMKilled):** When a container exceeds its memory limit (e.g., allocating 200M with a 100Mi limit), the Linux kernel terminates the container immediately with exit code **137** (`128 + SIGKILL`), resulting in an `OOMKilled` status.
* **Insufficient Resources (Pending):** When a Pod requests impossible resources (e.g., 100 CPUs and 128Gi RAM), the scheduler keeps the Pod in a `Pending` state, logging `Insufficient cpu` and `Insufficient memory` events.

---

## 4. Health Probes Mechanism
* **Liveness Probe:** Detects deadlocked or stuck containers. If it fails, Kubernetes **restarts** the container.
* **Readiness Probe:** Controls traffic routing. If it fails, Kubernetes **removes the Pod from Service endpoints** without restarting it.
* **Startup Probe:** Protects slow-starting applications. While running, it disables liveness and readiness probes until the application successfully boots up.

---

## 5. Clean Up
All test pods and services were successfully deleted from the cluster to free up resources.
