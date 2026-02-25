#!/bin/bash

# jq の存在確認
if ! command -v jq > /dev/null 2>&1; then
  echo "警告: jq がインストールされていません。コミット前検証をスキップします。" >&2
  exit 0
fi

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# git commit コマンドの場合のみ実行
if ! echo "$COMMAND" | grep -qE '^git commit'; then
  exit 0
fi

# WIP コミットの場合はチェックをスキップする
if echo "$COMMAND" | grep -qi 'WIP'; then
  exit 0
fi

CONFIG_FILE="${CLAUDE_PROJECT_DIR:-.}/.claude/hooks/config.json"
if [ ! -f "$CONFIG_FILE" ]; then
  exit 0  # 設定なし → スキップ
fi

LINT_CMD=$(jq -r '.lint_command // empty' "$CONFIG_FILE")
TEST_CMD=$(jq -r '.test_command // empty' "$CONFIG_FILE")

# lint 実行
if [ -n "$LINT_CMD" ]; then
  LINT_OUTPUT=$(eval "$LINT_CMD" 2>&1)
  LINT_EXIT=$?
  if [ $LINT_EXIT -ne 0 ]; then
    echo "lint が失敗しています。修正してからコミットしてください。(コマンド: $LINT_CMD)" >&2
    echo "$LINT_OUTPUT" >&2
    exit 2
  fi
fi

# テスト実行
if [ -n "$TEST_CMD" ]; then
  TEST_OUTPUT=$(eval "$TEST_CMD" 2>&1)
  TEST_EXIT=$?
  if [ $TEST_EXIT -ne 0 ]; then
    echo "テストが失敗しています。修正してからコミットしてください。(コマンド: $TEST_CMD)" >&2
    echo "$TEST_OUTPUT" >&2
    exit 2
  fi
fi

exit 0
