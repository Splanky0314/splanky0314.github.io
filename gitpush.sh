#!/bin/sh

date=`date+'%Y-%m-%d %H:%M:%S %Z'`

echo "git add ."

git add .

echo "git commit"

git commit -m $date commit

echo "git push"

git push