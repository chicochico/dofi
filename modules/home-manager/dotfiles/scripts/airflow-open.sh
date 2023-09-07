#!/bin/bash

# Prerequisites
# - aws cli
# - aws vault with the bi-{env} profiles
env=$1

# map of envs
case "$env" in
    "dev")
        env_full="development"
        ;;
    "stg")
        env_full="staging"
        ;;
    "prd")
        env_full="production"
        ;;
    *)
        echo "Unknown environment"
        exit 1
        ;;
esac

token=$(aws --profile bi-${env_full} mwaa create-web-login-token --region eu-central-1 --name data-platform-${env})
host_name=$(echo $token | jq -r .WebServerHostname)
web_token=$(echo $token | jq -r .WebToken)
ui_url="https://${host_name}/aws_mwaa/aws-console-sso?login=true#${web_token}"

open ${ui_url}
