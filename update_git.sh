#!/bin/bash

check=$(git status /root/Debian_10_Scripts/ | grep -a "Your branch is up to date with")
if test -n "$check" 
then

# save directory and change
directory=$(pwd)
cd /root/Debian_10_Scripts/

# do git things
git stash 
git pull 

# go back to directory
cd $directory

# modify file permissions
chmod -R 110 /root/Debian_10_Scripts/

#report status
check=$(git status /root/Debian_10_Scripts/ | grep -a "Your branch is up to date with")
fi

echo $check
