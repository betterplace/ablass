# vim: set ft=ruby:

source 'https://rubygems.org'

ruby '2.1.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.0.8'

# Use sqlite3 as the database for Active Record
gem 'sqlite3',  group: [:development]
gem 'pg',       group: [:production]
gem 'rails_12factor', group: [:production]

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 1.2'
gem 'rabl'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :assets do
  gem 'chunky_png'
  gem 'compass-rails'
  gem 'sassy-buttons'
end

group :production do
  gem 'thin'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
gem 'byebug', group: [:development, :test]

gem 'haml-rails'

gem 'rspec-rails', group: :test

gem 'capybara', group: :test

gem 'simplecov', group: :test

gem 'webmock', group: :test

gem 'factory_girl', group: :test

gem 'fuubar', group: :test

gem 'rails_admin'

gem "devise"

gem 'newrelic_rpm'

gem 'tins', '~>0.10', require: 'tins/xt'

gem 'globalize', github: 'globalize/globalize'
gem 'rails_admin_globalize_field'

gem 'http_accept_language'

gem 'mini_magick'
gem 'carrierwave'
