export ZPLUG_HOME=$HOME/.zplug
source $ZPLUG_HOME/init.zsh

zplug "sorin-ionescu/prezto"

# Prezto Plugins
zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/prompt", from:prezto

# Others
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme, as:theme
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/git", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "marzocchi/zsh-notify"
zplug "junegunn/fzf", from:gh-r, as:command, rename-to:fzf

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# OSで分岐する設定
case ${OSTYPE} in
  darwin*)
    # アーキテクチャに応じてhomebrewのパス変更
    typeset -U path PATH
    if [ `uname -m` = "arm64" ]; then
      export PATH=/opt/homebrew/bin:$PATH
      # export PATH=/bin:$PATH
    else
      export PATH=/usr/local/bin/brew:$PATH
    fi
    alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias emacs='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias ls='ls -G'
    alias la='ls -aG'
    alias grep='grep -G'
    alias ll='ls -lG'
    ;;
  # if [ -z $TMUX ]; then
#   if $(tmux has-session); then
#     tmux attach
#   else
#     # tnew macbook-pro
#     tnew imac
#   fi
# fi
  linux*)
    alias vim='/usr/bin/vim'
    alias vi='vim'
    alias emacs='vim'
    alias ls='ls --color=auto'
    alias la='ls -a --color=auto'
    alias grep='grep --color=auto'
    alias ll='ls -l --color=auto'
    ;;
#   if [ -z $TMUX ]; then
#     if $(tmux has-session); then
#       tmux attach
#     else
#       tnew remote
#     fi
#   fi
esac

# cd関連
setopt auto_cd
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls
    fi
}

# autossh
alias autossh='autossh -f -M 0 -N'

# shell関連
alias pgrep='ps ax | grep'
alias sr='source ~/.zshrc'

# tmux関連
alias tmux='tmux -2 -u'
alias tnew='tmux new -s'
alias tv='tmux -v'
alias tls='tmux ls'
alias ta='tmux a -t'
alias tm='tmux move-window -t'
alias ts='tmux swap-window -t'
alias tkill='tmux kill-session -t'

# git関連
alias gbl='git blame'
alias gt='git tag'

# TeX関連
alias lpandoc='pandoc -V documentclass=ltjsarticle --latex-engine=lualatex'

export PATH=$HOME/.nodebrew/current/bin:$PATH
export TERM=xterm-256color
export LANG=ja_JP.UTF-8
export EDITOR="vim"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
