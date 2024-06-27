# 4Asset - UserManager

[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)
[![Rails Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rails.rubystyle.guide)

* Ruby version 3.2.2

* System dependencies
  * Docker OR PostgresSQL for the DB

* Configuration
  * Docker
  * `docker-compose up -d`

* Database Setup
  * `rails db:create`
  * `rails db:migrate`
  * `rails db:seed`
  * `rails db:populate`

* How to run the test suite
  * `rails db:migrate RAILS_ENV=test`
  * `rake parallel:spec` 
  * `rspec` <-- run the specs normally
  * `rake parallel:spec` <-- run the secs in parallel


* Startup
  * `rails s`

* Docs
  * http://localhost:3000/apipie

* Author
  * Lucas A. R. Sartori
  * https://github.com/Sartori-RIA
  * https://www.linkedin.com/in/lucas-antonio-ramos-sartori/