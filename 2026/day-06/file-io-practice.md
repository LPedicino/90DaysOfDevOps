# Linux File I/O Practice

## Commands Executed

* `touch notes.txt`: Created an empty file.
* `echo "..." > notes.txt`: Overwrote/created file with Line 1.
* `echo "..." >> notes.txt`: Appended Line 2.
* `echo "..." | tee -a notes.txt`: Appended Line 3 and displayed it in the terminal.
* `cat notes.txt`: Read the full file content.
* `head -n 2 notes.txt`: Displayed the first 2 lines.
* `tail -n 2 notes.txt`: Displayed the last 2 lines.

## File Content (`cat notes.txt`)

```
Line 1: DevOps started
Line 2: Learning Linux commands
Line 3: File I/O practice
Line 4: Mastering redirection
```