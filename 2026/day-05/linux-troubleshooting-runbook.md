# Linux Troubleshooting Runbook

## Target Service: System Base (Debian Container)

### 1. Environment & Filesystem

* `uname -a`:
```
 Linux bcd657f37c9e 6.18.33.1-microsoft-standard-WSL2 #1 SMP PREEMPT_DYNAMIC Fri Jun  5 01:12:21 UTC 2026 x86_64 GNU/Linux
 ```
* `cat /etc/os-release`:
```
PRETTY_NAME="Debian GNU/Linux 13 (trixie)"
NAME="Debian GNU/Linux"
VERSION_ID="13"
VERSION="13 (trixie)"
VERSION_CODENAME=trixie
DEBIAN_VERSION_FULL=13.5
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
```
* `ls -l /tmp/runbook-demo`: 
```
total 4
-rw-r--r-- 1 root root 172 Jul 13 20:57 hosts-copy
```

### 2. CPU & Memory

* `top`:
```
top - 20:58:57 up 9 min,  0 users,  load average: 0.00, 0.00, 0.00
Tasks:   2 total,   1 running,   1 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st 
MiB Mem :  15544.6 total,  13355.0 free,    941.1 used,   1461.4 buff/cache     
MiB Swap:   4096.0 total,   4096.0 free,      0.0 used.  14603.5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      1 root      20   0    4328   3796   3220 S   0.0   0.0   0:00.02 bash
    412 root      20   0    7236   4968   2968 R   0.0   0.0   0:00.00 top
```
* `free -h`: 
```
               total        used        free      shared  buff/cache   available
Mem:            15Gi       890Mi        14Gi       3.7Mi       420Mi        14Gi
Swap:          4.0Gi          0B       4.0Gi
```

### 3. Disk & IO

* `df -h`: 
```
Filesystem      Size  Used Avail Use% Mounted on
overlay        1007G   13G  944G   2% /
tmpfs            64M     0   64M   0% /dev
shm              64M     0   64M   0% /dev/shm
/dev/sdd       1007G   13G  944G   2% /etc/hosts
tmpfs           4.0K     0  4.0K   0% /proc/acpi
```
* `du -sh /var/log`: 
```
44K     /var/log
```

### 4. Network

* `ss -tulpn`: 
```
Netid            State             Recv-Q             Send-Q                         Local Address:Port                         Peer Address:Port            Process            
```

### 5. Logs

* `tail -n 20 /var/log/dpkg.log`: 
```
2026-07-13 20:50:05 status installed libpam-cap:amd64 1:2.75-10+deb13u1+b1
2026-07-13 20:50:05 configure libbpf1:amd64 1:1.5.0-3 <none>
2026-07-13 20:50:05 status unpacked libbpf1:amd64 1:1.5.0-3
2026-07-13 20:50:05 status half-configured libbpf1:amd64 1:1.5.0-3
2026-07-13 20:50:05 status installed libbpf1:amd64 1:1.5.0-3
2026-07-13 20:50:06 configure libgssapi-krb5-2:amd64 1.21.3-5+deb13u1 <none>
2026-07-13 20:50:06 status unpacked libgssapi-krb5-2:amd64 1.21.3-5+deb13u1
2026-07-13 20:50:06 status half-configured libgssapi-krb5-2:amd64 1.21.3-5+deb13u1
2026-07-13 20:50:06 status installed libgssapi-krb5-2:amd64 1.21.3-5+deb13u1
2026-07-13 20:50:06 configure libtirpc3t64:amd64 1.3.6+ds-1 <none>
2026-07-13 20:50:06 status unpacked libtirpc3t64:amd64 1.3.6+ds-1
2026-07-13 20:50:06 status half-configured libtirpc3t64:amd64 1.3.6+ds-1
2026-07-13 20:50:06 status installed libtirpc3t64:amd64 1.3.6+ds-1
2026-07-13 20:50:06 configure iproute2:amd64 6.15.0-1 <none>
2026-07-13 20:50:06 status unpacked iproute2:amd64 6.15.0-1
2026-07-13 20:50:06 status half-configured iproute2:amd64 6.15.0-1
2026-07-13 20:50:06 status installed iproute2:amd64 6.15.0-1
2026-07-13 20:50:06 trigproc libc-bin:amd64 2.41-12+deb13u3 <none>
2026-07-13 20:50:06 status half-configured libc-bin:amd64 2.41-12+deb13u3
2026-07-13 20:50:06 status installed libc-bin:amd64 2.41-12+deb13u3
```
## Quick Findings
* The system is stable, disk usage is low, and no unexpected processes are consuming resources.

## If this worsens (Next Steps)
1. Increase log verbosity (e.g., enable debug mode in the service config).
2. Collect `strace` logs to trace system calls if the process hangs.
3. Perform a clean restart of the specific service.