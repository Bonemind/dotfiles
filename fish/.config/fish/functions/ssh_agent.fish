# Source: https://superuser.com/a/966942
function ssh_agent --description 'SSH-Agent wrapper, first run starts and agent, running again kills an agent'
    if set -q SSH_AGENT_PID
        ssh-agent -k
        set -e SSH_AGENT_PID
        set -e SSH_AUTH_SOCK
        echo Killed ssh-agent
    else if set -q SSH_AUTH_SOCK
        set -e SSH_AUTH_SOCK
        echo "PID was't set, AGENT_SOCK was, shouldn't happen. unset sock"
    else
        eval (command ssh-agent -c | sed 's/^setenv/set -Ux/')
        set -l identity $HOME/.ssh/id_rsa
        set -l fingerprint (ssh-keygen -lf $identity | awk '{print $2}')
        ssh-add -l | grep -q $fingerprint
            or ssh-add $identity
    end
end
