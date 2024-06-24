# frozen_string_literal: true

class Api::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def_param_group :user do
    param :user, Hash, action_aware: true do
      param :name, String, required: true
      param :email, String, required: true
      param :born_date, String, required: true
      param :phone, String, required: true
    end
  end

  api :GET, '/users/', 'Retrieves User from DB'
  error code: 404, desc: 'Not Found'
  error code: 422, desc: 'Unprocessable Entity'
  def index
    @users = User.all

    pagy, records = pagy(@users)
    # explicitly merge the headers to the response
    pagy_headers_merge(pagy)
    render json: records
  end

  api :GET, '/users/:id', 'Retrieves User from DB by ID'
  param :id, Integer, desc: 'User ID', required: true
  error code: 404, desc: 'Not Found'
  error code: 422, desc: 'Unprocessable Entity'
  def show; end

  api :POST, '/users', 'Add a User on DB'
  param_group :user, as: :create
  error code: 404, desc: 'Not Found'
  error code: 422, desc: 'Unprocessable Entity'
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, '/users/:id', 'Updates User on DB'
  param :id, Integer, desc: 'User ID', required: true
  param_group :user
  error code: 404, desc: 'Not Found'
  error code: 422, desc: 'Unprocessable Entity'
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, '/users/:id', 'Remove User from DB'
  param :id, Integer, desc: 'User ID', required: true
  error code: 404, desc: 'Not Found'
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
