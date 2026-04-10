# Lyric Skills Marketplace

这个仓库现在只聚焦一件事：根据需求整理方案，并直接产出 Markdown 文档。

## 导入方式

### 方式 1：通过 skills CLI

适合 Codex、Claude Code 和其他支持 `skills` CLI 的环境。

```bash
# 安装整个仓库里的 skills
npx skills add <your-github-username>/lyric-skills-marketplace --agent codex

# 或只安装单个 skill
npx skills add https://github.com/<your-github-username>/lyric-skills-marketplace/tree/main/skills/requirements-to-md
```

### 方式 2：通过 Claude Code 插件市场

适合 Claude Code 的 `/plugin marketplace add` 流程。

```bash
/plugin marketplace add https://github.com/<your-github-username>/lyric-skills-marketplace
/plugin install lyric-skills@lyric-skills-marketplace
```

要让别人正常导入，仓库需要公开，或者对方对该 GitHub 仓库有访问权限。

## 当前结构

```text
lyric-skills-marketplace/
├── .claude-plugin/marketplace.json
├── .agents/plugins/marketplace.json
├── plugins/lyric-skills/
│   ├── .claude-plugin/plugin.json
│   ├── .codex-plugin/plugin.json
│   ├── hooks/hooks.json
│   ├── scripts/validate-skills.sh
│   └── skills/
│       └── requirements-to-md/
└── skills -> plugins/lyric-skills/skills
```

## 当前 Skill

- `requirements-to-md`: 接收模糊或完整需求，补齐假设与边界，形成结构化方案，并落成 `.md` 文件

## 默认行为

- 用户没指定文件名时，优先写入仓库根目录下的 `docs/`
- 文件名默认使用 `YYYY-MM-DD-<topic>.md`
- 文档默认包含背景、目标、范围、约束、方案、执行计划、风险、验收标准
- 如果关键信息不足，不停在“提问模式”，而是先列出假设和待确认项

## 校验

```bash
/Users/lyric/code/utils/lyric-skills-marketplace/plugins/lyric-skills/scripts/validate-skills.sh
```

## 你后面要改的地方

- 把 [plugin.json](/Users/lyric/code/utils/lyric-skills-marketplace/plugins/lyric-skills/.codex-plugin/plugin.json) 里的仓库地址和邮箱换成你自己的
- 把 [marketplace.json](/Users/lyric/code/utils/lyric-skills-marketplace/.claude-plugin/marketplace.json) 和 Claude plugin manifest 里的邮箱也换掉
- 如果你想输出固定格式的方案文档，可以继续改 `requirements-to-md/references/solution-template.md`
