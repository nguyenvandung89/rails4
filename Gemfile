source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem "mysql2"
gem "devise"
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem "rails_config"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "carrierwave"
gem "mini_magick"
gem "friendly_id"
gem "kaminari"
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
group :assets, :staging, :production do
  gem "coffee-rails", "~> 4.0.0"
  gem "therubyracer"
  gem "sass-rails", "~> 4.0.0"
  gem "less-rails"
  gem "uglifier", ">= 1.3.0"
  gem "twitter-bootstrap-rails", git: "http://github.com/seyhunak/twitter-bootstrap-rails.git"
  gem "turbo-sprockets-rails3"
end
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'
group :development, :test do
  gem "pry-rails"
  gem "pry"
  gem "pry-debugger"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "better_errors"
  gem "binding_of_caller"
  gem "rails-erd"
end
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
