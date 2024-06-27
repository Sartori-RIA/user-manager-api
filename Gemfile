# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'brakeman'
gem 'bundler-audit', '~> 0.9.1'
gem 'cancancan'
gem 'devise', '~> 4.9'
gem 'devise-argon2', '~> 2.0'
gem 'devise-i18n'
gem 'devise-jwt'
gem 'dotenv'
gem 'email_validator'
gem 'pagy', '~> 8.4'
gem 'pg'
gem 'pg_search'
gem 'puma', '>= 5.0'
gem 'rack-attack'
gem 'rack-cors'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'rails-i18n', '~> 7.0.0'
gem 'tzinfo-data', platforms: %i[mswin mswin64 mingw x64_mingw jruby]

group :development, :test do
  gem 'apipie-rails'
  gem 'byebug'
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.3'
  gem 'faker'
  gem 'parallel_tests'
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop-factory_bot'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubocop-rspec_rails'
end

group :test do
  gem 'database_cleaner-active_record'
  gem 'fuubar'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
