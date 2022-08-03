#
# Setup Zsh enviroments
#


if [ ! -e ~/.zshrc ]; then
  ln -s ~/my/nekobato/dotfiles/zsh/zshrc ~/.zshrc
fi

if [ ! -e ~/.zshrc.local ]; then
  touch ~/.zshrc.local
fi


if [ ! -e ~/.zshenv ]; then
  ln -s ~/my/nekobato/dotfiles/zsh/zshenv ~/.zshenv
fi

if [ ! -e ~/.zshenv.local ]; then
  touch ~/.zshenv.local
fi

if [ ! -e ~/.zprofile ]; then
  ln -s ~/my/nekobato/dotfiles/zsh/zprofile ~/.zprofile
fi

if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/my/nekobato/dotfiles/tmux.conf ~/.tmux.conf
fi

if [ ! -e ~/.vim ]; then
  ln -s ~/my/nekobato/dotfiles/vim ~/.vim
fi

if [ ! -e ~/.vimrc ]; then
  ln -s ~/my/nekobato/dotfiles/vimrc ~/.vimrc
fi

if [ ! -e ~/.gitconfig ]; then
  ln -s ~/my/nekobato/dotfiles/gitconfig ~/.gitconfig
fi

if [ ! -e ~/.gitconfig.user ]; then
  touch ~/.gitconfig.user
fi

if [ ! -e ~/.gitignore_global ]; then
  ln -s ~/my/nekobato/dotfiles/gitignore_global ~/.gitignore_global
fi


echo 'finished dotfiles setup.'
