Skills 按 bucket 组织在 `skills/` 目录下：

- `engineering/` — 日常代码工程工作
- `productivity/` — 日常非代码效率工具
- `misc/` — 较少使用但仍保留的工具
- `personal/` — 绑定作者个人设置，不对外推广
- `in-progress/` — 尚未准备发布的草稿
- `deprecated/` — 已不再使用

`engineering/`、`productivity/`、`misc/` 中的每个 skill 都必须：

1. 在顶层 `README.md` 中有引用；
2. 在 `.claude-plugin/plugin.json` 中有条目；
3. 在所属 bucket 的 `README.md` 中有一行说明，并且 skill 名必须链接到对应的 `SKILL.md`。

`personal/`、`in-progress/`、`deprecated/` 中的 skill 不得出现在顶层 `README.md` 或 `.claude-plugin/plugin.json` 中。

维护原则：

- 保留 skill 目录名、frontmatter `name` 和 slash command 英文名，方便兼容 Claude/Codex 与上游同步。
- 面向人的说明、流程和执行指令使用中文。
- 命令、路径、包名、label 示例、错误消息和代码片段保持原样。
- 修改公开 skill 后运行 `./scripts/check-consistency.sh`。
