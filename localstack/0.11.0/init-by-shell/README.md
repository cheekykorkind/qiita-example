# localstack init by shell script

## AWS SAMプロジェクトを以下のコマンドで使っておきました
cd qitta-example/localstack/0.11.0/init-by-shell  
sam init  
...  
Project name [sam-app]: sam-lambda

### docker composeを使ってlocalstackを実行します。localstackの作業内容が見れるようにdockerコンテナにattachします
- `docker-compose up -d && docker attach localstack-dev`

### localstackの起動完了後、localstackが使ったlambdaを試すためにlocalstackのコンテナに入ります
- `docker exec -it localstack-dev /bin/bash`

### localstackのlambdaを試します
```
aws lambda invoke \
    --region us-east-1 \
    --endpoint-url http://localstack:4566 \
    --function-name hello_lambda \
    --payload '{ "name": "Bob" }' \
    response.json
```