#! /usr/bin/env bash

awslocal cloudformation deploy \
    --template-file cloudformation/sqs-queues.yaml \
    --stack-name sqs-stack 

export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"

aws cloudformation deploy \
    --template-file cloudformation/sqs-queues.yaml \
    --stack-name sqs-stack \
    --endpoint-url=http://localhost:4566

awslocal sqs receive-message --queue-url http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/arka-ordenes-queue

aws sqs receive-message --queue-url http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/arka-ordenes-queue \
    --endpoint-url=http://localhost:4566

awslocal sqs delete-message \
    --queue-url http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/arka-ordenes-queue \
    --receipt-handle MzE5M2IwMmQtYzJiMC00ZjllLTk3OTQtNDJmZjgxYTljMDQ4IGFybjphd3M6c3FzOnVzLWVhc3QtMTowMDAwMDAwMDAwMDA6YXJrYS1vcmRlbmVzLXF1ZXVlIDM1YTIyNDljLTA0ODctNDc2Yi1hODZjLTVjN2FkMjAxODNiYSAxNzcwODY0NTY5LjQyNDMyOQ==

aws sqs delete-message \
    --queue-url http://sqs.us-east-1.localhost.localstack.cloud:4566/000000000000/arka-ordenes-queue \
    --receipt-handle MzE5M2IwMmQtYzJiMC00ZjllLTk3OTQtNDJmZjgxYTljMDQ4IGFybjphd3M6c3FzOnVzLWVhc3QtMTowMDAwMDAwMDAwMDA6YXJrYS1vcmRlbmVzLXF1ZXVlIDM1YTIyNDljLTA0ODctNDc2Yi1hODZjLTVjN2FkMjAxODNiYSAxNzcwODY0NTY5LjQyNDMyOQ== \
    --endpoint-url=http://localhost:4566