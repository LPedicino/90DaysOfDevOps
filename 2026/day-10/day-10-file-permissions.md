# Day 10 – File Permissions & File Operations Challenge

## Files Created
- `devops.txt`, `notes.txt`, `script.sh`, `project/` (directory)

## Permission Changes
| File/Dir | Initial Perms | Final Perms | Action |
| :--- | :--- | :--- | :--- |
| `devops.txt` | 664 | 444 | Set to read-only |
| `notes.txt` | 664 | 640 | Set owner rw, group r |
| `script.sh` | 664 | 775 | Added executable bit |
| `project/` | - | 755 | Created dir |

## Commands Used
- `touch`, `echo`, `vim` / `view`
- `head`, `tail`
- `chmod +x`, `chmod -w`, `chmod 640`, `chmod 755`
- `ls -l` / `ls -ld`

## Testing Permissions Results
1. **Write to read-only file (`devops.txt`)**: 
   - Command: `echo "test" >> devops.txt`
   - Result: `bash: devops.txt: Permission denied`
2. **Execute non-executable file (`notes.txt`)**:
   - Command: `./notes.txt`
   - Result: `bash: ./notes.txt: Permission denied`
3. **Execute `script.sh`**:
   - Result: `Hello DevOps`

## What I Learned
1. **Permission Logic**: Understood how the Linux permission system (rwx) protects files by restricting which users can read, modify, or execute content.
2. **Execution Control**: Learned that a file, even if it contains valid commands, cannot be executed unless it is explicitly granted the `x` (execute) permission.
3. **Defense in Depth**: Understood that `chmod` is a primary tool for implementing the principle of least privilege, ensuring that users only have access to what is strictly necessary.