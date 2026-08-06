# Day 38: YAML Basics

## 1. YAML Files Created

### `person.yaml`
```yaml
name: "Leandro"
role: "DevOps Learner"
experience_years: 2
learning: true
tools:
  - Docker
  - Git
  - Linux
  - Nginx
  - PostgreSQL
hobbies: [boxing, programming, gaming]
```

## server.yaml
```yaml
server:
  name: "proliant-server"
  ip: "192.168.1.100"
  port: 8096

database:
  host: "localhost"
  name: "day36db"
  credentials:
    user: "admin"
    password: "secretpassword"

startup_script: |
  echo "Starting services..."
  docker compose up -d
  echo "System is ready!"

description: >
  This server runs our core infrastructure 
  and containerized applications for daily 
  DevOps learning and practice.
```

## 2. Key Learnings & Answers
* **Two ways to write lists in YAML:**
  * Block style using dashes (`- item`).
  * Flow style using square brackets inline (`[item1, item2]`).
* **When to use `|` vs `>` for multi-line strings:**
  * Use **`|` (Literal style)** when you want to preserve newlines and line breaks (ideal for scripts or formatted text blocks).
  * Use **`>` (Folded style)** when you want to fold sequential lines into a single continuous space-separated string (ideal for long descriptive paragraphs).
* **Tabs vs Spaces and Indentation Errors:**
  * YAML strictly prohibits tabs for indentation; only spaces are allowed (standard is 2 spaces per level). Using tabs throws syntax/indentation errors.
* **Spot the Difference (Task 6):**
  * Block 2 is broken because the list item `- kubernetes` is indented further than its parent key `devopstools:`, breaking the structural mapping hierarchy.

## 3. Three Key Takeaways
* **Indentation is everything:** Consistent use of 2 spaces defines structural nesting and scope.
* **No Tabs Allowed:** Invisible tab characters cause parsing failures across YAML parsers.
* **Data Types:** Scalar values, booleans, lists, and nested maps are cleanly supported natively without complex syntax overhead.
