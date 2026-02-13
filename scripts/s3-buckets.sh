#!/usr/bin/env bash

awslocal cloudformation deploy \
  --template-file ../cloudformation/s3-buckets.yaml \
  --stack-name s3-stack \
  --parameter-overrides pEnvironment=dev
