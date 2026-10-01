set -x -g LANG en_US.UTF-8
set -x -g EDITOR vim
set -e -g SSH_ASKPASS
set fish_greeting ""
set -x -g RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/config

alias sls "serverless"
alias tf "terraform"
alias k "kubectl"

# Git Abbrs
abbr gits "git status"
abbr gitc "git checkout"
abbr gitcb "git checkout -b"
abbr gitl "git log"
abbr gitp "git push origin"
abbr gitg 'git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# One shared ssh-agent on a fixed socket, managed with `ssh_agent`.
# Left alone in ssh sessions so a forwarded agent keeps working.
if set -q XDG_RUNTIME_DIR
	set -g ssh_agent_sock $XDG_RUNTIME_DIR/ssh-agent.sock
else
	set -g ssh_agent_sock $HOME/.ssh/agent.sock
end
if not set -q SSH_CONNECTION
	set -gx SSH_AUTH_SOCK $ssh_agent_sock
end

set LOCALCONFIG $HOME/.config/fish/config.fish.local
if test -e $LOCALCONFIG
	source $LOCALCONFIG
end

direnv hook fish | source

starship init fish | source

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
