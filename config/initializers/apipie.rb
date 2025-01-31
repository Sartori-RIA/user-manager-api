# frozen_string_literal: true

Apipie.configure do |config|
  config.app_name                = 'UserManager'
  config.api_base_url            = '/api'
  config.doc_base_url            = '/apipie'
  # where is your API defined?
  config.api_controllers_matcher = Rails.root.join('app/controllers/**/*.rb').to_s
end

Apipie.configuration.ignore_allow_blank_false = true
