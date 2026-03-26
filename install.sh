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
        [ "$f" = ".gitconfig" ] && continue
        [ "$f" = ".gitconfig.template" ] && continue
        [ "$f" = ".config" ] && continue
        [ "$f" = "install.sh" ] && continue
        [ "$f" = "init_mac.sh" ] && continue

        ln -snf ${DOT_DIR}/${f} ${HOME}/${f}
        echo "Installed $f"
    done
        ln -snf ${DOT_DIR}/.vim ${HOME}/.vim

    # .gitconfig をテンプレートから生成
    # シンボリックリンクが残っている場合は削除 (テンプレートから実体ファイルを生成するため)
    [ -L "${HOME}/.gitconfig" ] && rm "${HOME}/.gitconfig"
    if [ ! -f "${HOME}/.gitconfig" ]; then
        echo "Setting up .gitconfig..."
        printf "Git user name: "; read git_name
        printf "Git email: "; read git_email
        sed -e "s/{{GIT_USER_NAME}}/${git_name}/" \
            -e "s/{{GIT_USER_EMAIL}}/${git_email}/" \
            "${DOT_DIR}/.gitconfig.template" > "${HOME}/.gitconfig"
        echo "Installed .gitconfig"
    else
        echo ".gitconfig already exists, skipping"
    fi

    # .config 配下は個別にリンク (他アプリの設定と競合しないように)
    mkdir -p ${HOME}/.config
    ln -snf ${DOT_DIR}/.config/sheldon ${HOME}/.config/sheldon
    echo "Installed .config/sheldon"
else
    echo "dotfiles already exists"
fi

# sheldon (プラグイン管理)
if has "sheldon"; then
    echo "Running sheldon lock..."
    sheldon lock
else
    echo "sheldon not found. Install with: brew install sheldon"
fi

if [ $(uname) != "Darwin" ] ; then
    echo "Let's get started!"
    exit 0
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Lycoris/dotfiles/master/init_mac.sh)"
fi

