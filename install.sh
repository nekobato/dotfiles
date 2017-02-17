#/bin/bash

if [ ! -e ~/.zshrc ]; then
  ln -s ~/dotfiles/zshrc ~/.zshrc
fi

if [ ! -e ~/.zshrc.local ]; then
  touch ~/.zshrc.local
fi

if [ ! -e ~/.zshenv ]; then
  ln -s ~/dotfiles/zshenv ~/.zshenv
fi

if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi

if [ ! -e ~/.vim ]; then
  ln -s ~/dotfiles/vim ~/.vim
fi

if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/vimrc ~/.vimrc
fi

if [ ! -e ~/.atom ]; then
  ln -s ~/dotfiles/atom ~/.atom
fi

if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfiles/gitconfig ~/.gitconfig
fi

if [ ! -e ~/.gitconfig.user ]; then
  touch ~/.gitconfig.user
fi

if [ ! -e ~/.gitignore_global ]; then
  ln -s ~/dotfiles/gitignore_global ~/.gitignore_global
fi

# install dein.vim
if [ ! -e ~/dotfiles/vim/dein ]; then
  sh ./vim/dein.sh ~/dotfiles/vim/dein
fi

echo 'finished dotfiles setup.'
