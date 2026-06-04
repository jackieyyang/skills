---
name: git-commit
description: "Create standardized, semantic git commits using the Conventional Commits specification. Analyze the actual diff to determine appropriate type, scope, and message."
---

# Git 提交规范

- 提交信息必须符合约定式提交规范：`<type>[optional scope]: <description>`
- `description` 使用中文，例如 `docs: 更新 Agent 提交说明`、`fix(config): 修复空配置处理`
- 常用 `type`：
  - `feat`: 新增功能
  - `fix`: 修复 bug
  - `build`: 修改项目构建系统，例如依赖库、外部接口或 Node 版本
  - `chore`: 修改非业务性代码，例如构建流程或工具配置
  - `ci`: 修改持续集成流程，例如 Travis、Jenkins 等工作流配置
  - `docs`: 修改文档，例如 README 或 API 文档
  - `style`: 修改代码样式，例如缩进、空格、空行等，不影响功能逻辑
  - `refactor`: 重构代码，例如代码结构、变量名、函数名调整，不新增功能也不修复 bug
  - `perf`: 优化性能，例如提升执行效率或减少内存占用
  - `test`: 新增、删除或修改测试用例
- 破坏性变更使用 `!` 或脚注 `BREAKING CHANGE: <description>` 标记
- 除 `BREAKING CHANGE: <description>` 外，脚注应采用类似 Git trailer 的格式