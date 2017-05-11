#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
	echo "Usage: ./lockrevs.sh [current plugin folder] [common.vim path]"
	exit 1
fi

# Pluginpath
PLUGINPATH=$1"/repos/github.com/"

# Replace any double forward slashes
PLUGINPATH=$(echo $PLUGINPATH | sed 's|//|/|g')

COMMONFILE=$2

echo "Getting revisions of $PLUGINPATH"

folders=$(cd $PLUGINPATH && find . -mindepth 2 -maxdepth 2)

COMMON=()
SPECIFIC=()

for folder in $folders; do
	cd $PLUGINPATH
	cd $folder
	rev=$(git rev-parse HEAD)
	plugin=$(echo $folder | sed 's/\.\///g')
	pluginline="dein#add('$plugin', { 'rev': '$rev' })"

	if [ -z "$(grep $plugin $COMMONFILE)" ]; then
		# Not in common
		SPECIFIC+=( "$pluginline" )
	else
		# In common
		COMMON+=( "$pluginline" )
	fi
done

printf "\n\n"

echo "Common:"
printf "%s\n" "${COMMON[@]}"

printf "\n\n"

echo "Specific:"
printf "%s\n" "${SPECIFIC[@]}"

