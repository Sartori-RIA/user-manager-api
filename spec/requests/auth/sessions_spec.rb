# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::SessionsController do
  let(:user) { create(:user) }

  it 'signs user in and returns JWT token' do
    post user_session_path, params: { user: { email: user.email, password: user.password } }, as: :json
    expect(response).to have_http_status(:ok)
    expect(response.headers['Authorization']).to be_present
  end

  it 'signs user out' do
    headers = { 'Content-Type' => 'Application/json', 'Accept' => 'Application/json' }
    delete destroy_user_session_path, headers: Devise::JWT::TestHelpers.auth_headers(headers, user), as: :json
    expect(response).to have_http_status(:no_content)
  end
end
