export AWS_SSO_START_URL="https://beautybay-master.awsapps.com/start"

function set-aws-profile() {
  export AWS_PROFILE=${1}
  echo "Profile set to ${1}"
}

function unset-aws-profile() {
  unset AWS_PROFILE
  echo "AWS profile removed"
}

function get-aws-account-id() {
  account_id=$(jq -r --arg ACCOUNT_ID "${1}" '.[] | select(.short_name==$ACCOUNT_ID) | .id' ~/.bb/aws_accounts.json | tr -d '"')
  echo "Account ID for ${1}: ${account_id}"
}

alias aws-caller-identity="aws sts get-caller-identity | jq '.'"

set-user() {
  export AWS_ACCESS_KEY_ID="${1}"
  export AWS_SECRET_ACCESS_KEY="${2}"

  aws sts get-caller-identity | jq '.'
}

function assume() {
  response=$(aws sts assume-role --role-arn ${1} --role-session-name ${2})

  key_id=$(echo $response | jq '.Credentials.AccessKeyId' | tr -d '"')
  key_secret=$(echo $response | jq '.Credentials.SecretAccessKey' | tr -d '"')
  session_token=$(echo $response | jq '.Credentials.SessionToken' | tr -d '"')

  export AWS_ACCESS_KEY_ID="${key_id}"
  export AWS_SECRET_ACCESS_KEY="${key_secret}"
  export AWS_SESSION_TOKEN="${session_token}"

  aws sts get-caller-identity | jq '.'
}

function unassume() {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_SESSION_TOKEN

  aws sts get-caller-identity | jq '.'
}
