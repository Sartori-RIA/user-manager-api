# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def_param_group :user do
    param :user, Hash, action_aware: true do
      param :name, String, required: true
      param :email, String, required: true
      param :born_date, String, required: true
      param :phone, String, required: true
    end
  end

  api :GET, '/v1/users/', 'Retrieves User from DB'
  format 'json'
  error code: 404, desc: 'Not Found'
  error code: 422, desc: 'Unprocessable Entity'
  param :q, String, required: false, desc: 'Search the user by name or email'
  param :page, Hash do
    param :number, Integer, required: false, desc: 'Page Number'
    param :size, Integer, required: false, desc: 'Page Size, default 20'
  end
  returns array_of: :user
  def index
    @users = params[:q].present? ? User.search_by(params[:q]) : User.all
    pagy_render @users
  end

  api :GET, '/v1/users/:id', 'Retrieves User from DB by ID'
  format 'json'
  param :id, Integer, desc: 'User ID', required: true
  error code: 404, desc: 'Not Found'
  error code: 422, desc: 'Unprocessable Entity'
  returns :user
  def show
    render json: @user
  end

  api :POST, '/v1/users', 'Add a User on DB'
  format 'json'
  param_group :user, as: :create
  error code: 404, desc: 'Not Found'
  error code: 400, desc: 'Bad Request, you\'re forgetting something'
  error code: 422, desc: 'Unprocessable Entity'
  returns :user
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, '/v1/users/:id', 'Updates User on DB'
  format 'json'
  param :id, Integer, desc: 'User ID', required: true
  param_group :user
  error code: 404, desc: 'Not Found'
  error code: 400, desc: 'Bad Request, you\'re forgetting something'
  error code: 422, desc: 'Unprocessable Entity'
  returns :user
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, '/v1/users/:id', 'Remove User from DB'
  param :id, Integer, desc: 'User ID', required: true
  error code: 404, desc: 'Not Found'
  error code: 400, desc: 'Bad Request, you\'re forgetting something'
  def destroy
    @user.destroy!
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :phone, :born_date)
  end
end
