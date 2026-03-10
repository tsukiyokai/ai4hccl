# AI 辅助 HCCL 研发效率指南

## 概述

本指南介绍如何利用 AI 工具提升 HCCL（华为集合通信库）的研发效率，覆盖从需求分析到代码合入的全流程。

## 工具链

| 工具 | 用途 | 入口 |
|------|------|------|
| vibe-design | 根据需求生成软件设计文档 | `/vibe-design` |
| vibe-review | AI 代码审查 | `/vibe-review` |

## 研发流程

### 1. 需求分析与设计

使用 `vibe-design` skill 从需求描述生成设计文档：

```
/vibe-design
```

输入需求描述后，自动生成包含 4+1 架构视图的设计文档（markdown + docx）。

### 2. 编码

结合 `docs/` 中的 HCCL 和 AscendC 文档作为上下文，让 AI 理解现有架构和 API，辅助代码编写。

### 3. 代码审查

使用 `vibe-review` skill 进行 AI 代码审查：

```
/vibe-review
```

支持 C++ 和 Python，检查编码规范、安全漏洞、内存问题等。

### 4. 提交与 CI

使用 `vibe-pr` skill 管理 PR 全生命周期：fork、push、创建 PR、触发 CI、处理 review 意见。

## 文档资源

- `docs/hccl/` — HCCL 集合通信库文档
- `docs/ascendc/` — AscendC 算子开发文档
