# 進捗確認

現在のマイルストーンの進捗を確認し、次にすべきアクションを提示する。

## 前提確認

1. docs/state.md を読み、現在のマイルストーンを把握する
2. 現在のマイルストーンファイル（docs/milestones/{{version}}-{{name}}.md）を読む
3. マイルストーンが未設定の場合 → /create-milestone の実行を提案する

## 実行手順

### Step 1. チケットの状態を収集する

マイルストーンのチケット一覧に記載された各チケットについて:

- requirements ファイルの `status` フロントマターを確認する
- requirements ファイルが存在しない場合は「未作成」として記録する

### Step 2. 3次元の検証を実施する

#### 完全性（Completeness）

- 全チケットの requirements が存在するか
- implemented 状態のチケット数 / 全チケット数
- 対応する specs が存在し、active 状態か

#### 正確性（Correctness）

- テストが存在し、通過しているか（CI結果またはローカル実行で確認）
- 受け入れ基準が具体的でテスト可能な形になっているか

#### 一貫性（Coherence）

- consistency-check スキルの Layer 1〜4 に基づく簡易チェック
- specs と code の整合が取れているか
- 新しい用語が用語集に追加されているか

### Step 3. マイルストーンの検証セクションを更新する

- 完全性・正確性・一貫性の各項目を最新の状態に更新する
- マイルストーンファイルの「検証」セクションを上書きする

### Step 4. 次のアクションを提示する

チケットのステータスに基づいて、優先度順に次のアクションを推奨する:

1. requirements が未作成 → 「`/create-requirement` を実行してください」
2. requirements が draft → 「要件のレビュー・承認を進めてください」
3. requirements が approved で specs が未作成 → 「`/create-spec` を実行してください」
4. specs が draft → 「`/implement` を実行してください」
5. 実装完了で未レビュー → 「`/review` を実行してください」

### Step 5. docs/state.md を更新する

- セッション履歴に進捗確認の結果を記録する

## マイルストーン完了判定

全ての完了条件のチェックボックスが埋まった場合:

1. マイルストーンの status を `completed` に変更する
2. `completed_date` を記入する
3. 振り返りセクションの記入をユーザーに促す
4. docs/state.md の current_milestone をクリアする

## 関連スキル

- **consistency-check**: 一貫性検証の基準（Layer 0〜4）
- **parallel-execution**: 検証タスクの並列実行判断
