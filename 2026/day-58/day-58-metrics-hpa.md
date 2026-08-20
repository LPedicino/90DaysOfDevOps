## Day 58 – Metrics Server and Horizontal Pod Autoscaler (HPA)

## 1. Overview
Today's objective was to install the **Metrics Server** to capture real-time resource telemetry, and implement both imperative and declarative **Horizontal Pod Autoscalers (HPA)** to dynamically scale deployments based on CPU utilization.

---

## 2. Metrics Server & `kubectl top`
* **What it is:** A lightweight, in-memory cluster-wide metrics aggregator that polls Kubelets via the Summary API every 15 seconds.
* **Why HPA needs it:** The HPA controller relies on the Metrics API to fetch current utilization metrics (e.g., CPU/memory usage percentages) to compute the required replica adjustments.
* **Command:** `kubectl top nodes` and `kubectl top pods -A` display real-time resource usage, distinct from configured requests and limits.

---

## 3. How HPA Calculates Desired Replicas
The HPA controller uses the following formula to determine scaling actions:
$$\text{desiredReplicas} = \lceil \text{currentReplicas} \times \left( \frac{\text{currentMetricValue}}{\text{desiredMetricValue}} \right) \rceil$$

---

## 4. Autoscaling/v1 vs. Autoscaling/v2
* **autoscaling/v1:** Supports **CPU utilization metrics only**. Simple syntax, ideal for basic scaling needs.
* **autoscaling/v2:** Supports **multiple metrics** (CPU, memory, and custom/external metrics) and introduces advanced **behavior configuration** (custom scale-up and scale-down stabilization windows and rate limits).

---

## 5. Verification & Observations
* Under heavy load (generated using a Busybox pod hammering the PHP-Apache service), the HPA successfully scaled the application up from **1 to 10 replicas** as CPU utilization spiked past the 50% threshold.
* Scale-up occurs rapidly when thresholds are exceeded, whereas scale-down incorporates a stabilization window to prevent rapid flapping.

---

## 6. Clean Up
All test deployments, services, pods, and autoscalers were cleaned up, leaving only the Metrics Server active in the cluster.
