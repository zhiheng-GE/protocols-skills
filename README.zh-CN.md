# Matt Pocock Skills 中文项目说明

这是一个面向真实软件工程场景的 **AI Agent Skills（智能体技能）集合**。项目中的每个技能都以 `SKILL.md` 的形式存在，可以被 Claude Code、Codex 或其他支持技能机制的 AI 编程助手加载使用。

项目目标不是让 AI “随便写代码”，而是把成熟的软件工程实践沉淀成一组小而清晰、可组合、可修改的工作流，让智能体在开发、调试、需求澄清、架构改进和任务拆分时更稳定、更可靠。

---

## 项目定位

现代 AI 编程助手很容易出现以下问题：

1. **没有真正理解需求**  
   用户以为自己说清楚了，但智能体实现出来后才发现方向不对。

2. **表达啰嗦、术语不统一**  
   智能体不了解项目中的领域语言，解释问题时经常绕远。

3. **代码缺少反馈闭环**  
   没有测试、类型检查、复现步骤或调试流程，智能体容易盲目修改。

4. **代码架构逐渐变差**  
   AI 加速了编码，也可能加速技术债和复杂度膨胀。

本项目通过一系列技能来解决这些问题，例如：

- 在动手前进行需求追问；
- 把需求转成 PRD 或 issue；
- 使用 TDD 建立红绿重构循环；
- 用系统化调试流程定位问题；
- 维护项目领域语言和架构决策记录；
- 定期分析代码架构改进机会。

---

## 目录结构

```text
.
├── README.md                    # 中文项目说明和技能索引
├── README.zh-CN.md              # 中文项目说明
├── CONTEXT.md                   # 项目领域语言和术语说明
├── CLAUDE.md                    # 仓库维护规则
├── LICENSE                      # 开源许可证
├── .claude-plugin/
│   └── plugin.json              # Claude 插件技能清单
├── docs/
│   └── adr/                     # 架构决策记录 ADR
├── scripts/
│   ├── list-skills.sh           # 列出所有技能
│   └── link-skills.sh           # 将技能软链接到 ~/.claude/skills
└── skills/
    ├── engineering/             # 工程开发类技能
    ├── productivity/            # 通用效率类技能
    ├── misc/                    # 较少使用的辅助技能
    ├── personal/                # 作者个人工作流技能
    ├── in-progress/             # 开发中的实验技能
    └── deprecated/              # 已废弃技能
```

---

## 技能分类

### 1. Engineering：工程开发类技能

这些技能用于日常代码开发、调试、架构分析和任务管理。

| 技能 | 作用 |
| --- | --- |
| [`diagnose`](./skills/engineering/diagnose/SKILL.md) | 用系统化流程调试复杂 bug 或性能问题：复现、缩小范围、提出假设、插桩、修复、回归测试。 |
| [`grill-with-docs`](./skills/engineering/grill-with-docs/SKILL.md) | 在开发前对需求进行深入追问，同时维护项目领域语言 `CONTEXT.md` 和 ADR。 |
| [`triage`](./skills/engineering/triage/SKILL.md) | 按状态机流程对 issue 进行分流和标记。 |
| [`improve-codebase-architecture`](./skills/engineering/improve-codebase-architecture/SKILL.md) | 分析代码库中的架构改进机会，帮助降低复杂度。 |
| [`setup-matt-pocock-skills`](./skills/engineering/setup-matt-pocock-skills/SKILL.md) | 初始化本技能集合需要的项目级配置。 |
| [`tdd`](./skills/engineering/tdd/SKILL.md) | 以红绿重构方式进行测试驱动开发。 |
| [`to-issues`](./skills/engineering/to-issues/SKILL.md) | 将计划、PRD 或方案拆分成可以独立执行的 issue。 |
| [`to-prd`](./skills/engineering/to-prd/SKILL.md) | 根据当前对话上下文生成 PRD，并提交为 issue。 |
| [`zoom-out`](./skills/engineering/zoom-out/SKILL.md) | 让智能体从更高层次解释代码或系统上下文。 |
| [`prototype`](./skills/engineering/prototype/SKILL.md) | 快速构建一次性原型，用于验证设计或业务逻辑。 |

---

### 2. Productivity：通用效率类技能

这些技能不局限于代码开发，适合用于沟通、规划和写作。

| 技能 | 作用 |
| --- | --- |
| [`caveman`](./skills/productivity/caveman/SKILL.md) | 超压缩沟通模式，减少冗余表达，保留技术准确性。 |
| [`grill-me`](./skills/productivity/grill-me/SKILL.md) | 对一个计划或设计进行高强度追问，帮助用户澄清所有关键分支。 |
| [`write-a-skill`](./skills/productivity/write-a-skill/SKILL.md) | 帮助创建新的技能，并遵循项目的技能结构和写作规范。 |

---

### 3. Misc：辅助类技能

这些技能较少使用，但在特定场景下很有价值。

