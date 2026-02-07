---
name: claude-cli
description: Invoke Claude Code CLI directly with prompts using non-interactive mode
---

# Claude CLI Skill

This skill enables you to invoke the Claude Code CLI directly with prompts in non-interactive mode, bypassing the workspace trust dialog.

## Overview

The Claude Code CLI can be invoked in non-interactive mode using the `-p` or `--print` flag, which prints the response and exits. This is particularly useful for:
- Scripting and automation
- Piping output to other commands
- Quick one-off queries
- Integration with other tools

**Important Security Note**: The `-p` flag automatically bypasses the workspace trust dialog. Only use this in directories you trust.

### Setup and Requirements

1. **Authentication**: Before using this skill, you MUST perform a one-time login in your terminal:
   ```bash
   claude /login
   ```
   Follow the OAuth flow in your browser to authorize the CLI.
2. **OpenClaw Execution**: When calling this skill from an OpenClaw agent, ALWAYS use `pty:true` to ensure the terminal output is handled correctly.
   ```bash
   # Example OpenClaw tool call
   bash pty:true command:"claude -p 'Your prompt'"
   ```

## Usage

### Basic Syntax

```bash
claude -p "<prompt>"
```

### Key Flags

- `-p, --print`: Print response and exit (non-interactive mode). **This automatically skips the workspace trust dialog.**
- `--model <model>`: Specify a model (e.g., 'sonnet', 'opus', or full model name)
- `--output-format <format>`: Output format - "text" (default), "json", or "stream-json"
- `--max-budget-usd <amount>`: Set maximum spending limit for API calls
- `--session-id <uuid>`: Use a specific session ID
- `--system-prompt <prompt>`: Override the system prompt
- `--tools <tools>`: Specify available tools (e.g., "Bash,Edit,Read" or "" to disable all)

### Examples

#### Simple Query
```bash
claude -p "What is the capital of France?"
```

#### Code Analysis
```bash
claude -p "Analyze the code in main.py and suggest improvements"
```

#### With Model Selection
```bash
claude -p --model opus "Explain quantum computing in simple terms"
```

#### JSON Output
```bash
claude -p --output-format json "List the top 3 programming languages"
```

#### With Budget Limit
```bash
claude -p --max-budget-usd 0.50 "Generate a Python script to parse CSV files"
```

#### Disable All Tools (API-only mode)
```bash
claude -p --tools "" "Explain the concept of recursion"
```

#### With Custom System Prompt
```bash
claude -p --system-prompt "You are a code reviewer" "Review this function for security issues"
```

## Integration Patterns

### Piping Output
```bash
claude -p "Generate a bash script to backup files" > backup.sh
chmod +x backup.sh
```

### Chaining Commands
```bash
result=$(claude -p "What is 2+2?")
echo "Claude says: $result"
```

### Processing Files
```bash
for file in *.py; do
  claude -p "Summarize this Python file: $file"
done
```

## When to Use This Skill

Use this skill when you need to:
1. **Automate Claude interactions** - Scripts, CI/CD pipelines, or automated workflows
2. **Get quick answers** - One-off queries without starting an interactive session
3. **Process output programmatically** - Pipe to files, parse JSON, or chain with other commands
4. **Bypass trust prompts** - Work in trusted directories without manual confirmation
5. **Integrate with other tools** - Combine Claude with existing command-line workflows

## Security Considerations

⚠️ **Warning**: The `-p` flag bypasses the workspace trust dialog. This means:
- Claude will have access to tools without prompting for permission
- Only use this in directories you trust
- Be cautious when running in directories with sensitive data
- Consider using `--tools ""` to disable all tools if you only need text generation

## Advanced Usage

### Streaming JSON Output
```bash
claude -p --output-format stream-json "Explain machine learning" | jq -r '.content'
```

### Fallback Model (when primary is overloaded)
```bash
claude -p --fallback-model haiku "Quick question about Python syntax"
```

### With MCP Servers
```bash
claude -p --mcp-config ./mcp-config.json "Query the database for user stats"
```

### Structured Output with JSON Schema
```bash
claude -p --json-schema '{"type":"object","properties":{"name":{"type":"string"},"age":{"type":"number"}},"required":["name","age"]}' "Extract person info: John is 30 years old"
```

## Tips and Best Practices

1. **Quote your prompts**: Always use quotes around prompts to handle spaces and special characters
2. **Use specific models**: Specify `--model` for consistent behavior (e.g., `--model sonnet` for faster responses)
3. **Set budget limits**: Use `--max-budget-usd` to prevent unexpected API costs
4. **Disable tools when not needed**: Use `--tools ""` for pure text generation to improve speed and reduce costs
5. **Capture output**: Redirect output to files or variables for further processing
6. **Check exit codes**: The command returns 0 on success, non-zero on errors

## Troubleshooting

### Command not found
Ensure Claude CLI is installed and in your PATH:
```bash
which claude
```

### Permission errors
Make sure you're in a directory you trust, or the `-p` flag won't help with file access permissions.

### API rate limits
Use `--max-budget-usd` to control spending, or wait if you hit rate limits.

## Related Commands

- `claude --help`: View all available options
- `claude --version`: Check installed version
- `claude doctor`: Check CLI health and configuration
- `claude setup-token`: Configure authentication
