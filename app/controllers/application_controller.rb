# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend

  rescue_from CanCan::AccessDenied do |exception|
    Rails.logger.debug { "Access denied on #{exception.action} #{exception.subject.inspect}" }
    render json: { message: 'Access Denied!' }, status: :forbidden
  end

  rescue_from Apipie::ParamError do |e|
    render json: { message: e.message }, status: :unprocessable_entity
  end

  def pagy_render(collection, vars = {})
    pagy, records = pagy(collection, vars)
    pagy_headers_merge(pagy)
    render json: records
  end
end
