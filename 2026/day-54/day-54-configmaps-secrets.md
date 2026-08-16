# Day 54: ConfigMaps and Secrets in Kubernetes

## Overview
Practiced decoupling configuration and sensitive data from container images using ConfigMaps and Secrets, exploring both environment variables and volume mounts.

## Key Learnings
1. **ConfigMaps**: Used for non-confidential configuration data. Injected via environment variables (`envFrom`/`valueFrom`) and mounted as files/volumes.
2. **Secrets**: Used for sensitive data (passwords, tokens). Stored encoded in Base64 (not encrypted by default) and injected similarly to ConfigMaps.
3. **Hot-Reloading**: ConfigMaps and Secrets mounted as volumes automatically propagate updates to pods without requiring a restart, whereas environment variables require a pod restart.
