#!/bin/bash

echo "🧠 VS Code 설정 복원 중..."

VSCODE_USER="$HOME/Library/Application Support/Code/User"
BACKUP_DIR="./vscode"

cp -f "$BACKUP_DIR/settings.json" "$VSCODE_USER/settings.json"
cp -f "$BACKUP_DIR/keybindings.json" "$VSCODE_USER/keybindings.json"

# snippets 복원 (선택)
if [ -d "$BACKUP_DIR/snippets" ]; then
  mkdir -p "$VSCODE_USER/snippets"
  cp -R "$BACKUP_DIR/snippets/"* "$VSCODE_USER/snippets/"
fi

# 확장 복원
echo "📦 확장 설치 중..."
xargs -n1 code --install-extension < "$BACKUP_DIR/extensions.txt"

echo "✅ VS Code 설정 복원이 완료되었습니다."
