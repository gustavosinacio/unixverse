#!/bin/bash

# Source the git-status-folders.sh file to get the GIT_STATUS_DIRS array
source ~/dotfiles/git-status-folders.sh

num_files_altered=0
num_commits_to_push=0
num_repos_with_changes=0
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
  repo_files=$(git status --porcelain | wc -l | xargs)
  num_files_altered=$((num_files_altered + repo_files))

  # Compare the local and remote branches
  local_branch=$(git rev-parse --abbrev-ref HEAD)
  remote_branch="origin/$local_branch"
  repo_commits=$(git rev-list --count $remote_branch..$local_branch)
  num_commits_to_push=$((num_commits_to_push + repo_commits))

  # Increment repos with changes counter if either files are altered or commits need pushing
  if [ "$repo_files" -gt 0 ] || [ "$repo_commits" -gt 0 ]; then
    num_repos_with_changes=$((num_repos_with_changes + 1))
  fi
done

echo -e "$num_repos_with_changes  $num_files_altered  $num_commits_to_push" | xargs
