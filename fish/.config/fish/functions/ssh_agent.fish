# Source: https://superuser.com/a/966942
function ssh_agent --description 'SSH-Agent wrapper, first run starts and agent, running again kills an agent'
	eval (ssh-agent -c)
end
