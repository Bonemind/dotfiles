function __fish_add_multi_files_to_commandline -d 'add stdin to the command line without escaping, for fzf functions'
	read -l result
	set files (string split '*' $result)
	commandline -t ""
	for file in $files
		commandline -it -- (string escape $file)" "
	end
	commandline -f repaint
end