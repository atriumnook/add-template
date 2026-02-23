---
ticket: "{{TICKET_ID}}"
domain: "{{DOMAIN}}"
status: draft # draft / approved / implemented / cancelled / deferred
depends_on: [] # 前提となる要件のチケットID（例: ["PROJ-100", "PROJ-101"]）
related_specs: [] # /create-spec 後にパスを追加する（例: ["docs/specs/{{domain-name}}/overview.md"]）
priority: medium # high / medium / low（チケット管理ツール側で管理する場合は省略可）
created: "{{YYYY-MM-DD}}"
updated: "{{YYYY-MM-DD}}" # 初回は created と同じ日付。内容変更のたびに更新する
---

# {{TICKET_ID}}: {{機能名}}

<!--
ファイル名規約:
- チケットIDあり: {{TICKET_ID}}-{{feature-name}}.md (例: PROJ-142-invitation.md)
- チケットIDなし: {{YYYYMMDD}}-{{feature-name}}.md (例: 20260215-invitation.md)

配置場所:
- ゼロイチ期: docs/requirements/ 直下
- ドメイン分割後: docs/requirements/{{domain}}/ 配下

目安: 約300行。超える場合は分割を検討する。
-->

## 背景と目的

<!-- なぜこの機能が必要か。事業上の理由、ユーザーからの要望、技術的負債の解消 等 -->

## ユーザーストーリー

<!-- 「〇〇として、△△したい。なぜなら□□だから。」の形式 -->

- {{ROLE}}として、{{ACTION}}したい。なぜなら{{REASON}}だから。

## ビジネスルール

<!-- この機能で守るべき制約・条件。BR-N 形式で一意に参照可能にする -->

- BR-1: {{RULE_1}}
- BR-2: {{RULE_2}}

## 技術判断

<!--
この要件に固有の技術的決定事項。横断的な判断は ADR（/create-adr）に記録する。
簡潔に記述できる場合はリスト形式でもよい。該当なしの場合はセクションごと削除する。
-->

- **決定**: {{DECISION}}
- **理由**: {{RATIONALE}}

## 受け入れ基準

### 正常系

- [ ] {{SCENARIO_1}} → {{EXPECTED_RESULT_1}}
- [ ] {{SCENARIO_2}} → {{EXPECTED_RESULT_2}}

### 異常系

- [ ] {{ERROR_SCENARIO_1}} → {{ERROR_HANDLING_1}}
- [ ] {{ERROR_SCENARIO_2}} → {{ERROR_HANDLING_2}}

<!-- セキュリティ観点の異常系も検討する（詳細は requirements-writing スキルを参照）:
- 認証・認可: 未認証/権限不足のアクセス
- 入力検証: 不正な入力値・インジェクション攻撃
- データ保護: 他ユーザーのデータへのアクセス
- レート制限: ブルートフォース攻撃の防止
-->

### 非機能要件（該当する場合）

<!-- この機能固有の非機能要件。システム全体の基準は docs/qa/performance-criteria.md を参照。該当なしの場合はセクションごと削除する -->

- [ ] {{NON_FUNCTIONAL_REQUIREMENT_1}}

<!-- 記載例:
- [ ] API レスポンスが P95 200ms 以内
- [ ] 同時リクエスト 100件 を処理できる
- [ ] 認証が必要（未認証時は 401 を返す）
-->

## スコープ外

<!-- この要件では対応しない事項を明記する。将来対応する可能性があるものも含む -->

- {{OUT_OF_SCOPE_1}}
- {{OUT_OF_SCOPE_2}}

## 暗黙の前提（AI向け）

<!-- 人間には自明だがAIに伝えるべき背景知識がある場合に記載する。該当なしの場合はセクションごと削除する -->

- {{IMPLICIT_ASSUMPTION_1}}

<!-- 記載例:
- 業界固有の慣習や法規制（例: インボイス制度、個人情報保護法）
- 社内の暗黙のルール（例: 承認フローは稟議制度に基づく）
- ユーザーの利用環境の前提（例: 主にモバイルから利用される）
-->

## 変更区分

<!-- 仕様変更の場合のみ使用する。新規機能の場合はこのセクションを削除する -->

### ADDED（追加された仕様）

<!-- 新しく追加されるビジネスルール・機能 -->

### MODIFIED（変更された仕様）

<!-- 変更前 → 変更後 の形式で明記 -->

- **変更前**: {{OLD_SPEC}}
- **変更後**: {{NEW_SPEC}}
- **変更理由**: {{REASON}}

### REMOVED（削除された仕様）

<!-- 削除される機能・ルールとその理由 -->
