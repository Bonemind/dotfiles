complete -c ssh_agent -f
complete -c ssh_agent -n __fish_use_subcommand -a start -d "Start the shared agent (if needed) and use it"
complete -c ssh_agent -n __fish_use_subcommand -a kill -d "Kill the shared agent"
complete -c ssh_agent -n __fish_use_subcommand -a unset -d "Stop using the agent in this shell"
complete -c ssh_agent -n __fish_use_subcommand -a status -d "Show agent state and loaded keys"
