function bwe
	set len (count $argv)
	if [ $len = 0 ]
		echo Bash With Environment, runs a bash command with env vars set
		echo Env vars are optional
		echo USAGE: bwe command ENV_VAR1=val ENV_VAR2=val2
	else if [ $len = 1 ]
		echo /bin/bash -c "$argv[1]"
	else
		set exports ''
		for x in $argv[2..$len]
			set exports "$exports export $x"
			set exports "$exports &&"
		end
		/bin/bash -c "($exports $argv[1])"
	end
end

