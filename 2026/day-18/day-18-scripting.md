# Day 18 – Shell Scripting: Functions & intermediate Concepts

## Overview
In this day's challenge, I learned how to write cleaner, reusable, and safer shell scripts using functions, local variables, and strict mode (`set -euo pipefail`).

## Scripts Developed

1. **`functions.sh`**: Basic functions for greeting and adding numbers with parameters (`$1`, `$2`).
2. **`disk_check.sh`**: System resource checking functions for disk space and memory.
3. **`strict_demo.sh` / `strict_pipeline.sh`**: Demonstration of strict mode flags (`-e`, `-u`, `-o pipefail`).
4. **`local_demo.sh`**: Encapsulation of variables using the `local` keyword.
5. **`system_info.sh`**: Comprehensive system reporter combining functions for OS details, uptime, disk usage, memory, and top CPU processes.

## Understanding Strict Mode (`set -euo pipefail`)
- **`set -e`**: Exits immediately if a command exits with a non-zero status (fails).
- **`set -u`**: Treats unset variables as an error when substituted, preventing silent bugs.
- **`set -o pipefail`**: Returns the exit status of the last command in the pipeline that failed, rather than just the last command of the chain.

## Key Learnings
1. **Reusability**: Breaking down complex scripts into modular functions improves readability and maintenance.
2. **Variable Scope**: Using `local` prevents global namespace pollution and unintended side effects inside functions.
3. **Error Handling**: Enforcing strict mode (`set -euo pipefail`) at the beginning of scripts is a best practice for robust automation.