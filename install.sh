#!/bin/bash
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Lycoris/dotfiles/master/install.sh)

# https://kisqragi.hatenablog.com/entry/2020/02/17/224129
# https://blog.fukkatsuso.com/posts/start-dotfiles/
# https://qiita.com/okamos/items/40966158d0271ae7198b

DOT_DIR="$HOME/dotfiles"
CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)

has() {
    type "$1" > /dev/null 2>&1
}

# Dotfiles
if [ ! -d ${DOT_DIR} ]; then
    if has "git"; then
        git clone https://github.com/Lycoris/dotfiles.git ${DOT_DIR}
    elif has "curl" || has "wget"; then
        TARBALL="https://github.com/Lycoris/dotfiles/archive/master.tar.gz"
        if has "curl"; then
            curl -L ${TARBALL} -o master.tar.gz
        else
            wget ${TARBALL}
        fi
        tar -zxvf master.tar.gz
        rm -f master.tar.gz
        mv -f dotfiles-master "${DOT_DIR}"
    else
        echo "curl or wget or git required"
        exit 1
    fi

    cd ${DOT_DIR}
    for f in .??*
    do
        [ "$f" = ".DS_Store" ] && continue
        [ "$f" = ".git" ] && continue
        [ "$f" = ".gitignore" ] && continue
        [ "$f" = "Brewfile" ] && continue
        [ "$f" = "install.sh" ] && continue
        [ "$f" = "init_mac.sh" ] && continue

        ln -snf ${DOT_DIR}/${f} ${HOME}/${f}
        echo "Installed $f"
    done
        ln -snf ${DOT_DIR}/.vim ${HOME}/.vim
else
    echo "dotfiles already exists"
fi

# zplug
if [[ -z $ZPLUG_HOME ]]; then
    echo "Installing zplug..."
    /bin/zsh -c "$(curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh)"
    exec zsh
    echo "Installing prezto..."
    ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto $HOME/.zprezto
# Prezto初期設定はいったん削除、手動でやる
#     setopt EXTENDED_GLOB
#     for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#     done
else
    echo "zplug is already installed"
fi

if [ $(uname) != "Darwin" ] ; then
    echo "Let's get started!"
    exit 0
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Lycoris/dotfiles/master/init_mac.sh)"
fi

