#!/bin/sh

# current dir
cd $(dirname $0)

# download neobundle
if [ -e ~/dotfiles/.vim/bundle/neobundle.vim ]; then
    echo "neobundle found"
    is_existed=true
else
    echo "install neobundle"
    mkdir -p ~/dotfiles/.vim/bundle/
    git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/.vim/bundle/neobundle.vim
    is_existed=false
fi

# symlinks
ln -sf ~/dotfiles/.config/ ~/.config/
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore
ln -sf ~/dotfiles/.gvimrc ~/.gvimrc
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
ln -sf ~/dotfiles/.oh-my-zsh/ ~/.oh-my-zsh/
ln -sf ~/dotfiles/.pydistutils.cfg ~/.pydistutils.cfg
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vim/ ~/.vim/
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshrc.orig.zsh ~/.zshrc.orig
ln -sf ~/dotfiles/.zshrc.orig.zsh ~/dotfiles/.oh-my-zsh/custom/zshrc.orig.zsh

# use zsh
chsh -s /bin/zsh
