#!/bin/bash

# Source the git-status-folders.sh file to get the GIT_STATUS_DIRS array
source ~/dotfiles/git-status-folders.sh

num_files_altered=0
num_commits_to_push=0
git_paths=""
# GREEN='\033[0;32m'
# NC='\033[0m' # No Color

# Check if arguments are provided; if not, use GIT_STATUS_DIRS
if [ $# -eq 0 ]; then
  # Use the directories from GIT_STATUS_DIRS
  set -- "${GIT_STATUS_DIRS[@]}"
fi

for repo_path in "$@"; do
  # Navigate to the specified path
  cd "$repo_path" >/dev/null 2>&1 || {
    continue
  }

  # Check if the current directory is a git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    continue
  fi

  # Get the number of altered (modified, added, deleted) files
  num_files_altered=$((num_files_altered + $(git status --porcelain | wc -l | xargs)))

  # Compare the local and remote branches
  local_branch=$(git rev-parse --abbrev-ref HEAD)
  remote_branch="origin/$local_branch"
  num_commits_to_push=$((num_commits_to_push + $(git rev-list --count $remote_branch..$local_branch)))

done

echo -e " $num_files_altered  $num_commits_to_push" | xargs
