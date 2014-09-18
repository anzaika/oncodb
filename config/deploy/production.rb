set :stage, :production
set :branch, 'master'

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"

server 'oncodb.labhub.co', user: 'deploy', roles: %w{web app}, primary: true

set :rails_env, :production

set :unicorn_worker_count, 5

set :enable_ssl, false
