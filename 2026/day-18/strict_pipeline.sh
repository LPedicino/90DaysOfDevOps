#!/bin/bash

set -euo pipefail

echo "Probando pipe con fallo..."

# Un comando que falla a la izquierda del pipe, pero el de la derecha tiene éxito.
# Sin pipefail, el script seguiría porque el último comando (grep) devuelve exit code 0.
# Con pipefail, el script se detiene porque el comando de la izquierda falló.
non_existent_command | echo "Hola desde el pipe"

echo "Esta línea nunca debería mostrarse si pipefail funciona."
