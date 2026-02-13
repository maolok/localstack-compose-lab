#!/usr/bin/env bash

awslocal cloudformation deploy \
  --template-file ../cloudformation/sqs-queues.yaml \
  --stack-name sqs-stack \
  --parameter-overrides pEnvironment=dev
