#! /usr/bin/env bash

awslocal cloudformation deploy \
    --template-file ../cloudformation/secrets-manager.yaml \
    --stack-name secrets-stack 

#export AWS_ACCESS_KEY_ID="test"
#export AWS_SECRET_ACCESS_KEY="test"
#export AWS_DEFAULT_REGION="us-east-1"

#aws cloudformation deploy \
#    --template-file cloudformation/secrets-manager.yaml \
#    --stack-name secrets-stack \
#    --endpoint-url=http://localhost:4566