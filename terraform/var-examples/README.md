# terraformで変数を扱う（コマンドライン引数、デフォルト値、tplファイル）

## 試す順番
1. docker composeがあるデレクトリー移動に移動します 
  - `cd qitta-example/terraform/var-examples`
2. dockerコンテナをバックグラウンドで起動します
  - `DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up -d`
3. dockerコンテナに入ります
  - `docker exec -it var-examples /bin/sh`

4. 試したい例があるterraformデレクトリーに移動します
  - コマンドラインから引数を渡される場合
    - `cd ~/terraform/examples/command-line`
    - `terraform init`
    - `terraform apply -var="lambda-zip-path=my-zip-path"`
  - コマンドラインからtfvarsファイルを指定した場合
    - `cd ~/terraform/examples/command-line`
    - `terraform init`
    - `terraform apply -var-file="tfvars-exam.tfvars"`
  - デフォルト値を設定する場合
    - `cd ~/terraform/examples/set-default`
    - `terraform init`
    - `terraform apply`
  - tplファイルを活用する場合
    - `cd ~/terraform/examples/tpl`
    - `terraform init`
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

docker images -a | grep "var-examples" | awk '{print $3}' | xargs docker rmi --force
```
