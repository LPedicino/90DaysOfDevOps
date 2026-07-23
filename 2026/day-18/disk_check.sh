#!/bin/bash

# Función para verificar el uso de disco de la raíz
check_disk() {
    echo "=== Disk Usage (/) ==="
    df -h /
    echo ""
}

# Función para verificar la memoria libre
check_memory() {
    echo "=== Memory Usage ==="
    free -h
    echo ""
}

# Sección principal
echo "Starting system checks..."
echo "----------------------------------------"
check_disk
check_memory
echo "Checks completed successfully."
