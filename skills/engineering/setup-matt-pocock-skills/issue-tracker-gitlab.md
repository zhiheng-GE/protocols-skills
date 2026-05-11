# 问题追踪器：GitLab Issues

本仓库使用 GitLab Issues 作为问题追踪器。

## 读取

- 优先使用项目已有 GitLab CLI 或 API 约定。
- 读取 issue 正文、评论、label、assignee 和状态。

## 写入

- 创建 issue 时使用项目现有模板。
- 更新 label 时使用 `docs/agents/triage-labels.md` 中的真实 label 字符串。
- 评论中保留 AI 生成免责声明。

## 失败处理

如果没有可用 CLI/API，不要伪造写入结果。输出要创建的 issue/comment 内容，并请用户手动提交或提供凭据。
