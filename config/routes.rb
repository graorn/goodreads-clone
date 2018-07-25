# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :profile
  end

  resources :books do
    resources :reviews
    resources :favorites

    member do
      post 'favorite', to: 'books#favorite'
      post 'read', to: 'books#place_book_to_reading_list'
    end

    collection do
      match 'search' => 'books#search', via: %i[get post], as: :search
    end
  end
end
