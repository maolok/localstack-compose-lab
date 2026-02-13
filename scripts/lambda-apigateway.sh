#! /usr/bin/env bash

# Upload lambda.zip
aws s3 cp ./lambda/python/healthcheck.zip s3://lambda-code-dev/lambda-healthcheck.zip \
    --endpoint-url=http://localhost:4566


awslocal cloudformation deploy \
    --template-file cloudformation/lambda-apigateway.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name lambda-apigateway-stack 

export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"

aws cloudformation deploy \
    --template-file cloudformation/lambda-apigateway.yaml \
    --stack-name lambda-apigateway-stack \
    --capabilities CAPABILITY_NAMED_IAM \
    --endpoint-url=http://localhost:4566

curl -X GET http://8fzh1wwhp9.execute-api.localhost.localstack.cloud:4566/dev/health