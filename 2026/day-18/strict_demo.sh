#!/bin/bash

# Activamos el modo estricto
set -euo pipefail

echo "1. El script arrancó correctamente."

# Prueba 2: Variable no definida (con -u debería fallar y detenerse aquí)
echo "Intentando usar una variable no definida..."
echo "$VARIABLE_INEXISTENTE"

echo "Esto no debería imprimirse nunca si -u funciona."
