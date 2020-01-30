#!/bin/bash

echo 1
check=$(git status /root/Debian_10_Scripts/ | grep -a "Your branch is up to date with")

echo 2
if test -n "$check" 

echo 3
then

# save directory and change
echo 4
directory=$(pwd)
cd /root/Debian_10_Scripts/

# do git things
echo 5
git stash 
echo 6
git pull 

# go back to directory
echo 7
cd $directory

# modify file permissions
echo 8
chmod -R 110 /root/Debian_10_Scripts/

#report status
echo 9
check=$(git status /root/Debian_10_Scripts/ | grep -a "Your branch is up to date with")

echo 10
fi

echo 11
echo $check
