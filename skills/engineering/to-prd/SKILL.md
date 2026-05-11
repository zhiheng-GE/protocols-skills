---
name: to-prd
description: 将当前对话上下文整理为 PRD，并发布到项目问题追踪器。用户想从当前上下文创建 PRD 时使用。
---

这个 skill 会基于当前对话上下文和代码库理解生成 PRD。**不要采访用户**，只综合已知信息。

问题追踪器和分流标签词汇应已提供；如果没有，请运行 `/setup-matt-pocock-skills`。

## 流程

1. 如果尚未探索仓库，先了解当前代码库状态。整个 PRD 使用项目领域词汇，并尊重相关 ADR。

2. 概述完成实现需要构建或修改的主要模块。主动寻找可以提取为深模块、并能独立测试的机会。

   深模块是用简单、可测试、很少变化的接口封装大量功能的模块。

   向用户确认这些模块是否符合预期，并确认哪些模块需要测试。

3. 使用下面模板编写 PRD，然后发布到问题追踪器。应用 `ready-for-agent` 分流标签或项目配置中的等价标签；不需要额外 triage。

<prd-template>

## Problem Statement

我们要解决什么问题？谁受影响？为什么现在重要？

## Goals

- ...

## Non-Goals

- ...

## Users / Use Cases

- ...

## Proposed Solution

描述用户可见行为和系统行为。使用项目领域语言。

## Modules / Architecture

- 要新增或修改的模块；
- 关键接口和接缝；
- 可以成为深模块的地方；
- 相关 ADR 或需要新增的 ADR。

## Acceptance Criteria

- [ ] ...
- [ ] ...

## Test Plan

- ...

## Risks / Open Questions

- ...

</prd-template>

## 写作规则

- 不要编造用户没有给出的需求；将不确定内容放到 `Risks / Open Questions`。
- 不要写实现清单替代 PRD；PRD 应先描述问题、行为和验收。
- 具体到足以让 `to-issues` 拆分，但不要把每个小任务都展开。
- 如果写入问题追踪器失败，输出 PRD 正文和失败原因。

## 输出

汇报 PRD issue 链接/编号、应用的 label、以及任何开放问题。
