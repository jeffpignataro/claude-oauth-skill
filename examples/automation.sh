#!/bin/bash
# Example: Using Claude CLI in automation workflows

# Generate a script
echo "=== Generating a backup script ==="
claude -p "Generate a bash script that backs up all .txt files to a backup/ directory" > generated_backup.sh
chmod +x generated_backup.sh
echo "Generated script saved to generated_backup.sh"

# Process multiple files
echo -e "\n=== Processing multiple files ==="
for file in *.md; do
  if [ -f "$file" ]; then
    echo "Analyzing $file..."
    claude -p "Count the number of sections (headers starting with #) in $file"
  fi
done

# Capture output in variable
echo -e "\n=== Capturing output ==="
result=$(claude -p "What is 2+2?")
echo "Claude's answer: $result"

# Chain with other commands
echo -e "\n=== Chaining with jq ==="
claude -p --output-format json "Create a JSON object with keys 'name' and 'value' where name is 'example' and value is 42" | jq '.'
