# ai4hccl

AI 辅助 HCCL 研发效率工具集。包含研发效率指南、技术文档和 AI skills。

## 目录结构

```
ai4hccl/
├── guide.md          AI 辅助研发效率指南
├── docs/             HCCL & AscendC 技术文档 (submodule)
└── skills/
    ├── vibe-design/  设计文档生成 skill (submodule)
    └── vibe-review/  代码审查 skill (submodule)
```

## 快速开始

```bash
git clone --recurse-submodules https://github.com/tsukiyokai/ai4hccl.git
```

## 更新子模块

```bash
git submodule update --remote
git add .
git commit -m "chore: update submodules"
```
