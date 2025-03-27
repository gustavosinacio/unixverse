#!/bin/bash

# Source the git-status-folders.sh file to get the GIT_STATUS_DIRS array
source ~/dotfiles/git-status-folders.sh

# Initialize an array instead of a string
declare -a git_repos=()

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
    git_repos+=("!invalid path")
    continue
  }

  # Check if the current directory is a git repository
  if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    git_repos+=("")
    continue
  fi

  # Get the number of altered files and commits to push
  num_files_altered=$(git status --porcelain | wc -l | xargs)
  local_branch=$(git rev-parse --abbrev-ref HEAD)
  remote_branch="origin/$local_branch"
  num_commits_to_push=$(git rev-list --count $remote_branch..$local_branch)

  if [[ "$num_commits_to_push" -ne "0" || "$num_files_altered" -ne "0" ]]; then
    dirname=$(basename $repo_path)
    repo_info="${dirname}"
    
    # Add commit and file information if they exist
    [[ "$num_commits_to_push" -ne "0" ]] && repo_info+="  $num_commits_to_push"
    [[ "$num_files_altered" -ne "0" ]] && repo_info+="  $num_files_altered"
    
    git_repos+=("$repo_info")
  fi
done

# Print the array (each element on a new line)
printf '%s\n' "${git_repos[@]}"