---
name: code-review
description: 审核代码改动并输出严重度排序的问题、风险和最终结论。用于用户提到“review 代码”“审一下 PR”“看看有没有问题”“做代码审核”“给 review 结论”“找风险点”等场景。
---

# Code Review

用于对现有改动做质量审查。重点是发现 bug、风险、行为回归和测试缺口，而不是复述改了什么。

## 工作方式

1. 先看改动边界。
   明确这次 review 的目标文件、功能范围和潜在影响。
2. 以风险为中心审查。
   优先看正确性、兼容性、安全性、数据一致性、边界条件和测试覆盖。
3. findings 优先。
   输出先列问题，再给总体结论。
4. 默认结构。
   按 [references/review-template.md](references/review-template.md) 输出。

## 输出要求

- findings 必须带严重度
- 结论必须说明是否建议合入
- 如果未发现问题，也要明确说“未发现问题”并指出剩余风险

## 给维护者的提示

- 这个 skill 聚焦 review 结论，不负责替代实现说明
- 如果团队有固定 severity 分级，直接改 `references/` 模板
