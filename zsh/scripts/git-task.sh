#!/usr/bin/env bash

git checkout master
git pull
git checkout -b task-$1 master
git push -u origin task-$1
git branch -v