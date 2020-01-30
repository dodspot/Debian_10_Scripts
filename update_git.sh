#!/bin/bash

# grep up to date string
check=$(git status /root/Debian_10_Scripts/ | grep -a "Your branch is up to date with")

# if no string was found do
if test -z "$check" 
then

# save working directory and change to git directory
directory=$(pwd)
cd /root/Debian_10_Scripts/

# stash and pull quiet
git stash -q
git pull -q

# go back to working directory
cd $directory

# modify file permissions
chmod -R 110 /root/Debian_10_Scripts/

#report status
echo "Branch has been updated."
echo $check
else
echo $check
fi
