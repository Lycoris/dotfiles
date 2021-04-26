# ZSH=$HOME/.oh-my-zsh


export ZPLUG_HOME=/usr/local/opt/zplug
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
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "plugins/git", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "marzocchi/zsh-notify"

if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="powerline"

# Powerline
# POWERLINE_HIDE_USER_NAME="true"
# POWERLINE_HIDE_HOST_NAME="true"
# POWERLINE_SHOW_GIT_ON_RIGHT="true"
# POWERLINE_RIGHT_B="none"
# POWERLINE_NO_BLANK_LINE="true"
# POWERLINE_DETECT_SSH="true"
# POWERLINE_FULL_CURRENT_PATH="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(web-search git history zsh-syntax-highlighting)

# source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH=$HOME/bin:/usr/local/bin:/usr/bin:$PATH

# export MANPATH="/usr/local/man:$MANPATH"

