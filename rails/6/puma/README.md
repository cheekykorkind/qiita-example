# rails-puma

## 試す順番
1. docker composeがあるデレクトリー移動に移動します 
  - `cd qitta-example/rails/6/puma`
2. dockerコンテナをバックグラウンドで起動します
  - `DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up -d`
3. dockerコンテナに入ります
  - `docker exec -it rails-puma-web /bin/bash`

- terraform dockerの掃除がしたいなら実行（選択）
  - 実行内容 : 実行中の全dockerコンテナ・docker network・docker volumeを停止する、削除する、**imageはrails-puma dockerだけ削除**する
```
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
yes | docker network prune
yes | docker volume prune

docker images -a | grep "rails-puma" | awk '{print $3}' | xargs docker rmi --force
```


## Rails6プロジェクト作成までの手順（rails6.0.3.2）
1. docker composeがあるデレクトリー移動に移動しました
  - `cd qitta-example/rails/6/puma`
2. Dockerfileとentrypoint.shに**dbマイグレーション、puma起動コマンド部分なし**で、rails起動させるdockerコンテナを起動しました
  - `DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up -d`
  - まず、railsをインストールするためです
  - railsがインストールされてない状態でentrypoint.shの`bundle exec`コマンドで`db:create db:migrate`や`rails s -p 3000 -b 0.0.0.0`などを実行したらエラーになるからです
3. rails起動させるdockerコンテナに入りました
  - `docker exec -it rails-puma-web /bin/bash`
4. railsをインストールしました
  - `rails new . -d postgresql`
  - postgres使いますからrails newコマンドにpostgresを含めました
5. database.ymlを修正しました
  - `host`をdocker composeに合わせて調整しました
  - 他の部分も調整しました
6. Dockerfileとentrypoint.shにdbマイグレーション、puma起動コマンドを追加しました
  - railsがインストールされたから、dbマイグレーション、puma起動コマンドが問題なく起動できます