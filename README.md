#CEREBRO-API

##First-Time Setup:

1. Install rbenv (https://github.com/rbenv/rbenv)
2. set ruby version to 2.4.1
3. Install bundler - gem install bundler
4. Copy and modify the database.yml file: cp config/database.yml.example config/database.yml
5. Copy and modify the .env file: cp .env.example .env
6. Run bundle install to install all the gems
7. Run rake db:setup to create and seed the database
8. Run bundle exec rake db:setup
9. Run rake db:migrate
10. Run foreman start to run the server
