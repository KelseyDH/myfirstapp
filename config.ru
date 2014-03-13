require "app.rb"
run Sinatra::Application
require rubygems

source "https://rubygems.org"
ruby "2.0.0"
gem 'sinatra', '1.1.0'

web: bundle exec rackup config.ru -p $PORT
