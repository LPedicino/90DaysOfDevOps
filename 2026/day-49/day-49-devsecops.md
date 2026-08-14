# Day 49 – DevSecOps: Add Security to Your CI/CD Pipeline

## What is DevSecOps?
DevSecOps means integrating security practices directly into the CI/CD pipeline rather than treating security as an afterthought. By automating checks like vulnerability scanning and dependency reviews during pull requests and builds, potential security issues are caught and fixed early before reaching production.

## Security Controls Implemented
1. **Trivy Image Scan:** Scans the built Docker image for CRITICAL and HIGH vulnerabilities, failing the pipeline if any are found.
2. **Dependency Review:** Inspects new dependencies introduced in pull requests for known CVEs.
3. **GitHub Secret Scanning & Push Protection:** Automatically detects and blocks accidentally leaked credentials or secrets.
4. **Least Privilege Permissions:** Restricted workflow permissions using explicit `permissions:` blocks.

## Pipeline Security Diagram

PR opened
→ build & test
→ dependency vulnerability check     ← (Day 49)
→ PR checks pass or fail

Merge to main
→ build & test
→ Docker build
→ Trivy image scan (fail on CRITICAL) ← (Day 49)
→ Docker push (only if scan passes)
→ deploy

Always active
→ GitHub secret scanning              ← (Day 49)
→ push protection for secrets         ← (Day 49)

## Pipeline Security Scan Output

