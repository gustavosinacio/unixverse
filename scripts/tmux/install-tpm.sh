
INSTALL_DIR="~/.tmux/plugins/tpm"

if [ ! -d  $INSTALL_DIR ]; then
  echo -e "$BRIGHT_GREEN\t install tpm$RESET"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
