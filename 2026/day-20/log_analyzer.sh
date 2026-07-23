#!/bin/bash

set -euo pipefail

# Task 1: Input and Validation
if [ $# -eq 0 ]; then
    echo "Error: No log file provided."
    echo "Usage: $0 <path_to_log_file>"
    exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' does not exist."
    exit 1
fi

CURRENT_DATE=$(date +%Y-%m-%d)
REPORT_FILE="log_report_${CURRENT_DATE}.txt"

echo "Analyzing log file: $LOG_FILE..."

# Task 2: Error Count (matching ERROR or Failed)
TOTAL_ERRORS=$(grep -iE "ERROR|Failed" "$LOG_FILE" | wc -l)

# Total lines processed
TOTAL_LINES=$(wc -l < "$LOG_FILE")

# Task 3: Critical Events (with line numbers)
CRITICAL_EVENTS=$(grep -n "CRITICAL" "$LOG_FILE" || true)

# Task 4: Top 5 Error Messages
TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" | sed 's/^[0-9:\-\ ]*\[\?[A-Z]*\]\?//' | sort | uniq -c | sort -rn | head -5 || true)

# --- Task 5: Generate Summary Report ---
{
    echo "========================================"
    echo "         SERVER LOG ANALYSIS REPORT     "
    echo "========================================"
    echo "Date of Analysis : $CURRENT_DATE"
    echo "Log File Name    : $(basename "$LOG_FILE")"
    echo "Total Lines      : $TOTAL_LINES"
    echo "Total Errors     : $TOTAL_ERRORS"
    echo ""
    echo "--- Top 5 Error Messages ---"
    if [ -n "$TOP_ERRORS" ]; then
        echo "$TOP_ERRORS"
    else
        echo "No errors found."
    fi
    echo ""
    echo "--- Critical Events ---"
    if [ -n "$CRITICAL_EVENTS" ]; then
        echo "$CRITICAL_EVENTS"
    else
        echo "No critical events found."
    fi
    echo "========================================"
} > "$REPORT_FILE"

echo "Report generated successfully: $REPORT_FILE"

# --- Task 6: Archive Processed Logs ---
mkdir -p archive
mv "$LOG_FILE" archive/
echo "Log file moved to archive/ directory."
