# Day 11 – File Ownership Challenge

## Files & Directories Created
- `devops-file.txt`, `team-notes.txt`, `project-config.yaml`, `app-logs/`, `heist-project/`, `bank-heist/` (with internal files)

## Ownership Changes
| File/Dir | User | Group |
| :--- | :--- | :--- |
| `devops-file.txt` | `tokyo` | `lpedicino` |
| `team-notes.txt` | `lpedicino` | `heist-team` |
| `project-config.yaml` | `tokyo` | `heist-team` |
| `heist-project/` | `tokyo` | `planners` |
| `access-codes.txt` | `tokyo` | `vault-team` |
| `blueprints.pdf` | `berlin` | `tech-team` |
| `escape-plan.txt` | `nairobi` | `vault-team` |

## Commands Used
- `useradd`, `groupadd`
- `chown`, `chgrp`
- `ls -l`, `ls -lR`

## What I Learned
1. **Ownership vs Permissions**: Learned that while permissions (rwx) control *what* can be done, ownership (chown/chgrp) controls *who* owns the resource and which group access it belongs to.
2. **Recursive Management**: Understood that the `-R` flag in `chown` is essential for managing entire directory structures, ensuring consistency across all sub-files.
3. **Multi-User/Group Context**: Practiced how to delegate specific file access to different teams (vault vs. tech) using group-based ownership, a fundamental concept for DevOps and secure system administration.