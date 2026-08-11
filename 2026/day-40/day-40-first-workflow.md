# Day 40: Your First GitHub Actions Workflow

## 1. Workflow YAML (`.github/workflows/hello.yml`)
```yaml
name: Hello World Pipeline

on: [push]

jobs:
  greet:
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository code
        uses: actions/checkout@v4

      - name: Print Hello Message
        run: echo "Hello from GitHub Actions!"

      - name: Print current date and time
        run: date

      - name: Print triggering branch name
        run: echo "Branch triggered: ${{ github.ref_name }}"

      - name: List files in the repository
        run: ls -la

      - name: Print runner operating system
        run: uname -a
```
## 2. Anatomy Key Breakdown
* **`on:`** Defines the event triggers that automatically kick off the workflow (e.g., every `push` or `pull_request`).
* **`jobs:`** Groups the independent execution units that make up the workflow.
* **`runs-on:`** Specifies the type of virtual machine runner (e.g., `ubuntu-latest`) where the job will execute.
* **`steps:`** A sequential list of individual tasks/actions executed as part of a job.
* **`uses:`** Pulls and runs an external pre-built community action (like `actions/checkout@v4`).
* **`run:`** Executes raw shell commands directly on the runner's terminal environment.
* **`name: (on a step)`** Provides a custom, human-readable label displayed in the GitHub Actions console UI.

## 3. Observations on Failures & Debugging
* **What does a failed pipeline look like?** 
  GitHub marks the run with a bright red cross (`❌`) instead of a green checkmark. When clicking into the workflow details, the specific step that threw a non-zero exit code highlights in red, halting any subsequent steps in that job.
* **How do you read the error?** 
  You open the failed job, expand the failing step's log output, and trace backward from the error message or exit code (e.g., `exit 1`) to pinpoint the exact command or syntax failure.
