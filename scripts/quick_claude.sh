#!/bin/bash
# Helper script: Quick Claude query wrapper
# Usage: ./quick_claude.sh [-m model] "your prompt here"

# Default model (empty means use Claude's default)
MODEL=""

# Parse arguments
while getopts "m:" opt; do
  case $opt in
    m)
      MODEL="$OPTARG"
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift past the options
shift $((OPTIND-1))

# Check if prompt is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 [-m model] \"<prompt>\""
  echo ""
  echo "Options:"
  echo "  -m model    Specify Claude model (e.g., opus, sonnet, haiku)"
  echo ""
  echo "Examples:"
  echo "  $0 \"What is the meaning of life?\""
  echo "  $0 -m opus \"Explain quantum computing\""
  echo "  $0 -m sonnet \"Write a Python function to sort a list\""
  exit 1
fi

# Build the command
CMD="claude -p"

# Add model if specified
if [ -n "$MODEL" ]; then
  CMD="$CMD --model $MODEL"
fi

# Add the prompt
CMD="$CMD \"$@\""

# Run Claude with -p flag to bypass trust prompt
eval $CMD
