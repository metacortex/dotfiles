# ⚙️ Minimal macOS Dev Environment Setup

<br/>

## 📦 Brewfile 포함 내용

### CLI 도구

- `git`, `pyenv`, `python`, `fnm`, `yarn`  
- `cmake`, `ffmpeg`, `graphicsmagick`, `ssh-copy-id`  
- `stripe`, `tree`, `mysql-client`, `lzip`, `rsync`, `tmux`  
- `mongosh`, `mongodb-database-tools`, `fzf`

### GUI 앱

- `visual-studio-code`, `iterm2`, `kitty`, `google-chrome`  
- `discord`, `notion`, `slack`, `tableplus`, `studio-3t`  
- `macs-fan-control`, `gureumkim`, `font-fira-code`

### App Store 앱 (`mas` 사용)

- Menu World Time  
- Keynote  
- Pages  
- Numbers

---
<br/>

## 🎨 Zsh 플러그인 설정

활성화된 플러그인 목록:

- `git`, `z`, `extract`, `colored-man-pages`  
- `fzf`, `fzf-tab` (탭 자동완성 강화)

> `fzf-tab`은 `~/.oh-my-zsh/custom/plugins`에 자동 설치됩니다.


---
<br/>

## 사용 방법

```bash
git clone https://github.com/metacortex/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh

# Reload Zsh config
source ~/.zshrc

```

---
<br/>

## 설치 후 추가 설정 (optional)

```bash
pyenv install 3.12.2
pyenv global 3.12.2

fnm install --lts
fnm use --lts

```
