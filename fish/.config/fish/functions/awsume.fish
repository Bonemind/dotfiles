function awsume
	set -l script ~/.local/bin/awsume.fish
	if not test -e $script
		echo "awsume missing, to install: uv tool install awsume" >&2
		return 1
	end
	source $script $argv
end
