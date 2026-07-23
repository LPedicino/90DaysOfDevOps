#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run as root. Try using sudo."
    exit 1
fi

PACKAGES=("nginx" "curl" "wget")

for pkg in "${PACKAGES[@]}"; do
    if dpkg -s "$pkg" &> /dev/null; then
        echo "Package '$pkg' is already installed. Skipping."
    else
        echo "Installing '$pkg'..."
        apt-get update && apt-get install -y "$pkg"
    fi
done
