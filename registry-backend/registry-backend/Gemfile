source 'https://rubygems.org'

gem 'rails', '4.1.1'

# Gems for webscrapping
gem 'nokogiri', '~> 1.6q'
gem 'open-uri-s3'
gem 'whenever', :require => false

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'timecop'
end
group :production do
  gem 'mysql'
  gem 'mysql2'
  gem 'pg'
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.3'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end

gem 'jquery-rails'			# Use jquery as the JavaScript library
gem 'turbolinks'			# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0'	# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'rubocop', require: false
gem 'sdoc', '~> 0.4.0',     group: :doc # bundle exec rake doc:rails generates the API under doc/api.

# for http request
gem 'httpclient'

# Pagination
gem 'will_paginate', '~> 3.0'
gem 'api-pagination'

# gem for converting distance latitude and longitude measurements
gem "geocoder"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]


