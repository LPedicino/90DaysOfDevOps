#!/bin/bash

set -euo pipefail

# Validar que se pase el directorio como argumento
if [ $# -eq 0 ]; then
    echo "Error: Debes proveer el directorio de logs."
    echo "Uso: $0 /ruta/al/directorio"
    exit 1
fi

LOG_DIR="$1"

# Verificar si el directorio existe
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: El directorio '$LOG_DIR' no existe."
    exit 1
fi

echo "Iniciando rotación de logs en: $LOG_DIR"

# Contar y comprimir archivos .log con más de 7 días
compressed_count=$(find "$LOG_DIR" -name "*.log" -mtime +7 | wc -l)
if [ "$compressed_count" -gt 0 ]; then
    find "$LOG_DIR" -name "*.log" -mtime +7 -exec gzip {} \;
fi

# Contar y eliminar archivos .gz con más de 30 días
deleted_count=$(find "$LOG_DIR" -name "*.log.gz" -mtime +30 | wc -l)
if [ "$deleted_count" -gt 0 ]; then
    find "$LOG_DIR" -name "*.log.gz" -mtime +30 -exec rm -f {} \;
fi

echo "Archivos comprimidos (>7 días): $compressed_count"
echo "Archivos eliminados (>30 días): $deleted_count"
echo "Rotación de logs finalizada con éxito."
