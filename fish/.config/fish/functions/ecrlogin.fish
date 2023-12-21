function ecrlogin -d "Login to ecr"
	if test (count $argv) -lt 3
		set RES (aws ecr get-login-password)
	else
		set RES (aws ecr get-login-password --profile $argv[3])
	end

	set ECR $argv[1].dkr.ecr.$argv[2].amazonaws.com
	echo $RES | sudo docker login --username AWS --password-stdin $argv[1].dkr.ecr.$argv[2].amazonaws.com
	echo $ECR
end
