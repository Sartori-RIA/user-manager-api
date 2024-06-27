# frozen_string_literal: true

module Auth
  class SessionsController < Devise::SessionsController
    respond_to :json

    api :POST, '/auth/sign_in', 'Sign In'
    format 'json'
    param :user, Hash, desc: 'User sign in attributes' do
      param :email, String, required: true
      param :password, String, required: true
    end
    returns code: 401, desc: 'email or password are wrong'
    description <<~EOS
      this endpoint will return YOUR USER and the bearer token in the headers
      to use the token and should to use like this:

      authorization: Bearer <YOUR-TOKEN-HERE>
    EOS
    # rubocop:disable Lint/UselessMethodDefinition
    def create
      super
    end

    api :DELETE, '/auth/sign_out', 'Sign Out'
    format 'json'
    def destroy
      super
    end
    # rubocop:enable Lint/UselessMethodDefinition

    private

    def respond_with(resource, _opts = {})
      render json: resource, status: :ok
    end

    def respond_to_on_destroy
      head :no_content
    end
  end
end
