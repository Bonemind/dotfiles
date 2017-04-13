function _fuckwrapper -d "Correct your previous console command"
	set -lx argcount (count $argv)

	# Grab passed alias if any
	if test $argcount -ge 1
		set alias $argv[1]
	else
		set alias fuck
	end


	# Override confirmation if any
	if test $argcount -ge 2
		set -x THEFUCK_REQUIRE_CONFIRMATION $argv[2]
	end

	set -l fucked_up_command $history[1]

	env TF_ALIAS=$alias PYTHONIOENCODING=utf-8 thefuck $fucked_up_command | read -l unfucked_command
	if [ "$unfucked_command" != "" ]
		eval $unfucked_command
		builtin history delete --exact --case-sensitive -- $fucked_up_command
		builtin history merge ^ /dev/null
  end
end

