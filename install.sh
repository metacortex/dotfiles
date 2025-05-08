#!/bin/bash
set -e

echo "🛠 Xcode Command Line Tools 설치 확인"
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
  echo "👉 설치 완료 후 이 스크립트를 다시 실행하세요."
  exit 1
fi

echo "🍺 Homebrew 설치 확인"
which brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "🔧 mas CLI 선 설치"
brew list mas >/dev/null 2>&1 || brew install mas

echo "🛍 App Store 로그인 확인"
if ! mas account >/dev/null 2>&1; then
  echo "⚠️ App Store에 로그인되어 있지 않습니다."
  echo "   App Store 앱을 열고 로그인한 후 다시 실행하세요."
  open -a "App Store"
  exit 1
fi

echo "📦 전체 패키지 설치 (brew + cask + mas)"
brew bundle --file=./Brewfile

echo "🎨 Oh My Zsh 설치"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "🔗 dotfiles 링크 생성"
ln -sf $(pwd)/.zshrc ~/.zshrc
ln -sf $(pwd)/.gitconfig ~/.gitconfig
ln -sf $(pwd)/.p10k.zsh ~/.p10k.zsh

echo "📦 kitty 설정 복사"
mkdir -p ~/.config/kitty
cp -f ./kitty.conf ~/.config/kitty/kitty.conf

echo "⚡ scm_breeze 설치"
if [ ! -d "$HOME/.scm_breeze" ]; then
  git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
  ~/.scm_breeze/install.sh
fi

echo "📄 환경 변수 샘플 파일 생성"
cp -n .zsh_env.template ~/.zsh_env 2>/dev/null || true
echo "👉 ~/.zsh_env 파일을 열어 필요한 키를 입력하세요."

echo "🧠 fzf 설치 후 키바인딩 적용"
"$(brew --prefix)/opt/fzf/install" --all

echo "🔌 fzf-tab 설치"
git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/custom/plugins/fzf-tab

echo "🧶 Corepack 활성화 및 Yarn 최신화"
corepack enable
corepack prepare yarn@stable --activate

echo "🌐 Google Cloud SDK 설치"
if [ ! -d "$HOME/google-cloud-sdk" ]; then
    curl https://sdk.cloud.google.com | bash
else
    echo "✅ Google Cloud SDK already installed"
fi

echo "🧠 VS Code 설정 복원"
VSCODE_USER="$HOME/Library/Application Support/Code/User"
cp -f ./vscode/settings.json "$VSCODE_USER/settings.json"
cp -f ./vscode/keybindings.json "$VSCODE_USER/keybindings.json"

if [ -d ./vscode/snippets ]; then
  mkdir -p "$VSCODE_USER/snippets"
  cp -R ./vscode/snippets/* "$VSCODE_USER/snippets/"
fi

echo "📦 VS Code 확장 설치"
xargs -n1 code --install-extension < ./vscode/extensions.txt

echo "🛠 유틸리티 툴 설치됨: bat, jq, ripgrep"
echo "   bat  👉 cat 대체로 하이라이트 + 라인넘버 지원"
echo "   jq   👉 JSON 파일 빠른 파싱/가공"
echo "   rg   👉 ripgrep, 초고속 파일 내용 검색 (VSCode 내부도 이걸 씀)"

echo "🌐 HTTPie 설치 완료: 커맨드라인에서 API 테스트용 http 클라이언트"
echo "   예시: http GET https://httpbin.org/get"

echo "📂 iTerm2 설정 복원 안내"
echo "👉 iTerm2 > Preferences > General > Preferences 탭으로 가서"
echo "   ✅ 'Load preferences from a custom folder or URL' 체크"
echo "   📁 경로로 아래를 입력하세요:"
echo "      $(pwd)/iterm2"
echo "💡 설정 변경 후 iTerm2 재시작 시 적용됩니다."

echo "📺 BetterDisplay 설정 복원 안내"
echo "⚠️ 디스플레이 환경에 따라 완벽하게 동일하게 복원되지 않을 수 있습니다."
echo "👉 수동 복원 경로: ~/Library/Preferences/com.github.macdaddy.BetterDisplay.plist"
echo "   또는: ~/Library/Preferences/pro.betterdisplay.BetterDisplay.plist"

echo "🌐 Clash Verge 설치 완료 안내"
echo "👉 Clash Verge Rev는 /Applications/Clash Verge.app 에 설치됩니다."
echo "⚠️ macOS가 앱 실행을 차단할 수 있습니다. 실행이 안 되면 다음 명령어로 권한을 해제하세요:"
echo "   sudo xattr -r -d com.apple.quarantine \"/Applications/Clash Verge.app\""


echo "✅ 설치 완료! 터미널 재시작 후 `source ~/.zshrc` 실행하세요."
