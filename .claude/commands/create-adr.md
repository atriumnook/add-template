# ADR（技術判断記録）の作成

機能横断の技術判断を記録する。

## 前提確認

1. この判断が本当にADRに該当するか確認する
   - 特定機能に閉じた判断 → requirements 内の「技術判断」セクションに書く
   - 複数機能に影響する判断 → ADR に書く（このコマンド）
   - 例: 「メール送信を全て非同期にする」はADR、「招待メールのテンプレートをHTML形式にする」は requirements
2. 既存の ADR と矛盾・重複がないか docs/adr/ を確認する

## 実行手順

1. **ファイルを作成する**
   - 配置先: `docs/adr/{{YYYYMMDD}}-{{decision-name}}.md`
   - テンプレート: `docs/adr/_TEMPLATE.md` を使用

2. **フロントマターを記入する**
   - status: `proposed`（初期値。遷移: proposed → accepted / rejected → superseded）
   - date: 作成日（YYYY-MM-DD）
   - superseded_by: 空欄（superseded 時に後継ADRのファイル名を記入）

3. **各セクションを記入する**
   - コンテキスト: なぜこの判断が必要になったか
   - 検討した選択肢: 各選択肢のメリット・デメリット
   - 決定: 何を選んだか
   - 結果: この決定がもたらす影響（正負両面）

4. **仕様への反映が必要か判断する**
   - ADR の判断結果を反映すべき specs がある場合:
     1. まず対象の requirements に変更経緯を記録する（MODIFIED セクション等）
     2. その上で specs を更新する
     3. **specs を直接編集してはならない**（requirements → specs の順序を守る）
   - 対応する requirements が存在しない場合は、ADR を参照する requirements を新規作成する
   - ADR 自体は specs に吸収されない（経緯の記録として永続する）

## 完了条件

- [ ] ファイルが docs/adr/ に正しい名前で作成されている
- [ ] コンテキスト・検討した選択肢・決定・結果が全て記載されている
- [ ] 検討した選択肢が2つ以上ある（1択なら ADR にする必要がない）
- [ ] 関連する specs への反映が必要な場合、反映済みまたは TODO として記録済み

## 関連スキル

- **doc-placement**: ADR の配置先・命名規約

## 注意

- ADR は追記専用。一度書いたら内容を変えない
- 判断を覆す場合は、新しい ADR を作成し、元の ADR の status を `superseded` に変更
- status 変更のみが既存 ADR への唯一許容される編集
