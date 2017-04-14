function gitbj -d "Uses jira cli client to fetch an issue description and branch feature branches"
	if test (count $argv) -eq 1
		# Upcase input
		set issue (echo $argv[1] | sed -E 'y/abcdefghijklmnopqrstuvwxyz/ABCDEFGHIJKLMNOPQRSTUVWXYZ/')

		# Get the issue description from the jira cli tool
		# https://github.com/Netflix-Skunkworks/go-jira
		# Then remove starting space
		set desc (jira $issue | tail -n 1 | sed -E "s/^[ ]+//g")

		if test -n $desc
			# Remove trailing period, replace spaces by dashes
			set branchname (echo $desc | sed -E "s/\.\$//g" | sed -E "s/ /-/g")

			set branchname "$issue-$branchname"

			# Create feature and develop branches
			echo "Creating feature branch for '$desc'"
			git checkout -b feature/$branchname

			echo "Creating develop branch"
			git checkout -b feature/$branchname-develop
		else
			echo "No description for $issue, Exiting..."
		end

	else
		echo "Invalid number of arguments, expecting 1 argument (Issue number)"
	end

	# Input:
	# CD-1:        Portal for Healt Care Professional 
	# First sed: trim space from end of string
	# Second sed: Replace :<spaces> with dash
	# Third sed: Replace remaining spaces with -
	#echo $t | sed -E "s/ \$//g" | sed -E "s/^([A-Z]+-[0-9]):[ ]+/\1-/g" | sed -E "s/ /-/g"
end

