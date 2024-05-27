#!/bin/bash

# ORIGIN_PATH = $1
# DESTINATION_PATH = $2

if [ ! -f $1 ]; then
  echo "file $1 not found"
  exit 1
fi

ORIGIN_PATH=$(realpath $1) >/dev/null

IS_LINK=$(readlink $2)

if [ "$IS_LINK" = "$ORIGIN_PATH" ]; then
  echo -e "\n\n\tThe path is already a link to the origin. Leaving...\n\n"
  exit 0
fi

echo "Linkin --> $ORIGIN_PATH <-- to ==> $2"
echo "$2"
ln -sf $ORIGIN_PATH $2
