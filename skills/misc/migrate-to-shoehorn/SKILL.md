---
name: migrate-to-shoehorn
description: 将测试文件中的 `as` 类型断言迁移到 @total-typescript/shoehorn。用户提到 shoehorn、想替换测试里的 `as`，或需要 partial test data 时使用。
---

# Migrate to Shoehorn

## 为什么用 shoehorn？

`shoehorn` 允许你在测试中传入 partial data，同时保持 TypeScript 友好。它用类型安全替代方案替换 `as` 断言。

**只用于测试代码。** 不要在生产代码中使用 shoehorn。

测试中 `as` 的问题：

- 训练坏习惯；
- 必须手动指定目标类型；
- 对故意错误数据常出现 double-as（`as unknown as Type`）；
- 容易绕过真实类型问题。

## 安装

```bash
npm i -D @total-typescript/shoehorn
```

根据项目包管理器改用 `pnpm add -D`、`yarn add -D` 或 `bun add -d`。

## 迁移规则

只改测试文件，例如：

- `*.test.ts`
- `*.spec.ts`
- `__tests__/`
- 测试 fixture/helper 文件

不要改生产代码。

## 替换模式

### 简单 partial object

之前：

```ts
const user = { id: '1' } as User
```

之后：

```ts
import { shoehorn } from '@total-typescript/shoehorn'

const user = shoehorn<User>({ id: '1' })
```

### 故意错误数据

之前：

```ts
const input = { count: 'bad' } as unknown as Input
```

之后：

```ts
const input = shoehorn<Input>({ count: 'bad' })
```

## 流程

1. 查找测试文件中的 ` as `、`as unknown as`、`as Type`。
2. 确认断言是测试数据构造，而不是必要的 TypeScript narrowing。
3. 安装依赖。
4. 替换为 `shoehorn<Type>(...)`。
5. 合并重复 import。
6. 运行测试和 typecheck。

## 不要迁移

- 生产代码；
- 合法的 const assertion：`as const`；
- DOM/event narrowing 中不可避免的断言；
- 第三方库类型缺陷的临时 workaround，除非它在测试 fixture 中。

## 输出

汇报：

- 修改了哪些测试文件；
- 替换了多少处断言；
- 运行了哪些验证命令；
- 保留了哪些 `as` 以及原因。
