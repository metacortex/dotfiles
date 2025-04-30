#!/bin/bash

echo "🧾 VS Code 설정 백업 중..."

VSCODE_USER="$HOME/Library/Application Support/Code/User"
BACKUP_DIR="./vscode"

mkdir -p "$BACKUP_DIR"

cp "$VSCODE_USER/settings.json" "$BACKUP_DIR/settings.json"
cp "$VSCODE_USER/keybindings.json" "$BACKUP_DIR/keybindings.json"

# snippets 폴더 (선택)
if [ -d "$VSCODE_USER/snippets" ]; then
  mkdir -p "$BACKUP_DIR/snippets"
  cp -R "$VSCODE_USER/snippets/"* "$BACKUP_DIR/snippets/"
fi

# 확장 목록
code --list-extensions > "$BACKUP_DIR/extensions.txt"

echo "✅ VS Code 설정이 $BACKUP_DIR/ 에 저장되었습니다."
