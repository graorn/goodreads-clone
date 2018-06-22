# frozen_string_literal: true

Rails.application.routes.draw do
  resources :reviews
  root to: 'home#index'

  resources :profile
  resources :books do
    collection do
      match 'search' => 'books#search', via: %i[get post], as: :search
    end

    post 'favorite', on: :member
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
