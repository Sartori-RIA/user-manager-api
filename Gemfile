source "https://rubygems.org"

ruby "3.0.0"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"

group :development, :test do
  gem 'faker'
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ]

end

group :development do
  gem 'brakeman'
  gem 'rubocop-rails', require: false
end

