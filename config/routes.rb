# frozen_string_literal: true

Rails.application.routes.draw do
  get 'favorite_books/update'
  root to: 'home#index'
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  resources :books do
    collection do
      match 'search' => 'books#search', via: %i[get post], as: :search
    end
  end

  resources :profile
end
