---
name: git-guardrails-claude-code
description: 设置 Claude Code hooks，在危险 git 命令（push、reset --hard、clean、branch -D 等）执行前阻止它们。用户想防止破坏性 git 操作、添加 git safety hooks，或阻止 Claude Code 执行 git push/reset 时使用。
---

# Setup Git Guardrails

设置一个 `PreToolUse` hook，在 Claude 执行危险 git 命令前拦截并阻止。

## 会阻止什么

- `git push`（包括 `--force`）
- `git reset --hard`
- `git clean -f` / `git clean -fd`
- `git branch -D`
- `git checkout .` / `git restore .`

被阻止时，Claude 会看到一条消息，说明它无权执行这些命令。

## 步骤

### 1. 询问安装范围

询问用户安装到：

- **当前项目**：`.claude/settings.json`
- **所有项目**：`~/.claude/settings.json`

### 2. 安装脚本

将 `scripts/block-dangerous-git.sh` 复制到合适位置，例如：

```text
.claude/hooks/block-dangerous-git.sh
```

或全局：

```text
~/.claude/hooks/block-dangerous-git.sh
```

确保可执行：

```bash
chmod +x <path>/block-dangerous-git.sh
```

### 3. 配置 hook

在 Claude settings 中添加 `PreToolUse` hook，让它拦截 Bash 工具调用并执行脚本。

### 4. 验证

尝试让 Claude 执行一个被阻止命令，例如：

```bash
git push
```

确认 hook 阻止命令，并显示清晰错误消息。

## 注意

- 不要阻止安全只读命令，如 `git status`、`git diff`、`git log`。
- 如果用户明确授权推送，仍建议让用户自己在终端执行。
- hook 是安全护栏，不是权限系统；用户仍可手动运行命令。
