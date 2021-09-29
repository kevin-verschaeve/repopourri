#!/bin/bash

hashes=$(git log --no-merges --pretty="format:%h" origin/master..origin/dev)

commits=''
for hash in $hashes
do
  prId=$(git log --merges --reverse --pretty="format: %s" --ancestry-path $hash..origin/dev | head -n1 | sed -n "s/^.*Merge pull request #\\s*\\([0-9]*\\).*$/\\1/p")
  commitInfo=$(git show -s --format="**%aN** - *%s* (commit: [#%h](https://github.com/kevin-verschaeve/repopourri/commit/%h), " $hash)
  commits=$(echo $commits$commitInfo 'PR: [#'$prId'](https://github.com/kevin-verschaeve/repopourri/pull/'$prId'/files))'"\n")
done

echo '{"body": "'$commits'"}'
