# CLAUDE.md

## プロジェクト概要

- **プロジェクト名**: {{PROJECT_NAME}}
- **概要**: {{PROJECT_SUMMARY}}
- **詳細**: docs/project.md を参照

## 技術スタック

- **言語**: {{LANGUAGE}}
- **フレームワーク**: {{FRAMEWORK}}
- **データベース**: {{DATABASE}}
- **ORM**: {{ORM}}
- **テスト**: {{TEST_FRAMEWORK}}
- **E2E**: {{E2E_FRAMEWORK}}
- **CI/CD**: {{CI_CD}}

## アーキテクチャ

{{ARCHITECTURE_OVERVIEW}}

## 作業開始時の確認

新しいタスクに着手する際、以下の順序で情報を取得すること:

1. 対象チケットの要件ファイルを読む: `docs/requirements/{{TICKET_ID}}*.md`
2. 関連ドメインの仕様概要を読む: `docs/specs/{{domain-name}}/overview.md`
3. overview.md の「コンテキスト（AI向け）」セクションに列挙されたファイルを読む
4. 関連する ADR がある場合は読む: `docs/adr/`

バグ修正の場合は Step 2 から開始する（要件ファイルが存在しない場合がある）。
各コマンド（/implement 等）にはより詳細な前提確認手順がある。

## ドキュメント管理

docs/ 配下でドキュメントを管理する。詳細は [.claude/rules/document-workflow.md](.claude/rules/document-workflow.md) を参照。

- docs/project.md: プロダクト基礎情報（ビジョン・対象ユーザー・事業制約・用語集）
- docs/requirements/: 要件定義（フロー情報、時系列で増え続ける）
- docs/specs/: 統合仕様（ストック情報、常に最新を反映）
- docs/adr/: 技術判断記録（追記専用）
- docs/qa/: テスト方針・基準
- docs/guides/: 運用ガイド（人間向けリファレンス）

ワークフローの絶対ルールは [.claude/rules/document-workflow.md](.claude/rules/document-workflow.md) を参照。

配置判断・命名規約の詳細は doc-placement スキルを参照。

### コンテキスト管理

- このファイルには全作業に共通する最小限の情報のみ記載する
- 詳細なコーディング規約は .claude/rules/ を参照
- ドメイン固有のルールは各サブディレクトリの .claude.md に記載

## トラブルシューティング

ワークフローから逸脱した場合（specs の直接編集、requirements なしの実装等）は [.claude/rules/document-workflow.md](.claude/rules/document-workflow.md) の「ワークフロー違反のリカバリ」を参照。
