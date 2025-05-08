# 🛠 Mac 개발 환경 세팅

이 저장소는 나의 개인 Mac 개발 환경을 빠르게 세팅하기 위한 dotfiles 및 설치 스크립트를 포함합니다.

<br/>


## 📦 설치 순서

### 1️⃣ 필수 준비

- Xcode Command Line Tools 설치

```bash
xcode-select --install
```

### 2️⃣ Homebrew 설치 (만약 설치 안 되어 있으면)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3️⃣ dotfiles 클론 & 설치

```bash
git clone https://github.com/yourname/dotfiles.git
cd dotfiles
./install.sh
```

<br/>



## ✅ 설치되는 주요 구성

### 🧰 CLI 툴
* git
* pyenv
* python
* fnm
* yarn
* bat
* jq
* ripgrep
* httpie (CLI)
* terraform


### 💻 GUI 앱 (Homebrew Cask)
* Visual Studio Code
* iTerm2
* Kitty
* TablePlus
* Studio 3T
* BetterDisplay
* Discord
* Google Chrome
* Notion
* Slack
* Clash Verge Rev


### 🛒 App Store 앱 (mas)
* WireGuard
* Keynote
* Pages
* Numbers
* Menu World Time


<br/>



## 🚀 자동 세팅 내용

* VSCode 세팅 복원 (settings.json, keybindings.json, snippets)
* iTerm2 설정 안내
* BetterDisplay 설정 복원 안내
* WireGuard 설정 복원 안내


<br/>



## 📝 수동 설치 앱

아래 앱들은 자동 설치되지 않으므로 수동으로 다운로드 및 설치해 주세요.

### 1️⃣ Cursor
다운로드: https://cursor.sh

### 2️⃣ HTTPie Desktop (GUI)
다운로드: https://httpie.io/download

### 3️⃣ Elasticvue Desktop
다운로드: https://elasticvue.com/installation

Intel Mac vs Apple Silicon 구분해서 dmg 다운로드

<br/>



## 🔐 기타 개인 보안 정보

### Local files

- `/etc/hosts`
- `~/.ssh/`
- `.secrets` 각종 credentials 저장
    - `~/.google_cert/` -> `.secrets`

### Applications

- WireGuard
- TablePlus
- Studio 3T
- Clash Verge

