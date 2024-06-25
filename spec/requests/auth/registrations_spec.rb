# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::RegistrationsController, type: :request do
  let(:user) { create(:user) }

  it 'signs user in and returns JWT token' do
    post user_registration_path, params: { user: attributes_for(:user) }, as: :json
    expect(response).to have_http_status(:ok)
    expect(response.headers['Authorization']).to be_present
  end
end
