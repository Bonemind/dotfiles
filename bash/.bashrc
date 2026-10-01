# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

runfish() {
	if hash fish 2>/dev/null; then
		fish
	fi
}

alias ls="ls --color=auto"
alias sl="ls --color=auto"

case "$(uname -s)" in
	# macOS
	Darwin)
		export JAVA_HOME=$(/usr/libexec/java_home)
		runfish
		;;
	# GNU/Linux
	Linux)
		unset SSH_ASKPASS
		runfish
		;;
	# Windows (Cygwin, MinGW, MSYS)
	CYGWIN*|MINGW32*|MSYS*)
		;;
esac
