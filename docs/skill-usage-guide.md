# Agent Skills 使用场景指南

本文整理 `protocols-skills` 中公开稳定 skills 的使用场景，包含：

1. **中文对照表**：skill / 用途 / 典型提示词 / 适合阶段；
2. **实战 SOP**：按照“从需求到实现再到治理”的真实开发流程串联这些 skills。

---

## 一、Agent Skills 使用场景对照表

| Skill | 用途 | 典型提示词 | 适合阶段 |
|---|---|---|---|
| `grill-me` | 持续追问一个计划或设计，帮你把需求、边界和决策分支问清楚 | “帮我 grill me” / “你来追问我这个方案” / “帮我把这个需求问透” | 需求澄清、方案形成前 |
| `grill-with-docs` | 结合现有代码、术语、`CONTEXT.md`、ADR 追问方案，并沉淀项目语言 | “用 grill-with-docs 过一下这个方案” / “结合现有项目帮我澄清需求” | 中大型项目的需求澄清、架构讨论前 |
| `to-prd` | 把当前对话和上下文整理成 PRD | “把这个整理成 PRD” / “根据当前讨论生成 PRD” | 方案收口、准备进入执行 |
| `to-issues` | 把 PRD/计划拆成可执行、可并行的 issues | “把这个拆成 issues” / “拆成可执行任务” / “拆分 implementation tickets” | 项目规划、任务拆分 |
| `triage` | 给 issue / bug / 需求做分流和状态判断 | “帮我 triage 一下” / “整理这些 issue” / “判断这个需求该怎么分流” | Backlog 管理、需求流转 |
| `tdd` | 用红绿重构方式开发功能或修 bug | “用 TDD 做这个功能” / “test-first 修这个 bug” / “红绿重构来做” | 正式编码、实现阶段 |
| `prototype` | 快速做一次性原型，验证逻辑、状态机、数据模型或 UI 方案 | “先 prototype 一下” / “做个原型试试” / “做几个 UI 方案” | 设计验证、实现前探索 |
| `diagnose` | 系统化排查复杂 bug、异常行为或性能问题 | “diagnose this” / “debug 这个问题” / “帮我定位这个 bug” / “性能回退排查” | Bug 诊断、性能排查 |
| `zoom-out` | 从更高层次解释某块代码在系统里的位置和作用 | “zoom-out 一下这块代码” / “我不熟这块，给我全局地图” | 理解代码、接手陌生模块 |
| `improve-codebase-architecture` | 找出架构问题、浅模块、重构机会，提升可维护性 | “分析这个项目的架构问题” / “找代码库可改进点” / “帮我做架构体检” | 架构治理、重构规划 |
| `setup-matt-pocock-skills` | 初始化这套 skills 在某个 repo 中依赖的 issue tracker、标签、领域文档配置 | “先 setup 这套 skills” / “把 repo 配一下” | 仓库接入、首次使用前 |
| `caveman` | 开启极简回复模式，减少废话和 token 消耗 | “caveman mode” / “少说废话” / “更简短一点” / “less tokens” | 日常对话、快速技术沟通 |
| `write-a-skill` | 创建新的 skill，把某类经验或工作流沉淀成 agent 可复用能力 | “帮我写一个 skill” / “做一个新 skill” / “创建 code review skill” | 扩展技能库、流程沉淀 |
| `setup-pre-commit` | 给项目配置 Husky、lint-staged、Prettier、类型检查和测试钩子 | “帮我加 pre-commit” / “配置 Husky” / “提交前自动检查” | 工程化配置、项目治理 |
| `git-guardrails-claude-code` | 给 Claude Code 增加 git 安全护栏，阻止危险命令 | “防止 Claude 乱 push” / “加 git guardrails” / “阻止 reset --hard” | AI 安全治理、协作规范 |
| `migrate-to-shoehorn` | 把测试中的 `as` 断言迁移到 `@total-typescript/shoehorn` | “把测试里的 as 换掉” / “迁移到 shoehorn” | 测试治理、TypeScript 测试清理 |
| `scaffold-exercises` | 生成课程/练习项目的标准目录结构 | “创建 exercise 结构” / “生成练习目录” / “scaffold exercises” | 教学项目、练习仓库初始化 |

---

## 二、按开发阶段选择 Skill

| 阶段 | 推荐 Skill |
|---|---|
| 需求不清楚 | `grill-me` / `grill-with-docs` |
| 需要快速验证设计 | `prototype` |
| 需要整理正式需求文档 | `to-prd` |
| 需要拆任务 | `to-issues` |
| 需要管理 issue 状态 | `triage` |
| 开始正式开发 | `tdd` |
| 遇到 bug 或性能问题 | `diagnose` |
| 看不懂陌生代码 | `zoom-out` |
| 想优化架构 | `improve-codebase-architecture` |
| 初次接入仓库 | `setup-matt-pocock-skills` |
| 想让 AI 少废话 | `caveman` |
| 想新增团队专属 skill | `write-a-skill` |
| 想增强工程质量 | `setup-pre-commit` / `git-guardrails-claude-code` |

