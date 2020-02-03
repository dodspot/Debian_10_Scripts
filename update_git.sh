#!/bin/bash

# UPDATE
	apt-get -qq update
	apt-get -qq upgrade

# INSTALL

# VARS

# SETUP

  # save working directory and change to git directory
	cd /git/Debian_10_Scripts/

  # check for updates and cut log if 100
	git pull
	tail -n 99 /git/Debian_10_Scripts/_update.log > update.log

  # grep up to date string
	check=$(git status /git/Debian_10_Scripts/ | grep -a "Your branch is up to date with")

  # if no string was found do
	if test -z "$check"
	then

  # stash and pull quiet
	git stash -q
	git pull -q

  # modify file permissions
	chmod -R 110 /git/Debian_10_Scripts/

  # report status
	echo "$(date) UPDATED" >> _update.log
	echo "Branch has been updated."
	else
	echo "$(date) SKIPPED" >> _update.log
	echo "No update available."
	fi

  # go back to working directory
	cd ~
	echo $check
