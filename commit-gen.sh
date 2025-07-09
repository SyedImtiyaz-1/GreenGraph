#!/bin/bash

git config user.name "SyedImtiyaz-1"
git config user.email "syedimtiyazali141@gmail.com"

for i in {1..365}
do
  for j in {1..20}
  do
    echo "$i-$j" >> commit-gen.txt
    git add commit-gen.txt
    GIT_AUTHOR_DATE="$(date --date="$i days ago" +"%Y-%m-%dT12:00:00")" \
    GIT_COMMITTER_DATE="$(date --date="$i days ago" +"%Y-%m-%dT12:00:00")" \
    git commit -m "Commit $i-$j"
  done
done