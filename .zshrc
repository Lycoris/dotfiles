# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------------
# sheldon (プラグイン管理)
# ------------------------------------------
if command -v sheldon &>/dev/null; then
  eval "$(sheldon source)"
fi

# ------------------------------------------
# 履歴設定 (旧prezto modules/history)
# ------------------------------------------
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST              # '!' を使った履歴展開を有効化
setopt EXTENDED_HISTORY       # タイムスタンプ付きで履歴を保存
setopt SHARE_HISTORY          # セッション間で履歴を共有
setopt HIST_IGNORE_DUPS       # 連続する重複を記録しない
setopt HIST_IGNORE_ALL_DUPS   # 古い重複を削除
setopt HIST_IGNORE_SPACE      # スペースで始まるコマンドを記録しない
setopt HIST_REDUCE_BLANKS     # 余分な空白を削除して保存
setopt HIST_VERIFY            # 履歴展開後すぐに実行せず確認

# ------------------------------------------
# 補完設定 (旧prezto modules/completion)
# ------------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 小文字で大文字もマッチ
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ------------------------------------------
# ディレクトリ設定 (旧prezto modules/directory, environment)
# ------------------------------------------
setopt AUTO_CD                # ディレクトリ名だけでcd
setopt AUTO_PUSHD             # cd時にディレクトリスタックに追加
setopt PUSHD_IGNORE_DUPS      # スタックの重複を防ぐ
setopt CORRECT                # コマンドのスペル修正

# ------------------------------------------
# OSで分岐する設定
# ------------------------------------------
case ${OSTYPE} in
  darwin*)
    typeset -U path PATH
    if [ "$(uname -m)" = "arm64" ]; then
      export PATH=/opt/homebrew/bin:$PATH
    else
      export PATH=/usr/local/bin/brew:$PATH
    fi
    alias vi='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias emacs='/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    ;;
  linux*)
    alias vim='/usr/bin/vim'
    alias vi='vim'
    alias emacs='vim'
    ;;
esac

# モダン CLI ツール (eza, bat, ripgrep)
if command -v eza &>/dev/null; then
  alias ls='eza --icons'
  alias la='eza --icons -a'
  alias ll='eza --icons -l --git'
  alias tree='eza --icons --tree'
else
  case ${OSTYPE} in
    darwin*) alias ls='ls -G'; alias la='ls -aG'; alias ll='ls -lG' ;;
    linux*)  alias ls='ls --color=auto'; alias la='ls -a --color=auto'; alias ll='ls -l --color=auto' ;;
  esac
fi

if command -v bat &>/dev/null; then
  alias cat='bat --paging=never'
fi

alias grep='grep --color=auto'

# cd時にファイル一覧を表示
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls
    fi
}

# ------------------------------------------
# エイリアス
# ------------------------------------------
# autossh
alias autossh='autossh -f -M 0 -N'

# shell
alias pgrep='ps ax | grep'
alias sr='source ~/.zshrc'

# tmux
alias tmux='tmux -2 -u'
alias tnew='tmux new -s'
alias tv='tmux -v'
alias tls='tmux ls'
alias ta='tmux a -t'
alias tm='tmux move-window -t'
alias ts='tmux swap-window -t'
alias tkill='tmux kill-session -t'

# git
alias gbl='git blame'
alias gt='git tag'

# TeX
alias lpandoc='pandoc -V documentclass=ltjsarticle --latex-engine=lualatex'

# ------------------------------------------
# 環境変数
# ------------------------------------------
export TERM=xterm-256color
export LANG=ja_JP.UTF-8
export EDITOR="vim"

# ------------------------------------------
# fzf (あいまい検索: Ctrl+R=履歴, Ctrl+T=ファイル, Alt+C=cd)
# ------------------------------------------
if command -v fzf &>/dev/null; then
  eval "$(fzf --zsh)"
fi

# ------------------------------------------
# zoxide (スマート cd: z foo でよく行くディレクトリへジャンプ)
# ------------------------------------------
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# mise (Node.js等のバージョン管理)
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi
