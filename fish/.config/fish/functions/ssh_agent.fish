function ssh_agent -d "Manage one ssh-agent shared by all shells: start, kill, unset, status"
	# Socket path is fixed (set in config.fish) so every shell finds the same agent
	set -l sock $ssh_agent_sock

	switch "$argv[1]"
		case start
			if __ssh_agent_alive $sock
				echo "ssh-agent already running on $sock"
			else
				# A socket left behind by a crashed agent blocks ssh-agent -a
				rm -f $sock
				ssh-agent -a $sock >/dev/null; or return 1
				echo "Started ssh-agent on $sock"
			end
			set -gx SSH_AUTH_SOCK $sock

		case kill
			if pkill -u (id -u) -xf "ssh-agent -a $sock"
				echo "Killed ssh-agent on $sock"
			else
				echo "No ssh-agent running on $sock"
			end
			rm -f $sock

		case unset
			# Only detaches this shell, the agent keeps running for the others
			set -e SSH_AUTH_SOCK
			echo "SSH_AUTH_SOCK unset in this shell"

		case status ''
			if __ssh_agent_alive $sock
				echo "ssh-agent running on $sock (pid "(pgrep -u (id -u) -xf "ssh-agent -a $sock")")"
				env SSH_AUTH_SOCK=$sock ssh-add -l
			else
				echo "ssh-agent not running"
			end
			if test "$SSH_AUTH_SOCK" != "$sock"
				echo "This shell is not using it (SSH_AUTH_SOCK=$SSH_AUTH_SOCK)"
			end

		case '*'
			echo "Usage: ssh_agent [start|kill|unset|status]" >&2
			return 1
	end
end

function __ssh_agent_alive -a sock
	# ssh-add -l exits 2 when it can't reach an agent, 0/1 when it can
	env SSH_AUTH_SOCK=$sock ssh-add -l >/dev/null 2>&1
	test $status -ne 2
end
