# Git 運用ルール

## ブランチ戦略

Conventional Branch をベースに、以下のルールで運用する

- `main`: リリース済み（またはリリース可能な）確定コード・確定仕様
- `feat/{{TICKET_ID}}-{{name}}`: 機能開発
- `fix/{{TICKET_ID}}-{{name}}`: バグ修正
- `hotfix/{{TICKET_ID}}-{{name}}`: 本番障害の緊急修正
- `docs/{{TICKET_ID}}-{{name}}`: ドキュメント単体の変更
- `refactor/{{TICKET_ID}}-{{name}}`: リファクタリング（外部動作の変更なし）

## コミットメッセージ

Conventional Commits をベースに、以下のルールで運用する

```text
{{type}}({{scope}}): {{summary}}

{{body}}
```

### type

- feat: 新機能
- fix: バグ修正
- docs: ドキュメント変更
- refactor: リファクタリング
- test: テスト追加・修正
- chore: ビルド・設定変更

### scope

対象のドメインまたはモジュール名（例: `user-management`, `billing`）

### 規約

- summary・body ともに日本語で記述する（type と scope は英語）
- summary は50文字以内
- body は「なぜこの変更をしたか」を記載（任意）
- 1コミット1関心事。複数の変更を混ぜない
- Co-Authored-By 等の自動生成フッターは付けない

### PR内のコミット構成

1つのPR内でのコミット順序は以下を推奨する:

1. docs/requirements/ の追加・変更
2. docs/specs/ の追加・変更
3. テストコードの追加
4. 実装コードの追加
5. リファクタリング（必要な場合）

ドキュメントとコードを1つのコミットにまとめても良い。重要なのはPR全体として requirements → specs → test → code が揃っていること。

### ドキュメント単体の変更

`docs/` ブランチは、既存仕様の誤字修正やガイドの更新等、コード変更を伴わないドキュメントのみの変更に使用する。この場合、PR にコードやテストの変更は不要。

## プルリクエスト

### 必須条件

- requirements + specs + コード + テストを同一PRに含める
- 仕様変更がある場合、requirements の変更が必ず含まれていること
- CIが通っていること
- 最低1人のレビューを受けること

### PR説明文の構成

```md
## 概要
何をしたか（1〜2文）

## 関連チケット
{{TICKET_URL}}

## 変更内容
- docs/requirements/: 要件の追加・変更
- docs/specs/: 仕様の追加・変更
- src/: コードの変更
- tests/: テストの追加・変更

## レビュー観点
特に見てほしいポイント
```

## マージ戦略

- Squash Merge を基本とする
- マージ後に feature ブランチを削除する