---

## 三、Agent Skills 实战 SOP

下面是一条更贴近真实开发的流程：从一个需求开始，到实现、排查、上线前治理。

---

### 0. 仓库首次接入

使用 skill：

```text
/setup-matt-pocock-skills
```

适合场景：

- 第一次在某个项目中使用这套 skills；
- 需要让 agent 知道 issue tracker、triage labels、`CONTEXT.md` 和 ADR 的位置；
- 后续希望 `to-prd`、`to-issues`、`triage` 能正确写入项目。

典型提示词：

```text
先 setup-matt-pocock-skills，把这个 repo 配好。
```

产出：

- 问题追踪器配置；
- 分流标签配置；
- 领域文档配置；
- `AGENTS.md` 或 `CLAUDE.md` 中的 agent skills 配置块。

---

### 1. 需求初始阶段：先把想法问清楚

简单项目使用：

```text
/grill-me
```

中大型项目使用：

```text
/grill-with-docs
```

适合场景：

- 只有一个大概想法；
- 目标、边界、用户、约束还不清楚；
- 不确定会影响哪些模块；
- 需要结合项目术语、`CONTEXT.md` 或 ADR 做判断。

推荐提示词：

```text
用 grill-with-docs 帮我过一下这个方案。
结合当前项目文档和代码，先追问我，把需求、边界和验收标准问清楚。
```

产出：

- 更清晰的需求；
- 明确的目标和非目标；
- 关键设计决策；
- 可能更新的 `CONTEXT.md`；
- 可能新增的 ADR。

---

### 2. 设计不确定时：先做原型

使用 skill：

```text
/prototype
```

适合场景：

- 状态机是否合理还不确定；
- 业务规则冲突时优先级不清楚；
- 数据模型是否支撑常见操作还需要验证；
- UI 布局、信息架构或交互方式还需要比较。

业务逻辑原型提示词：

```text
先 prototype 一下这个状态流，做一个一次性终端原型，让我能跑几种典型场景。
```

UI 原型提示词：

```text
帮我 prototype 几个 UI 方案，放在一个可切换的 route 里。
```

产出：

- 一次性原型；
- 可运行 demo；
- 几种方案对比；
- 对设计是否成立的判断。

---

### 3. 需求收口：生成 PRD

使用 skill：

```text
/to-prd
```

适合场景：

- 已经通过讨论或 prototype 确认方向；
- 需要把上下文整理成正式需求文档；
- 需要交给工程师或 agent 继续执行。

推荐提示词：

```text
把我们当前讨论的内容整理成 PRD。
使用项目领域语言，包含目标、非目标、方案、模块影响、验收标准和测试计划。
```

产出：

- Problem Statement；
- Goals；
- Non-Goals；
- Users / Use Cases；
- Proposed Solution；
- Modules / Architecture；
- Acceptance Criteria；
- Test Plan；
- Risks / Open Questions。

---

### 4. 拆分执行任务

使用 skill：

```text
/to-issues
```

适合场景：

- PRD 已经基本清楚；
- 需要拆成可以独立执行的任务；
- 希望多个 agent 或工程师并行推进。

推荐提示词：

```text
把这个 PRD 拆成可独立执行的 issues。
请按垂直切片拆分，不要拆成单纯前端/后端/数据库任务。
```

拆分原则：

- 优先拆成“用户可以完成一次完整操作”的垂直切片；
- 避免只建表、只写接口、只做 UI、只写测试等水平切片。

产出：

- 多个 issue；
- 每个 issue 的背景、行为、验收标准；
- 实施提示；
- 测试建议；
- 依赖关系。

---

### 5. Issue 分流和执行准备

使用 skill：

```text
/triage
```

适合场景：

- issue 已创建，但状态还不清晰；
- 需要判断信息是否足够；
- 需要判断是否可交给 agent 独立完成；
- 需要区分 `needs-info`、`ready-for-agent`、`out-of-scope` 等状态。

推荐提示词：

```text
帮我 triage 这些 issues，判断哪些 ready-for-agent，哪些 needs-info，哪些 out-of-scope。
```

产出：

- 每个 issue 的分流角色；
- 缺失信息列表；
- agent brief；
- out-of-scope 判断说明。

---

### 6. 正式开发：用 TDD 推进

使用 skill：

```text
/tdd
```

适合场景：

- 开始实现某个明确 issue；
- 修复一个行为明确的 bug；
- 希望通过测试约束 AI 不乱写代码。

推荐提示词：

```text
用 TDD 实现这个 issue。
先写一个失败测试，再写最小实现，然后重构。
测试要通过公共接口验证行为，不要测实现细节。
```

工作方式：

```text
Red       写一个失败测试
Green     写最少代码让测试通过
Refactor  在测试保护下优化设计
```

产出：

- 行为测试；
- 最小实现；
- 重构后的代码；
- 验证命令和结果。

---

### 7. 开发中看不懂代码：先 zoom out

使用 skill：

```text
/zoom-out
```

适合场景：

