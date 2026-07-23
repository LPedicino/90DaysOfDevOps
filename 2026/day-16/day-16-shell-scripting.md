# Day 16 – Shell Scripting Basics

## Tasks & Outputs

### Task 1: Your First Script (`hello.sh`)
* **Code:**
  ```bash
  #!/bin/bash
  echo "Hello, DevOps!"
  ```
  Output: Hello, DevOps!

Note: Removing the shebang line (`#!/bin/bash`) causes the system to lose the explicit interpreter instruction, which can lead to execution failures or default shell fallback errors.

## Task 2: Variables (`variables.sh`)

* **Code:**
  ```bash
  #!/bin/bash
  NAME="Lea"
  ROLE="DevOps Engineer"
  echo "Hello, I am $NAME and I am a $ROLE"
  echo 'Using single quotes: Hello, I am $NAME'
  ```
  Output: Hello, I am Lea and I am a DevOps Engineer
  Using single quotes: Hello, I am $NAME
  
  Note: Double quotes (`"`) expand variables to their actual values, whereas single quotes (`'`) treat the string literally, preventing variable interpolation.

## Task 3: User Input with `read` (`greet.sh`)

* **Code:**
  ```bash
  #!/bin/bash
  read -p "Enter your name: " USER_NAME
  read -p "Enter your favourite tool: " TOOL
  echo "Hello $USER_NAME, your favourite tool is$TOOL"
  ```
  Output(Interactive): Successfully prompted for user input and printed a personalized greeting message containing the entered variables.

## Task 4: If-Else Conditions

### `check_number.sh`

* **Code:**
  ```bash
  #!/bin/bash
  read -p "Enter a number: " NUM
  if [ "$NUM" -gt 0 ]; then
      echo "The number is positive."
  elif [ "$NUM" -lt 0 ]; then
      echo "The number is negative."
  else
      echo "The number is zero."
  fi
  ```
  Output: Correctly categorized positive, negative, and zero inputs using numeric conditional flags (`-gt`, `-lt`).

### `file_check.sh`

* **Code:**
  ```bash
  #!/bin/bash
  read -p "Enter filename to check: " FILENAME
  if [ -f "$FILENAME" ]; then
      echo "File '$FILENAME' exists."
  else
      echo "File '$FILENAME' does not exist."
  fi
  ```
  Output: Validated local file paths successfully using the `-f` flag.

## Task 5: Combine It All (`server_check.sh`)

* **Code:**
  ```bash
  #!/bin/bash
  SERVICE="ssh"
  read -p "Do you want to check the status of $SERVICE? (y/n): " CHOICE
  if [ "$CHOICE" = "y" ]; then
      echo "Checking status..."
      sudo systemctl status "$SERVICE"
  else
      echo "Skipped."
  fi
  ```
  Output: Dynamically evaluated user choice and successfully invoked `systemctl` for the target service when confirmed.

## What I Learned

* **Shebang Importance:** How `#!/bin/bash` instructs the operating system on which interpreter must execute the script.
* **Variable Expansion:** The critical difference between double quotes (interpolation enabled) and single quotes (literal strings).
* **Control Flow & Input:** Integrating user prompts (`read`) and logical conditions (`if-else` / file testing) to build interactive automation logic.
