---
name: setup-pre-commit
description: 在当前 repo 设置 Husky pre-commit hooks，集成 lint-staged（Prettier）、类型检查和测试。用户想添加 pre-commit hooks、设置 Husky、配置 lint-staged，或加入提交时格式化/typechecking/testing 时使用。
---

# Setup Pre-Commit Hooks

## 会设置什么

- **Husky** pre-commit hook
- **lint-staged** 对 staged files 运行 Prettier
- **Prettier** config（如果缺失）
- pre-commit 中的 **typecheck** 和 **test** scripts

## 步骤

### 1. 检测包管理器

检查：

- `package-lock.json` → npm
- `pnpm-lock.yaml` → pnpm
- `yarn.lock` → yarn
- `bun.lockb` → bun

如果不明确，默认 npm。

### 2. 安装依赖

安装 devDependencies：

```text
husky
lint-staged
prettier
```

使用项目包管理器对应命令。

### 3. 配置 scripts

在 `package.json` 中确保有：

- `prepare` 用于 Husky；
- `format` 或 lint-staged 配置；
- `typecheck`；
- `test`。

如果项目已有等价命令，沿用现有命令名，不要重复创建。

### 4. 配置 lint-staged

只格式化 staged 文件，避免提交时重写整个仓库。

示例：

```json
{
  "lint-staged": {
    "*.{js,jsx,ts,tsx,json,md,css}": "prettier --write"
  }
}
```

### 5. 创建 Husky hook

pre-commit 应运行：

1. `lint-staged`
2. `typecheck`
3. `test`

如果测试太慢，向用户确认是否只运行 related tests。不要自行移除测试。

### 6. 验证

运行：

```bash
npm run typecheck
npm test
npx lint-staged --debug
```

根据包管理器调整命令。

## 注意

- 不要覆盖已有 Husky hooks；合并。
- 不要引入与项目格式化工具冲突的 Prettier 配置。
- 不要格式化全仓库，除非用户明确要求。
- 如果是 monorepo，确认 hook 应放在根目录还是 package 目录。

## 输出

汇报：

- 安装了哪些依赖；
- 修改了哪些配置；
- pre-commit 会运行什么；
- 验证命令和结果。
