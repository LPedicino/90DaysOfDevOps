# Git Commands Reference

## Setup & Config
- **git config --global user.name "Name"**: Sets your global username for commits.
- **git config --global user.email "email"**: Sets your global email for commits.

## Basic Workflow
- **git init**: Initializes a new local Git repository.
- **git status**: Shows the state of the working directory and staging area.
- **git add <file>**: Stages changes to be committed.
- **git commit -m "message"**: Records staged changes permanently in the history.
- **git log**: Views the commit history.

## Viewing Changes
- **git diff**: Shows changes in the working directory that are not yet staged.
- **git log --oneline**: Displays the commit history in a compact, one-line format.

## Branching & Merging
- **git branch**: Lists, creates, or deletes branches.
- **git checkout <branch>** or **git switch <branch>**: Switches to a different branch.
- **git merge <branch>**: Merges the specified branch into the current branch.

## Multi-Environment Workflows (Proliant & Main PC)

* **`git fetch origin`**: Downloads objects and refs from another repository without merging them into your current working branch.
* **`git merge <branch> --allow-unrelated-histories`**: Merges two branches that do not share a common ancestor history. Used to connect and merge the independent history from our main PC with the new setup on the Proliant server.
