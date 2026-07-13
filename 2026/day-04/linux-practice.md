# Linux Practice Log

## 1. Process Checks
* Output of `ps aux | head -n 10`:
```
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0   4328  3812 pts/0    Ss   20:27   0:00 bash
root         371  0.0  0.0   6400  3868 pts/0    R+   20:35   0:00 ps aux
root         372  0.0  0.0   2596  1704 pts/0    S+   20:35   0:00 head -n 10
```
## 2. Service Checks
* Note: In a Docker container, `systemctl` does not have access to the system bus.
* Alternative command used: `ps -ef`
* Result:
```
UID          PID    PPID  C STIME TTY          TIME CMD
root           1       0  0 20:27 pts/0    00:00:00 bash
root         373       1  0 20:35 pts/0    00:00:00 ps -ef
```
## 3. Log Checks
* Since `journalctl` requires an active systemd, we inspect flat log files:
* Command: `ls -la /var/log`
* Result:
```
total 40
drwxr-xr-x  1 root root             4096 Jul 13 20:28 .
drwxr-xr-x  1 root root             4096 Jun 23 00:00 ..
lrwxrwxrwx  1 root root               39 Jul 13 20:28 README -> ../../usr/share/doc/systemd/README.logs
drwxr-xr-x  1 root root             4096 Jul 13 20:28 apt
-rw-rw----  1 root utmp                0 Jun 23 00:00 btmp
-rw-r--r--  1 root root            11393 Jul 13 20:28 dpkg.log
drwxr-sr-x+ 2 root systemd-journal  4096 Jul 13 20:28 journal
-rw-rw-r--  1 root utmp                0 Jun 23 00:00 lastlog
drwx------  2 root root             4096 Jul 13 20:28 private
-rw-rw-r--  1 root utmp                0 Jun 23 00:00 wtmp
```
## 4. Troubleshooting flow
* I verified system processes and identified that while standard systemd services are restricted in this container, I can successfully monitor running processes using `ps` and inspect log file directories.