# dockerfileでパスワードを求めないsudoer作り

## 試し順番
- デレクトリー移動
  - `cd qitta-example/dockerfiles/no-password-sudoer`

- dockerコンテナをバックグラウンドで起動
  - `docker-compose up -d`

- 各々のdockerコンテナにsudoerが作られたか確認します
  - `docker exec -it alpine-sudoer /bin/sh -e -c "cat /etc/passwd | grep alpine-sudoer"`
  - `docker exec -it debian-sudoer /bin/sh -e -c "cat /etc/passwd | grep debian-sudoer"`
  - `docker exec -it ubuntu-sudoer /bin/bash -e -c "cat /etc/passwd | grep ubuntu-sudoer"`
  - `docker exec -it centos-sudoer /bin/bash -e -c "cat /etc/passwd | grep centos-sudoer"`

- 自由に確認したいなら、入りたいdockerコンテナに入ります
  - `docker exec -it alpine-sudoer /bin/sh`
  - `docker exec -it debian-sudoer /bin/sh`
  - `docker exec -it ubuntu-sudoer /bin/bash`
  - `docker exec -it centos-sudoer /bin/bash`




