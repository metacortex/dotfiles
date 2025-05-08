# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(
  git
  z
  extract
  colored-man-pages
  fzf
  fzf-tab
)

source $ZSH/oh-my-zsh.sh

# powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"

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

# google cloud sdk
if [ -f '/Users/metacortex/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/metacortex/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/metacortex/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/metacortex/google-cloud-sdk/completion.zsh.inc'; fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
