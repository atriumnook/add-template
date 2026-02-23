# E2E テストガイドライン

## フレームワーク

{{E2E_FRAMEWORK}} を使用（例: Playwright, Cypress）

## ファイル配置

```text
e2e/
├── {{domain}}/
│   └── {{feature}}.spec.ts
├── fixtures/            # テストデータ・ファクトリ
├── pages/               # ページオブジェクト
└── helpers/             # 共通ユーティリティ
```

## ページオブジェクトモデル（POM）

- 各画面に対応するページオブジェクトを作成する
- セレクタの直接指定をテストコードに書かない
- ページオブジェクトに操作メソッドを定義し、テストコードはメソッド呼び出しのみにする

<!-- 以下は TypeScript の例。プロジェクトの言語に合わせて /init-project 時に書き換えること -->

```typescript
// 例: e2e/pages/InvitationPage.ts（TypeScript の場合）
// プロジェクトの言語に合わせて読み替えること
class InvitationPage {
  async sendInvitation(email: string, role: string) { ... }
  async getSuccessMessage() { ... }
}
```

## テスト設計原則

### 独立性

- テスト間の実行順序に依存しない
- 各テストは自身のセットアップ・クリーンアップを行う
- 共有状態を持たない

### 非同期待ち

- 明示的な `wait(ms)` は使わない
- 要素の出現・状態変化を待つアサーション（auto-waiting）を使う
- タイムアウトはグローバル設定で管理する（デフォルト: {{TIMEOUT}}ms）
- ネットワークリクエスト完了の待機が必要な場合は `waitForResponse` 等を使う

### セレクタ戦略

- 優先順: data-testid > role > テキスト内容 > CSS セレクタ
- data-testid の命名: `{{domain}}-{{element}}-{{action}}` (例: `invitation-email-input`)

## テスト対象の選定基準

- ユーザーのクリティカルパス（登録・ログイン・主要操作・決済等）は必ずE2Eでカバー
- 管理画面等の低頻度操作はユニットテスト・統合テストでカバー
- E2Eで全パターンを網羅しようとしない（実行時間の肥大化を避ける）

## 認証の扱い

<!-- プロジェクトに応じて記載 -->
<!-- 例: テスト用の認証トークンを環境変数で管理し、ログインフローをスキップ -->
