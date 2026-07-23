# Day 24: Advanced Git: Merge, Rebase, Stash & Cherry Pick

## Task 1: Git Merge
- **What is a fast-forward merge?**
  It happens when the target branch (`main`) has not received any new commits since the feature branch was created. Git simply moves the pointer forward to the tip of the feature branch without creating a new merge commit.
- **When does Git create a merge commit instead?**
  When both branches have diverged (meaning `main` received new commits while you were working on the feature branch). Git needs to combine the two snapshots and creates a new commit with two parents.
- **What is a merge conflict?**
  It occurs when Git cannot automatically resolve differences because the same line in a file was modified differently in both branches. You must manually edit the file to choose which changes to keep.

## Task 2: Git Rebase
- **What does rebase actually do to your commits?**
  It takes the commits from your current branch and "re-plants" or replays them on top of another base commit (like the tip of `main`), rewriting the commit hashes in the process.
- **How is the history different from a merge?**
  Rebase creates a clean, linear history without merge commits, whereas merge preserves the exact non-linear history showing branching paths.
- **Why should you never rebase commits that have been pushed and shared with others?**
  Because rebase rewrites history (changes commit hashes). If other developers have already pulled those commits, it will break their local histories and cause severe synchronization conflicts.
- **When would you use rebase vs merge?**
  Use rebase for local feature branches to keep a clean linear history before merging. Use merge when working collaboratively on shared branches to preserve the true historical context.

## Task 3: Squash Commit vs Merge Commit
- **What does squash merging do?**
  It combines all individual commits of a feature branch into a single, comprehensive commit when merging into `main`.
- **When would you use squash merge vs regular merge?**
  Use squash merge to keep the main branch history clean of messy WIP, typo, or incremental commits. Use regular merge when preserving the detailed chronological development of a feature is important.
- **What is the trade-off of squashing?**
  You lose the granular, step-by-step historical context of how the feature was built because all changes are condensed into one single commit.

## Task 4: Git Stash
- **What is the difference between `git stash pop` and `git stash apply`?**
  Both apply the stashed changes to your working directory, but `git stash pop` applies them *and* deletes the stash from the stack, while `git stash apply` applies them but keeps the stash saved in the list.
- **When would you use stash in a real-world workflow?**
  When you are in the middle of writing code on a branch, but suddenly need to switch to another branch (e.g., to fix an urgent bug) without committing unfinished work.

## Task 5: Cherry Picking
- **What does cherry-pick do?**
  It takes a specific commit from any branch and applies its changes directly onto your current active branch as a new commit.
- **When would you use cherry-pick in a real project?**
  When you need to backport a specific bug fix from a development branch into a production release branch without merging all the other unrelated changes.
- **What can go wrong with cherry-picking?**
  It can cause conflicts if the target branch lacks the underlying context or code structure required by that specific commit.
