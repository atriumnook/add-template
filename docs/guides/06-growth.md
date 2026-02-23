# 成長段階ガイド

プロジェクトの規模に応じて構造を段階的に進化させる。最初から完璧な構造を作ろうとしない。

## Stage 1: ゼロイチ（0〜10ファイル）

### 構造

```text
docs/
├── project.md
├── requirements/
│   ├── _TEMPLATE.md                    ← テンプレート（参考として残す）
│   ├── PROJ-001-product-vision.md    ← 全体像（ここではrequirementsに含めてOK）
│   ├── PROJ-002-mvp-definition.md
│   └── PROJ-003-user-registration.md
├── specs/
│   ├── overview.md                   ← 全体の仕様（1ファイルで十分）
│   └── api.md
├── adr/
├── qa/
│   ├── test-strategy.md              ← 最低限の方針だけ
│   ├── e2e-guidelines.md             ← プレースホルダーのまま可
│   ├── test-data-management.md       ← プレースホルダーのまま可
│   └── performance-criteria.md       ← プレースホルダーのまま可
└── guides/
```

### ポイント

- requirements/ はフラット（サブディレクトリなし）
- specs/ も全体で overview.md + api.md の2ファイルで十分
- qa/ は test-strategy.md の初版を記入する。他のファイルはテンプレートのプレースホルダーのままで良い
- CLAUDE.md は薄くて良い（技術スタック + ドキュメント管理規約）
- 「足りなかったら足す」のスタンス

---

## Stage 2: 機能拡充期（10〜30ファイル）

### 構造変化

```text
docs/
├── project.md
├── requirements/
│   ├── user-management/              ← ドメインサブディレクトリが登場
│   │   ├── PROJ-003-user-registration.md
│   │   └── PROJ-010-invitation.md
│   ├── billing/
│   │   └── PROJ-015-subscription.md
│   ├── PROJ-001-product-vision.md    ← 全体的なものは直下に残る
│   └── PROJ-002-mvp-definition.md
├── specs/
│   ├── user-management/              ← ドメインサブディレクトリ
│   │   ├── overview.md
│   │   ├── api.md
│   │   └── domain-model.md
│   └── billing/
│       └── overview.md
├── adr/
│   └── 20260215-async-email.md       ← ADRが出始める
├── qa/
│   ├── test-strategy.md
│   ├── e2e-guidelines.md             ← E2Eが始まったら追加
│   └── test-data-management.md
└── guides/
```

### ポイント

- ファイル数 15〜20 を目安にドメインサブディレクトリを導入
- 移動時は Git の `git mv` を使い履歴を保持
- CLAUDE.md が育ってきたら .claude/rules/ へ分割を開始
- qa/ のドキュメントを実際のテスト運用から抽出して充実させる

---

## Stage 3: 安定運用期（30ファイル以上）

### 構造変化

```text
docs/
├── project.md
├── requirements/
│   ├── user-management/
│   ├── billing/
│   ├── notification/                 ← ドメインが増える
│   ├── analytics/
│   ├── PROJ-001-product-vision.md
│   └── PROJ-002-mvp-definition.md
├── specs/
│   ├── user-management/
│   │   ├── overview.md
│   │   ├── api.md
│   │   └── domain-model.md
│   ├── billing/
│   ├── notification/
│   ├── analytics/
│   └── system/                       ← 横断的なシステム仕様
│       └── architecture.md
├── adr/
│   ├── 20260215-async-email.md
│   ├── 20260301-event-driven.md
│   └── 20260315-multi-tenant.md
├── qa/
│   ├── test-strategy.md
│   ├── e2e-guidelines.md
│   ├── test-data-management.md
│   └── performance-criteria.md       ← 非機能要件が重要になる
└── guides/
```

### ポイント

- ドメイン固有のルールは各ドメインディレクトリに .claude.md を配置
- specs/system/ で横断的なアーキテクチャ仕様を管理
- ADR が蓄積されてプロジェクトの判断履歴として機能し始める
- qa/ が全項目揃い、AIのテスト生成品質が安定する

---

## ディレクトリ分割のタイミング判断

具体的な閾値とアクションは [doc-placement スキル](../../.claude/skills/doc-placement/SKILL.md) の「分割タイミング」を参照。
