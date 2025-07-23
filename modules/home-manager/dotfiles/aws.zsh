# AWS utils
# ---------
#
# USAGE:
# $ ap # to switch profile
# $ aa <account-name> <account-id> # to add new account

fzf_aws_pick() {
  # $1 results to pick from
  fzf \
    --layout=reverse \
    --height=40% \
    --print0 \
    --header-lines=2 <<< "$1"
}

ap() {
  # change profile
  local result selected profile
  result=$(aws-vault list | grep -E -v 'vault|common')
  selected=$(fzf_aws_pick "$result")
  if [[ -z "$selected" ]]; then
    if [[ -n "$AWS_PROFILE" ]]; then
      echo "AWS profile $AWS_PROFILE is active."
    else
      echo "No profile is active."
    fi
    return
  fi
  profile=$(awk '{printf $1}' <<< "$selected")
  export AWS_PROFILE=$profile
  echo "AWS profile $profile is active."
}

aa() {
  # add new account
  local account_name account_id config_file
  
  if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "Usage: aa <account-name> <account-id>"
    return 1
  fi
  
  account_name="$1"
  account_id="$2"
  
  config_file="$HOME/.aws/config"
  
  if [[ ! -f "$config_file" ]]; then
    echo "AWS config file not found at $config_file"
    return 1
  fi
  
  # Generate the configuration block
  {
    echo
    echo "# ${account_name:u}"
    echo "[profile ${account_name}-common]"
    echo "include_profile = common"
    echo "sso_account_id = ${account_id}"
    echo
    
    for role in Admin Developer ReadOnly; do
      echo "[profile ${role}-${account_name}-vault]"
      echo "include_profile = ${account_name}-common"
      echo "sso_role_name = ${role}"
      echo
    done
    
    for role in admin developer readonly; do
      echo "[profile ${role}-${account_name}]"
      echo "credential_process = aws-vault export --format=json ${role}-${account_name}-vault"
      echo
    done
  } >> "$config_file"
  
  echo "Added AWS account '$account_name' with ID '$account_id' to $config_file"
}
