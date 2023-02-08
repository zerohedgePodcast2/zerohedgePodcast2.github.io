#!/bin/bash

# Confirm with user
if (( $# < 2 )); then
	read -n 1 -p "Push to GitHub? (enter or ctrl+c):" input
else
	if (( $2 != "auto" )); then
		read -n 1 -p "Push to GitHub? (enter or ctrl+c):" input
	fi
fi

#Perform git commit/push


#if [[ 'git status --porcelain' ]]; then
if test -n "$(git status --porcelain)"; then
	# If a command fails then the deploy stops
	set -e
	
	#printf "\033[0;32m$(date): Deploying updates to GitHub B)\033[0m\n"
	printf "$(date): Deploying updates to GitHub\n"

	# Add changes to git
	git add -A

	# Commit changes
	msg="rebuilding site $(date)"
	if [ -n "$*" ]; then
		msg="$*"
	fi
	git commit -m "$msg"

	# Push source
	#git config http.version HTTP/1.1
	git push -v
	#git config --unset http.version

	printf "$Updates Deployed B)\n"
else
	#Check if there are commited changes that need to be pushed
	if [[ -z "$(git cherry)" ]]; then
		#printf "\033[0;32m$(date): No changes to deploy ;)\033[0m\n"
		printf "$(date): No changes to deploy\n"
	else
		printf "$(date): PUSHing updates to GitHub\n"
		git push -v
	fi
fi