#!/bin/sh

# Make sure path is provided as first script argument
if [ -z "$1" ]
then
	printf "Usage : $0 Repositories_Path\n"
	exit 1
fi

# List all directories in the provided path, each one is considered a git repository
# Use new line character to separate names instead of default space character to avoid the "for" loop confusing spaces in file names with file name separators
Repositories_List=$(find "${1}" -mindepth 1 -maxdepth 1 -type d -printf "%f\n")

# Enter each repository and try to update it
for Repository in $Repositories_List
do
	printf "\033[33mUpdating ${Repository}...\033[0m\n"
	cd "${1}/${Repository}" && git pull
done
