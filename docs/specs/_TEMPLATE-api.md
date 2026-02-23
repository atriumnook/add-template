---
domain: "{{DOMAIN}}"
status: draft # draft / active / deprecated
base_path: "/api/v1/{{resource}}"
---

# {{ドメイン名}} API 仕様

<!--
配置場所: docs/specs/{{domain-name}}/api.md

このテンプレートは REST API 用。GraphQL・gRPC・WebSocket・イベント駆動等の
通信方式を使う場合は、/init-project 時にプロジェクトに合わせて構造を変更すること。
-->

## 共通仕様

### ベースURL

`/api/v1/{{resource}}`

### 認証

<!-- 認証方式を記載（Bearer Token, Session, API Key 等） -->

### 共通エラーレスポンス

| ステータス | 意味           | レスポンス例                                                     |
| ---------- | -------------- | ---------------------------------------------------------------- |
| 400        | リクエスト不正 | 下記「バリデーションエラー詳細形式」を参照                       |
| 401        | 認証エラー     | `{ "error": "unauthorized", "message": "認証が必要です" }`       |
| 403        | 権限不足       | `{ "error": "forbidden", "message": "権限がありません" }`        |
| 404        | リソース未存在 | `{ "error": "not_found", "message": "リソースが見つかりません" }`|
| 500        | サーバーエラー | `{ "error": "internal_error", "message": "内部エラー" }`         |

### バリデーションエラー詳細形式（400）

```json
{
  "error": "validation_error",
  "message": "入力値に問題があります",
  "details": [
    {
      "field": "email",
      "message": "メールアドレスの形式が正しくありません",
      "code": "invalid_format"
    },
    {
      "field": "name",
      "message": "必須項目です",
      "code": "required"
    }
  ]
}
```

---

## エンドポイント一覧

### POST /api/v1/{{resource}}

{{DESCRIPTION}}

#### リクエスト

```json
{
  "field_1": "string",
  "field_2": "number"
}
```

| フィールド | 型     | 必須 | 説明     | バリデーション |
| ---------- | ------ | ---- | -------- | -------------- |
| field_1    | string | ○    | {{DESC}} | {{VALIDATION}} |

#### レスポンス (201)

```json
{
  "id": "uuid",
  "field_1": "string",
  "created_at": "ISO8601"
}
```

#### エラー

| ステータス | 条件                   | エラーコード   |
| ---------- | ---------------------- | -------------- |
| 409        | {{CONFLICT_CONDITION}} | {{ERROR_CODE}} |
| 422        | {{VALIDATION_FAILURE}} | {{ERROR_CODE}} |

---

### GET /api/v1/{{resource}}

一覧取得。ページネーション必須。

#### クエリパラメータ

| パラメータ | 型     | デフォルト | 説明                                                |
| ---------- | ------ | ---------- | --------------------------------------------------- |
| page       | number | 1          | ページ番号（offset ベースの場合）                   |
| per_page   | number | 20         | 1ページあたりの件数（最大100）                      |
| cursor     | string | -          | カーソル（cursor ベースの場合。page と排他）        |
| sort       | string | created_at | ソート対象フィールド                                |
| order      | string | desc       | ソート順（asc / desc）                              |

<!-- プロジェクトに応じて offset ベースまたは cursor ベースのどちらかを選択する -->

#### レスポンス (200)

```json
{
  "data": [
    {
      "id": "uuid",
      "field_1": "string",
      "created_at": "ISO8601"
    }
  ],
  "meta": {
    "total": 100,
    "page": 1,
    "per_page": 20,
    "total_pages": 5
  }
}
```

<!-- cursor ベースの場合の meta:
  "meta": {
    "next_cursor": "xxx",
    "has_more": true
  }
-->

---

### GET /api/v1/{{resource}}/:id

{{DESCRIPTION}}

#### レスポンス (200)

<!-- POST のレスポンスと同様の形式で記載 -->

#### エラー

| ステータス | 条件 | エラーコード |
| ---------- | ---- | ------------ |
| 404        | リソースが存在しない | not_found |

---

### PUT /api/v1/{{resource}}/:id

{{DESCRIPTION}}

#### リクエスト

<!-- POST のリクエストと同様の形式で記載 -->

#### レスポンス (200)

<!-- 更新後のリソースを返す -->

#### エラー

| ステータス | 条件 | エラーコード |
| ---------- | ---- | ------------ |
| 404        | リソースが存在しない | not_found |
| 409        | {{CONFLICT_CONDITION}} | {{ERROR_CODE}} |

---

### DELETE /api/v1/{{resource}}/:id

{{DESCRIPTION}}

#### レスポンス (204)

レスポンスボディなし。

#### エラー

| ステータス | 条件 | エラーコード |
| ---------- | ---- | ------------ |
| 404        | リソースが存在しない | not_found |
