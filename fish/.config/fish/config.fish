# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"


# Load Oh My Fish configuration.
source $OMF_PATH/init.fish
set -x -g LANG en_US.UTF-8
set -x -g EDITOR (which nvim)
# set -x -g SHELL (which nvim)
set -e -g SSH_ASKPASS
set -x -g XML_CATALOG_FILES /usr/local/etc/xml/catalog
set fish_greeting ""

function tmux
	command tmux -2 $argv
end

alias sls "serverless"
alias tf "terraform"
alias pkube "kubectl --kubeconfig /home/sdweik/.kube/personal.conf"
alias nvidia-xconfig "/bin/false"

# Git Abbrs
abbr gits "git status"
abbr gitc "git checkout"
abbr gitcb "git checkout -b"
abbr gitl "git log"
abbr gitp "git push origin"
abbr gitg 'git log --graph --full-history --all --color --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

if test -z $TMUX
	set -x FZF_TMUX 0
else
	set -x FZF_TMUX 1
end

eval (python -m virtualfish auto_activation)

set -x LOCALSSHIDENTPATH $HOME/dotfiles/submodules/ssh-ident/ssh-ident
if test -e $LOCALSSHIDENTPATH
	set -x SSH_ADD_DEFAULT_OPTIONS "-t 300"
	set -x GIT_SSH_COMMAND $LOCALSSHIDENTPATH
	set -x ANSIBLE_SSH_EXECUTABLE $LOCALSSHIDENTPATH
else
	echo "Missing ssh-ident submodule in dotfiles"
end

set LOCALCONFIG $HOME/.config/fish/config.fish.local
if test -e $LOCALCONFIG
	source $LOCALCONFIG
end

# FZF
set -U FZF_LEGACY_KEYBINDINGS 0
set -x FZF_COMPLETE 2
set -x FZF_CTRL_T_OPTS "--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# Setting fd as the default source for fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height 50% --preview-window=wrap'

direnv hook fish | source

if type -q navi
	navi widget fish | source
else
	echo "Navi is missing..."
end
