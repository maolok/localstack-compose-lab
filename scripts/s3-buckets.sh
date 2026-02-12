#! /usr/bin/env bash
awslocal cloudformation deploy \
    --template-file cloudformation/s3-buckets.yaml \
    --stack-name s3-stack \
    --parameter-overrides pEnvironment=dev

export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"

aws cloudformation deploy \
    --template-file cloudformation/s3-buckets.yaml \
    --stack-name s3-stack \
    --parameter-overrides pEnvironment=dev \
    --endpoint-url=http://localhost:4566

aws s3 ls --endpoint-url=http://localhost:4566

awslocal s3 ls


