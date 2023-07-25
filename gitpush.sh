#!/bin/sh

date=`date`

echo "git add ."

git add .

echo "git commit" >> $(date +'%Y-%m-%d %H:%M:%S %Z')

# git commit -m $(date +'%Y-%m-%d %H:%M:%S %Z') 

# echo "git push"

# git push