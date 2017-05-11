#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: ./lockrevs.sh [current plugin folder]"
	exit 1
fi

# Pluginpath
PLUGINPATH=$1"/repos/github.com/"

# Replace any double forward slashes
PLUGINPATH=$(echo $PLUGINPATH | sed 's|//|/|g')

echo "Getting revisions of $PLUGINPATH"

folders=$(cd $PLUGINPATH && find . -mindepth 2 -maxdepth 2)

for folder in $folders; do
	cd $PLUGINPATH
	cd $folder
	rev=$(git rev-parse HEAD)
	plugin=$(echo $folder | sed 's/\.\///g')
	echo "dein#add('$plugin', { 'rev': '$rev' })"
done
