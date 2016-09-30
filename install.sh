/bin/sh

cd ~

ln -s ~/dotfiles/zshrc .zshrc
touch .zshrc.local
ln -s ~/dotfiles/zshenv .zshenv

ln -s ~/dotfiles/tmux.conf .tmux.conf

ln -s ~/dotfiles/vim .vim
ln -s ~/dotfiles/vimrc .vimrc
ln -s ~/dotfiles/atom .atom

ln -s ~/dotfiles/gitconfig .gitconfig
ln -s ~/dotfiles/gitconfig_global .gitconfig_global
touch .gitconfig_local
