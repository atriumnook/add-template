---
name: doc-placement
description: ドキュメントの配置先・命名・分割の判断基準。ドキュメントファイルの作成・移動・リネーム時、「これはどこに書く？」という判断が必要なとき、ファイル数が増えて構造の見直しが必要なときに使用する。docs/ 配下のファイル操作全般で参照。
commands: ["/create-requirement", "/create-spec", "/create-adr"]
---

# ドキュメント配置ガイド

## 配置判断

| 書きたいこと | 配置先 | 理由 |
|---|---|---|
| 機能の背景・目的・要件 | docs/requirements/ | フロー情報（時系列の記録） |
| 現時点のAPI仕様・ドメインモデル | docs/specs/{{domain}}/ | ストック情報（現時点の真実） |
| 複数機能に影響する技術判断 | docs/adr/ | 追記専用の判断記録 |
| 特定機能に閉じた技術判断 | requirements 内の「技術判断」セクション | 機能に紐づく判断 |
| テストの方針・基準 | docs/qa/ | 方針のみ。コードは tests/ |
| プロダクトのビジョン・用語 | docs/project.md | 上位の前提情報 |
| コーディング規約 | .claude/rules/coding-style.md | AI向け技術ルール |
| ドメイン固有のルール | 該当ディレクトリの .claude.md | スコープ限定 |

### 横断的要件の扱い

複数ドメインにまたがる要件（例: 「全APIにページネーションを実装する」「全画面で日本語UIを使う」）:

- docs/requirements/ 直下に配置する（特定ドメインのサブディレクトリには入れない）
- 各ドメインの specs/overview.md の「関連する要件」から参照する
- 横断的な技術判断が含まれる場合は ADR も作成する

### 迷ったときの判断基準

- **時間が経っても残すべきか？** → Yes: requirements / No: 検討メモ等は不要
- **「今どうなっているか」か「いつ決めたか」か？** → 今: specs / いつ: requirements
- **影響範囲が単一機能か複数機能か？** → 単一: requirements 内の技術判断 / 複数: ADR

## 命名規約

### requirements/

- チケットIDあり（推奨）: `{{TICKET_ID}}-{{feature-name}}.md`
- チケットIDなし: `{{YYYYMMDD}}-{{feature-name}}.md`

チケットIDを推奨する理由: Issue Tracker との追跡可能性、番号衝突がない、AIが「PROJ-142 の要件を読んで」で参照可能。

### specs/

役割ベース固定名: `overview.md`, `api.md`, `domain-model.md`, `ui.md`

### adr/

日付ベース: `{{YYYYMMDD}}-{{decision-name}}.md`

### テンプレートファイル

先頭に `_` を付ける: `_TEMPLATE.md`, `_TEMPLATE-api.md`

### ブランチ名

`feat/PROJ-142-invitation` — 全て小文字、ハイフン区切り、チケットIDを含める。

## フロー情報とストック情報

```
requirements（フロー） → 集約・再構成 → specs（ストック）
```

- **フロー（requirements/）**: 時系列の断面記録。増え続ける
- **ストック（specs/）**: 現時点の統合仕様。常に最新を反映
- 仕様変更は requirements に経緯を記録してから specs を更新する
- requirements / specs / ADR のステータス遷移は .claude/rules/document-workflow.md を参照

## 分割タイミング

| シグナル | アクション |
|---|---|
| requirements/ が15件超 | ドメインサブディレクトリを導入 |
| specs/ の1ファイルが300行超 | overview / api / domain-model に分割 |
| CLAUDE.md が100行超 | .claude/rules/ への分割を検討 |
| ドメイン固有ルールが出現 | .claude.md をサブディレクトリに配置 |
| E2Eテスト開始 | docs/qa/e2e-guidelines.md を追加 |

### 分割時の注意

- `git mv` を使い履歴を保持する
- 移動後のリンク切れを確認する
- README.md のディレクトリ構成を更新する
