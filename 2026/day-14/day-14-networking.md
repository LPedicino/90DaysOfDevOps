# Day 14 – Networking Fundamentals & Hands-on Checks

## Quick Concepts

* **OSI layers vs TCP/IP stack:**
  * OSI is a theoretical 7-layer model (Physical, Data Link, Network, Transport, Session, Presentation, Application) used for conceptualizing network communication.
  * TCP/IP is a pragmatic 4-layer model (Link, Internet, Transport, Application) that actually powers the modern internet.
* **Protocol Placement:**
  * **IP** sits at the Internet/Network layer.
  * **TCP/UDP** sit at the Transport layer.
  * **HTTP/HTTPS & DNS** sit at the Application layer.
* **Real Example:** `curl https://example.com` triggers the Application layer (HTTP/HTTPS) running over the Transport layer (TCP) over the Internet layer (IP) via the Link layer.

---

## Hands-on Checklist

* **Identity (`ip addr show`):**
  * *Observation:* `inet 192.168.1.8/24 brd 192.168.1.255 scope global enp3s0`
* **Reachability (`ping google.com`):**
  * *Observation:* `6 packets transmitted, 6 received, 0% packet loss, time 5006ms` with an average RTT of ~119.042 ms.
* **Path (`traceroute google.com`):**
  * *Observation:* Reached destination `2800:3f0:4002:817::200e` in 7 hops via IPv6.
* **Ports (`ss -tulpn`):**
  * *Observation:* `tcp LISTEN 0 128 0.0.0.0:2222 0.0.0.0:*` (SSH service listening on port 2222).
* **Name resolution (`dig google.com`):**
  * *Observation:* Resolved to `142.251.129.174` via server `100.100.100.100#53`.
* **HTTP check (`curl -I https://google.com`):**
  * *Observation:* `HTTP/2 301` (Moved Permanently redirect to www.google.com).
* **Connections snapshot (`ss -s` or fallback check):**
  * *Observation:* `netstat` command was not found, but checked via `ss` output showing active listening sockets for SSH and Tailscale.

---

## Mini Task: Port Probe & Interpret

1. **Listening port identified:** SSH service listening on port `2222`.
2. **Probe command & result:** `nc -zv localhost 2222` -> `localhost [127.0.0.1] 2222 (?) open`.
3. **Status & Next step:** Reachable. If unreachable, the next check would be verifying the service status (`systemctl status ssh`) or checking local firewall rules.

---

## Reflection

* **Fastest signal command:** `ping` or `curl` give the fastest instant signal to check if a host is alive or an application layer endpoint is responding.
* **Layers to inspect on failure:** 
  * If DNS fails, inspect the Application/Network layers (check name servers).
  * If HTTP 500 shows up, inspect the Application layer (server-side application logs, backend health).
* **Two follow-up incident checks:** 
  1. Inspect application logs (`journalctl` or container logs).
  2. Check resource utilization (`htop` or `df -h`) to rule out CPU/disk exhaustion.