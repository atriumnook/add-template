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

## チケット一覧

| チケットID | 要件ファイル | ドメイン | ステータス | 優先度 | scope |
|---|---|---|---|---|---|
| {{TICKET_ID}} | docs/requirements/{{file}} | {{domain}} | draft | high | lite |

<!--
ステータスは requirements の status と同期する（draft / approved / implemented）
scope は requirements の scope と同期する（lite / full）
-->

## 完了条件

- [ ] 全チケットの requirements が implemented
- [ ] 全 specs が active
- [ ] CI/CD が通っている
- [ ] {{追加の完了条件}}

## 検証

<!-- /check-progress で更新される。手動での記入も可 -->

### 完全性（Completeness）

- 全チケット implemented: 0/0
- 全 specs active: 0/0

### 正確性（Correctness）

- 受け入れ基準テスト通過: 未検証

### 一貫性（Coherence）

- specs と code の整合: 未検証

## 振り返り（完了後に記入）

### 達成したこと

### 達成できなかったこと・持ち越し

### 学び
