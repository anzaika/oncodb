set :application, 'oncodb'
set :deploy_user, 'deploy'

set :scm, :git
set :repo_url, 'git@github.com:anzaika/oncodb.git'

set :rbenv_type, :system
set :rbenv_ruby, '2.1.2'
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w{rake gem bundle ruby rails}

set :keep_releases, 5

set :linked_files, %w{config/database.yml config/secrets.yml}

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :tests, ["spec"]

set(:config_files, %w(
    nginx.conf
    database.yml
    secrets.yml
    monit
    unicorn.rb
    unicorn_init.sh
))

set(:executable_config_files, %w(
    unicorn_init.sh
))

set(:symlinks, [
  {
    source: 'nginx.conf',
    link: "/etc/nginx/sites-enabled/{{full_app_name}}"
  },
  {
    source: 'unicorn_init.sh',
    link: "/etc/init.d/unicorn_{{full_app_name}}"
  },
  {
    source: 'monit',
    link: "/etc/monit/conf.d/{{full_app_name}}.conf"
  }
])

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }


# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  # before :deploy, 'deploy:run_tests'

  after 'deploy:symlink:shared', 'deploy:compile_assets_locally'
  after :finishing, 'deploy:cleanup'

end
