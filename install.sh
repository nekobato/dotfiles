#
# Setup Zsh enviroments
#
if [ ! -e ~/.zprezto ]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

if [ ! -e ~/.zshrc ]; then
  ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
fi

if [ ! -e ~/.zshrc.local ]; then
  touch ~/.zshrc.local
fi

if [ ! -e ~/.zpreztorc ]; then
  ln -s ~/dotfiles/zsh/zpreztorc ~/.zpreztorc
fi

if [ ! -e ~/.zshenv ]; then
  ln -s ~/dotfiles/zsh/zshenv ~/.zshenv
fi

if [ ! -e ~/.zshenv.local ]; then
  touch ~/.zshenv.local
fi

if [ ! -e ~/.zprofile ]; then
  ln -s ~/dotfiles/zsh/zprofile ~/.zprofile
fi

if [ ! -e "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_nekobato_setup" ]; then
  ln -s ~/dotfiles/zsh/prompt_nekobato_setup "${ZDOTDIR:-$HOME}/.zprezto/modules/prompt/functions/prompt_nekobato_setup"
fi

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

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
