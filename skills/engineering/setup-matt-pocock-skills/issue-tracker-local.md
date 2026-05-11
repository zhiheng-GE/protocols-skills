# 问题追踪器：本地 Markdown

本仓库使用本地 markdown 文件作为问题追踪器。

## 位置

默认位置：

```text
.scratch/issues/
```

每个 issue 一个 `.md` 文件，文件名使用递增编号和短标题：

```text
0001-short-title.md
```

## 字段

每个文件至少包含：

- 标题；
- 当前分流角色；
- 背景；
- 验收标准；
- 备注/评论。

## 规则

- 使用 `docs/agents/triage-labels.md` 的角色名。
- 不要把本地 issue 当成 GitHub issue URL。
- 如果未来迁移到真实 issue tracker，保留编号映射。
