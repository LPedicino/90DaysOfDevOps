# Day 39: What is CI/CD? Concepts & Anatomy

## 1. The Problem of Manual Deployments
* **What can go wrong?** 
  Human error during manual execution, conflicting changes overwritten when multiple developers push simultaneously, forgotten configuration updates, downtime during deployments, and the lack of a standardized, repeatable process.
* **What does "it works on my machine" mean and why is it a real problem?** 
  It refers to code functioning correctly in a developer's local environment due to hidden local dependencies, matching OS libraries, or cached states, but failing in production because the target environment lacks those exact conditions.
* **How many times a day can a team safely deploy manually?** 
  At most once or twice, and usually with scheduled maintenance windows, because manual deployments are slow, risky, and mentally exhausting.

---

## 2. CI vs CD Definitions & Real-World Examples
* **Continuous Integration (CI):** 
  Developers frequently merge code changes into a central repository (multiple times a day). Automated builds and tests run instantly to detect integration bugs early.
  * *Real-world example:* A developer pushes a bug fix branch to GitHub; an automated runner instantly checks out the code, installs dependencies, and runs unit tests.
* **Continuous Delivery (CD):** 
  An extension of CI where code changes are automatically built, tested, and prepared for a release, but deployed to production via a manual approval click.
  * *Real-world example:* After passing all tests, a staging environment updates automatically, and a release manager clicks a "Deploy to Production" button.
* **Continuous Deployment (CD):** 
  The logical next step of Delivery: every change that passes all stages of the production pipeline is released automatically to production without human intervention.
  * *Real-world example:* A microservice bug fix passes automated integration and security tests, and is immediately rolled out to live users via automated blue-green deployment.

---

## 3. Pipeline Anatomy
* **Trigger:** The event or webhook that kicks off the pipeline (e.g., a `git push` or pull request).
* **Stage:** A logical grouping of sequential or parallel phases in a workflow (e.g., Build, Test, Deploy).
* **Job:** A specific execution unit inside a stage that runs on a single runner/machine.
* **Step:** An individual command or script action executed sequentially inside a job.
* **Runner:** The physical or virtual machine that executes the jobs defined in the pipeline.
* **Artifact:** Files or compiled packages produced by a job that are passed to subsequent stages or saved for download.

---

## 4. Pipeline Diagram Description
```text
[ Developer Push to GitHub ]
             │
             ▼
     ┌───────────────┐
     │    TRIGGER    │ (Webhook on main branch)
     └───────┬───────┘
             │
             ▼
     ┌───────────────┐
     │  STAGE: BUILD │ (Install deps & compile app)
     └───────┬───────┘
             │
             ▼
     ┌───────────────┐
     │  STAGE: TEST  │ (Run unit & integration tests)
     └───────┬───────┘
             │
             ▼
     ┌───────────────┐
     │ STAGE: DEPLOY │ (Push Docker image to Staging Server)
     └───────────────┘
```

## 5. Explore in the Wild (FastAPI Repository Workflow)
* **Target Repo:** `fastapi/fastapi` (`.github/workflows/verify-commits.yml`)
* **What triggers it?** Pull requests and pushes targeting specific branches.
* **How many jobs does it have?** Typically single or multi-job workflows split by validation scope (linting, commit message checks, and testing).
* **What does it do?** Enforces conventional commit standards, checks formatting, runs linters, and verifies that code changes comply with repository governance rules before code review.
