
INSTALL_DIR="$HOME/.tmux/plugins/tpm"
TMUX_PLUGINS_DIR="$HOME/.tmux/plugins"

echo $INSTALL_DIR

if [  -d $INSTALL_DIR ]; then
  echo "$BRIGHT_GREEN\t install tpm$RESET"
  rm -rf $INSTALL_DIR
  rm -rf $TMUX_PLUGINS_DIR
fi

git clone https://github.com/tmux-plugins/tpm $INSTALL_DIR