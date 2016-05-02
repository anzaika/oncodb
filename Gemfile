source 'https://rubygems.org'

#------> Core
gem 'rails'
gem 'mysql2'
gem 'activeadmin', github: 'activeadmin'
gem 'devise'
gem 'turbolinks'
gem 'jbuilder'
gem 'unicorn'
gem 'unicorn-rails'
gem 'newrelic_rpm'
gem 'elasticsearch-model',
    git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails',
    git: 'git://github.com/elasticsearch/elasticsearch-rails.git'

#------> Languages
gem 'sass-rails'
gem 'haml-rails'
gem 'coffee-rails'
gem 'therubyracer', platforms: :ruby

#------> Assets
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'bootstrap-sass'

#------> Helpers
gem 'uglifier' # Use Uglifier as compressor for JavaScript assets
gem 'kaminari'
gem 'bootstrap_form'
gem 'simple_form', github: 'plataformatec/simple_form', branch: 'master'
gem 'smart_listing'

group :development do
  gem 'rubocop'
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rails-console'
  gem 'capistrano-rbenv'
  # gem 'capistrano-rvm'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
end
group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'launchy'
  gem 'selenium-webdriver'
end
