#!/bin/bash

git config user.name "SyedImtiyaz-1"
git config user.email "syedimtiyazali141@gmail.com"

# Define the number of commits per day
COMMITS_PER_DAY=10

# Start and end dates
START_DATE="2023-01-01"
END_DATE="2025-07-02"

# Loop over each day in the date range
current_date="$START_DATE"
while [ "$current_date" != "$(date -I -d "$END_DATE + 1 day")" ]; do
  for ((j=1; j<=COMMITS_PER_DAY; j++)); do
    echo "$current_date - $j" >> commit-gen.txt
    git add commit-gen.txt
    GIT_AUTHOR_DATE="$current_date T12:00:00" \
    GIT_COMMITTER_DATE="$current_date T12:00:00" \
    git commit -m "Commit on $current_date [$j]"
  done
  current_date=$(date -I -d "$current_date + 1 day")
done
