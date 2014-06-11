# Created by newuser for 4.3.10
alias ls='ls -G'
alias la='ls -aG'
alias grep='grep -G'
alias ll='ls -lG'
alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias emacs='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias tv='tmux -v'
alias tmux='tmux -2 -u'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias ta='tmux a -t'
alias tm='tmux move-window -t'
alias ts='tmux swap-window -t'
alias tkill='tmux kill-session -t'
alias sr='source ~/.zshrc'
alias pgrep='ps ax | grep'
alias pl='platex -kanji=utf8 -interaction=nonstopmode'
alias lmk='latexmk -pvc -pdfdvi'

#vim関連
alias wp='vim +":BlogNew"'

bindkey -v

export TERM=xterm-256color
export LANG=ja_JP.UTF-8
export EDITOR="vim"
#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux attach
  else
    tnew macbook-pro
  fi
fi



autoload -Uz compinit
compinit
autoload -Uz colors
colors

HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd
function chpwd() { ls -G }
setopt auto_pushd
setopt nolistbeep
setopt no_check_jobs
setopt listpacked
setopt hist_ignore_all_dups
setopt print_eight_bit
setopt extended_glob



