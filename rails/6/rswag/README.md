# rails-rswag
https://github.com/rswag/rswag

## 試す順番
1. docker composeがあるデレクトリー移動に移動します 
  - `cd qitta-example/rails/6/rswag`
2. dockerコンテナをバックグラウンドで起動します
  - `DOCKER_UID=$(id -u $USER) DOCKER_GID=$(id -g $USER) docker-compose up -d`
3. dockerコンテナに入ります
  - `docker exec -it rails-rswag-web /bin/bash`

- rails-rswag dockerの掃除がしたいなら実行（選択）
  - 実行内容 : 実行中の全dockerコンテナ・docker network・docker volumeを停止する、削除する、**imageはrails-rswag dockerだけ削除**する
```
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)
docker rmi $(docker images -f "dangling=true" -q)
docker volume rm $(docker volume ls -qf dangling=true)
yes | docker network prune
yes | docker volume prune

docker images -a | grep "rails-rswag" | awk '{print $3}' | xargs docker rmi --force
```

## 実装リスト
- Gemfileにgemを追加して`bundle install`します
```
gem 'rswag-api'
gem 'rswag-ui'

group :test do
  gem 'rspec-rails'
  gem 'rswag-specs'
end
```

- コマンド実行
```
bundle exec rails g rswag:api:install
bundle exec rails g rswag:ui:install
bundle exec rails generate rspec:install
RAILS_ENV=test bundle exec rails g rswag:specs:install
RAILS_ENV=test rake rswag:specs:swaggerize
RAILS_ENV=test bundle exec rspec
```

- 手動でswagger.json使うために調整
   - `spec/swagger_helper.rb`
   - `rswag/config/initializers/rswag-ui.rb`

- 手動でAPIとrspec作成
   - `rswag/spec/api/v1/books_spec.rb`
   - `rswag/app/controllers/api/v1/books_controller.rb`

## rswag周りの実装が書かれているcommit
https://github.com/cheekykorkind/qiita-example/commit/bb97a13181dee8d45b607ace05b889c61ed63e6e
