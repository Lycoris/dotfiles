# OSで分岐する設定
case ${OSTYPE} in
darwin*)
  alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias emacs='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  if [ -z $TMUX ]; then
    if $(tmux has-session); then
      tmux attach
    else
      tnew macbook-pro
    fi
  fi
  # Powerline関連
  export PATH=$PATH:~/Library/Python/2.7/bin
  powerline-daemon -q
  . ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
  ;;
linux*)
  alias vim='/usr/bin/vim'
  alias vi='vim'
  alias emacs='vim'
  if [ -z $TMUX ]; then
    if $(tmux has-session); then
      tmux attach
    else
      tnew remote
    fi
  fi
  # Powerline関連
  export PATH=$PATH:/usr/lib/python2.7
  powerline-daemon -q
  . /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
  ;;
esac


# shell関連
alias ls='ls -G'
alias la='ls -aG'
alias grep='grep -G'
alias pgrep='ps ax | grep'
alias ll='ls -lG'
alias sr='source ~/.zshrc'

# tmux関連
alias tv='tmux -v'
alias tmux='tmux -2 -u'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias ta='tmux a -t'
alias tm='tmux move-window -t'
alias ts='tmux swap-window -t'
alias tkill='tmux kill-session -t'

# git関連
alias gf='git fetch'
alias gbl='git blame'

# vim関連
alias wp='vim +":BlogNew"'

# TeX関連
alias lmk='latexmk -pvc -pdfdvi'

bindkey -v

export TERM=xterm-256color
export LANG=ja_JP.UTF-8
export EDITOR="vim"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


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

