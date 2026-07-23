#!/bin/bash
set -e

echo "Trying to create and navigate into a test directory..."
mkdir -p /tmp/devops-test || echo "Directory creation failed or already exists"
cd /tmp/devops-test

echo "Creating a test file..."
echo "Hello DevOps" > test_file.txt
echo "Success! File created inside /tmp/devops-test"
