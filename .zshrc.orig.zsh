# Created by newuser for 4.3.10
alias ls='ls -G'
alias la='ls -aG'
alias grep='grep -G'
alias ll='ls -lG'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias emacs='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
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
alias dvipdfmx='/usr/local/bin/dvipdfmx'
alias dp='dvipdfmx'
alias lmk='latexmk -dvi -f'
alias ndl='ruby niconicodl -s -m'

#git
alias gadd='git add'
alias gremote='git remote'
alias gst='git status -uno'
alias gcommit='git commit -m'
alias gpush='git push'
alias gpull='git pull'
alias gclone='glt clone'

#vim関連
alias wp='vim +":BlogNew"'

bindkey -v

export PATH="/usr/local/texlive/2013/bin/x86_64-linux:$PATH"
export TERM=xterm-256color
export LANG=ja_JP.UTF-8
export EDITOR="vim"
export PATH="$HOME/.rbenv/bin:$PATH"
export INFOPATH="/usr/local/texlive/2013/texmf-dist/doc/info"
export MANPATH="/usr/local/texlive/2013/texmf-dist/doc/man"
eval "$(rbenv init -)"

#if [ -z $TMUX ]; then
#  if $(tmux has-session); then
#    tmux attach
#  else
#    tnew lycoris
#  fi
#fi

# http://qiita.com/fieldville/items/e24500165be947db8eaa
[[ -z "$TMUX" && ! -z "$PS1" ]] && ta remote


autoload -Uz compinit
compinit
autoload -Uz colors
colors

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
setopt print_eight_bit
setopt extended_glob



