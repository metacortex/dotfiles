# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  z
  extract
  colored-man-pages
  fzf
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Node.js
eval "$(fnm env --use-on-cd)"

# fzf 자동완성
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# scm_breeze
[[ -s "$HOME/.scm_breeze/scm_breeze.sh" ]] && source "$HOME/.scm_breeze/scm_breeze.sh"

# 환경 변수 비공개 설정
[ -f "$HOME/.zsh_env" ] && source "$HOME/.zsh_env"
