# Day 26: GitHub CLI (`gh`) Practice

## Overview
Today's focus was learning how to interact with GitHub directly from the command line using the official GitHub CLI (`gh`), covering authentication, repository management, issue tracking, and pull request workflows.

## Key Concepts & Commands

### 1. Authentication

* Log in to GitHub via CLI:
  ```bash
  gh auth login
  ```

* Check authentication status:
  ```bash
  gh auth status
  ```

### 2. Repository Management

* Create a new repository:
  ```bash
  gh repo create <repo-name> --public --clone
  ```
* Delete a repository:
  ```bash
  gh repo delete <repo-name> --confirm
  ```

### 3. Issue Management

* Create an issue:
  ```bash
  gh issue create --repo <owner>/<repo> --title "Title" --body "Description" --label "bug"
  ```
* List open issues:
  ```bash
  gh issue list --repo <owner>/<repo>
  ```
* View specific issue details:
  ```bash
  gh issue view <issue-number> --repo <owner>/<repo>
  ```
* Close an issue:
  ```bash
  gh issue close <issue-number> --repo <owner>/<repo>
  ```

### 4. Pull Request Workflow

* Create a Pull Request:
  ```bash
  gh pr create --repo <owner>/<repo> --title "Title" --body "Body" --base main --head <branch-name>
  ```
* Merge a Pull Request and delete the remote branch:
  ```bash
  gh pr merge <pr-number> --repo <owner>/<repo> --merge --delete-branch
  ```