| 技能 | 作用 |
| --- | --- |
| [`git-guardrails-claude-code`](./skills/misc/git-guardrails-claude-code/SKILL.md) | 为 Claude Code 设置 Git 安全钩子，阻止危险命令。 |
| [`migrate-to-shoehorn`](./skills/misc/migrate-to-shoehorn/SKILL.md) | 将测试文件中的 `as` 类型断言迁移到 `@total-typescript/shoehorn`。 |
| [`scaffold-exercises`](./skills/misc/scaffold-exercises/SKILL.md) | 创建课程练习目录结构，包括题目、解答和讲解。 |
| [`setup-pre-commit`](./skills/misc/setup-pre-commit/SKILL.md) | 配置 Husky、lint-staged、Prettier、类型检查和测试等 pre-commit 流程。 |

---

> `personal/`、`in-progress/` 和 `deprecated/` 中的技能不属于公开稳定技能，因此不在顶层 README 展示。需要查看时，请进入对应 bucket 的 README。

---

## 快速使用

官方推荐安装方式：

```bash
npx skills@latest add mattpocock/skills
```

安装过程中选择需要的技能，并确保选择：

```text
/setup-matt-pocock-skills
```

安装后，在智能体中运行：

```text
/setup-matt-pocock-skills
```

该技能会引导你完成项目级配置，例如：

- 使用哪种 issue tracker：GitHub、Linear 或本地文件；
- triage 流程中使用哪些标签；
- 生成的文档保存在哪里。

---

## 本地脚本

### 列出所有技能

```bash
./scripts/list-skills.sh
```

该脚本会查找仓库内所有 `SKILL.md` 文件。

### 链接稳定公开技能到 Claude 全局目录

推荐中文团队使用：

```bash
./scripts/link-public-skills.sh
```

该脚本只安装稳定公开技能：

```text
skills/engineering/*
skills/productivity/*
skills/misc/*
```

并将它们软链接到：

```text
~/.claude/skills
```

### 链接所有非废弃技能

如果你也想安装 `personal/` 和 `in-progress/` 中的技能，可以使用：

```bash
./scripts/link-skills.sh
```

该脚本会排除 `deprecated/`，但会安装 `personal/` 和 `in-progress/`。

### 安装到 Codex

Codex 可使用相同的软链接思路：

```bash
mkdir -p ~/.codex/skills
CLAUDE_SKILLS_DIR=~/.codex/skills ./scripts/link-public-skills.sh
```

### 更新已安装技能

如果使用软链接方式安装，更新源仓库即可：

```bash
cd /Users/cds-dn-222/Downloads/AI_PROJECT/protocols-skills
git pull
./scripts/link-public-skills.sh
```

已有技能内容会立即来自最新仓库；重新运行脚本是为了链接新增技能。

### 一致性检查

修改公开技能、README 或插件清单后运行：

```bash
./scripts/check-consistency.sh
```

它会检查：

- 公开 skills 是否都在顶层 `README.md` 中有链接；
- 公开 skills 是否都在对应 bucket README 中有链接；
- 公开 skills 是否都在 `.claude-plugin/plugin.json` 中；
- `personal/`、`in-progress/`、`deprecated/` 是否没有误加入插件清单；
- 所有 `SKILL.md` 是否包含基本 frontmatter。

---

## 项目维护规则

根据 `CLAUDE.md`：

- `engineering/`、`productivity/`、`misc/` 下的技能应当：
  - 出现在顶层 `README.md`；
  - 出现在 `.claude-plugin/plugin.json`；
  - 在对应 bucket 的 `README.md` 中有一行说明。

- `personal/`、`in-progress/`、`deprecated/` 下的技能不应出现在顶层 README 或插件清单中。

当前项目通过 `./scripts/check-consistency.sh` 校验 README、bucket README 和 `.claude-plugin/plugin.json` 的一致性。修改公开技能、插件清单或 README 后应运行该脚本。

---

## 设计理念

这个项目强调：

1. **小技能，而不是大框架**  
   每个技能解决一个明确问题，便于理解、替换和组合。

2. **工程纪律优先**  
   需求澄清、TDD、调试、架构维护等传统工程实践仍然重要。

3. **用户保留控制权**  
   技能用于增强智能体，而不是让智能体完全接管开发流程。

4. **文档即上下文**  
   `CONTEXT.md` 和 ADR 帮助智能体理解项目语言和历史决策，减少重复解释。

5. **反馈循环决定速度**  
   测试、类型检查、复现步骤和调试日志是让 AI 稳定工作的关键。

---

## 适合谁使用

本项目适合：

- 使用 Claude Code、Codex 或类似 AI 编程助手的开发者；
- 希望让 AI 更符合真实工程流程的团队；
- 经常需要把需求拆成 PRD、issue 或开发任务的人；
- 希望通过 TDD、调试流程和架构复盘提升 AI 产出质量的人；
- 想学习如何编写高质量 Agent Skill 的开发者。

---

## 建议后续改进

可以考虑增加：

1. `scripts/check-consistency.sh`  
   自动检查 `README.md`、bucket README 和 `.claude-plugin/plugin.json` 是否一致。

2. 更精确的安装脚本过滤规则  
   例如只安装 `engineering/`、`productivity/` 和 `misc/`。

3. 中文技能索引  
   为每个技能补充中文说明，方便中文团队使用。

4. Codex 适配说明  
   如果要在 Codex 环境中使用，可以补充安装路径、触发方式和注意事项。

---

## 一句话总结

这是一个把真实软件工程经验封装成 AI Agent 可复用技能的项目，核心价值是让智能体在需求澄清、任务拆分、TDD、调试和架构维护中更可控、更可靠。
