#
# Setup Zsh enviroments
#


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
