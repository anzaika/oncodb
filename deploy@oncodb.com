# MySQL.  Versions 5.0+ are recommended.
#
# Install the MYSQL driver
#   gem install mysql2
#
# Ensure the MySQL gem is defined in your Gemfile
#   gem 'mysql2'
#
# And be sure to use new-style password hashing:
#   http://dev.mysql.com/doc/refman/5.0/en/old-client.html
#
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  port: 3316
  username: pgx
  password: pgx
  host: mg.uncb.iitp.ru

development:
  <<: *default
  database: pgx_db

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  <<: *default
  database: oncodb_test

# Avoid production credentials in the repository,
# instead read the configuration from the environment.
#
# Example:
#   mysql2://myuser:mypass@localhost/somedatabase
#
production:
  adapter: mysql2
  encoding: utf8
  pool: 5
  port: 3316
  username: pgx
  password: pgx
  host: mg.uncb.iitp.ru
  database: pgx_db
