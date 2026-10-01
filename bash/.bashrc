# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

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
		export PATH=$PATH:/usr/local/sbin
		export PATH=$PATH:/usr/sbin
		export PATH=$PATH:/usr/bin
		export PATH=$PATH:/sbin/
		export PATH=$PATH:/usr/lib32
		unset SSH_ASKPASS
		runfish
		;;
	# Do something under GNU/Linux platform
	CYGWIN*|MINGW32*|MSYS*)
	;;
	# Do something under Windows NT platform
esac



# NVM
if [ -s ~/.nvm/nvm.sh ]; then
	NVM_DIR=~/.nvm
	source ~/.nvm/nvm.sh
fi
