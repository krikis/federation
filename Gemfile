source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem "bootstrap-sass", "~> 2.3.1.3"
gem 'ryansch-andand'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem "haml-rails", "~> 0.4"
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'haml_coffee_assets'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'spork', :require => false
end

group :test do
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'guard-shell'
  gem 'guard-pow'
  gem 'rb-fsevent', :require => false
  gem 'rb-readline', :require => false
  gem 'growl', :require => false
  gem 'rspec-rails'
  gem 'fuubar'
  gem 'fabrication'
  gem 'database_cleaner'
  gem 'timecop'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
