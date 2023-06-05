#!/bin/bash
set -e

rm -f tmp/pids/server.pid

bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails assets:precompile

bundle exec rails server -p 3000 -b '0.0.0.0'