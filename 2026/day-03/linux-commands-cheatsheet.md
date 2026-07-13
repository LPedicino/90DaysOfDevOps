# Linux Commands Toolkit

## 1. Process & System Monitoring

* `top` / `htop`: Interactive real-time CPU/RAM monitoring.
* `ps aux`: List all active processes with detailed information.
* `kill -9 <PID>`: Forcefully terminate an unresponsive process.
* `nice`: Adjust the execution priority of a process.
* `uptime`: Display how long the system has been running and load average.
* `df -h`: Show disk space usage in a human-readable format.
* `free -m`: Display memory usage in MB.

## 2. File & Directory Management

* `ls -lah`: List files with detailed permissions and hidden files.
* `cd`: Change the current directory.
* `pwd`: Print the current working directory (absolute path).
* `grep -r "pattern" .`: Search for text within files recursively.
* `cat /var/log/syslog`: Display the full content of a log file.
* `tail -f /var/log/syslog`: Follow log file changes in real-time (essential for debugging).
* `chmod +x <file>`: Grant execution permissions to a file.
* `chown user:group <file>`: Change the owner and group of a file.

## 3. Networking Troubleshooting

* `ip addr`: Show network interfaces and their IP addresses.
* `ping <host>`: Verify basic connectivity to a destination.
* `curl -I <url>`: Verify HTTP headers and server status.
* `netstat -tulpn`: Show listening ports and open connections.
* `dig <domain>`: Query DNS to check records and name resolution.