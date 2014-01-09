# Created by newuser for 4.3.10
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'
alias vi='vim'


export PATH=$PATH:/usr/local/bin
export TERM=xterm-256color
export LANG=ja_JP.UTF8
export EDITOR="vim"


autoload -U compinit
compinit
autoload -U colors
colors

PROMPT="%B%(?.%F{green}.%F{red})%~%#%f%b "
PROMPT2="%_%%"
SPROMPT="%r is correct? [n,y,a,e]: "
RPROMPT="%1(v|%F{green}%1v%f|)"

function chpwd() { ls --color=auto }
HISTFILE=~/.zsh_histfile
HISTSIZE=10000
SAVEHIST=10000

setopt auto_cd
setopt auto_pushd
setopt nolistbeep
setopt no_check_jobs
setopt listpacked
setopt hist_ignore_all_dups

