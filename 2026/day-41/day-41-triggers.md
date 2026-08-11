# Day 41: Triggers & Matrix Builds

## 1. Cron Expression Answer (Task 2)
* **What is the cron expression for every Monday at 9 AM?**
  ```cron
  0 9 * * 1
  ```
(Minute 0, Hour 9, any day of the month, any month, day of the week 1 which corresponds to Monday).

## 2. Matrix Strategies & Fail-Fast (Task 5)
### What does `fail-fast: true` (the default) do vs `false`?
* **`fail-fast: true`**: If a single job within the matrix fails, GitHub Actions will automatically cancel all other running or pending matrix jobs.
* **`fail-fast: false`**: If a job fails, the remaining matrix jobs continue running until completion, allowing you to see the full results of all combinations.

## 3. Workflow Files Implemented
* `.github/workflows/pr-check.yml`
* `.github/workflows/manual.yml`
* `.github/workflows/matrix.yml`
