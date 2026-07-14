# Linux File System Hierarchy & Scenario Practice

## Part 1: File System Hierarchy

| Directory | Purpose | Use when... |
| :--- | :--- | :--- |
| `/` | Root, starting point. | Navigating the full system. |
| `/home` | User home directories. | Managing personal user files. |
| `/root` | Root user's home. | Performing admin tasks. |
| `/etc` | Configuration files. | Editing service/system settings. |
| `/var/log` | Log files. | Troubleshooting errors. |
| `/tmp` | Temp files. | Testing scripts or temporary data. |
| `/bin` | Essential binaries. | Running basic system commands. |
| `/usr/bin` | User binaries. | Accessing installed user applications. |
| `/opt` | Optional packages. | Managing third-party software. |

*Ejecuté `ls -l /etc` y vi archivos como `hostname` y `passwd`.*

---

## Part 2: Scenario Practice

### Scenario 1: Service Not Starting ('myapp')

*   **Step 1:** `systemctl status myapp` (Identifies if it's active, dead, or failed).
*   **Step 2:** `journalctl -u myapp -n 50` (Reads recent error logs to find the root cause).
*   **Step 3:** `systemctl is-enabled myapp` (Checks if it's configured to start on boot).
*   **Step 4:** `systemctl restart myapp` (Attempts to force a clean start).

### Scenario 2: High CPU Usage

*   **Step 1:** `top` o `htop` (Shows live resource consumption).
*   **Step 2:** `ps aux --sort=-%cpu | head -10` (Lists top 10 processes by CPU usage).
*   **Step 3:** `kill -9 <PID>` (Terminates the runaway process if necessary).

### Scenario 3: Finding Service Logs ('docker')

*   **Step 1:** `systemctl status docker` (Confirms service state).
*   **Step 2:** `journalctl -u docker -n 50` (Filters system journal for docker logs).
*   **Step 3:** `journalctl -u docker -f` (Follows logs in real-time).

### Scenario 4: File Permissions ('backup.sh')

*   **Step 1:** `ls -l /home/user/backup.sh` (Checks current permissions).
*   **Step 2:** `chmod +x /home/user/backup.sh` (Grants execute permission).
*   **Step 3:** `ls -l /home/user/backup.sh` (Verifies the change).
*   **Step 4:** `./backup.sh` (Executes the script).