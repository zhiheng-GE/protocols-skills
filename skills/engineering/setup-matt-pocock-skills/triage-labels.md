# 分流标签配置模板

将规范分流角色映射到问题追踪器中的真实 label。

| 分流角色 | 真实 label |
| --- | --- |
| `needs-triage` | `needs-triage` |
| `needs-info` | `needs-info` |
| `ready-for-agent` | `ready-for-agent` |
| `ready-for-afk` | `ready-for-afk` |
| `out-of-scope` | `out-of-scope` |

## 规则

- 每个 issue 同一时间只应有一个分流角色。
- 如果真实 label 与上表不同，更新右列，不要改左列的规范角色。
- `triage`、`to-prd` 和 `to-issues` 必须读取这个映射后再写 label。
