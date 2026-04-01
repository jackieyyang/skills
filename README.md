# Skills

<p align="center">
  <a href="https://github.com/jackieyyang/skills/blob/main/LICENSE"><img src="https://img.shields.io/github/license/jackieyyang/skills?style=flat-square" alt="LICENSE" /></a>
  <a href="https://github.com/jackieyyang/skills/stargazers"><img src="https://img.shields.io/github/stars/jackieyyang/skills?style=flat-square" alt="Stars" /></a>
  <a href="https://github.com/jackieyyang/skills/network/members"><img src="https://img.shields.io/github/forks/jackieyyang/skills?style=flat-square" alt="Forks" /></a>
  <a href="https://github.com/jackieyyang/skills/issues"><img src="https://img.shields.io/github/issues/jackieyyang/skills?style=flat-square" alt="Issues" /></a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README.zh-CN.md">中文</a>
</p>

**Skills** is a collection of AI agent skills for AI-powered editors. Install with a single command, enhance your AI coding assistant with domain-specific expertise.

Works with Cursor, Windsurf, Cline, Copilot, Codebuddy, Trae, and any editor supporting the Skills protocol.

## Available Skills

| Skill | Description |
|-------|-------------|
| [ntu-dissertation-expert](./skills/ntu-dissertation-expert/) | NTU EEE MSc dissertation LaTeX expert. Auto-clones template, sets up local compilation with live preview, and guides academic writing following official NTU guidelines. Cross-platform (macOS / Windows / Linux). |

## Marketplace

- skills.sh: [ntu-dissertation-expert](https://skills.sh/jackieyyang/skills/ntu-dissertation-expert)
- agentskill.sh: [AI Agent Skills Directory](https://agentskill.sh)

## Installation

```bash
npx skills add jackieyyang/skills
```

Install a specific skill:

```bash
npx skills add jackieyyang/skills --skill ntu-dissertation-expert
```

Install globally (available across all projects):

```bash
npx skills add jackieyyang/skills -g
```

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=jackieyyang/skills&type=date&legend=top-left)](https://www.star-history.com/#jackieyyang/skills&type=date&legend=top-left)

## License

[MIT](./LICENSE)
