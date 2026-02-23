# 仕様書の作成・更新

要件定義をもとに、統合仕様書を作成または更新する。

> **注意**: specs はストック情報であり、requirements を経由せずに直接作成・編集してはならない。対象の requirements が存在しない場合は、先に /create-requirement を実行すること。

## 前提確認

1. 対象の要件定義（`docs/requirements/{{TICKET_ID}}*.md`）が存在すること
   - 存在しない場合は先に /create-requirement を実行する
   - **要件が存在しないまま仕様書を作成してはならない**
2. `docs/specs/{{domain-name}}/` の該当ドメインに既存の仕様書があるか確認する
3. CLAUDE.md のアーキテクチャ方針を確認する

## 実行手順

### 新規作成の場合

1. ドメインディレクトリが未作成なら作成する
   - `docs/specs/{{domain-name}}/`
2. テンプレートを使ってファイルを作成する
   - `overview.md`: ドメイン全体像（`_TEMPLATE-overview.md` を使用）
   - `api.md`: API仕様（必要な場合）
   - `domain-model.md`: ドメインモデル定義（必要な場合）
   - `ui.md`: 画面仕様（フロントエンドを含むプロジェクトの場合。`_TEMPLATE-ui.md` を使用）
   - 各テンプレートのフロントマターを記入する（domain, status。api.md の場合は base_path も記入）
3. 要件定義の内容を仕様として構造化する
   - ビジネスルールを一覧化
   - API のエンドポイント・リクエスト・レスポンスを定義
   - ドメインモデル（エンティティ・値オブジェクト・集約）を定義
4. overview.md の関連情報セクション（「関連する要件」「関連するADR」「コンテキスト（AI向け）」）を記入する
   - 「関連する要件」テーブルに対象 requirements のチケットID・機能名・パスを追記
   - 「関連するADR」セクションに該当する ADR があれば記入
   - 「コンテキスト（AI向け）」セクションに関連ファイルのパスを記入（/implement 時にAIが参照する）
5. 対象の requirements ファイルの `related_specs` フロントマターに、作成した specs ファイルのパスを追記する

### 既存更新の場合

1. 対象の requirements ファイルの 変更区分セクション（ADDED / MODIFIED / REMOVED）を確認
2. specs の該当箇所を特定する
3. 仕様を更新する
   - 新規追加: 該当セクションに追記
   - 変更: 既存の記述を更新
   - 削除: 該当記述を削除し、削除理由をコミットメッセージに残す

## 完了条件

- [ ] 要件定義の内容が仕様に反映されている
- [ ] requirements の受け入れ基準がテスト可能な仕様レベルまで具体化されている
- [ ] 既存の仕様との整合性が取れている
- [ ] API 仕様がある場合、リクエスト/レスポンスの型が定義されている
- [ ] 対象 requirements の `related_specs` フロントマターが更新されている
- [ ] overview.md の「関連する要件」テーブルに対象 requirements が追加されている
- [ ] 新しい用語が出現した場合、docs/project.md の用語集に追加されている

## 関連スキル

- **spec-design**: 要件→仕様の構造化、API設計、ドメインモデリングのパターン
- **doc-placement**: ファイル配置先・命名規約の判断基準

## 注意

- specs はストック情報。「現時点でどうなっているか」を記述する
- 「なぜそうなったか」は requirements や adr の役割
- specs が肥大化した場合、ファイル分割を検討する（overview + api + domain-model + ui 等）
- specs の status 遷移: `draft`（feature ブランチ上で作成・更新中）→ `active`（main にマージ後、確定仕様）→ `deprecated`（機能廃止やドメイン再編時）
