function awsassume -d "Assume an aws role and set the credentials as env vars given a role, session name and profile"

	if test (count $argv) -lt 3
		set RES (aws sts assume-role --role-arn $argv[1] --role-session-name $argv[2])
	else
		set RES (aws sts assume-role --role-arn $argv[1] --role-session-name $argv[2] --profile $argv[3])
	end

	set -gx AWS_ACCESS_KEY_ID (echo $RES | jq -r .Credentials.AccessKeyId)
	set -gx AWS_SECRET_ACCESS_KEY (echo $RES | jq -r .Credentials.SecretAccessKey)
	set -gx AWS_SESSION_TOKEN (echo $RES | jq -r .Credentials.SessionToken)
end
