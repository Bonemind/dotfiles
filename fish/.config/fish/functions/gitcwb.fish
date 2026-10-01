function gitcwb
	set stripped (__get_current_git_branch | cut -d '/' -f2)
	git commit -m "$stripped $argv"
end
