# ec2 test

## 試す順番
1. docker composeがあるデレクトリー移動に移動します 
  - `cd qitta-example/terraform/amazonlinux2-ansible`
2. dockerコンテナをバックグラウンドで起動します
  - `DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up -d`
3. Ansibleのplaybookがあるデレクトリーに移動します
  - `cd qitta-example/terraform/amazonlinux2-ansible/ansible`
4. Ansible実行します(両方同じです。どっちでも実行可能です)
  - `sh local_docker_book.sh`
  - `ansible-playbook local_docker_book.yml -i local_hosts -u ec2-user --private-key ../docker-ssh/docker-ssh-key`


1. Ansibleが実行を確認したいなら、dockerコンテナに入ります（選択）
  - `docker exec -it amazonlinux2-ansible /bin/bash`

- amazonlinux2-ansible dockerの掃除がしたいなら実行（選択）
  - 実行内容 : 実行中の全dockerコンテナ・docker network・docker volumeを停止する、削除する、**imageはamazonlinux2-ansible dockerだけ削除**する
```
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
yes | docker network prune
yes | docker volume prune

docker images -a | grep "amazonlinux2-ansible" | awk '{print $3}' | xargs docker rmi --force
```
