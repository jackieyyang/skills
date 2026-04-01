# Cursor Skills

A collection of AI agent skills for [Cursor](https://cursor.com/) / Codebuddy / Trae and other AI-powered editors.

## Available Skills

| Skill | Description |
|-------|-------------|
| [ntu-dissertation-expert](./ntu-dissertation-expert/) | NTU EEE MSc dissertation LaTeX expert. Auto-clones template, sets up local compilation with live preview, and guides academic writing following official NTU guidelines. |

## Installation

### Cursor

Copy the skill directory to `~/.cursor/skills/`:

```bash
# Clone this repo
git clone https://github.com/jackieyyang/cursor-skills.git

# Copy the skill you need
cp -r cursor-skills/ntu-dissertation-expert ~/.cursor/skills/
```

### Other AI Editors

Copy the skill files to the corresponding configuration directory of your editor (Codebuddy, Trae, etc.).

## License

MIT