- 你或 agent 不熟某块代码；
- 准备修改陌生模块；
- 需要先理解上下游关系和数据流。

推荐提示词：

```text
对这个模块 zoom-out 一下。
给我相关模块、调用方、数据流、风险点的地图。
```

产出：

- 模块职责；
- 上下游调用关系；
- 数据流；
- 关键接口；
- 修改风险点；
- 相关 ADR / `CONTEXT.md` 术语。

---

### 8. 遇到 bug：不要猜，用 diagnose

使用 skill：

```text
/diagnose
```

适合场景：

- 难复现 bug；
- 测试失败；
- 性能回退；
- 线上异常；
- agent 开始猜原因。

推荐提示词：

```text
diagnose 这个 bug。
先建立可重复的反馈循环，再缩小范围、提出假设、插桩验证，最后修复并加回归测试。
```

工作方式：

```text
复现 → 缩小范围 → 提出假设 → 插桩验证 → 修复 → 回归测试
```

产出：

- 稳定复现方式；
- 根因；
- 修复；
- 回归测试；
- 验证结果。

---

### 9. 功能完成后：做架构复盘

使用 skill：

```text
/improve-codebase-architecture
```

适合场景：

- 功能开发完成后想复盘设计；
- 项目越来越难改；
- 模块边界不清；
- 测试越来越难写；
- agent 在代码库里容易迷路。

推荐提示词：

```text
帮我分析这个代码库的架构改进机会。
重点找 shallow modules、错误 seam、重复规则、难测试模块。
```

适合发现：

- 模块太浅；
- 接口设计差；
- 调用方知道太多；
- 规则散落；
- 测试难写；
- 改一点动很多地方。

产出：

- 架构地图；
- 深模块机会；
- 推荐重构顺序；
- 测试建议；
- 风险评估。

---

### 10. 工程质量治理

#### 配置 pre-commit

使用 skill：

```text
/setup-pre-commit
```

推荐提示词：

```text
帮我给这个项目配置 pre-commit，包含 prettier、lint-staged、typecheck 和 test。
```

#### 增加 Git 安全护栏

使用 skill：

```text
/git-guardrails-claude-code
```

推荐提示词：

```text
给 Claude Code 加 git guardrails，阻止 git push、reset --hard、clean 等危险操作。
```

#### 清理 TypeScript 测试断言

使用 skill：

```text
/migrate-to-shoehorn
```

推荐提示词：

```text
把测试文件里的 as 断言迁移到 @total-typescript/shoehorn。
```

---

### 11. 日常沟通优化

使用 skill：

```text
/caveman
```

适合场景：

- AI 回复太长；
- 希望减少 token；
- 希望更像工程师之间的直接沟通。

推荐提示词：

```text
进入 caveman mode，后面都简短回答。
```

效果：

- 少废话；
- 更短；
- 保留技术准确性。

---

### 12. 沉淀自己的团队经验

使用 skill：

```text
/write-a-skill
```

适合场景：

当你发现某类工作反复出现，例如：

- code review；
- 发版检查；
- 数据库迁移；
- 接口联调；
- 线上排障；
- 文档生成。

推荐提示词：

```text
帮我写一个 code-review skill。
它应该检查类型、测试、边界情况、错误处理和可维护性。
```

产出：

- 新的 `SKILL.md`；
- 触发条件；
- 执行流程；
- 输出格式；
- 可选脚本或参考文件。

---

## 四、完整推荐流水线

如果要做一个中等复杂功能，推荐这样使用：

```text
1. /setup-matt-pocock-skills
   ↓
2. /grill-with-docs
   ↓
3. /prototype   如果设计不确定
   ↓
4. /to-prd
   ↓
5. /to-issues
   ↓
6. /triage
   ↓
7. /tdd
   ↓
8. /diagnose   如果遇到 bug
   ↓
9. /zoom-out   如果遇到陌生代码
   ↓
10. /improve-codebase-architecture
```

---

## 五、团队 README 推荐使用流程

如果要在团队 README 中放一个极简版本，可以使用：

```markdown
## 推荐使用流程

1. 新仓库接入：`/setup-matt-pocock-skills`
2. 需求澄清：`/grill-with-docs`
3. 设计验证：`/prototype`
4. 需求文档：`/to-prd`
5. 任务拆分：`/to-issues`
6. Issue 分流：`/triage`
7. 开发实现：`/tdd`
8. Bug 排查：`/diagnose`
9. 代码理解：`/zoom-out`
10. 架构复盘：`/improve-codebase-architecture`
```

---

## 六、最短记忆版

| 你现在要做什么 | 优先使用 |
|---|---|
| 需求不清楚 | `grill-me` / `grill-with-docs` |
| 想快速验证设计 | `prototype` |
| 要整理成 PRD | `to-prd` |
| 要拆任务 | `to-issues` |
| 要管理 issue 状态 | `triage` |
| 要正式开发 | `tdd` |
| 遇到 bug | `diagnose` |
| 看不懂代码 | `zoom-out` |
| 想优化架构 | `improve-codebase-architecture` |
| 想新增 skill | `write-a-skill` |
