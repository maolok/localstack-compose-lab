#! /usr/bin/env bash

echo "building infra"

# pwd
cd /etc/localstack/init/ready.d

awslocal cloudformation deploy \
    --template-file cloudformation/s3-buckets.yaml \
    --stack-name s3-stack \
    --parameter-overrides pEnvironment=dev

cd lambda_python && zip healthcheck.zip healthcheck.py && cd ..

awslocal s3 cp ./lambda_python/healthcheck.zip s3://lambda-code-dev/lambda-healthcheck.zip

awslocal cloudformation deploy \
    --template-file cloudformation/sqs-queues.yaml \
    --stack-name sqs-stack 

awslocal cloudformation deploy \
    --template-file cloudformation/secrets-manager.yaml \
    --stack-name secrets-stack 

awslocal cloudformation deploy \
    --template-file cloudformation/lambda-apigateway.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --stack-name lambda-apigateway-stack 