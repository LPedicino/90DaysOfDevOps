# Day 20 – Bash Scripting Challenge: Log Analyzer and Report Generator

## Overview
In this challenge, I built an automated log analyzer script (`log_analyzer.sh`) that processes system logs, counts errors, extracts critical events with line numbers, aggregates the top error occurrences, generates a summary report, and handles log archiving.

## Scripts Developed
1. **`sample_logs_generator.sh`**: Generates a realistic mock log file (`sample_log.log`) containing info, warnings, errors, and critical events.
2. **`log_analyzer.sh`**: The core analyzer script incorporating strict mode, argument validation, text processing pipelines (`grep`, `sed`, `sort`, `uniq`), report generation, and safe archiving.

## Sample Execution Output
```bash
lpedicino@proliant:~/2026/day-20$ ./log_analyzer.sh sample_log.log
Analyzing log file: sample_log.log...
Report generated successfully: log_report_2026-07-22.txt
Log file moved to archive/ directory.
```
## Tools & Commands Used
* **`grep -iE`**: Case-insensitive and extended regex matching to catch variations of errors and failures.
* **`sed`**: Text substitution to clean up timestamps and log headers before sorting error counts.
* **`sort & uniq -c`**: Counting occurrences of unique error messages and sorting them in descending order.
* **`set -euo pipefail`**: Enforcing strict error handling and pipeline failure detection.

## Key Learnings
* **Text Pipeline Efficiency**: Combining `grep`, `sort`, and `uniq -c` provides a powerful native Linux mechanism for quick log aggregation without heavy external tools.
* **Report Redirection**: Grouping commands inside a block `{ ... } > file` allows cleanly formatting multi-line summary reports into text files in a single write operation.
* **Lifecycle Management**: Automating the archival step (`mv` into an `archive/` directory) after successful parsing prevents duplicate processing of the same log files.