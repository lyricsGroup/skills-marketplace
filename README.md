# Skills Marketplace

这个仓库提供 6 个职责清晰、名字够短的工程技能，覆盖代码分析、方案制定、前后端实现、UI 测试和代码审核。

## 导入方式

### 方式 1：通过 skills CLI

适合 Codex、Claude Code 和其他支持 `skills` CLI 的环境。

```bash
# 安装整个仓库里的 skills
npx skills add lyricsGroup/skills-marketplace --agent codex

# 或只安装单个 skill
npx skills add https://github.com/lyricsGroup/skills-marketplace/tree/main/skills/code-analysis
```

### 方式 2：通过 Claude Code 插件市场

适合 Claude Code 的 `/plugin marketplace add` 流程。

```bash
/plugin marketplace add https://github.com/lyricsGroup/skills-marketplace
/plugin install skills-marketplace@skills-marketplace
```

## 当前结构

```text
skills-marketplace/
├── .claude-plugin/marketplace.json
├── .agents/plugins/marketplace.json
├── plugins/skills-marketplace/
│   ├── .claude-plugin/plugin.json
│   ├── .codex-plugin/plugin.json
│   ├── hooks/hooks.json
│   ├── scripts/validate-skills.sh
│   └── skills/
│       ├── code-analysis/
│       ├── code-planning/
│       ├── senior-frontend/
│       ├── senior-backend/
│       ├── code-ui-test/
│       └── code-review/
└── skills -> plugins/skills-marketplace/skills
```

## Skill Map

| Skill | 用途 | 默认输出 |
| --- | --- | --- |
| `code-analysis` | 分析代码结构、调用链、依赖、影响面，并给出结论 | 结论、证据、影响面、风险 |
| `code-planning` | 根据需求制定或修改方案，并落成 Markdown | 方案文档、假设、任务拆分 |
| `senior-frontend` | 以资深前端标准完成实现 | 改动代码、交互状态、校验结果 |
| `senior-backend` | 以资深后端标准完成实现 | 改动代码、接口/数据变更、测试结果 |
| `code-ui-test` | 测试关键 UI 流程并检查视觉/交互问题 | 检查清单、问题列表、结论 |
| `code-review` | 审核代码并给出严重度排序的结论 | findings、风险、结论 |

## 给维护者看的约定

- 一个 skill 只负责一种任务，不做跨职责混写
- `SKILL.md` 保持短，细节放到 `references/`
- `description` 必须写清楚触发场景，方便 AI 自动命中
- 前后端 skill 要体现“资深工程师”预期，具体栈说明放在 `references/`
- 修改 skill 时，同步更新本 README 的 Skill Map

## 校验

```bash
/Users/lyric/code/utils/skills-marketplace/plugins/skills-marketplace/scripts/validate-skills.sh
```
