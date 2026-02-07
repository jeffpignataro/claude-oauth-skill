#!/bin/bash
# Example: Simple Claude CLI invocation with -p flag

# Basic query
echo "=== Basic Query ==="
claude -p "What is the capital of France?"

echo -e "\n=== Code Analysis ==="
# Analyze a file (if it exists)
if [ -f "SKILL.md" ]; then
  claude -p "Summarize the main points of SKILL.md in 3 bullet points"
fi

echo -e "\n=== JSON Output ==="
# Get JSON output
claude -p --output-format json "List 3 benefits of using the Claude CLI"

echo -e "\n=== With Model Selection ==="
# Use a specific model
claude -p --model sonnet "Explain what the -p flag does in the Claude CLI in one sentence"
