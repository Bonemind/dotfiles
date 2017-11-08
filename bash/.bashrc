# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
# >>> BEGIN ADDED BY CNCHI INSTALLER
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano
# <<< END ADDED BY CNCHI INSTALLER

runfish() {
	if hash fish 2>/dev/null; then
		fish
	fi
}

alias tmux="tmux -2"
alias ls="ls --color=auto"
alias sl="ls --color=auto"

case "$(uname -s)" in
	Darwin)
		export JAVA_HOME=$(/usr/libexec/java_home)
		runfish
		;;
	Linux)
		alias cls="clear"
		alias apt-get="sudo apt-get"
		alias zypper="sudo zypper"
		export PATH=$PATH:/usr/local/sbin
		export PATH=$PATH:/usr/sbin
		export PATH=$PATH:/usr/bin
		export PATH=$PATH:/sbin/
		alias ctags="'brew --prefix'/bin/ctags"
		alias dpkg="sudo dpkg"
		export PATH=$PATH:/usr/lib32
		unset SSH_ASKPASS
		export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
		runfish
		;;
	# Do something under GNU/Linux platform
	CYGWIN*|MINGW32*|MSYS*)
	;;
	# Do something under Windows NT platform
esac


export WORKON_HOME=~/python-venvs

# NVM
if [ -s ~/.nvm/nvm.sh ]; then
	NVM_DIR=~/.nvm
	source ~/.nvm/nvm.sh
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
