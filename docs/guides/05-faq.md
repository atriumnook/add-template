# よくある質問・判断基準集

## 「これはどこに書く？」

> 配置判断の正規定義は [doc-placement スキル](../../.claude/skills/doc-placement/SKILL.md) にある。以下は同じ判断基準を Q&A 形式で説明したもの。

### Q: 機能の背景・目的は？

**A: docs/requirements/**

「なぜこの機能を作るのか」はフロー情報。タスクIDでファイルを作成する。

### Q: API のエンドポイント定義は？

**A: docs/specs/{{domain}}/api.md**

「現時点の API がどうなっているか」はストック情報。

### Q: 「PostgreSQL を採用する」という技術判断は？

**A: docs/adr/**

複数機能に影響する技術判断は ADR。特定機能に閉じた判断は requirements 内の「技術判断」セクション。

### Q: テストの書き方ルールは？

**A: docs/qa/**

テストの「方針・基準」は qa/。テストコード自体は tests/ や e2e/。

### Q: プロダクトのビジョンや対象ユーザーは？

**A: docs/project.md**

要件でも仕様でもない上位の前提情報。

### Q: コーディング規約は？

**A: .claude/rules/coding-style.md**

AI がコードを書く際に参照する技術ルール。CLAUDE.md から参照する形で管理。

### Q: ドメイン固有のルール（例: 「決済モジュールでは金額を整数で扱う」）は？

**A: 該当ドメインの .claude.md**

ドメインディレクトリ直下に .claude.md を配置し、そのドメイン固有のルールを記載する。Claude Code はそのディレクトリ内のファイル操作時に `.claude.md` を自動で読み込む。

**配置場所の例**:

- `src/billing/.claude.md` — billing ドメインの実装ルール
- `src/notification/.claude.md` — notification ドメインの実装ルール

**作成タイミング**:

- 特定ドメインにだけ適用されるルールが出てきたとき
- 他ドメインと異なる慣習・制約があるとき
- ドメイン固有の型の扱い方・命名規約があるとき

**記載例**（`src/billing/.claude.md`）:

```markdown
# billing ドメインルール

## 金額の扱い
- 金額は全て整数（cents）で保持する。浮動小数点は使用禁止
- 通貨コードは ISO 4217 に準拠する
- 税計算は切り捨て（Math.floor）で統一する

## 関連仕様
- docs/specs/billing/overview.md
- docs/adr/20260301-currency-as-integer.md
```

### Q: 既存機能の仕様変更は？

**A: まず requirements に MODIFIED セクションで経緯を記録 → specs を更新**

変更の「なぜ」が消えないよう、必ず requirements → specs の順序を守る。

---

## 「これはどう判断する？」

### Q: requirements と specs の境界が曖昧

判断基準: **そのドキュメントは時間が経っても残すべきか？**

- 「2026年3月にこう決めた」→ requirements（時系列の記録）
- 「現在のAPIはこうなっている」→ specs（現時点の真実）

### Q: ADR にすべきか requirements 内の技術判断にすべきか

判断基準: **影響範囲が単一機能か複数機能か？**

- 「招待メールをHTML形式にする」→ requirements（招待機能に閉じる）
- 「全メール送信を非同期にする」→ ADR（複数機能に波及）

### Q: ドメインサブディレクトリを作るタイミング

判断基準: **ファイル数が15〜20件を超えたか？**

- 超えていない → フラットのままで良い
- 超えた → ドメインの境界が見えているはずなので分割

### Q: specs が大きくなりすぎた

判断基準: **300行を超えたか？**

- overview.md + api.md + domain-model.md に分割する
- それでも大きい場合、ドメインの粒度を見直す

### Q: CLAUDE.md が肥大化してきた

判断基準: **そのルールは全作業で必要か？**

- 必要 → CLAUDE.md に残す
- 特定作業のみ → .claude/rules/ に切り出す
- 特定ドメインのみ → サブディレクトリの .claude.md に移す

---

## ワークフロー違反のリカバリ

リカバリ手順は [document-workflow.md](../../.claude/rules/document-workflow.md) の「ワークフロー違反のリカバリ」を参照。
