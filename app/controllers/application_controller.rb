# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pagy::Backend

  def pagy_render(collection, vars={})
    pagy, records = pagy(collection, vars)
    pagy_headers_merge(pagy)
    render json: records
  end
end
