#!/bin/sh

# current dir
# cd $(dirname $0)

# install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"

# install git, tig, python
brew update
brew install git
brew install tig
brew install python

git clone git@github.com:Lycoris/dotfiles.git

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
cd ~/dotfiles
git clone git@github.com:robbyrussell/oh-my-zsh.git .oh-my-zsh
ln -sf ~/dotfiles/.oh-my-zsh/ ~/.oh-my-zsh/
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
cd
ln -sf ~/dotfiles/.pydistutils.cfg ~/.pydistutils.cfg
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vim/ ~/.vim/
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshrc.orig.zsh ~/.zshrc.orig
ln -sf ~/dotfiles/.zshrc.orig.zsh ~/dotfiles/.oh-my-zsh/custom/zshrc.orig.zsh

# install powerline
pip install powerline-status

# use zsh
chsh -s /bin/zsh
