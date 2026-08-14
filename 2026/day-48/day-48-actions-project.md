# Day 48 – GitHub Actions Project: End-to-End CI/CD Pipeline

## Pipeline Architecture
- **PR Opened / Synchronized:** Triggers `pr-pipeline.yml` $\rightarrow$ Calls reusable build-test workflow $\rightarrow$ Runs checks $\rightarrow$ Posts PR comment. (No Docker build/push).
- **Push to Main:** Triggers `main-pipeline.yml` $\rightarrow$ Calls reusable build-test workflow $\rightarrow$ Calls reusable Docker workflow (builds & pushes to Docker Hub) $\rightarrow$ Deploys to `production` environment with manual approval / controls.
- **Scheduled (Every 12h) / Manual:** Triggers `health-check.yml` $\rightarrow$ Pulls latest image $\rightarrow$ Runs container locally $\rightarrow$ Checks endpoint via curl $\rightarrow$ Generates report in `$GITHUB_STEP_SUMMARY`.

## Workflow Files
All workflow configurations are implemented in `.github/workflows/`:
1. `reusable-build-test.yml`
2. `reusable-docker.yml`
3. `pr-pipeline.yml`
4. `main-pipeline.yml`
5. `health-check.yml`

## Docker Hub Image Link
- [Docker Hub - leapedicino](https://hub.docker.com/u/leapedicino)

## What to Improve Next
- Implement automated vulnerability scanning (DevSecOps) using Trivy on built images.
- Add notification alerts (e.g., Slack or Discord webhooks) on pipeline failures.
- Introduce multi-environment deployments (staging followed by production).
