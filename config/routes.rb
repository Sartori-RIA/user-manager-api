# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', controllers: {
    sessions: 'auth/sessions',
    registrations: 'auth/registrations'
  }
  apipie
  namespace :api do
    namespace :v1 do
      resources :users
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
