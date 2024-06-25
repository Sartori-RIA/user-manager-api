# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend

  def pagy_render(collection, vars={})
    pagy, records = pagy(collection, vars)
    pagy_headers_merge(pagy)
    render json: records
  end
end

class IntegerValidator < Apipie::Validator::BaseValidator

  def initialize(param_description, argument)
    super(param_description)
    @type = argument
  end

  def validate(value)
    return false if value.nil?
    !!(value.to_s =~ /^[-+]?[0-9]+$/)
  end

  def self.build(param_description, argument, options, block)
    if argument == Integer
      self.new(param_description, argument)
    end
  end

  def description
    "Must be #{@type}."
  end

  def expected_type
    'numeric'
  end
end