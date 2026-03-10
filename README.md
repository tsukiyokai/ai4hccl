# ai4hccl

AI辅助HCCL通信算子组研发效率提升工具集。包含全流程指导书、技术文档和AI skills。

## 目录结构

```
ai4hccl/
├── guide.md          AI 辅助研发效率提升全流程指导书 (v1.1)
├── docs/             HCCL & AI4SE 技术文档、论文 (submodule)
└── skills/
    ├── vibe-design/  设计文档生成 skill (submodule)
    ├── vibe-review/  代码审查 skill (submodule)
    └── vibe-pr/      CANN 社区自主开发 bot (submodule)
```

## 用户指南

开箱即用，三步上手。

### 1. 克隆仓库

```bash
git clone --recurse-submodules https://github.com/tsukiyokai/ai4hccl.git
```

### 2. 安装Skills

在Claude Code中安装需要的skill：

```bash
# 代码审查（npm 发布，一键安装）
npx @tsukiyokai/vibe-review --global

# 设计文档生成、社区开发 bot 通过本地路径加载，
# 克隆本仓库后 Claude Code 会自动识别 skills/ 下的 SKILL.md
```

### 3. 使用

在Claude Code对话中直接调用：

```
> /vibe-review src/transport.cpp                 # 审查单个文件
> /vibe-review HEAD~3..HEAD                      # 审查一段提交
> /vibe-review https://github.com/.../pull/42    # 审查 PR
> /vibe-design                                   # 根据需求生成设计文档（交互式）
> /vibe-pr                                       # 从 issue 到 PR 合入的全流程自动化
```

指导书 `guide.md` 可直接阅读，了解HCCL场景下AI辅助研发的策略、边界和实施路线。

### 更新到最新版本

```bash
git pull
git submodule foreach 'git checkout main && git pull'
```

## 开发者指南

欢迎参与子仓共建。每个子模块都是独立仓库，可以单独fork、开发、提PR。

### 子仓列表

| 子仓               | 仓库地址                                                                        | 说明                     |
| ------------------ | ------------------------------------------------------------------------------- | ------------------------ |
| docs               | [tsukiyokai/hccl-docs](https://github.com/tsukiyokai/hccl-docs)                 | 技术文档、论文、分析报告 |
| skills/vibe-design | [tsukiyokai/vibe-design](https://github.com/tsukiyokai/vibe-design)             | 设计文档生成skill        |
| skills/vibe-review | [tsukiyokai/vibe-review-skill](https://github.com/tsukiyokai/vibe-review-skill) | 代码审查skill            |
| skills/vibe-pr     | [tsukiyokai/vibe-pr](https://github.com/tsukiyokai/vibe-pr)                     | CANN社区自主开发bot      |

### 贡献流程

1. Fork目标子仓（不是主仓）
2. 在fork上开发并提交
3. 向子仓提PR
4. 子仓合入后，主仓会更新子模块指针

### 本地开发调试

```bash
# 进入子仓目录直接开发
cd skills/vibe-review
git checkout -b feature/my-change

# 修改、测试、提交
git add .
git commit -m "feat: my change"

# 推送到自己的 fork（需先添加 remote）
git remote add myfork https://github.com/<you>/vibe-review-skill.git
git push myfork feature/my-change
```

### 新增子仓

如果要将新的skill或文档仓库纳入管理：

```bash
git submodule add https://github.com/tsukiyokai/<repo>.git skills/<name>
git commit -m "Add <name> submodule"
```
