---
domain: "{{DOMAIN}}"
status: draft # draft / active / deprecated
---

# {{ドメイン名}} ドメインモデル

<!--
配置場所: docs/specs/{{domain-name}}/domain-model.md
-->

## ドメインモデル概要図

<!--
エンティティ間の関係を簡潔に表現する。
図は Mermaid 記法を標準とする（GitHub/GitLab のレンダリング互換性あり）。
-->

```mermaid
erDiagram
    {{AGGREGATE_ROOT}} ||--o{ {{ENTITY}} : contains
    {{AGGREGATE_ROOT}} ||--|| {{VALUE_OBJECT}} : has
```

## 集約: {{AGGREGATE_NAME}}

### 集約ルート: {{ENTITY_NAME}}

| プロパティ | 型       | 説明       | 制約           |
| ---------- | -------- | ---------- | -------------- |
| id         | UUID     | 一意識別子 | 自動生成       |
| {{prop}}   | {{type}} | {{desc}}   | {{constraint}} |

### エンティティ: {{ENTITY_NAME}}

| プロパティ | 型       | 説明     | 制約           |
| ---------- | -------- | -------- | -------------- |
| {{prop}}   | {{type}} | {{desc}} | {{constraint}} |

### 値オブジェクト: {{VALUE_OBJECT_NAME}}

| 値          | 説明     |
| ----------- | -------- |
| {{value_1}} | {{desc}} |
| {{value_2}} | {{desc}} |

## 不変条件

<!-- この集約が常に満たすべきビジネスルール。requirements の BR-N を参照して追跡可能にする -->

| BR-ID | 不変条件          | 出典          |
| ----- | ----------------- | ------------- |
| BR-1  | {{INVARIANT_1}}   | {{TICKET_ID}} |
| BR-2  | {{INVARIANT_2}}   | {{TICKET_ID}} |

## ステータス遷移

<!--
状態を持つエンティティがある場合、遷移ルールを定義する。
-->

```
{{STATUS_1}} → {{STATUS_2}}: {{TRIGGER}}
{{STATUS_2}} → {{STATUS_3}}: {{TRIGGER}}
{{STATUS_2}} → {{STATUS_4}}: {{TRIGGER}}
```

| 遷移              | トリガー    | 事前条件         |
| ----------------- | ----------- | ---------------- |
| {{FROM}} → {{TO}} | {{TRIGGER}} | {{PRECONDITION}} |

## ドメインイベント

<!-- この集約が発行するイベント（必要な場合） -->

| イベント名     | 発行タイミング | ペイロード  |
| -------------- | -------------- | ----------- |
| {{EVENT_NAME}} | {{WHEN}}       | {{PAYLOAD}} |
