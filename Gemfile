source 'https://rubygems.org'
ruby "3.3.5"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 7.1.3.4', '< 8.0.0'

gem 'carrierwave', '>= 3.0.0'

# gem 'fog-aws'
# HEROKU doesn't support sqlite3.
# Comment this gem
gem 'sqlite3', '~> 1.4'
# and uncomment the following
# gem 'pg'
# gem 'thin'

# Use Puma as the app server
gem 'puma', '>= 6.0' # UPDATED
# Use SCSS for stylesheets
gem 'sassc-rails'
# gem 'sass-rails', '>= 6' # DEPRECATED
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# gem 'webpacker', '~> 4.0' # DEPRECATED
gem 'shakapacker', '>= 6.0' # NEW
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.18', require: false # UPDATED

# Silence Ruby stdlib default-gem deprecation warning for ostruct (JSON depends on it)
gem 'ostruct'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:windows] # UPDATED
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'cucumber'
  gem 'rspec', '~> 3.12'
  # gem 'selenium-webdriver', '>= 4.1.0' # Still works but it will be deprecated
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '= 5.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:windows, :jruby] # UPDATED

gem "devise", "~> 4.9"

# IF NEEDED
# gem install rexml -v 3.3.6
# gem install net-smtp -v 0.4.0.1
