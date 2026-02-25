#!/bin/bash
WARNINGS=""
BRANCH=$(git branch --show-current 2>/dev/null)

# 1. 未コミットの変更チェック
CHANGES=$(git status --porcelain 2>/dev/null)
if [ -n "$CHANGES" ]; then
  WARNINGS="${WARNINGS}【未コミット変更あり】前回のセッションから未コミットの変更が残っています。WIP コミットするか確認してください。\n"
fi

# 2. state.md の更新チェック（feature ブランチ上のみ）
if [ "$BRANCH" != "main" ] && [ "$BRANCH" != "master" ] && [ -n "$BRANCH" ]; then
  STATE_MODIFIED=$(git diff --name-only main...HEAD 2>/dev/null | grep -c "docs/state.md")
  STATE_WIP=$(git status --porcelain -- docs/state.md 2>/dev/null)
  if [ "$STATE_MODIFIED" = "0" ] && [ -z "$STATE_WIP" ]; then
    WARNINGS="${WARNINGS}【state.md 未更新】docs/state.md がこのブランチで更新されていません。セッション履歴を記録してください。\n"
  fi
fi

# 3. 現在のブランチ情報
if [ -n "$BRANCH" ]; then
  echo "現在のブランチ: $BRANCH"
fi

# 4. プロジェクト状態の表示
STATE_FILE="${CLAUDE_PROJECT_DIR:-.}/docs/state.md"
if [ -f "$STATE_FILE" ]; then
  MILESTONE=$(sed -n 's/^current_milestone: *"\(.*\)"/\1/p' "$STATE_FILE")
  TASK=$(sed -n 's/^current_task: *"\(.*\)"/\1/p' "$STATE_FILE")
  if [ -n "$MILESTONE" ]; then
    echo "マイルストーン: $MILESTONE"
  fi
  if [ -n "$TASK" ]; then
    echo "作業中タスク: $TASK"
  fi
fi

if [ -n "$WARNINGS" ]; then
  echo ""
  echo -e "$WARNINGS"
fi

exit 0
