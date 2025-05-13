#!/bin/bash

# Fetch the latest updates from the remote
git fetch --prune

# Get a list of merged branches, excluding master and staging
merged_branches=$(git branch --merged | grep -vE '^\*|master|staging')

# Loop through the merged branches and delete them
for branch in $merged_branches; do
  echo "Deleting branch: $branch"
  git branch -d "$branch"
done

echo "Cleanup complete."