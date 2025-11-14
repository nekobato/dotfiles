#
# Setup Zsh enviroments
#

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link_if_missing() {
  local src="$1"
  local dest="$2"

  if [ ! -e "$dest" ] && [ ! -L "$dest" ]; then
    ln -s "$src" "$dest"
  else
    echo "$dest は既に存在するためスキップしました。"
  fi
}

link_if_missing "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"

if [ ! -e "$HOME/.gitconfig.user" ]; then
  touch "$HOME/.gitconfig.user"
fi

link_if_missing "$DOTFILES_DIR/gitignore_global" "$HOME/.gitignore_global"

CODEX_DIR="$DOTFILES_DIR/codex"
CODEX_CONFIG_DIR="$HOME/.codex"

if [ -d "$CODEX_DIR" ]; then
  mkdir -p "$CODEX_CONFIG_DIR"

  for codex_file in AGENTS.md config.toml; do
    src="$CODEX_DIR/$codex_file"
    dest="$CODEX_CONFIG_DIR/$codex_file"

    if [ ! -e "$dest" ] && [ ! -L "$dest" ]; then
      ln -s "$src" "$dest"
    else
      echo "codex設定: $dest が既に存在するためスキップしました。"
    fi
  done
fi


echo 'finished dotfiles setup.'
