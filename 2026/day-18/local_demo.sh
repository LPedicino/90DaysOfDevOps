#!/bin/bash

set -euo pipefail

# Variable global
GLOBAL_VAR="Soy global"

test_scope() {
    # Variable local (solo vive dentro de esta función)
    local LOCAL_VAR="Soy local"
    
    # Modificamos o redefinimos una variable global dentro de la función sin 'local'
    GLOBAL_VAR="Global modificada dentro de la función"
    
    echo "Dentro de la función -> Local: $LOCAL_VAR"
    echo "Dentro de la función -> Global: $GLOBAL_VAR"
}

echo "=== ANTES de ejecutar la función ==="
echo "Global: $GLOBAL_VAR"
# Si descomentaras la siguiente línea, daría error por el -u porque LOCAL_VAR no existe acá fuera:
# echo "Local fuera: $LOCAL_VAR"

echo ""
echo "=== EJECUTANDO la función ==="
test_scope

echo ""
echo "=== DESPUÉS de ejecutar la función ==="
echo "Global (fue afectada): $GLOBAL_VAR"

# Intentamos imprimir la variable local fuera de la función (fallará por set -u)
echo "Intentando acceder a LOCAL_VAR fuera de su función..."
echo "$LOCAL_VAR"
