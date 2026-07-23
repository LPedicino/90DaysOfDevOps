# Day 19 – Shell Scripting Project: Log Rotation, Backup & Crontab

## Overview
In this project challenge, I built practical automation scripts for log rotation and server backups, combined them into a master maintenance script, and mapped out scheduling via Cron.

## Scripts Developed
1. **`log_rotate.sh`**: Compresses logs older than 7 days and purges archives older than 30 days.
2. **`backup.sh`**: Creates timestamped `.tar.gz` archives, verifies integrity, checks size, and cleans up backups older than 14 days.
3. **`maintenance.sh`**: Orchestrates both tasks and redirects all outputs with timestamps to `/var/log/maintenance.log`.

## Crontab Configuration
- **Maintenance (Daily at 1 AM)**: `0 1 * * * /home/lpedicino/2026/day-19/maintenance.sh`
- **Log Rotation (Daily at 2 AM)**: `0 2 * * * /home/lpedicino/2026/day-19/log_rotate.sh /var/log`
- **Server Backup (Sundays at 3 AM)**: `0 3 * * 0 /home/lpedicino/2026/day-19/backup.sh`

## Key Learnings
1. **Automation Safety**: Combining `set -euo pipefail` with argument validation ensures cron jobs fail loudly and safely rather than causing silent corruption.
2. **Archiving & Retention**: Using `find` with `-mtime` combined with `gzip` and `tar` provides a powerful native Linux lifecycle management workflow.
3. **Centralized Logging**: Redirecting output streams (`>> logfile 2>&1`) inside maintenance wrappers is essential for troubleshooting headless cron jobs.