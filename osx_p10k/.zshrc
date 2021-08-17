# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

alias grep='grep --color=auto'
alias ls='ls -aGFh --color=auto'
alias ll='ls -alGFh --color=auto'
alias vim='lvim'
alias git='LANG=en_GB git'
alias fp='git fetch -p && git pull --prune'
alias st='git status'
alias python='python3.11'

alias disable_font_smoothing='defaults -currentHost write -g AppleFontSmoothing -int 0'
alias reset_font_smoothing='defaults -currentHost delete -g AppleFontSmoothing'
# BEGIN ANSIBLE MANAGED BLOCK
# Load homebrew shell variables
eval "$(/opt/homebrew/bin/brew shellenv)"

####################################################
# Prompt colors.
autoload -U colors && colors
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# source /Users/regis.caillaud/zsh-git-prompt/zshrc.sh
# ZSH_THEME_GIT_PROMPT_CACHE=1
# ZSH_GIT_PROMPT_SHOW_UPSTREAM=0
# GIT_PROMPT_EXECUTABLE='shell' 
# PROMPT='%B%~%b$(git_super_status) %# '
####################################################


