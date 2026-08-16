# Day 55: Persistent Volumes (PV) and Persistent Volume Claims (PVC)

## Overview
Practiced solving the ephemeral nature of container storage in Kubernetes by utilizing Persistent Volumes (PV) and Persistent Volume Claims (PVC) for both static and dynamic provisioning.

## Key Learnings
1. **Ephemeral Storage (`emptyDir`)**: Data inside a container disappears when the Pod dies or is recreated.
2. **Persistent Volumes (PV)**: Cluster-wide storage resources provisioned statically by an administrator or dynamically via StorageClasses.
3. **Persistent Volume Claims (PVC)**: Namespaced requests for storage by a user/pod, matching capacity, access modes (`RWO`, `ROX`, `RWX`), and storage classes.
4. **Static vs. Dynamic Provisioning**: Static requires manual PV creation, whereas dynamic provisioning uses a StorageClass to automatically provision underlying storage upon PVC creation.
5. **Reclaim Policies**: `Retain` keeps the underlying data and PV when the claim is deleted (leaving it in `Released`), while `Delete` automatically removes the storage asset.
