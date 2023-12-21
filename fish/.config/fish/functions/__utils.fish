function __fish_add_to_commandline -d 'add stdin to the command line, for fzf functions'
	read -l result
	commandline -t ""
	commandline -it -- (string escape $result)
	commandline -f repaint
end

function __fish_add_multi_files_to_commandline -d 'add stdin to the command line without escaping, for fzf functions'
	read -l result
	set files (string split '*' $result)
	commandline -t ""
	for file in $files
		commandline -it -- (string escape $file)" "
	end
	commandline -f repaint
end

function __fish_add_multi_hashes_to_commandline -d 'add multiple hashes as a range'
	read -d \n -z -a result
	set -l hashes
	for hash in $result
		if test -n (string trim $hash)
			set -a hashes $hash
		end
	end
	commandline -t ""
	if test (count $hashes) -gt 1
		commandline -it -- $hashes[1]".. "$hashes[-1]
	else
		commandline -it -- $hashes[1]
	end
	commandline -f repaint
end
