#!/bin/bash

# sudo chown -R ec2-user /workspace/myapp

# # Remove a potentially pre-existing server.pid for Rails.
# rm -f ./tmp/pids/server.pid
# rm -rf ./tmp/*
# mkdir -p ./tmp/pids

# yarn install --check-files
# bundle exec rails db:create db:migrate
# bundle exec rails assets:precompile
# bundle exec rails s -p 3000 -b 0.0.0.0