# AWS utils
# ---------
#
# USAGE:
# $ ap # to switch profile

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
  result=$(aws-vault list)
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
