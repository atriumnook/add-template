---
status: proposed # proposed / accepted / rejected / superseded
date: "{{YYYY-MM-DD}}"
superseded_by: "" # superseded の場合、後継ADRのファイル名
---

# ADR: {{判断タイトル}}

<!--
ファイル名規約: {{YYYYMMDD}}-{{decision-name}}.md
配置場所: docs/adr/

このファイルは追記専用。一度書いたら内容を変えない。
判断を覆す場合は新しい ADR を作成し、このファイルのステータスを superseded に変更する。

status の遷移:
- proposed → accepted (YYYY-MM-DD) : 承認
- proposed → rejected (YYYY-MM-DD) : 却下
- accepted → superseded (by: {{後継ADR}}) : 新しいADRで代替
-->

## コンテキスト

<!-- なぜこの判断が必要になったか。背景・制約・前提条件を記述する -->

## 検討した選択肢

<!-- 2つ以上の選択肢を記載する。3つ目以降は必要に応じて追加 -->

### 選択肢A: {{NAME}}

- **メリット**: {{PROS}}
- **デメリット**: {{CONS}}

### 選択肢B: {{NAME}}

- **メリット**: {{PROS}}
- **デメリット**: {{CONS}}

### 選択肢C: {{NAME}}

- **メリット**: {{PROS}}
- **デメリット**: {{CONS}}

## 決定

<!-- 何を選んだか。1〜2文で明確に -->

{{DECISION}}

## 結果

<!-- この決定がもたらす影響。正の影響と負の影響の両方を記載する -->

### 正の影響

- {{POSITIVE_CONSEQUENCE}}

### 負の影響・トレードオフ

- {{NEGATIVE_CONSEQUENCE}}

### 影響を受ける specs

<!-- この判断の結果を反映すべき仕様書 -->

- docs/specs/{{path}}: {{反映内容}}

### 影響を受ける requirements

<!-- この判断の結果として新規作成・変更すべき要件 -->
<!-- ADR → requirements → specs の順序で反映する -->

- docs/requirements/{{path}}: {{変更内容}}（新規作成 / MODIFIED）
