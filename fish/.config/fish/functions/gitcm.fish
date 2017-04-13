function gitcm
	set stripped (echo (_git_branch_name) | cut -d '/' -f2)
	git commit -m "$stripped $argv"
end
