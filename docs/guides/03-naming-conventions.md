# 命名規約ガイド

> 判断基準の正規定義は [doc-placement スキル](../../.claude/skills/doc-placement/SKILL.md) にある。このガイドは設計判断の背景説明を提供する。

## ディレクトリ名

| ディレクトリ  | 採用理由                                                       |
| ------------- | -------------------------------------------------------------- |
| requirements/ | 省略しない。固有概念であり「reqs」では直感的に通じない         |
| specs/        | 省略する。業界標準（OpenAPI等）。specifications は17文字で冗長 |
| qa/           | 省略する。Quality Assurance として広く認知                     |
| adr/          | 省略する。Architecture Decision Records の業界標準略称         |
| guides/       | 省略しない。短く明確                                           |

省略するかどうかの判断基準は「その略語が初見で通じるか」であり、一貫性のための一貫性は求めない。

## ファイル名

### requirements/

**タスクIDベース**（推奨）:

```text
PROJ-142-invitation.md
PROJ-287-role-management.md
```

**日付ベース**（タスク管理ツール未使用時）:

```text
20260215-invitation.md
20260301-role-management.md
```

タスクIDベースを推奨する理由:

- Issue Tracker との直接的な追跡可能性
- ディレクトリ横断での番号衝突がない
- AIが「PROJ-142 の要件を読んで」で参照できる
- 3桁連番（feat-001）は1〜2年で枯渇リスクがある

### specs/

**役割ベース**（固定的な名前）:

```text
overview.md
api.md
domain-model.md
```

ファイル数がドメインごとにほぼ一定のため、連番やタスクIDは不要。

### adr/

**日付ベース**:

```text
20260215-async-email.md
20260301-clean-architecture.md
```

ADR はタスクに紐づかないケースがあるため、日付ベースで一意性を担保する。
タスクIDが存在する場合はそれを使っても良い。

### qa/

**役割ベース**（固定的な名前）:

```text
test-strategy.md
e2e-guidelines.md
test-data-management.md
performance-criteria.md
```

## テンプレートファイル

テンプレートファイルの命名は [doc-placement スキル](../../.claude/skills/doc-placement/SKILL.md) を参照。

## ブランチ名

ブランチの命名規約は [git-workflow.md](../../.claude/rules/git-workflow.md) を参照。
