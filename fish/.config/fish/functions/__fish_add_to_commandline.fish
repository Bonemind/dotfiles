function __fish_add_to_commandline -d 'add stdin to the command line, for fzf functions'
	read -l result
	commandline -t ""
	commandline -it -- (string escape $result)
	commandline -f repaint
end