# frozen_string_literal: true

module Auth
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def_param_group :user do
      param :user, Hash do
        param :name, String, required: true
        param :email, String, required: true
        param :born_date, String, required: true
        param :phone, String, required: true
      end
    end

    api :POST, '/auth', 'Add a User on DB'
    format 'json'
    param_group :user
    returns :user
    error code: 401, desc: 'You need to Sign-In first'
    error code: 403, desc: 'You\'re not allow to access here'
    error code: 404, desc: 'Not Found'
    error code: 400, desc: 'Bad Request, you\'re forgetting something'
    error code: 422, desc: 'Unprocessable Entity'
    description <<~EOS
      this endpoint will return YOUR USER and the bearer token in the headers
      to use the token and should to use like this:

      authorization: Bearer <YOUR-TOKEN-HERE>
    EOS

    def create
      @user = User.new sign_up_params
      if @user.save
        sign_in @user, store: false
        render json: @user
      else
        render json: { user: @user.errors.full_messages.to_sentence }, status: :unprocessable_entity
      end
    end

    private

    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: { status: 'success', data: resource }, status: :created
      else
        render json: { status: 'error', errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def sign_up_params
      params.require(:user).permit(:name, :password, :email, :phone, :born_date)
    end
  end
end
