# Skills

<p align="center">
  <img src="./assets/icon.png" alt="Skills" width="500" />
</p>

<p align="center">
  <a href="https://github.com/jackieyyang/skills/blob/main/LICENSE"><img src="https://img.shields.io/github/license/jackieyyang/skills?style=flat-square" alt="LICENSE" /></a>
  <a href="https://github.com/jackieyyang/skills/stargazers"><img src="https://img.shields.io/github/stars/jackieyyang/skills?style=flat-square" alt="Stars" /></a>
  <a href="https://github.com/jackieyyang/skills/network/members"><img src="https://img.shields.io/github/forks/jackieyyang/skills?style=flat-square" alt="Forks" /></a>
  <a href="https://github.com/jackieyyang/skills/issues"><img src="https://img.shields.io/github/issues/jackieyyang/skills?style=flat-square" alt="Issues" /></a>
</p>

<p align="center">
  <a href="./README.md">English</a> | 中文
</p>

**Skills** 是一系列适用于 AI 编程编辑器的智能体技能集合。一行命令安装，为你的 AI 编程助手注入专业领域知识。

支持 Cursor、Windsurf、Cline、Copilot、Codebuddy、Trae 以及所有兼容 Skills 协议的编辑器。

## 可用技能

技能按类别存放在 `skills/<类别>/<技能>/` 下。

### Claude Code（`skills/claude-code/`）

| 技能 | 描述 |
|------|------|
| [cc-statusline](./skills/claude-code/cc-statusline/) | 一键安装两行式 Claude Code 状态栏（Dracula 主题）：模型、带 token 数的上下文进度条、费用、推理强度、git 与 worktree，以及 5h / 7d 额度和重置倒计时。安装前自动备份，只改动 `statusLine` 配置。 |

### 开发（`skills/dev/`）

| 技能 | 描述 |
|------|------|
| [git-commit](./skills/dev/git-commit/) | 按约定式提交（Conventional Commits）规范生成提交信息，根据实际 diff 判断 type 和 scope。 |

### 学术（`skills/academic/`）

| 技能 | 描述 |
|------|------|
| [ntu-dissertation-expert](./skills/academic/ntu-dissertation-expert/) | NTU EEE 硕士论文 LaTeX 专家。自动克隆模板、配置本地编译与实时预览、遵循 NTU 官方格式规范指导学术写作。跨平台支持（macOS / Windows / Linux）。 |

## 市场页

- skills.sh: [ntu-dissertation-expert](https://skills.sh/jackieyyang/skills/ntu-dissertation-expert)
- agentskill.sh: [AI Agent Skills Directory](https://agentskill.sh)

## 安装

```bash
npx skills add jackieyyang/skills
```

安装指定技能：

```bash
npx skills add jackieyyang/skills --skill ntu-dissertation-expert
```

全局安装（所有项目可用）：

```bash
npx skills add jackieyyang/skills -g
```

## Star 历史

[![Star History Chart](https://api.star-history.com/svg?repos=jackieyyang/skills&type=date&legend=top-left)](https://www.star-history.com/#jackieyyang/skills&type=date&legend=top-left)

## 许可证

[MIT](./LICENSE)
