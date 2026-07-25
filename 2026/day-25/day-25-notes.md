# Day 25: Git Reset vs Revert & Branching Strategies

## 1. Git Reset vs `--soft`, `--mixed`, and `--hard`

* **`--soft`**: Moves the `HEAD` pointer to the specified commit. It keeps your changes in the staging area (`Changes to be committed`), ready to be committed again.
* **`--mixed` (default)**: Moves the `HEAD` pointer and clears the staging area, but leaves your changes in your working directory (`Changes not staged for commit`).
* **`--hard`**: **Destructive.** Moves the `HEAD` pointer, clears the staging area, and completely discards all local changes in your working directory.

### Answers to Task 1 Questions:
* **Which one is destructive and why?** `--hard` is destructive because it deletes uncommitted work and removes commits from the current tracking line, risking permanent loss of code if not careful.
* **When would you use each one?** 
  * `--soft`: When you want to combine multiple local commits into a single one (squashing) before pushing.
  * `--mixed`: When you want to keep your code modifications but completely redo how they are grouped or staged.
  * `--hard`: When you want to completely wipe out experimental local changes and return your working directory to a clean, known previous state.
* **Should you ever use git reset on commits that are already pushed?** No, because it rewrites shared history, causing severe sync conflicts and broken histories for anyone else collaborating on the repository.

---

## 2. Git Revert

`git revert` creates a brand-new commit that applies the inverse (opposite) of the specified commit's changes, leaving the existing history completely intact.

### Answers to Task 2 Questions:
* **How is git revert different from git reset?** `reset` rewrites history by moving pointers backward, whereas `revert` moves history forward by adding a new commit that undoes previous changes.
* **Why is revert considered safer than reset for shared branches?** It preserves the full audit trail and doesn't rewrite shared history, preventing disruptions for other developers pulling from the same branch.
* **When would you use revert vs reset?** Use `revert` on public/shared branches (like `main` or `develop`) and `reset` for private, local work before pushing.

---

## 3. Reset vs Revert Summary

| Feature | Git Reset | Git Revert |
| :--- | :--- | :--- |
| **What it does** | Moves `HEAD` back and alters history | Adds a new commit to undo changes safely |
| **Safe for shared/pushed branches** | No | Yes |
| **When to use** | Local cleanup and unpushed commits | Fixing bugs or backing out changes on shared branches |

---

## 4. Branching Strategies

### 1. GitFlow
* **How it works:** Uses strict branching models with dedicated roles for `main`, `develop`, `feature/*`, `release/*`, and `hotfix/*`.
* **Flow:** `feature` branches branch off `develop` -> merge back into `develop` -> `release` branches prepare production -> merged into `main` and `develop`.
* **When/used:** Traditional software teams with scheduled release cycles.
* **Pros:** Highly structured for large teams and release management.
* **Cons:** Complex, heavy overhead, and slower for rapid CI/CD delivery.

### 2. GitHub Flow
* **How it works:** A lightweight, branch-based workflow built around a single permanent `main` branch.
* **Flow:** Create short-lived `feature/*` branches from `main` -> open a Pull Request for review -> merge directly into `main` and deploy.
* **When/used:** Web applications, SaaS products, and teams shipping continuously.
* **Pros:** Simple, fast, and great for continuous deployment.
* **Cons:** Can become chaotic if automated testing and code reviews aren't strictly enforced.

### 3. Trunk-Based Development
* **How it works:** Developers merge small, frequent updates directly into a single central branch (the trunk/main) often multiple times a day.
* **Flow:** Short-lived feature branches (lasting a few hours/days) -> rapid review -> merge to trunk.
* **When/used:** High-performing engineering teams and startups requiring extreme velocity.
* **Pros:** Eliminates merge hell, enables true continuous integration, and speeds up delivery.
* **Cons:** Requires rigorous automated testing and high team discipline.

### Answers to Strategy Questions:
* **Which strategy would you use for a startup shipping fast?** Trunk-Based Development or GitHub Flow.
* **Which strategy would you use for a large team with scheduled releases?** GitFlow.
* **Which one does your favorite open-source project use?** GitHub Flow (commonly utilized by modern open-source repositories via Pull Requests).
