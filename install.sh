#!/bin/bash
# とりあえずmacOS専用で、Ubuntuはそんなに頻繁に環境構築しないのでまたそのとき考える
# bash -c "$(curl -fsSL https://raw.githubusercontent.com/Lycoris/dotfiles/master/install.sh)

# https://kisqragi.hatenablog.com/entry/2020/02/17/224129
# https://blog.fukkatsuso.com/posts/start-dotfiles/

DOT_DIR="$HOME/dotfiles"
CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)

has() {
    type "$1" > /dev/null 2>&1
}


# Homebrew
if has "homebrew"; then
  echo "Homebrew is already installed"
  exit 1;
else 
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update && brew upgrade

echo "Installing applications..."
brew install git tmux tig pandoc fontforge openssl python ruby hugo zplug fzf

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
    for f in *;
    do
        [[ $f == ".DS_Store" ]] && continue
        [[ $f == ".git" ]] && continue
        [[ $f == ".gitignore" ]] && continue
        [[ $f == "install.sh" ]] && continue

        ln -snf $DOT_DIR/$f $HOME/$f
        echo "Installed $f"
    done
else
    echo "dotfiles already exists"
    exit 1
fi
