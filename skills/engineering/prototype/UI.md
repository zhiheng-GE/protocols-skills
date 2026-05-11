# UI Prototype

用于快速比较多个界面方向，而不是打磨一个方案。

## 形态

在项目现有路由系统中新增一个清楚标记为 prototype 的 route 或页面。一个 route 内包含多个方案，通过 URL search param 或浮动切换条选择，例如：

```text
/prototype/new-dashboard?variant=a
/prototype/new-dashboard?variant=b
/prototype/new-dashboard?variant=c
```

## 适用问题

- 这个信息架构是否清楚？
- 哪种布局更适合主要任务？
- 视觉层级是否能引导用户？
- 数据密度应该高还是低？
- 空状态、加载态、错误态如何呈现？

## 方案要求

生成 3–5 个差异明显的方案。不要只换颜色。

每个方案应在以下维度至少有一个明显差异：

- 信息架构；
- 布局结构；
- 交互模型；
- 数据密度；
- 视觉层级；
- 导航方式。

## 实施规则

- 使用项目已有组件、样式系统和路由约定。
- 使用静态 fixture 数据，除非问题必须依赖真实 API。
- 明确标记为 prototype，不进入生产导航。
- 不追求像素完美；追求可比较。
- 不要重构设计系统来服务 prototype。
- 如果需要新增 fixture，放在 prototype 附近并标记一次性。

## 浮动切换条

提供一个简单的底部浮动栏：

- 显示当前 variant；
- 一键切换所有方案；
- 可复制当前 URL；
- 不遮挡主要内容。

## 完成汇报

- route；
- 每个 variant 的设计意图；
- 推荐方向；
- 应删除或转正的代码位置。
