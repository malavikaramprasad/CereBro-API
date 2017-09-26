CEREBRO-API

First-Time Setup:

Install rbenv (https://github.com/rbenv/rbenv)
set ruby version to 2.4.1
Install bundler - gem install bundler

Copy and modify the database.yml file: cp config/database.yml.example config/database.yml
Copy and modify the .env file: cp .env.example .env
Run bundle install to install all the gems
Run rake db:setup to create and seed the database
Run foreman start to run the server

Run bundle install
Run bundle exec rake db:setup
Run rake db:migrate
