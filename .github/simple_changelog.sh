#!/bin/bash

hashes=$(git log --no-merges --pretty="format:%h"  master..dev)

for hash in $hashes
do
  prId=$(git log --merges --reverse --pretty="format: %s" --ancestry-path $hash..dev | head -n1 | sed -n "s/^.*Merge pull request #\\s*\\([0-9]*\\).*$/\\1/p")
  commitInfo=$(git show -s --format="**%aN** - *%s* (commit: [#%h](https://github.com/kevin-verschaeve/repopourri/commit/%h), " $hash)
  echo $commitInfo 'PR: [#'$prId'](https://github.com/kevin-verschaeve/repopourri/pull/'$prId'/files))'
done
