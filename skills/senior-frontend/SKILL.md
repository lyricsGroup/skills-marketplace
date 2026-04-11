---
name: senior-frontend
description: 以资深前端工程师标准完成前端实现，覆盖 React、Vue、JavaScript、TypeScript 及相关现代工程化栈。用于用户提到“做前端”“实现页面”“写 React/Vue”“改 UI”“接入接口”“补交互”“按方案落地前端”等场景。
---

# Frontend

用于资深前端工程师视角的编码落地。前提是需求或方案已经足够明确；如果不明确，先回到 `code-planning` 或至少收敛假设。

## 技术栈路由

- React 项目：优先读 [references/react-guide.md](references/react-guide.md)
- Vue 项目：优先读 [references/vue-guide.md](references/vue-guide.md)
- TypeScript 项目：额外读 [references/typescript-guide.md](references/typescript-guide.md)
- 需要统一组件复用和设计系统策略时：读 [references/component-reuse-guide.md](references/component-reuse-guide.md)
- 需要统一前端决策标准时：读 [references/frontend-senior-guide.md](references/frontend-senior-guide.md)
- 需要交付前自检时：读 [references/frontend-checklist.md](references/frontend-checklist.md)

## 工作方式

1. 确认边界。
   明确页面、组件、状态、接口、空态、错误态和响应式范围。
2. 遵循现有设计系统。
   如果仓库已有组件库、样式约定或视觉语言，优先沿用，不另起体系。
3. 使用现代前端实现方式。
   对 React、Vue、JavaScript、TypeScript 等主流栈采用该生态内的惯用写法，避免混乱模式和过时实现。
4. 完成实现并校验。
   至少检查加载态、空态、报错态、交互反馈、表单校验、响应式和可维护性。
5. 输出结果。
   默认按 [references/frontend-checklist.md](references/frontend-checklist.md) 自检；涉及具体栈取舍时参考 [references/frontend-senior-guide.md](references/frontend-senior-guide.md)。

## 资深前端决策标准

- 先服从项目现有框架、目录结构、状态管理方案和设计系统
- 优先选择可维护的简单实现，不为了“高级感”制造抽象噪音
- 组件复用要有层次：基础组件、业务组件、页面编排组件边界要清楚
- 优秀的组件复用机制要追求一致 API、稳定插槽或 props 设计、低耦合和可扩展，而不是一个万能组件包打天下
- 组件边界、状态来源、副作用位置必须清楚
- 数据获取、缓存、表单、错误处理要有一致模式
- 不只追求页面能显示，还要考虑交互反馈、无障碍、响应式和性能
- TypeScript 项目中优先用类型收敛问题，而不是用 `any` 或断言掩盖问题

## 输出要求

- 说明改了哪些页面或组件
- 说明涉及哪些状态和边界情况
- 说明复用的是哪些已有组件或抽象，新增组件为什么值得沉淀
- 说明使用的前端模式是否符合项目现有技术栈
- 如果无法完整验证，明确留下验证缺口

## 明显反模式

- 一个页面或组件同时承担数据获取、状态编排、复杂业务和展示但没有分层
- 为了复用而造出高耦合、超多 props、难以理解的“超级组件”
- 状态和副作用散落在多个位置，导致数据流不可追踪
- 表单校验、错误态、空态、加载态缺失
- TypeScript 代码大量使用 `any`、`as unknown as` 或宽泛类型逃避建模
- React 或 Vue 项目里混入不符合当前主流约定的历史写法，且没有兼容理由

## 给维护者的提示

- 这个 skill 聚焦前端落地，不负责完整测试报告或代码审核
- 把团队 UI 规范和框架偏好沉淀到 `references/`，不要堆在正文
