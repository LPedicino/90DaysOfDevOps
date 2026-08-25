## Day 59 – Helm — Kubernetes Package Manager

## 1. Overview
Today's objective was to master **Helm**, the package manager for Kubernetes. We installed Helm, managed repositories, deployed charts from Bitnami, customized configurations using parameters and custom values files, performed upgrades and rollbacks, and built a custom chart from scratch.

---

## 2. Core Concepts
* **Chart:** A collection of files that describe a related set of Kubernetes resources (templates + default values).
* **Release:** An instance of a chart running in a Kubernetes cluster. A single chart can be installed multiple times, each creating a new release.
* **Repository:** The place where charts can be collected and shared.

---

## 3. Custom Values Configuration (`custom-values.yaml`)
To override default parameters cleanly without inline flags, a dedicated values file was used:
```yaml
replicaCount: 2
service:
  type: NodePort
  ports:
    http: 80
resources:
  limits:
    cpu: 200m
    memory: 256Mi
  requests:
    cpu: 100m
    memory: 128Mi
```
### 4. Upgrades, History, and Rollbacks
Helm tracks every modification as a new revision. If an upgrade introduces a bug or misconfiguration, rolling back to a stable previous revision is trivial using `helm rollback <release> <revision>`.

### 5. Creating a Custom Chart (`my-app`)
Using `helm create my-app`, we inspected Go template directives like `{{ .Values.replicaCount }}` and `{{ .Chart.Name }}` which dynamically inject values into Kubernetes manifests at render time.
