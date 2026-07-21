# Day 17 – Shell Scripting: Loops, Arguments & Error Handling

## Overview
Today we leveled up our bash scripting by implementing loops (`for` and `while`), handling command-line arguments, building an automated package installer, and adding robust error handling.

---

## Scripts Created

### 1. For Loop (`for_loop.sh` & `count.sh`)
- Iterated through arrays and number sequences (`{1..10}`).

### 2. While Loop (`countdown.sh`)
- Built an interactive countdown script using numeric conditions.

### 3. Command-Line Arguments (`greet.sh` & `args_demo.sh`)
- Handled positional parameters (`$1`), argument counting (`$#`), and full argument arrays (`$@`).

### 4. Package Installation Script (`install_packages.sh`)
- Automated package checking via `dpkg -s` and conditional installation.
- Added root user validation (`$EUID`).

### 5. Error Handling (`safe_script.sh`)
- Implemented `set -e` and short-circuit evaluation (`||`).

---

## Key Takeaways
1. **Control Flow:** Using `for` and `while` loops allows for dynamic data processing and repetitive execution.
2. **Arguments & Validation:** Checking `$#` and `$EUID` prevents incorrect script usage and unauthorized execution.
3. **Robustness:** Combining `set -e` with fallback operators (`||`) ensures scripts fail safely or handle expected exceptions gracefully.