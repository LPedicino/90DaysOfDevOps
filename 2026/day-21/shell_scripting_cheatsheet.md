# Shell Scripting Ultimate Cheat Sheet

## Quick Reference Summary Table

| Topic | Key Syntax | Example |
|-------|-----------|---------|
| Variable | `VAR="value"` | `NAME="DevOps"` |
| Argument | `$1`, `$2` | `./script.sh arg1` |
| If | `if [ condition ]; then` | `if [ -f file ]; then` |
| For loop | `for i in list; do` | `for i in 1 2 3; do` |
| Function | `name() { ... }` | `greet() { echo "Hi"; }` |
| Grep | `grep pattern file` | `grep -i "error" log.txt` |
| Awk | `awk '{print $1}' file` | `awk -F: '{print $1}' /etc/passwd` |
| Sed | `sed 's/old/new/g' file` | `sed -i 's/foo/bar/g' config.txt` |

---

## 1. Basics

### Shebang
* **Syntax**: `#!/bin/bash`
* **Purpose**: Tells the OS which interpreter to use to execute the script.

### Running a Script
```bash
chmod +x script.sh    # Give execution permissions
./script.sh           # Run directly using shebang
bash script.sh        # Run explicitly via bash interpreter
```

### Comments
```bash
# This is a single-line comment
echo "Hello" # This is an inline comment
```

### Variables
```bash
NAME="DevOps"         # Declare
echo $NAME            # Use
echo "Hello $NAME"    # Quoting (interpolates variable)
echo 'Hello $NAME'    # Strong quoting (treats literally)
```

### Reading User Input
```bash
read -p "Enter your name: " USER_NAME
echo "Welcome, $USER_NAME"
```

### Command-Line Arguments
* `$0`: Script name
* `$1`, `$2`: First and second arguments
* `$#`: Total number of arguments
* `$@`: All arguments as separate strings
* `$?`: Exit code of the last executed command

---

## 2. Operators and Conditionals

### String Comparisons
* `=`: Equal
* `!=`: Not equal
* `-z`: String is empty (zero length)
* `-n`: String is not empty

```bash
if [ "$STR1" = "$STR2" ]; then
    echo "Strings are equal"
fi
```

### Integer Comparisons
* `-eq`: Equal (`==`)
* `-ne`: Not equal (`!=`)
* `-lt`: Less than (`<`)
* `-gt`: Greater than (`>`)
* `-le`: Less than or equal (`<=`)
* `-ge`: Greater than or equal (`>=`)

```bash
if [ "$NUM" -gt 10 ]; then
    echo "Greater than 10"
fi
```

### File Test Operators
* `-f`: Exists and is a regular file
* `-d`: Exists and is a directory
* `-e`: Exists (file or directory)
* `-r`: Readable
* `-w`: Writable
* `-x`: Executable
* `-s`: Not empty (size greater than zero)

```bash
if [ -f "config.txt" ]; then
    echo "File exists"
fi
```

### If, Elif, Else Syntax
```bash
if [ "$1" -eq 1 ]; then
    echo "One"
elif [ "$1" -eq 2 ]; then
    echo "Two"
else
    echo "Other"
fi
```

### Logical Operators
* `&&`: AND
* `||`: OR
* `!`: NOT

```bash
if [ -f "file.txt" ] && [ -r "file.txt" ]; then
    echo "File exists and is readable"
fi
```

### Case Statements
```bash
case "$1" in
    start)
        echo "Starting..."
        ;;
    stop)
        echo "Stopping..."
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        ;;
esac
```
---

## 3. Loops

### For Loop (List)
```bash
for item in apple banana cherry; do
    echo "Fruit: $item"
done
```
### For Loop (C-Style)
```bash
for (( i=1; i<=5; i++ )); do
    echo "Count: $i"
done
```

### While Loop
```bash
COUNT=1
while [ $COUNT -le 3 ]; do
    echo "While iteration: $COUNT"
    ((COUNT++))
done
```

### Until Loop
```bash
COUNT=1
until [ $COUNT -gt 3 ]; do
    echo "Until iteration: $COUNT"
    ((COUNT++))
done
```

### Reading a File Line by Line
```bash
while IFS=read -r line; do
    echo "Line: $line"
done < "config.txt"
```

---

## 4. Functions

### Defining and Calling Functions
```bash
# Definition style 1
my_function() {
    echo "Hello from function"
}

# Definition style 2 (alternative)
function another_func {
    echo "Hello again"
}

# Calling the function
my_function
```

### Passing Arguments to Functions
```bash
greet() {
    echo "Hello $1, you are from $2"
}

greet "DevOps" "Argentina"
```

### Return Values and Exit Status
```bash
check_status() {
    if [ -f "config.txt" ]; then
        return 0 # Success
    else
        return 1 # Failure
    fi
}

check_status
if [ $? -eq 0 ]; then
    echo "Config exists!"
fi
```

### Local Variables
```bash
my_func() {
    local LOCAL_VAR="I am local"
    GLOBAL_VAR="I am global"
}

my_func
echo $GLOBAL_VAR
# echo $LOCAL_VAR # This would fail outside the function
```

---

## 5. Arrays

### Defining and Accessing Arrays
```bash
# Define an array
MY_ARRAY=("item1" "item2" "item3")

# Access specific element (0-indexed)
echo "${MY_ARRAY[0]}"

# Access all elements
echo "${MY_ARRAY[@]}"

# Get array length (number of elements)
echo "${#MY_ARRAY[@]}"
```

### Adding and Removing Elements
```bash
# Add an element to the end
MY_ARRAY+=("item4")

# Remove an element by index
unset MY_ARRAY[1]
```

### Looping Through an Array
```bash
for item in "${MY_ARRAY[@]}"; do
    echo "Item: $item"
done
```

---

## 6. Text Processing

### Grep (Searching)
```bash
# Search for a pattern in a file
grep "pattern" file.txt

# Case-insensitive search
grep -i "error" log.txt

# Show line numbers
grep -n "TODO" script.sh

# Recursive search in directories
grep -r "TODO" /path/to/dir
```

### Awk (Pattern Scanning and Processing)
```bash
# Print specific columns (default separator is whitespace)
awk '{print $1, $3}' file.txt

# Use a custom field separator (e.g., colon)
awk -F: '{print $1}' /etc/passwd

# Conditional printing (e.g., column 2 greater than 50)
awk '$2 > 50 {print $1}' data.txt
```

### Sed (Stream Editor for Filtering and Transforming)
```bash
# Replace first occurrence of a string in a line (in-place)
sed 's/old/new/' file.txt

# Replace all occurrences globally in a file (-i for in-place)
sed -i 's/old/new/g' config.txt

# Delete specific lines (e.g., line 3)
sed '3d' file.txt
```