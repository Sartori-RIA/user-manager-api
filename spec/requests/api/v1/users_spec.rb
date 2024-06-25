# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  let!(:logged_user) { create(:user) }
  let!(:valid_headers) {
    headers = { 'Content-Type' => 'Application/json', 'Accept' => 'Application/json' }
    Devise::JWT::TestHelpers.auth_headers(headers, logged_user)
  }
  let(:json) { JSON.parse(response.body, symbolized_name: true) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end

    it 'have to return in a json format' do
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response.content_type).to match(a_string_including('application/json'))
    end

    it 'return the users' do
      users = [logged_user, create_list(:user, 5)].flatten
      get api_v1_users_url, headers: valid_headers, as: :json
      expected_json = JSON.parse(users.to_json, symbolized_name: true)
      expect(json).to eq(expected_json)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      user = create(:user)
      get api_v1_user_url(user.id), as: :json, headers: valid_headers
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new User' do
        expect do
          post api_v1_users_url,
               params: { user: attributes_for(:user) }, headers: valid_headers, as: :json
        end.to change(User, :count).by(1)
      end

      it 'renders a JSON response with the new user' do
        post api_v1_users_url,
             params: { user: attributes_for(:user) }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new User' do
        expect do
          post api_v1_users_url,
               params: { user: { name: 'a', email: 'a', phone: 'a', born_date: 'a', password: 'a' } }, as: :json
        end.not_to change(User, :count)
      end

      it 'renders a JSON response with errors for the new user' do
        post api_v1_users_url,
             params: { user: attributes_for(:user, email: 'potato') }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      it 'updates the requested user' do
        user = create(:user)
        new_name = 'updated name'
        patch api_v1_user_url(user),
              params: { user: { name: new_name } }, headers: valid_headers, as: :json
        user.reload
        expect(user.name).to eq new_name
      end

      it 'renders a JSON response with the user' do
        user = create(:user)
        patch api_v1_user_url(user),
              params: { user: { name: 'updated name' } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the user' do
        user = create(:user)
        patch api_v1_user_url(user),
              params: { user: { email: 'asdadsa' } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      user = create(:user)
      expect do
        delete api_v1_user_url(user), headers: valid_headers, as: :json
      end.to change(User, :count).by(-1)
    end
  end
end
