#!/bin/bash

# Set your GitHub username and email
git config user.name "SyedImtiyaz-1"
git config user.email "syedimtiyazali141@gmail.com"

# Loop over the number of days you want to backfill (e.g., 365 days)
for i in {1..365}
do
  # Generate multiple commits per day
  for j in {1..5}
  do
    echo "$i-$j" >> commits.txt
    git add commits.txt
    GIT_AUTHOR_DATE="$(date --date="$i days ago" +"%Y-%m-%dT12:00:00")" \
    GIT_COMMITTER_DATE="$(date --date="$i days ago" +"%Y-%m-%dT12:00:00")" \
    git commit -m "Commit $i-$j"
  done
done
