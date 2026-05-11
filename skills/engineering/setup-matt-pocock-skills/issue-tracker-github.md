# 问题追踪器：GitHub Issues

本仓库使用 GitHub Issues 作为问题追踪器。

## 读取

- 使用 `gh issue view <number> --comments` 读取 issue 和评论。
- 使用 `gh issue list` 按 label、assignee、state 查询。
- 如果 `gh` 不可用，使用用户提供的 URL 或本地上下文。

## 写入

- 创建 issue：`gh issue create`。
- 更新 label：`gh issue edit <number> --add-label <label>` / `--remove-label <label>`。
- 发表评论：`gh issue comment <number> --body-file <file>`。

## 约定

- 使用 `docs/agents/triage-labels.md` 中的真实 label 字符串。
- AI 生成的 triage 评论必须包含项目要求的免责声明。
- 不要假设 label 存在；如果命令失败，向用户报告缺失 label。
