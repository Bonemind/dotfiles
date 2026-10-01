#!/bin/bash
DIRS=(
	"bash"
	"fish"
	"git"
	"tmux"
	"vim"
	"ripgrep"
	"direnv"
)

# Commands the configs call, incl. ones without their own package (starship, asdf, uv via fish/direnv)
REQUIRES=(fish vim tmux rg starship direnv asdf uv)

PARENT=$(dirname "$PWD")

if ! hash stow 2>/dev/null; then
	echo 'Missing stow, please install GNU Stow first'
	exit 1
fi

echo Stow will stow to $PARENT

if [ "$1" == "--no-prompt" ]
then
	REPLY=Y
else
	read -p "Are you sure? [y/N] " -n 1 -r
	echo    # (optional) move to a new line
fi

if [[ $REPLY =~ ^[Yy]$ ]]
then
	for dir in "${DIRS[@]}"
	do
		echo Stowing $dir
		stow $dir
	done
	echo Done

	# Point out directories that exist but aren't in DIRS
	SKIPPED=()
	for dir in */
	do
		dir=${dir%/}
		[[ " ${DIRS[*]} " == *" $dir "* ]] || SKIPPED+=("$dir")
	done
	if [ ${#SKIPPED[@]} -gt 0 ]
	then
		echo "Not stowed, not in package list: ${SKIPPED[*]}"
	fi

	MISSING=()
	for cmd in "${REQUIRES[@]}"
	do
		hash "$cmd" 2>/dev/null || MISSING+=("$cmd")
	done
	if [ ${#MISSING[@]} -gt 0 ]
	then
		echo "Missing commands: ${MISSING[*]}"
	fi
else
	echo Aborting...
fi
