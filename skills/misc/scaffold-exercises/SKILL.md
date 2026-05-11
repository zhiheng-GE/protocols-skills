---
name: scaffold-exercises
description: 创建包含 sections、problems、solutions 和 explainers 的课程练习目录结构，并确保通过 lint。用户想 scaffold exercises、创建 exercise stubs，或设置新 course section 时使用。
---

# Scaffold Exercises

创建能通过 `pnpm ai-hero-cli internal lint` 的练习目录结构，然后提交。

## 目录命名

- **Sections**：位于 `exercises/` 下，格式 `XX-section-name/`，例如 `01-retrieval-skill-building`。
- **Exercises**：位于 section 内，格式 `XX.YY-exercise-name/`，例如 `01.03-retrieval-with-bm25`。
- Section 编号 = `XX`，exercise 编号 = `XX.YY`。
- 名称使用 dash-case：小写、连字符。

## Exercise variants

每个 exercise 至少需要以下子目录之一：

- `problem/` — 学生工作区，包含 TODO；
- `solution/` — 参考实现；
- `explainer/` — 概念材料，不含 TODO。

## 流程

1. 确认要创建的 section/exercise 名称和编号。
2. 查看现有 `exercises/`，避免编号冲突。
3. 按现有课程约定复制最近似结构。
4. 创建必要 README、problem、solution、explainer 文件。
5. 确保 TODO、标题和元数据符合项目 lint。
6. 运行：

```bash
pnpm ai-hero-cli internal lint
```

7. 修复 lint 后提交。

## 规则

- 不要跳号，除非现有结构已经跳号。
- 不要创建空目录而没有可 lint 的内容。
- problem 和 solution 应保持同构，方便 diff。
- explainer 应解释概念，不应要求学生完成 TODO。
- 如果仓库没有 `pnpm` 或 `ai-hero-cli`，先探索项目实际 lint 命令。

## 输出

汇报：

- 创建的 section/exercise 路径；
- 包含哪些 variants；
- lint 命令和结果；
- commit hash（如果已提交）。
