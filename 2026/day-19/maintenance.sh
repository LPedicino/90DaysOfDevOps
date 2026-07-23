#!/bin/bash

set -euo pipefail

# Directorio de logs de mantenimiento y rutas a automatizar
LOG_FILE="/var/log/maintenance.log"
TARGET_LOG_DIR="/var/log" # O el directorio de tu app
BACKUP_SRC="/home/lpedicino/2026"
BACKUP_DEST="/home/lpedicino/backups"

# Asegurar que el directorio de destino de backups exista
mkdir -p "$BACKUP_DEST"

# Función para registrar mensajes con timestamp
log_message() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | sudo tee -a "$LOG_FILE" > /dev/null
}

log_message "=== Inicio de tareas de mantenimiento ==="

# 1. Ejecutar rotación de logs (requiere sudo por /var/log)
log_message "Ejecutando rotación de logs en $TARGET_LOG_DIR..."
if sudo /home/lpedicino/2026/day-19/log_rotate.sh "$TARGET_LOG_DIR" >> "$LOG_FILE" 2>&1; then
    log_message "Rotación de logs completada con éxito."
else
    log_message "ERROR: Falló la rotación de logs."
fi

# 2. Ejecutar respaldo del servidor
log_message "Ejecutando respaldo de $BACKUP_SRC..."
if /home/lpedicino/2026/day-19/backup.sh "$BACKUP_SRC" "$BACKUP_DEST" >> "$LOG_FILE" 2>&1; then
    log_message "Respaldo completado con éxito."
else
    log_message "ERROR: Falló el respaldo del servidor."
fi

log_message "=== Fin de tareas de mantenimiento ==="
echo ""
