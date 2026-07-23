#!/bin/bash

read -p "Enter a number to start countdown: " NUM

while [ "$NUM" -ge 0 ]; do
    echo "$NUM"
    NUM=$((NUM - 1))
done

echo "Done!"
