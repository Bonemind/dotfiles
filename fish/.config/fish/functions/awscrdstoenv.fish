function awscrdstoenv -d "Take an aws credentials output and set it to env vars"
	set RES $argv[1]
	echo $RES
	set -gx AWS_ACCESS_KEY_ID (echo $RES | jq -r .Credentials.AccessKeyId)
	set -gx AWS_SECRET_ACCESS_KEY (echo $RES | jq -r .Credentials.SecretAccessKey)
	set -gx AWS_SESSION_TOKEN (echo $RES | jq -r .Credentials.SessionToken)
end
