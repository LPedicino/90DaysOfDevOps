# Git Commands Reference


## Setup & Config
- `git config --global user.name "Name"`: Sets your global username for commits.
- `git config --global user.email "email"`: Sets your global email for commits.

## Basic Workflow
- `git init`: Initializes a new local Git repository.
- `git status`: Shows the state of the working directory and staging area.
- `git add <file>`: Stages changes to be committed.
- `git commit -m "message"`: Records staged changes permanently in the history.
- `git log`: Views the commit history.

## Viewing Changes
- `git diff`: Shows changes in the working directory that are not yet staged.
- `git log --oneline`: Displays the commit history in a compact, one-line format.
- `git log --oneline --graph --all`: Visualizes the entire commit history graph across all branches with compact hashes.

## Branching & Navigation
- `git branch`: Lists local branches.
- `git branch -a`: Lists all local and remote branches.
- `git branch <branch-name>`: Creates a new branch.
- `git switch <branch-name>`: Switches to a different branch.
- `git switch -c <branch-name>`: Creates and switches to a new branch in a single command.
- `git branch -d <branch-name>`: Safely deletes a merged branch.
- `git branch -D <branch-name>`: Force deletes an unmerged branch.

## Merging & Rebasing
- `git merge <branch>`: Merges the specified branch into the current branch (creates a merge commit if diverged).
- `git merge --squash <branch>`: Combines all commits from a feature branch into a single staged change before merging.
- `git rebase <target-branch>`: Re-plants current branch commits on top of the target branch for a linear history.
- `git cherry-pick <commit-hash>`: Applies a specific commit from another branch onto your current active branch.

## Stashing Work
- `git stash push -m "message"`: Temporarily shelves tracked changes.
- `git stash push -u -m "message"`: Temporarily shelves tracked and untracked (new) changes.
- `git stash pop`: Applies stashed changes to your working directory and removes them from the stash stack.
- `git stash apply`: Applies stashed changes but keeps them saved in the stash list.

## Remotes & Synchronization
- `git clone <url>`: Downloads a remote repository to your local machine.
- `git remote add upstream <url>`: Adds the original repository as an upstream reference for a fork.
- `git fetch origin`: Downloads objects and refs from a remote repository without merging them.
- `git pull origin <branch>`: Fetches and automatically merges changes from a remote branch into your current local branch.
- `git push -u origin <branch>`: Uploads local branch commits to the remote repository and sets up tracking.
- `git merge <branch> --allow-unrelated-histories`: Merges two branches that do not share a common ancestor history.
