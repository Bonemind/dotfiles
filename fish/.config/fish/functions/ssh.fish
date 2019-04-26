function ssh
	# new is 220, base = 253
	
	if set -q TMUX
		tmux select-pane -P bg=colour229
	else
		printf "\033[0;31mSSHing without tmux, background wont change"
	end

	if set -q LOCALSSHIDENTPATH
		$LOCALSSHIDENTPATH $argv
	else
		ssh $argv
	end

	if set -q TMUX
		tmux select-pane -P bg=colour253
	end
end

