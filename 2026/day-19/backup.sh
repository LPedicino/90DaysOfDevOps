#!/bin/bash

set -euo pipefail

# Validar argumentos (origen y destino)
if [ $# -lt 2 ]; then
    echo "Error: Faltan argumentos."
    echo "Uso: $0 /ruta/origen /ruta/destino"
    exit 1
fi

SRC_DIR="$1"
DEST_DIR="$2"

# Verificar si el directorio de origen existe
if [ ! -d "$SRC_DIR" ]; then
    echo "Error: El directorio de origen '$SRC_DIR' no existe."
    exit 1
fi

# Crear el directorio de destino si no existe
mkdir -p "$DEST_DIR"

TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup-$TIMESTAMP.tar.gz"
BACKUP_PATH="$DEST_DIR/$BACKUP_NAME"

echo "Creando respaldo de '$SRC_DIR' en '$BACKUP_PATH'..."

# Crear el archivo tar.gz
tar -czf "$BACKUP_PATH" -C "$(dirname "$SRC_DIR")" "$(basename "$SRC_DIR")"

# Verificar que el archivo se haya creado correctamente
if [ -f "$BACKUP_PATH" ]; then
    SIZE=$(du -sh "$BACKUP_PATH" | awk '{print $1}')
    echo "Respaldo creado exitosamente."
    echo "Archivo: $BACKUP_NAME"
    echo "Tamaño: $SIZE"
else
    echo "Error: Falló la creación del respaldo."
    exit 1
fi

# Eliminar respaldos más antiguos de 14 días en el destino
echo "Limpiando respaldos antiguos (>14 días)..."
find "$DEST_DIR" -name "backup-*.tar.gz" -mtime +14 -exec rm -f {} \;

echo "Proceso de respaldo finalizado."
