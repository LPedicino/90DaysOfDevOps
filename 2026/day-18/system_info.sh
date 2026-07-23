#!/bin/bash

# Activar modo estricto
set -euo pipefail

# 1. Hostname y OS info
print_os_info() {
    echo "========================================"
    echo "       SYSTEM & HOSTNAME INFO           "
    echo "========================================"
    echo "Hostname: $(hostname)"
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "OS: $PRETTY_NAME"
    else
        echo "OS: Desconocido"
    echo ""
    fi
}

# 2. Uptime
print_uptime() {
    echo "========================================"
    echo "             SYSTEM UPTIME              "
    echo "========================================"
    uptime -p
    echo ""
}

# 3. Disk usage (top 5 by size/mount)
print_disk_usage() {
    echo "========================================"
    echo "       DISK USAGE (Top Mounts)          "
    echo "========================================"
    df -h --local | grep -v tmpfs | head -n 6
    echo ""
}

# 4. Memory usage
print_memory_usage() {
    echo "========================================"
    echo "             MEMORY USAGE               "
    echo "========================================"
    free -h
    echo ""
}

# 5. Top 5 CPU-consuming processes
print_top_cpu() {
    echo "========================================"
    echo "      TOP 5 CPU-CONSUMING PROCESSES     "
    echo "========================================"
    ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
    echo ""
}

# Función principal (Main)
main() {
    echo "Generando reporte completo del sistema..."
    echo ""
    print_os_info
    print_uptime
    print_disk_usage
    print_memory_usage
    print_top_cpu
    echo "Reporte generado exitosamente."
}

# Ejecutar el main
main
