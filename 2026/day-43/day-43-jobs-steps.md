# Day 43: Jobs, Steps, Env Vars & Conditionals

## 1. What does `needs:` do?
`needs:` defines dependencies between jobs. By default, jobs run in parallel. Using `needs` forces a job to wait until the specified preceding job successfully completes before starting.

## 2. What do job `outputs:` do?
`outputs:` allow data generated inside a job (like a dynamic string, a build version, or a date) to be passed downstream to subsequent jobs that depend on it via `needs.<job-name>.outputs.<name>`.

---
## Key Workflow Snippets

### Multi-Job Chain (`needs`)
```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - run: echo "Building the app"
  test:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - run: echo "Running tests"
  deploy:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploying"
```

### Passing Outputs Between Jobs

```yaml
jobs:
  job1:
    runs-on: ubuntu-latest
    outputs:
      date: ${{ steps.date-step.outputs.todays_date }}
    steps:
      - id: date-step
        run: echo "todays_date=$(date)" >> $GITHUB_OUTPUT
  job2:
    needs: job1
    runs-on: ubuntu-latest
    steps:
      - run: echo "The date from job1 is ${{ needs.job1.outputs.date }}"
```
