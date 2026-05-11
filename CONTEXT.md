# Matt Pocock Skills

这是一个由 Claude Code 等 agent 加载的 skills（slash commands 和行为指令）集合。Skills 按 bucket 组织，并由 `/setup-matt-pocock-skills` 生成的每仓库配置消费。

## 语言

**问题追踪器（Issue tracker）**：
承载仓库问题/工作项的工具，例如 GitHub Issues、Linear、本地 `.scratch/` markdown 约定，或类似系统。`to-issues`、`to-prd`、`triage` 等技能会从这里读取和写入。
_避免使用_：backlog manager、backlog backend、issue host

**问题 / 工作项（Issue）**：
问题追踪器中的单个可追踪工作单元，可以是 bug、任务、PRD，或 `to-issues` 生成的切片。
_避免使用_：ticket（除非引用外部系统原文）

**分流角色（Triage role）**：
分流期间应用到问题/工作项上的规范状态机标签，例如 `needs-triage`、`ready-for-afk`。每个角色都会通过 `docs/agents/triage-labels.md` 映射到问题追踪器中的真实标签字符串。

**深模块（Deep module）**：
用较小、稳定、可测试的接口封装较多行为的模块。与“浅模块”相对。

**接口（Interface）**：
调用方为了使用模块必须知道的一切：类型、约束、不变量、错误模式、调用顺序、配置等。不只是类型签名。

**接缝（Seam）**：
接口所在的位置；可以改变行为而不必原地修改调用方的地方。优先使用“接缝”，不要泛泛说“边界”。

**适配器（Adapter）**：
在接缝处满足某个接口的具体实现。

**曳光弹式垂直切片（Tracer bullet vertical slice）**：
端到端穿过所有相关集成层的一小片可交付功能，用来降低不确定性并尽早获得反馈。

## 关系

- 一个问题追踪器包含多个问题/工作项。
- 一个问题/工作项在任意时刻只有一个分流角色。
- 一个深模块通过小接口提供高杠杆行为。
- 接缝承载接口，适配器在接缝处接入具体实现。

## 已澄清的歧义

- “backlog” 曾同时表示托管问题的工具和其中的工作集合。已统一：工具称为 **问题追踪器**；“backlog” 不作为领域术语使用。
- “backlog backend” / “backlog manager” 已收敛为 **问题追踪器**。
