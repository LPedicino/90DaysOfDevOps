# Capstone Project - Day 60: Kubernetes Production-Ready Stack (WordPress & MariaDB)

## Overview
Successfully designed, deployed, and validated a multi-tier web application stack on a Kubernetes cluster as part of the DevOps Capstone Project. The architecture ensures high availability, data persistence, automated recovery, and external access.

## Architecture Components
- **Namespace (`capstone`):** Dedicated environment isolating application resources.
- **Database Tier (`StatefulSet`):** MariaDB (`mariadb:latest`) backed by a Persistent Volume Claim (`PVC`) ensuring data durability across pod rescheduling.
- **Application Tier (`Deployment`):** WordPress instances managed via a ReplicaSet with configured resource requests, limits, and HTTP liveness/readiness probes (`/wp-login.php`).
- **Configuration Management:** Sensitive credentials securely injected via Kubernetes `Secrets`, and non-sensitive configurations handled via `ConfigMaps`.
- **Scaling & Exposure:** Configured via `HorizontalPodAutoscaler` (HPA) and exposed externally using a `NodePort` service (`30085`).

## Validation & Testing
1. **Pod Health:** All components (`mysql-0` and WordPress pods) successfully reached `1/1 Running` status with zero restart loops after stabilizing environment variables and connection strings.
2. **Persistence:** Verified that the MySQL `PVC` (`1Gi`) successfully bound to the underlying persistent volume (`PV`).
3. **Self-Healing:** Tested cluster resilience by manually terminating a WordPress pod (`kubectl delete pod`), observing the ReplicaSet immediately provision a healthy replacement pod.
