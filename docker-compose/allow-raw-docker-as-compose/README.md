# allow raw docker as docker compose

## 試す順番
1. docker composeがあるデレクトリー移動に移動します 
  - `cd qitta-example/docker-compose/allow-raw-docker-as-compose`
2. dockerコンテナをバックグラウンドで起動します
  - `docker-compose up -d`
3. docker composeで起動したコンテナを確認します
  - `docker-compose ps`
4. docker composeではないdockerコンテナを起動します
  - `docker run -d --label-file ./labels nginx:1.19.0-alpine`
5. docker composeで起動したコンテナを確認します
  - `docker-compose ps`


- dockerの掃除がしたいなら実行（選択）
  - 実行内容 : 実行中の全dockerコンテナ・docker network・docker volumeを停止する、削除する、**postgresがimage名に入ったdocker imageだけ削除**する
```
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
yes | docker network prune
yes | docker volume prune

docker images -a | grep "postgres" | awk '{print $3}' | xargs docker rmi --force
```

