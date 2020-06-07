# -*- coding: utf-8 -*-
import os
import boto3

if __name__ == "__main__":
    endpoint_url = 'http://{}:4566'.format(os.environ['HOSTNAME_EXTERNAL'])

    client = boto3.client('lambda', endpoint_url = endpoint_url)

    response = client.create_function(
        FunctionName = 'hello_lambda',
        Runtime='python3.7',
        Role='dummy',
        Handler='app.lambda_handler',
        Code={
            'ZipFile': open(os.environ['LAMBDA_ZIP_PATH'], 'rb').read()
        }
    )

    print(response)
