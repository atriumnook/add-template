# ドキュメントワークフロー

## 絶対ルール

- specs を直接編集しない。requirements → specs の順序を守る
- 新機能の実装前に docs/requirements/ に要件を作成する
- 仕様変更時は ADDED / MODIFIED / REMOVED の変更区分を明示する
- ADR 起因の仕様変更も requirements を経由する
- コードだけの PR を作成しない（ドキュメントを含めること）
- 例外: hotfix ブランチの緊急対応は /implement の緊急対応フローに従う（事後にドキュメントを作成）
- 例外: specs への影響がない軽微な修正（バグ修正、設定変更等）は requirements なしで実装可能（/implement の Quick モード）。ただし docs/state.md の調査メモに作業内容を記録すること
- 全てのコマンド（/create-requirement, /create-spec, /implement, /review, /check-progress 等）は、実行完了時に docs/state.md のセッション履歴を更新する

## ドキュメントの種類

| 種類 | 配置先 | 性質 | 説明 |
|---|---|---|---|
| フロー情報 | docs/requirements/ | 時系列の記録 | 「いつ・なぜ決めたか」。タスクごとに増え続ける |
| ストック情報 | docs/specs/ | 現時点の統合仕様 | 「今どうなっているか」。常に最新を反映 |
| ストック情報 | docs/milestones/ | リリース計画と進捗 | マイルストーン単位の計画・タスク一覧・完了条件 |
| 技術判断記録 | docs/adr/ | 追記専用 | 一度書いたら変更しない。判断を覆す場合は新規作成 |
| ワーキング情報 | docs/state.md | 現在の作業状態 | 作業位置・判断ログ・セッション履歴。常に最新を反映 |

```text
requirements（フロー） → 集約・再構成 → specs（ストック）
```

### state.md のセッション履歴管理

- 直近10件を保持する。それより古い履歴はマイルストーン完了時に削除する
- 削除した履歴は git の履歴で追跡可能なため、情報は失われない
- /check-progress のマイルストーン完了判定時に、古い履歴の削除を実施する

## 配置判断

配置先・命名規約・分割タイミングの詳細は doc-placement スキルを参照。

## 用語集の管理

- 新しい用語がコードやドキュメントに登場したら docs/project.md の用語集に追加する
- /create-requirement, /create-spec, /implement の完了条件に含まれる

## requirements のステータス遷移

- draft → approved → implemented
- implemented: specs に内容が集約済み。アクティブな参照元としての役割は終了。
  プロジェクト規模が大きくなった場合（目安: 30件超）、docs/requirements/_archive/ への移動を検討する
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
- planning: マイルストーンの計画中（タスク割り当て・スコープ調整中）
- active: 開発進行中（タスクの実装が進んでいる）
- completed: 全完了条件を満たした
- archived: 振り返り完了後にアーカイブ

## 仕様同期（Sync）

requirements が implemented になった後、specs が最新状態を反映しているか確認する。

### 同期チェックの内容

- requirements の変更区分（ADDED/MODIFIED/REMOVED）が specs に反映されているか
- ビジネスルール（BR-N）が specs に集約されているか
- specs の「関連する要件」テーブルが最新か

### いつ同期チェックするか

- /check-progress の実行時に自動的に検証する
- /review の実行時に Layer 1（requirements → specs）として検証する

### 不整合が見つかった場合

specs を requirements に基づいて更新する（requirements → specs の順序を守る）

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
