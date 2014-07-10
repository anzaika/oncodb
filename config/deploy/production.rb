set :stage, :production
set :branch, 'master'

set :server_name, "www.oncodb.labhub.co oncodb.labhub.co"

set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
server '146.185.148.177', user: 'deploy', roles: %w{web app}, primary: true
set :deploy_to, "/home/#{fetch(:deploy_user)}/apps/#{fetch(:full_app_name)}"

set :rails_env, :production

set :unicorn_worker_count, 3

set :enable_ssl, false
