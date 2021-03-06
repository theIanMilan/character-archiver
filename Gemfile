source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails', '~> 6.1.4'
gem 'pg'
gem 'puma', '~> 5.5.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
gem 'dotenv-rails', groups: [:development, :test]
gem 'devise'
gem 'pundit', '~> 2.1.1'
gem 'rails_admin', '~> 2.0'
gem 'obscenity' # Profanity filter gem. Ceased development in 2016
gem "auto_strip_attributes", "~> 2.6"
gem 'aes' # encryption
gem 'simple_form'
gem 'draper' # Decorator patterns
gem 'mail_form', '~> 1.9.0'
gem 'cocoon'
gem 'pagy', '~> 5.6' # pagination: omit patch digit

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'guard-livereload', '~> 2.5', require: false
  gem 'rack-livereload'
  gem 'brakeman'
  gem 'bullet' # eager loading alert
end

# Moved temporarily for seeding in production
gem 'factory_bot_rails'
gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails_real_favicon'
end

group :test do
  gem 'rspec-rails'
  gem 'database_rewinder'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'pundit-matchers', '~> 1.7.0'
end
