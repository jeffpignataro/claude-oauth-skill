# Claude CLI Skill for OpenClaw

An OpenClaw skill that enables direct invocation of the Claude Code CLI with prompts using non-interactive mode.

## Overview

This skill provides comprehensive instructions and examples for using the Claude Code CLI in non-interactive mode with the `-p` flag, which automatically bypasses the workspace trust dialog.

## Skill Structure

```
claude-oauth-skill/
├── SKILL.md              # Main skill instructions (read this first!)
├── README.md             # This file
├── examples/             # Example scripts demonstrating usage
│   ├── basic_usage.sh    # Basic Claude CLI examples
│   └── automation.sh     # Automation and scripting examples
└── scripts/              # Helper scripts
    └── quick_claude.sh   # Quick wrapper for Claude CLI queries
```

## Quick Start

### 1. Read the Skill Instructions

The main skill documentation is in [`SKILL.md`](SKILL.md). This contains:
- Complete usage guide
- All available flags and options
- Security considerations
- Integration patterns
- Advanced usage examples

### 2. Try the Examples

Run the example scripts to see the skill in action:

```bash
# Basic usage examples
./examples/basic_usage.sh

# Automation examples
./examples/automation.sh
```

### 3. Use the Helper Script

For quick queries, use the wrapper script:

```bash
# Simple query
./scripts/quick_claude.sh "What is the capital of France?"

# Code-related query
./scripts/quick_claude.sh "Explain what a closure is in JavaScript"
```

## Basic Usage

The core command pattern is:

```bash
claude -p "<prompt>"
```

The `-p` flag:
- Enables non-interactive mode (print and exit)
- **Automatically bypasses the workspace trust dialog**
- Makes output suitable for piping and scripting
- Only use in directories you trust!

## Common Use Cases

### Quick Queries
```bash
claude -p "Explain recursion in simple terms"
```

### Generate Code
```bash
claude -p "Create a Python function to calculate fibonacci numbers" > fibonacci.py
```

### Analyze Files
```bash
claude -p "Summarize the main points in README.md"
```

### JSON Output
```bash
claude -p --output-format json "List 5 programming languages"
```

### With Specific Model
```bash
claude -p --model opus "Explain quantum computing"
```

## Security Note

⚠️ **Important**: The `-p` flag bypasses the workspace trust dialog. This means:
- Claude will have access to tools without prompting
- Only use in directories you trust
- Be cautious with sensitive data
- Consider using `--tools ""` to disable tools if you only need text generation

## Integration with OpenClaw

When OpenClaw reads this skill, it will understand how to:
1. Invoke Claude CLI in non-interactive mode
2. Use the `-p` flag to bypass trust prompts
3. Format prompts correctly
4. Handle output for different use cases
5. Apply security best practices

## Requirements

- Claude Code CLI installed and configured
- Valid Claude authentication (API key or subscription)
- Bash shell (for example scripts)

## Verification

Check that Claude CLI is installed:

```bash
which claude
claude --version
```

Test the skill:

```bash
claude -p "Hello, Claude!"
```

## Additional Resources

- [Claude CLI Documentation](https://docs.anthropic.com/)
- Run `claude --help` for all available options
- Run `claude doctor` to check CLI health

## Contributing

To extend this skill:
1. Add new examples to `examples/`
2. Create helper scripts in `scripts/`
3. Update `SKILL.md` with new patterns
4. Document security considerations

## License

This skill is provided as-is for use with OpenClaw and Claude Code CLI.
