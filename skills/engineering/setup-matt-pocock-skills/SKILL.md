---
name: setup-matt-pocock-skills
description: 在 AGENTS.md/CLAUDE.md 和 docs/agents/ 中设置 `## Agent skills` 配置块，让工程 skills 知道当前仓库的问题追踪器（GitHub/GitLab/local markdown）、分流标签词汇和领域文档布局。首次使用 `to-issues`、`to-prd`、`triage`、`diagnose`、`tdd`、`improve-codebase-architecture` 或 `zoom-out` 前运行；如果这些 skills 缺少上下文，也应运行。
disable-model-invocation: true
---

# Setup Matt Pocock's Skills

初始化工程 skills 依赖的每仓库配置：

- **问题追踪器** — 问题/工作项存放在哪里。默认支持 GitHub，也支持 GitLab 和本地 markdown。
- **分流标签** — 五个规范分流角色使用的真实标签字符串。
- **领域文档** — `CONTEXT.md` 和 ADR 的位置，以及使用它们的规则。

这是提示驱动的 skill，不是确定性脚本。先探索，展示发现，向用户确认，然后写入。

## 流程

### 1. 探索

查看当前仓库的起始状态，不要假设：

- `git remote -v` 和 `.git/config` — 这是 GitHub/GitLab 仓库吗？哪个仓库？
- 根目录 `AGENTS.md` 和 `CLAUDE.md` — 是否存在？是否已有 `## Agent skills` 区块？
- `CONTEXT.md`、`docs/adr/`、`docs/decisions/` — 是否已有领域文档或 ADR？
- `.github/`、`.gitlab/`、issue 模板、label 文档 — 是否能推断问题追踪器和标签？
- `.scratch/`、`docs/agents/` — 是否已有本地问题约定？

### 2. 给出推荐配置

向用户展示推荐值：

- 问题追踪器：GitHub / GitLab / local markdown。
- 分流标签：五个角色映射到哪些真实 label。
- 领域文档位置：`CONTEXT.md` 和 `docs/adr/` 或现有等价位置。
- 要写入 `AGENTS.md` 还是 `CLAUDE.md`。

如果无法从仓库判断，给出默认推荐并询问确认。

### 3. 写入配置

创建或更新：

```text
docs/agents/issue-tracker.md
docs/agents/triage-labels.md
docs/agents/domain-docs.md
```

并在 `AGENTS.md` 或 `CLAUDE.md` 中加入：

```markdown
## Agent skills

- 问题追踪器配置：`docs/agents/issue-tracker.md`
- 分流标签配置：`docs/agents/triage-labels.md`
- 领域文档配置：`docs/agents/domain-docs.md`
```

如果文件已有等价内容，更新而不是重复追加。

### 4. 验证

确认：

- 三个 `docs/agents/` 文件存在且内容明确；
- agent 指令文件中只有一个 `## Agent skills` 区块；
- 硬依赖 skills（`to-issues`、`to-prd`、`triage`）能根据这些文件知道写到哪里、打什么标签；
- 软依赖 skills 能找到领域语言和 ADR。

## 配套模板

本目录提供：

- [issue-tracker-github.md](issue-tracker-github.md)
- [issue-tracker-gitlab.md](issue-tracker-gitlab.md)
- [issue-tracker-local.md](issue-tracker-local.md)
- [triage-labels.md](triage-labels.md)
- [domain.md](domain.md)

根据仓库情况复制并调整，不要盲目照抄。
