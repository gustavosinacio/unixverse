if [ -z "$1" ] || [ -z "$2" ]; then
  echo -e "Error: paths not specified"
  echo -e "Usage: link-files path/to/origin path/to/destination"
  exit 1
fi


ORIGIN_PATH=$(realpath $1) >/dev/null
IS_LINK=$(readlink $2)

if [ "$IS_LINK" = "$ORIGIN_PATH" ]; then
  echo -e "\tPath --> $BRIGHT_GREEN$1$RESET is already a link to $BRIGHT_GREEN$2$RESET"
  exit 0
fi

echo -e "\tLink --> $BRIGHT_GREEN$ORIGIN_PATH$RESET to ==> $BLINK$BRIGHT_BLUE$2$RESET created sucessfully"
ln -sf $ORIGIN_PATH $2
