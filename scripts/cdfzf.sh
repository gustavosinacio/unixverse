#!/bin/bash

source $HOME/dotfiles/working-dirs.sh

if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    find "${WORKING_DIRS[@]}" -mindepth 0 -maxdepth 1 -type d | fzf
  )
fi

if [[ -z $selected ]]; then
  exit 0
fi

export NEXT_DIR=$selected
