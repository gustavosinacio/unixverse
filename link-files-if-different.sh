#!/bin/bash

# CONFIG_FOLDER_NAME="$1"
# CONFIG_FILE_NAME="$2"

if [ ! -f $1 ]; then
  echo "file $1 not found"
  exit 1
fi

if [ ! -f $2 ]; then
  echo "file $2 not found"
else
  ORIGIN_FILE=$(realpath $1)
  DESTINATION_FILE=$(realpath $2)
  DIFF=$(diff $1 $2)

  if [ -z "$DIFF" ]; then
    echo "No difference found in files. Leaving..."
    exit 0
  else
    echo "Difference found."
    rm $2
  fi
fi

realpath $1
realpath $2

echo "Updating linked file"
echo $ORIGIN_FILE
echo $DESTINATION_FILE
# ln -s $ORIGIN_FILE $DESTINATION_FILE


