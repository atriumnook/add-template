# ブランチモデルとドキュメント同期

## 基本原則

ドキュメント（requirements / specs）とコードは同一ブランチで管理し、同一 PR でレビュー・マージする。これにより仕様とコードの同期が構造的に保証される。

## ブランチ上でのドキュメントの扱い

### feature ブランチ

```text
feat/PROJ-142-invitation
├── docs/requirements/PROJ-142-invitation.md  ← 要件（新規作成）
├── docs/specs/user-management/overview.md     ← 仕様（更新）
├── docs/specs/user-management/api.md          ← 仕様（更新）
├── src/...                                    ← コード
└── tests/...                                  ← テスト
```

feature ブランチ上の specs は「開発中の仕様」であり、確定していない。main にマージされて初めて確定仕様となる。

### hotfix ブランチ

```text
hotfix/PROJ-999-payment-failure
├── src/...                                    ← 緊急修正
└── tests/...                                  ← テスト
```

hotfix ブランチは本番障害の緊急修正用。先にコードを修正・デプロイし、事後にドキュメント（requirements / specs）を作成する。通常の feature ブランチとはドキュメント作成の順序が逆転することが許容される唯一のケース。

### main ブランチ

main の specs は常に「リリース済みまたはリリース可能な確定仕様」を表す。main の specs だけを見れば、現時点のシステムの全仕様がわかる状態を維持する。

### 複数ブランチでの同時開発

同じ specs ファイルを複数ブランチが同時に編集する場合、Git のマージで競合が発生する。これは意図的な設計で、仕様の競合を検知する仕組みとして機能する。

競合が発生した場合:

1. 両方の変更内容を確認する
2. 仕様として両方成立するか判断する
3. 成立する場合は両方の変更を統合する
4. 矛盾する場合はチームで議論して解決する

## PR のドキュメントチェックリスト

[consistency-check スキル](../../.claude/skills/consistency-check/SKILL.md) の「PR チェックリスト」を参照。

## アンチパターン

禁止事項の詳細は [document-workflow.md](../../.claude/rules/document-workflow.md) の「絶対ルール」を参照。

ブランチモデルに固有のアンチパターン:

- **ドキュメントが遅れて別 PR になる**: 「後で書く」は「永遠に書かない」と同義。コードとドキュメントは同一 PR に含める
