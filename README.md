# AI駆動開発プロジェクトテンプレート

AI駆動開発のためのプロジェクト雛形。Git でドキュメントとコードを一元管理し、AIエージェントに高品質なコンテキストを提供する。

## 使い方

### 1. テンプレートからリポジトリを作成

```bash
git clone {{THIS_REPO_URL}} my-project
cd my-project
rm -rf .git
git init
```

### 2. 初期設定

`/init-project` コマンドを実行するか、以下を手動で行う:

1. **CLAUDE.md** を編集: `{{PLACEHOLDER}}` を実際の値に置き換える
2. **docs/project.md** を編集: プロダクトのビジョン・対象ユーザー・制約を記入
3. **.claude/rules/coding-style.md** を編集: 技術スタックに合わせたルールを記入
4. **テンプレートを選別**: プロジェクトに不要な `docs/specs/_TEMPLATE-*.md` を削除

### 3. 開発開始

```text
/init-project        → プロジェクト初期セットアップ（初回のみ）
/create-requirement  → 要件定義の作成
/create-spec         → 仕様書の作成
/implement           → 実装
/review              → PRレビュー
/create-adr          → 技術判断の記録
```

## ディレクトリ構成

```text
├── CLAUDE.md                    # AIへの技術コンテキスト
├── .claude/
│   ├── rules/                   # コーディング規約・Git運用ルール（常時読み込み）
│   ├── commands/                # ワークフロー定義（コマンド実行時に読み込み）
│   └── skills/                  # AIスキル（知識・判断基準、必要時に読み込み）
│       ├── doc-placement/       # ドキュメント配置・命名・分割の判断基準
│       ├── requirements-writing/ # 良い要件の書き方
│       ├── spec-design/         # 仕様設計・API設計・ドメインモデリング
│       ├── test-approach/       # テスト戦略の適用方法
│       └── consistency-check/   # 一貫性検証基準
├── docs/
│   ├── project.md               # プロダクト基礎情報
│   ├── requirements/            # 要件定義（フロー情報）
│   ├── specs/                   # 統合仕様（ストック情報）
│   ├── adr/                     # 技術判断記録
│   ├── qa/                      # テスト方針・基準
│   └── guides/                  # 運用ガイド（人間向けリファレンス）
└── ...                          # ソースコード・テスト等（プロジェクトに応じて構成）
```

## コンテキスト管理の設計思想

AIに渡す情報を3層に分け、コンテキストウィンドウを効率的に使う:

| 層               | 置き場                             | 読み込みタイミング           | 内容                     |
| ---------------- | ---------------------------------- | ---------------------------- | ------------------------ |
| **常時**         | CLAUDE.md, .claude/rules/          | 毎回自動                     | 絶対ルール・技術スタック |
| **オンデマンド** | .claude/commands/, .claude/skills/ | コマンド実行時・スキル発動時 | ワークフロー・判断基準   |
| **人間向け**     | docs/guides/                       | 必要に応じて手動参照         | 設計思想・FAQ・導入手順  |

## ガイド一覧

| ガイド                                                        | 内容                                 |
| ------------------------------------------------------------- | ------------------------------------ |
| [01-structure](docs/guides/01-structure.md)                   | ドキュメント構造の全体像と設計思想   |
| [02-development-flow](docs/guides/02-development-flow.md)     | 要件定義からマージまでの開発フロー   |
| [03-naming-conventions](docs/guides/03-naming-conventions.md) | ディレクトリ名・ファイル名の命名規約 |
| [04-branching](docs/guides/04-branching.md)                   | ブランチモデルとドキュメント同期     |
| [05-faq](docs/guides/05-faq.md)                               | よくある質問・判断基準集             |
| [06-growth](docs/guides/06-growth.md)                         | プロジェクト規模に応じた構造の進化   |
| [07-migration](docs/guides/07-migration.md)                   | 既存プロダクトへの導入手順           |

## スキル一覧

| スキル               | 内容                                                     | 主な利用場面                 |
| -------------------- | -------------------------------------------------------- | ---------------------------- |
| doc-placement        | ファイル配置・命名・分割の判断基準                       | ドキュメント作成・移動時     |
| requirements-writing | ユーザーストーリー・受け入れ基準・ビジネスルールの書き方 | /create-requirement, /review |
| spec-design          | 要件→仕様の構造化、API設計、ドメインモデリング           | /create-spec                 |
| test-approach        | テスト戦略の適用、受け入れ基準→テストケース変換          | /implement, /review          |
| consistency-check    | requirements→specs→code→test の一貫性検証                | /review, /implement          |

