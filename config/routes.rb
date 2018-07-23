# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :books do
    resources :reviews
    member do
      put 'favorite', to: 'books#favorite'
      put 'unfavorite', to: 'books#unfavorite'
      post 'read', to: 'books#place_book_to_reading_list'
    end

    collection do
      match 'search' => 'books#search', via: %i[get post], as: :search
      #match 'read' => 'books#place_book_to_reading_list', via: :post, as: :read
    end
  end

  resources :profile
end
