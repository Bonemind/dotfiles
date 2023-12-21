function fzf_complete_current_dir
	ls | fzf | __fish_add_to_commandline
end

function fish_user_key_bindings
	set -U FZF_LEGACY_KEYBINDINGS 0
	bind \cf fzf_complete_current_dir
end
