#!/bin/bash
SERVICE="ssh"

read -p "Do you want to check the status of $SERVICE? (y/n): " CHOICE

if [ "$CHOICE" = "y" ]; then
    echo "Checking status..."
    sudo systemctl status "$SERVICE"
else
    echo "Skipped."
fi
