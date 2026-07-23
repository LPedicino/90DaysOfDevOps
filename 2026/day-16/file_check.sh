#!/bin/bash
read -p "Enter filename to check: " FILENAME

if [ -f "$FILENAME" ]; then
    echo "File '$FILENAME' exists."
else
    echo "File '$FILENAME' does not exist."
fi
