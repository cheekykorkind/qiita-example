# Terraformの使い方

## 用意したdocker上のTerraformを使う人
- デレクトリー移動
  - `cd qitta-example/terraform/aws-account-management`
- dockerコンテナをバックグラウンドで起動
  - `DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up -d`

- dockerコンテナに入る
  - `docker exec -it aws-account-management /bin/sh`

- aws profile設定します
  - 一回で十分です、HOSTマシンに影響与えません
  - profile名は `my-demo`にしてください。terraformで参照してます
```
aws configure --profile my-demo
AWS Access Key ID [None]: aaaaaa
AWS Secret Access Key [None]: sssssss
Default region name [None]:ap-northeast-1
Default output format [None]:
```

- terraformデレクトリーに移動します
  - `cd ~/terraform/demo`

- terraform initする
  - `terraform init`

- terraformを実行！！
  - `terraform apply`

- terraform dockerの掃除がしたいなら実行（選択）
  - 実行内容 : 実行中の全dockerコンテナ・docker network・docker volumeを停止する、削除する、**imageはterraform dockerだけ削除**する
```
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
yes | docker network prune
yes | docker volume prune

docker images -a | grep "aws-account-management" | awk '{print $3}' | xargs docker rmi --force
```


## 自身のTerraformを使う人
- 各々の方法でterraformインストールします
- aws profile設定します
  - profile名は `my-demo`にしてください。terraformで参照してます
```
aws configure --profile my-demo
AWS Access Key ID [None]: aaaaaa
AWS Secret Access Key [None]: sssssss
Default region name [None]:ap-northeast-1
Default output format [None]:
```

- terraformデレクトリーに移動します
  - `cd qitta-example/terraform/aws-account-management/demo`

- terraform initする
  - `terraform init`

- terraformを実行！！
  - `terraform apply`