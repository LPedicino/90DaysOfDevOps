Linux Architecture & systemd Fundamentals

1. Core Components

Kernel: The core of the OS. It manages CPU, memory, and hardware communication. It is the bridge between software and hardware.

User Space: Where applications and user processes run. It is isolated from the kernel for security.

init / systemd: The first process (PID 1) started by the kernel. It initializes the rest of the system and manages services.

2. Process Management

Processes are instances of programs. They transition through these states:

Running (R): Currently executing on the CPU or in the run queue.

Sleeping (S): Waiting for an event (e.g., I/O or a signal).

Zombie (Z): The process has finished, but its parent hasn't read its exit status yet. It takes up a PID but uses no resources.

Stopped (T): The process has been paused (usually by a signal).

3. Why systemd matters

systemd is the standard init system for most modern Linux distributions (like Debian). It allows for:

Parallelization: Starting services at the same time to speed up boot.

Dependency Management: Ensuring Service A starts only after Service B is ready.

Logging: Centralized logs via journalctl.

4. Essential Daily Commands

* `top` / `htop`: Real-time monitoring of CPU/memory usage and process status.
* `ps aux`: Snapshot of all running processes.
* `systemctl status <service>`: Check the health and logs of a service.
* `journalctl -u <service> -f`: Follow logs for a specific service in real-time.
* `kill -9 <PID>`: Forcefully terminate an unresponsive process.