# ドキュメントワークフロー

## 絶対ルール

- specs を直接編集しない。requirements → specs の順序を守る
- 新機能の実装前に docs/requirements/ に要件を作成する
- 仕様変更時は ADDED / MODIFIED / REMOVED の変更区分を明示する
- ADR 起因の仕様変更も requirements を経由する
- コードだけの PR を作成しない（ドキュメントを含めること）
- 例外: hotfix ブランチの緊急対応は /implement の緊急対応フローに従う（事後にドキュメントを作成）
- 例外: scope が lite かつ specs への影響がない軽微な修正（バグ修正、設定変更等）は requirements なしで実装可能。ただし docs/state.md に作業内容を記録すること

## ドキュメントの種類

| 種類 | 配置先 | 性質 | 説明 |
|---|---|---|---|
| フロー情報 | docs/requirements/ | 時系列の記録 | 「いつ・なぜ決めたか」。チケットごとに増え続ける |
| ストック情報 | docs/specs/ | 現時点の統合仕様 | 「今どうなっているか」。常に最新を反映 |
| ストック情報 | docs/milestones/ | リリース計画と進捗 | マイルストーン単位の計画・チケット一覧・完了条件 |
| 技術判断記録 | docs/adr/ | 追記専用 | 一度書いたら変更しない。判断を覆す場合は新規作成 |
| ワーキング情報 | docs/state.md | 現在の作業状態 | 作業位置・判断ログ・セッション履歴。常に最新を反映 |

```text
requirements（フロー） → 集約・再構成 → specs（ストック）
```

## 配置判断

配置先・命名規約・分割タイミングの詳細は doc-placement スキルを参照。

## 用語集の管理

- 新しい用語がコードやドキュメントに登場したら docs/project.md の用語集に追加する
- /create-requirement, /create-spec, /implement の完了条件に含まれる

## requirements のステータス遷移

- draft → approved → implemented
- draft / approved → cancelled（却下）
- draft / approved → deferred（延期、将来的に再検討）

## specs のステータス遷移

- draft → active → deprecated
- draft: feature ブランチ上で作成・更新中
- active: main にマージ後（確定仕様）
- deprecated: 機能廃止やドメイン再編時

## ADR のステータス遷移

- proposed → accepted / rejected → superseded
- proposed: 提案中（レビュー待ち）
- accepted: 承認済み（実施する）
- rejected: 却下（実施しない）
- superseded: 新しい ADR で代替された

## milestones のステータス遷移

- planning → active → completed → archived
- planning: マイルストーンの計画中（チケット割り当て・スコープ調整中）
- active: 開発進行中（チケットの実装が進んでいる）
- completed: 全完了条件を満たした
- archived: 振り返り完了後にアーカイブ

## ワークフロー違反のリカバリ

### specs を直接編集してしまった場合

1. specs に加えた変更内容をメモする
2. specs の変更を revert する（`git checkout` 等）
3. docs/requirements/ に変更経緯を記録する（変更区分の MODIFIED を使用）
4. requirements の内容をもとに specs を再度更新する
5. コミットメッセージに「リカバリ: requirements → specs の順序を修復」と記載する

### 要件定義なしに実装を進めてしまった場合

1. 実装済みのコードから受け入れ基準を抽出する
2. docs/requirements/ に要件ファイルを作成する（通常の /create-requirement フロー）
3. 対応する specs も作成・更新する
4. PR に要件・仕様・コード・テストが全て揃った状態にする
