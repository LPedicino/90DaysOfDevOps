# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Task 1: DNS – How Names Become IPs

1. **What happens when you type `google.com` in a browser:**
   The browser checks its local cache first, then the OS cache. If not found, it queries the configured DNS resolver (like a local router or public DNS). The resolver traverses the DNS hierarchy (Root -> TLD `.com` -> Authoritative nameserver for `google.com`) to retrieve the corresponding IP address, enabling the browser to establish a connection.

2. **DNS Record Types:**
   * `A`: Maps a domain name to an IPv4 address.
   * `AAAA`: Maps a domain name to an IPv6 address.
   * `CNAME`: Creates an alias from one domain name to another canonical domain.
   * `MX`: Directs emails to the correct mail servers for a domain.
   * `NS`: Delegates a DNS zone to a specific authoritative name server.

3. **`dig google.com` Output:**
   * **A Record:** `google.com. 149 IN A 142.251.129.174`
   * **TTL (Time to Live):** `149` seconds (cache expiration timer).

---

## Task 2: IP Addressing

1. **IPv4 Address Structure:**
   An IPv4 address is a 32-bit numerical address written as four decimal numbers separated by dots (octets), ranging from 0 to 255 (e.g., `192.168.1.10`).

2. **Public vs Private IPs:**
   * **Public IP:** Routable directly over the public internet, assigned by an ISP (e.g., `8.8.8.8`).
   * **Private IP:** Used within local networks (LANs), not routable on the public internet (e.g., `192.168.1.8`).

3. **Private IP Ranges:**
   * `10.0.0.0 – 10.255.255.255`
   * `172.16.0.0 – 172.31.255.255`
   * `192.168.0.0 – 192.168.255.255`

4. **`ip addr show` Local Analysis:**
   Private IPs found on the server: `192.168.1.8` (physical interface `enp3s0`), `100.102.19.118` (Tailscale VPN interface), and `172.17.0.1` (Docker bridge interface).

---

## Task 3: CIDR & Subnetting

1. **What `/24` means in `192.168.1.0/24`:**
   It means the first 24 bits of the address are used for the network identifier, leaving 8 bits for host addresses.

2. **Usable hosts:**
   * `/24`: 254 usable hosts (256 total IPs - 2 for network/broadcast).
   * `/16`: 65,534 usable hosts.
   * `/28`: 14 usable hosts.

3. **Why do we subnet?**
   Subnetting splits a large network into smaller, manageable subnetworks, improving performance, security, and traffic organization.

4. **CIDR Table:**

| CIDR | Subnet Mask | Total IPs | Usable Hosts |
|------|-------------|-----------|--------------|
| /24  | 255.255.255.0 | 256 | 254 |
| /16  | 255.255.0.0 | 65,536 | 65,534 |
| /28  | 255.255.255.240 | 16 | 14 |

---

## Task 4: Ports – The Doors to Services

1. **What is a port?**
   A logical endpoint identified by a 16-bit number (0–65535) that allows an operating system to direct incoming network traffic to the correct specific application or process.

2. **Common Ports:**

| Port | Service |
|------|---------|
| 22   | SSH (Secure Shell) |
| 80   | HTTP (Web Traffic) |
| 443  | HTTPS (Secure Web Traffic) |
| 53   | DNS (Domain Name System) |
| 3306 | MySQL Database |
| 6379 | Redis In-Memory Datastore |
| 27017| MongoDB Database |

3. **`ss -tulpn` Match:**
   * Port `2222`: Open for the SSH daemon (`sshd`).
   * Port `41641`: Active listening socket (Tailscale/local service).

---

## Task 5: Putting It Together

* **`curl http://myapp.com:8080` components:** 
  Involves **DNS** resolution to find `myapp.com`'s IP, **TCP** handshake on port `8080` at the transport layer, and an **HTTP** request at the application layer.
* **Database unreachable at `10.0.1.50:3306`:** 
  First, check network reachability via `ping`, verify if port `3306` is open using `nc -zv 10.0.1.50 3306`, check database service status, and inspect firewall/security group rules.

---

## What I Learned

1. **DNS Resolution Flow:** How names systematically map to IPs through hierarchical queries and record types (`A`, `CNAME`, etc.).
2. **IPs & CIDR Calculus:** The distinction between public/private ranges and how subnet masks dictate usable host capacity.
3. **Port Architecture:** How ports isolate network services and act as target routes for application traffic.