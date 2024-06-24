source "https://rubygems.org"

ruby "3.0.0"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem 'rails-i18n', '~> 7.0.0'
gem 'dotenv'
gem 'bundler-audit', '~> 0.9.1'
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem 'brakeman'
gem 'rack-attack'
gem 'pg_search'

group :development, :test do
  gem 'apipie-rails'
  gem 'byebug'
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
  gem 'parallel_tests'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop-rspec', '~> 2.29', '>= 2.29.2', require: false
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'fuubar'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end


