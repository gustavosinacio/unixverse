#!/bin/bash

git_paths=""

# Check if at least one path is provided
if [ $# -eq 0 ]; then
  echo "Usage: $0 <path_to_git_repo1> [<path_to_git_repo2> ...]"
  exit 1
fi


for repo_path in "$@"; do
  # Navigate to the specified path
  cd "$repo_path" || { echo " "; exit 1; }

  # Check if the current directory is a git repository
  if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Not a git repository"
    exit 1
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

  dirname=$(basename $repo_path)
  git_paths="$git_paths ${dirname:0:3}  $num_files_altered $num_commits_to_push "
done

# git_paths=$(echo "$git_paths" | sed 's/..$/  /')

echo -e "$git_paths"

