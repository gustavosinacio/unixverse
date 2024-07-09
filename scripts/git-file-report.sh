#!/bin/bash

git_paths=""
# GREEN='\033[0;32m'
# NC='\033[0m' # No Color

# Check if at least one path is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <path_to_git_repo1> [<path_to_git_repo2> ...]"
  exit 1
fi

for repo_path in "$@"; do
  # Navigate to the specified path
  cd "$repo_path" || {
    git_paths="$git_paths !invalid path"
    continue
  }

  # Check if the current directory is a git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git_paths="$git_paths  "
    continue
  fi

  # Get the number of altered (modified, added, deleted) files
  num_files_altered=$(git status --porcelain | wc -l | xargs)

  # Get the number of commits to push
  # First, fetch the latest changes from the remote
  # git fetch > /dev/null 2>&1

  # Compare the local and remote branches
  local_branch=$(git rev-parse --abbrev-ref HEAD)
  remote_branch="origin/$local_branch"
  num_commits_to_push=$(git rev-list --count $remote_branch..$local_branch)

  if [[ "$num_commits_to_push" -ne "0" || "$num_files_altered" -ne "0" ]]; then
    dirname=$(basename $repo_path)
    git_paths="$git_paths ${GREEN}${dirname:0:3}${NC}"
  fi

  if [ "$num_commits_to_push" -ne "0" ]; then
    git_paths="$git_paths $num_commits_to_push"
  fi

  if [ "$num_files_altered" -ne "0" ]; then
    git_paths="$git_paths  $num_files_altered"
  fi
done

# git_paths=$(echo "$git_paths" | sed 's/..$/  /')

echo -e "$git_paths" | xargs
