RAILS_ROOT = File.expand_path("../../..", __FILE__)

worker_processes 1
timeout 360
preload_app true

listen "#{RAILS_ROOT}/tmp/unicorn.todo.sock"
pid    "#{RAILS_ROOT}/tmp/pids/unicorn.pid"

stderr_path "#{RAILS_ROOT}/log/unicorn.stderr.log"
stdout_path "#{RAILS_ROOT}/log/unicorn.stdout.log"