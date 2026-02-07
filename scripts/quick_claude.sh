#!/bin/bash
# Helper script: Quick Claude query wrapper
# Usage: ./quick_claude.sh "your prompt here"

if [ $# -eq 0 ]; then
  echo "Usage: $0 \"<prompt>\""
  echo "Example: $0 \"What is the meaning of life?\""
  exit 1
fi

# Run Claude with -p flag to bypass trust prompt
claude -p "$@"
