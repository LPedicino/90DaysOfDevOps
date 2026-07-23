# Day 23: Git Branching & Working with GitHub

## Task 1: Understanding Branches

1. **What is a branch in Git?**
   A branch is a lightweight, movable pointer to a specific commit in Git. It represents an independent line of development, allowing you to diverge from the main codebase to work on features or fixes.

2. **Why do we use branches instead of committing everything to `main`?**
   We use branches to isolate work, prevent unstable or unfinished code from breaking the production-ready `main` branch, and enable multiple people or features to be developed simultaneously without interfering with each other.

3. **What is `HEAD` in Git?**
   `HEAD` is a pointer that references the current commit you are working on, which is usually the tip of the currently checked-out branch.

4. **What happens to your files when you switch branches?**
   Git updates the files in your working directory to match the snapshot of the commit associated with the target branch you are switching to.

## Task 2: Branching Commands — Hands-On

1. **How to list all branches in your repo:**
   `git branch` (lists local branches) or `git branch -a` (lists all local and remote branches).

2. **How to create and switch to a new branch:**
   - Create: `git branch <branch-name>`
   - Switch: `git switch <branch-name>` (or the older `git checkout <branch-name>`)
   - Create and switch in a single command: `git switch -c <branch-name>`

3. **How is `git switch` different from `git checkout`?**
   `git switch` is a modern, dedicated command introduced to handle branching operations cleanly (switching branches). `git checkout` is an older, multi-purpose command that was used for switching branches, restoring files, and detaching HEAD, which often caused confusion for beginners.

4. **How to delete a branch:**
   - Safely delete a merged branch: `git branch -d <branch-name>`
   - Force delete an unmerged branch: `git branch -D <branch-name>`

## Task 3: Push to GitHub

- **What is the difference between `origin` and `upstream`?**
  `origin` is the default alias name for your own remote repository (usually your fork on GitHub) from which you cloned. `upstream` is the convention used to refer to the original, main repository from which you forked, allowing you to pull future updates made by the original project owners.

## Task 4 & Task 5: Pull, Fetch, and Clone vs Fork

- **What is the difference between `git fetch` and `git pull`?**
  `git fetch` downloads the latest changes and metadata from the remote repository to your local copy without modifying or merging your working files. `git pull` does both: it fetches the changes *and* automatically merges them into your current working branch.

- **What is the difference between clone and fork?**
  A **fork** is a server-side (GitHub) operation that creates a personal copy of someone else's repository under your own account. A **clone** is a local operation that downloads a repository from GitHub to your physical machine.

- **When would you clone vs fork?**
  You **fork** when you want to contribute to a repository you don't own (so you can push changes to your own copy and open a Pull Request). You **clone** when you want to download a repository (whether it's your own, your fork, or a team repo) onto your computer to start working on it.

- **After forking, how do you keep your fork in sync with the original repo?**
  You add the original repository as a remote named `upstream` (`git remote add upstream <url>`), fetch its changes (`git fetch upstream`), and then merge the main branch of upstream into your local main branch (`git merge upstream/main`) before pushing it to your fork (`origin`).
