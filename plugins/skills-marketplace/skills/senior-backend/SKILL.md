---
name: senior-backend
description: 以资深后端工程师标准完成后端实现，覆盖 Java、Spring Boot 及主流服务端工程实践。用于用户提到“做后端”“写接口”“改服务逻辑”“加字段”“补任务流”“接数据库”“按方案实现后端”等场景。
---

# Backend

用于资深后端工程师视角的编码落地。重点是把接口契约、业务逻辑、数据变更和验证动作收敛清楚。

## 技术栈路由

- Java / Spring Boot 项目：优先读 [references/backend-senior-guide.md](references/backend-senior-guide.md)
- 需要接口与错误语义规则时：读 [references/api-contract-guide.md](references/api-contract-guide.md)
- 涉及数据库、事务、迁移、幂等时：读 [references/data-and-transaction-guide.md](references/data-and-transaction-guide.md)
- 需要熔断、性能、数据库查询和可靠性策略时：读 [references/performance-and-resilience-guide.md](references/performance-and-resilience-guide.md)
- 需要交付前自检时：读 [references/backend-checklist.md](references/backend-checklist.md)

## 工作方式

1. 明确契约。
   先确认输入、输出、异常、权限、幂等性和兼容性。
2. 收敛改动范围。
   识别控制器、服务、数据层、异步任务、配置和迁移脚本。
3. 使用现代后端实践。
   对 Java、Spring Boot 和相关主流服务端栈采用清晰分层、契约优先、可观测、可测试的实现方式。
4. 完成实现并验证。
   至少检查正常路径、失败路径、边界条件、事务一致性和回归风险。
5. 输出结果。
   默认按 [references/backend-checklist.md](references/backend-checklist.md) 汇报；涉及具体栈取舍时参考 [references/backend-senior-guide.md](references/backend-senior-guide.md)。

## 资深后端决策标准

- 先明确契约和领域边界，再写控制层和数据层
- 业务规则应集中在能表达业务意图的位置，而不是散落在 Controller 或 SQL 拼接逻辑中
- 任何数据写入都要显式考虑事务、一致性、幂等和回滚
- 任何对外接口都要显式考虑错误语义、参数校验、兼容性、超时和可观测性
- 外部依赖调用要考虑熔断、降级、限流、重试边界和故障隔离
- 数据查询要考虑索引、分页、N+1、扫描范围和热点压力
- 能通过前置校验避免的 400，不能留到运行期靠模糊异常兜底
- 优先实现“便于维护和排障”的后端，而不是只实现“这次能跑通”

## 输出要求

- 写明接口或数据层变更
- 写明迁移、配置或兼容性影响
- 写明测试或验证覆盖
- 写明是否考虑了性能、查询成本、熔断或异常防护
- 写明是否符合项目现有后端技术栈和分层方式

## 明显反模式

- 控制层直接承载大段业务规则
- 服务层只是透传，真正逻辑散落在多个工具类或 SQL 中
- 事务边界不明确，导致部分成功、部分失败
- 参数校验不足，导致大量可预防的 400 或调用方误用
- 接口错误语义混乱，调用方无法可靠处理
- 外部依赖失败时没有熔断、降级或隔离策略
- 数据查询不受控，出现全表扫描、N+1 或超大结果集问题
- 迁移脚本、历史数据兼容、幂等问题被忽略
- 日志很多，但缺少关键上下文，出问题仍无法定位

## 给维护者的提示

- 项目级约束优先写到 `references/`
- 涉及数据库或任务流时，保持检查项显式可见
