#!/bin/sh

aws lambda create-function \
  --function-name hello_lambda \
  --runtime python3.7 \
  --role whatever \
  --handler app.lambda_handler \
  --zip-file fileb://$LAMBDA_ZIP_PATH \
  --endpoint-url http://localstack:4566 \
  --region us-east-1
echo "lambda created"
