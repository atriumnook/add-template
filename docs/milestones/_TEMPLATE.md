---
version: "{{VERSION}}"
title: "{{MILESTONE_TITLE}}"
status: planning # planning → active → completed → archived
goal: "{{1-2文でマイルストーンのゴール}}"
rigor: lite # lite | full
created: "{{YYYY-MM-DD}}"
target_date: "{{YYYY-MM-DD}}"
completed_date:
---

# {{VERSION}} {{MILESTONE_TITLE}}

## ゴール

<!-- このマイルストーンで達成すること。ユーザー視点で記述 -->

## スコープ

### 含むもの

- {{機能・改善の箇条書き}}

### 含まないもの

- {{明示的に除外するもの}}

## タスク一覧

| タスクID | 概要 | ドメイン | ステータス | scope |
|---|---|---|---|---|
| {{TASK_ID}} | {{1行で何をするか}} | {{domain}} | draft | lite |

<!--
ステータスは requirements の status と同期する（draft / approved / implemented）
scope は requirements の scope と同期する（lite / full）
タスクの並び順 = 優先度（上が高い）
requirements 作成後は概要欄にリンクを追記:
  例: ユーザー登録 ([要件](../requirements/PROJ-001-user-signup.md))
-->

## 完了条件

- [ ] 全タスクの requirements が implemented
- [ ] 全 specs が active
- [ ] CI/CD が通っている
- [ ] {{追加の完了条件}}

## スコープ変更ログ

<!-- マイルストーン進行中にタスクの追加・削除・優先度変更があった場合に記録する -->

| 日付 | 変更内容 | 理由 |
|---|---|---|

## 検証

<!-- /check-progress で更新される。手動での記入も可 -->

### 完全性（Completeness）

- 全タスク implemented: 0/0
- 全 specs active: 0/0

### 正確性（Correctness）

- 受け入れ基準テスト通過: 未検証

### 一貫性（Coherence）

- specs と code の整合: 未検証

## 振り返り（完了後に記入）

### 達成したこと

### 達成できなかったこと・持ち越し

### 学び
