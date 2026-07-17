# Day 12 – Revision & Consolidation (Days 01–11)

## Mini Self-Check
1) **Which 3 commands save you the most time right now, and why?**
   - `ls -l`: It is essential for verifying file status and permissions at a glance.
   - `grep`: Allows me to quickly filter information within files or command outputs.
   - `systemctl`: It is the most efficient way to manage services on the server.

2) **How do you check if a service is healthy? List the exact 2–3 commands you’d run first.**
   - `systemctl status <service>`: To check the current state (active/running).
   - `journalctl -u <service> -n 20`: To read the last 20 lines of logs and check for errors.

3) **How do you safely change ownership and permissions? Give one example command.**
   - First, adjust permissions with `chmod` and then set ownership with `chown`.
   - Example: `sudo chown tokyo:vault-team access-codes.txt` (changes both owner and group simultaneously).

4) **What will you focus on improving in the next 3 days?**
   - Increasing speed with Linux commands and deepening my knowledge in log management and service troubleshooting.

## Key Takeaways
- Security and access control (`chmod`/`chown`) are the foundation to prevent deployment errors.
- `sudo` is necessary for critical operations but must be used with caution.
- Constant documentation (like these .md files) helps retain the logic of what has been learned.